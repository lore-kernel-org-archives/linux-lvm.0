Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E6C217F48
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 18:43:07 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 483297F755
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 18:43:05 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 5C69840B312E
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 20:43:03 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 13 Sep 2017 20:43:03 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <B6F45B41-86FC-4810-BC40-0EEE8DD9E372@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<aca4355a-d7f3-c116-fc7b-7379f269a21a@assyoma.it>
	<B6F45B41-86FC-4810-BC40-0EEE8DD9E372@redhat.com>
Message-ID: <f2e24a01b1e548b6b15db6d30596208b@xenhideout.nl>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Brassow Jonathan schreef op 13-09-2017 1:25:

> I’m the manager of the LVM/DM team here at Red Hat.

Thank you for responding.

> 2) allow users to reserve some space for critical volumes when a
> threshold is reached

> #2 doesn’t seem crazy hard to implement - even in script form.

> - Add a “critical” tag to all thinLVs that are very important:
> 	# lvchange --addtag critical vg/thinLV
> - Create script that is called by thin_command, it should:
> - check if a threshold is reached (i.e. your reserved space) and if so,
> - report all lvs associated with the thin-pool that are NOT critical:
> 	# lvs -o name --noheadings --select 'lv_tags!=critical && 
> pool_lv=thin-pool’ vg
> - run <command> on those non-critical volumes, where <command> could 
> be:
> 	# fsfreeze <mnt_point>

I think the above is exactly (or almost exactly) in agreement with the 
general idea yes.

It uses filesystem tool to achieve it instead of allocation blocking (so 
filesystem level, not DM level).

But if it does the same thing that is more important than having 
'perfect' solution.

The issue with scripts is that they feel rather vulnerable to 
corruption, not being there etc.

So in that case I suppose that you would want some default, shipped 
scripts that come with LVM as example for default behaviour and that are 
also activated by default?

So fixed location in FHS for those scripts and where user can find then 
and can install new ones.

Something similar to /etc/initramfs-tools/ (on Debian), so maybe 
/etc/lvm/scripts/ and /usr/share/lvm/scripts/ or similar.

Also easy to adjust by each distribution if they wanted to.

If no one uses critical tag -- nothing happens, but if they do use it, 
check unallocated space on critical volumes and sum it up to arrive at 
threshold value?

Then not even a threshold value needs to be configured.


> If the above is sufficient, then great.  If you’d like to see
> something like this added to the LVM repo, then you can simply reply
> here with ‘yes’ and maybe provide a sentence of what the scenario is
> that it would solve.

Yes. One obvious scenario is root on thin.

It's pretty mandatory for root on thin.


There is something else though.

You cannot set max size for thin snapshots?

This is part of the problem: you cannot calculate in advance what can 
happen, because by design, mayhem should not ensue, but what if your 
predictions are off?

Being able to set a maximum snapshot size before it gets dropped could 
be very nice.

This behaviour is very safe on non-thin.

It is inherently risky on thin.



> (I know there are already some listed in this
> thread, but I’m wondering about those folks that think the script is
> insufficient and believe this should be more standard.)

You really want to be able to set some minimum free space you want per 
volume.

Suppose I have three volumes of 10GB, 20GB and 3GB.

I may want the 20GB volume to be least important. The 3GB volume most 
important. The 10GB volume in between.

I want at least 100MB free on 3GB volume.

When free space on thin pool drops below ~120MB, I want the 20GB volume 
and the 10GB volumes to be frozen, no new extents for 30GB volume.

I want at least 500MB free on 10GB volume.

When free space on thin pool drops below ~520MB, I want the 20GB volume 
to be frozen, no new extents for 20GB volume.


So I would get 2 thresholds and actions:

- threshold for 3GB volume causing all others to be frozen
- threshold for 10GB volume causing 20GB volume to be frozen

This is easily scriptable and custom thing.

But it would be nice if you could set this threshold in LVM per volume?

So the script can read it out?

100MB of 3GB = 3.3%
500MB of 10GB = 5%

3-5% of mandatory free space could be a good default value.

So the default script could also provide a 'skeleton' for reading the 
'critical' tag and then calculating a default % of space that needs to 
be free.

In this case there is a hierarchy:

3GB > 10GB > 20GB.

Any 'critical volume' could cause all others 'beneath it' to be frozen.


But the most important thing is to freeze or drop snapshots I think.

And to ensure that this is default behaviour?

Or at least provide skeletons for responding to thin threshold values 
being reached so that the burden on the administrator is very minimal.
