Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FFDA5D98D
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2017 14:49:41 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8170065CE9
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2017 14:49:39 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id 5D6C740B23AA
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2017 16:49:38 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 21 Sep 2017 16:49:38 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <943c9d2c-0dd6-5d9a-ce98-6b30d12824fc@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<aca4355a-d7f3-c116-fc7b-7379f269a21a@assyoma.it>
	<B6F45B41-86FC-4810-BC40-0EEE8DD9E372@redhat.com>
	<f2e24a01b1e548b6b15db6d30596208b@xenhideout.nl>
	<595ff1d4-3277-ca5e-a18e-d62eaaf0b1a0@redhat.com>
	<9aa2d67c38af3e4042bd3f37559b799d@xenhideout.nl>
	<eb24f4de-2b58-38a4-9c8d-950a36530ed7@redhat.com>
	<2d1025d7784ab44cbc03cfe7f6778599@xenhideout.nl>
	<58f99204-d978-3f6a-9db8-b7122b30575e@redhat.com>
	<458d105938796d90f4e426bc458e8cc4@xenhideout.nl>
	<f7665fc3546d23200e9b08c6cdb67d2e@xenhideout.nl>
	<67e57de26f65447bde9e55bcf9a99ccc@xenhideout.nl>
	<d4b39ca6a299eb609f27f99e24eb7e26@assyoma.it>
	<e313e53f07abafead1713f03cf179542@xenhideout.nl>
	<45079be3-aa18-01f4-a663-7015c018e6f1@redhat.com>
	<5a579d450c0b079c3bc635eeb70e7c62@xenhideout.nl>
	<943c9d2c-0dd6-5d9a-ce98-6b30d12824fc@redhat.com>
Message-ID: <a0d46eaf4f73313e0db78da8d8594f2a@xenhideout.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Instead of responding here individually I just sought to clarify in my 
other email that I did not intend to mean by "kernel feature" any form 
of max snapshot constraint mechanism.

At least nothing that would depend on size of snapshots.


Zdenek Kabelac schreef op 21-09-2017 15:02:

> And you also have project that do try to integrate shared goals like 
> btrfs.

Without using disjunct components.

So they solve human problem (coordination) with technical solution (no 
more component-based design).

> We hope community will provide some individual scripts...
> Not a big deal to integrate them into repo dir...

We were trying to identify common cases so that LVM team can write those 
skeletons for us.

> It's mostly about what can be supported 'globally'
> and what is rather 'individual' customization.

There are people going to be interested in common solution even if it's 
not everyone all at the same time.

> Which can't be deliver with current thinp technology.
> It's simply too computational invasive for our targeted performance.

You misunderstood my intent.

> I assume you possibly missed this logic of thin-p:

> So when you 'write' to ORIGIN - your snapshot which becomes bigger in
> terms of individual/exclusively owned chunks - so if you have i.e.
> configured snapshot to not  consume more then  XX% of your pool - you
> would simply need to recalc this with every update on shared
> chunks....

I knew this. But we do not depend for the calculations on CONSUMED SPACE 
(and its character/distribution) but only on FREE SPACE.

> And as has been already said - this is currently unsupportable 'online'

And unnecessary for the idea I was proposing.

Look, I am just trying to get the idea across correctly.

> Another aspect here is - thin-pool has  no idea about 'history' of
> volume creation - it doesn't not know  there is volume X being
> snapshot of volume Y - this all is only 'remembered' by lvm2 metadata
> -  in kernel - it's always like  -  volume X  owns set of chunks  1...
> That's all kernel needs to know for a single thin volume to work.

I know this.

However you would need LVM2 to make sure that only origin volumes are 
marked as critical.

> Unsupportable in 'kernel' without rewrite and you can i.e.
> 'workaround' this by placing 'error' targets in place of less
> important thinLVs...

I actually think that if I knew how to do multithreading in the kernel, 
I could have the solution in place in a day...

If I were in the position to do any such work to begin with... :(.

But you are correct that error target is almost the same thing.

> Imagine you would get pretty random 'denials' of your WRITE request
> depending on interaction with other snapshots....

All non-critical volumes would get write requests denied, including 
snapshots (even read-only ones).

> Surely if use 'read-only' snapshot you may not see all related
> problems, but such a very minor subclass of whole provisioning
> solution is not worth a special handling of whole thin-p target.

Read-only snapshots would also die en masse ;-).


> You are not 'reserving' any space as the space already IS assigned to
> those inactive volumes.

Space consumed by inactive volumes is calculated into FREE EXTENTS for 
the ENTIRE POOL.

We need no other data for the above solution.

> What you would have to implement is to TAKE the space FROM them to
> satisfy writing task to your 'active' volume and respect
> prioritization...

Not necessary. Reserved space is a metric, not a real thing.

Reserved space by definition is a part of unallocated space.

> If you will not implement this 'active' chunk 'stealing' - you are
> really ONLY shifting 'hit-the-wall' time-frame....  (worth possibly
> couple seconds only of your system load)...

Irrelevant. Of course we are employing a measure at 95% full that will 
be like error targets replacing all non-critical volumes.

Of course if total mayhem ensues we will still be in trouble.

The idea is that if this total mayhem originates from non-critical 
volumes, the critical ones will be unaffected (apart from their 
snapshots).

You could flag snapshots of critical volumes also as critical and then 
not reserve any space for them so you would have a combined space 
reservation.

Then snapshots for critical volumes would live longer.

Again, no consumption metric required. Only free space metrics.

> In other words - tuning 'thresholds' in userspace's 'bash' script will
> give you very same effect as if you are focusing here on very complex
> 'kernel' solution.

It's just not very complex.

You thought I wanted space consumption metric for all volumes including 
snapshots and then invididual attribution of all consumed space.

Not necessary.

The only thing I proposed used negative space (free space).
