Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4902961292
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 12:06:49 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D65EC0D8D6A
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 12:06:47 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id E52A2407F2AF
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 14:06:44 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 11 Sep 2017 14:06:45 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
Message-ID: <2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
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

Zdenek Kabelac schreef op 11-09-2017 13:20:

> Wondering from where they could get this idea...
> We always communicate clearly - do not plan to use 100% full
> unresizable thin-pool as a part of regular work-flow

No one really PLANS for that.

They probably plan for some 80% usage or less.

But they *do* use thin provisioning for over-provisioning.

So the issue is runaway processes.

Typically the issue won't be "as planned" behaviour.

I still intend to write more better monitoring support for myself if I 
ever get the chance to code again.

> - it's always
> critical situation often even leading to system's reboot and full
> check of all volumes.

I know that but the issue is to prevent the critical situation (if the 
design should allow for that).

TWO levels of failure:

- Filesystem level failure
- Block layer level failure

File system level failure can also not be critical because of using 
non-critical volume because LVM might fail even though filesystem does 
not fail or applications.

Block level layer failure is much more serious, and can prevent system 
from recovering when it otherwise could.

> Thin-pool  needs to be ACTIVELY monitored

But monitoring is labour intensive task unless monitoring systems are in 
place with email reporting and so on.

Do those systems exist? Do we have them available?

I know I wrote one the other day and it is still working so I am not so 
much in a problem right now.

But in general it is still a poor solution for me (because I didn't 
develop it further and it is just a Bash script using some log reading 
functionality using the older version of LVM's reporting feature into 
the syslog (systemd-journald).

> and proactively either added
> more PV free space to the VG

That is not possible in the use case described. Not all systems have 
instantly more space available, or even able to expand, and may still 
want to use LVM thin provisioning because of the flexibility it 
provides.

> or eliminating  unneeded 'existing'
> provisioned blocks (fstrim

Yes that is very good to do that, but also needs setup.

> ,  dropping snapshots

Might also be good in more fully-fledged system.

> , removal of unneeded
> thinLVs....

Only manual intervention this one... and last resort only to prevent 
crash so not really useful in general situation?

> -  whatever comes on your mind to make a more free space
> in thin-pool

I guess but that is lot of manual intervention. We like to also be safe 
in case we're sleeping ;-).

> - lvm2 fully supports now to call 'smart' scripts
> directly out of dmeventd for such action.

Yes that is very good, thank you for that. I am still on older LVM 
making use of existing logging feature, which also works for me for now.

> It's illusion to hope anyone will be able to operate lvm2 thin-pool at
> 100% fullness reliable

That's not what we want.

100% is not the goal. Is exceptional situation to begin with.

> - there should be always enough room to give
> 'scripts' reaction time

Sure but some level of "room reservation" is only to buy time -- or 
really perhaps to make sure main system volume doesn't crash when data 
volume fills up by accident.

But system volumes already have reserved space filesystem level.

But do they also have this space reserved in actuality? I doubt it. Not 
on the LVM level.

So it is only to mirror that filesystem feature.

Now you could do something on the filesystem level to ensure that those 
blocks are already allocated on LVM level, that would be good too.

> to gain some more space in-time

Yes email monitoring would be most important I think for most people.

> - so thin-pool can
> serve free chunks for provisioning - that's been design

Aye but does design have to be complete failure when condition runs out?

I am just asking whether or not there is a clear design limitation that 
would ever prevent safety in operation when 100% full (by accident).

You said before that there was design limitation, that concurrent 
process cannot know whether the last block has been allocated.

> - to deliver
> blocks when needed,
> not to brake system

But it's exceptional situation to begin with.

>> Are there structural design inhibitions that would really prevent this 
>> thing from ever arising?
> 
> Yes, performance and resources consumption.... :)

Right, that was my question I guess.

So you said before it was a concurrent thread issue.

Concurrent allocation issue using search algorithm to find empty blocks.

> And there is fundamental difference between full 'block device' sharing
> space with other device - compared with single full filesystem - you
> can't compare these 2 things at all.....

You mean BTRFS being full filesystem.

I still think theoretically solution would be easy if you wanted it.

I mean I have been programmer for many years too ;-).

But it seems to me desire is not there.
