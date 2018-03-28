Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC5376012A
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2018 10:08:30 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8034BC052436
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2018 10:08:27 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp1.signet.nl (Postfix) with ESMTP id 93DC8611FF
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2018 12:08:26 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 28 Mar 2018 12:08:25 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <0fd9ce65-75da-f685-b7d1-c5ee9eecda3a@gmail.com>
References: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
	<229d22d1217a7fa96874df0fb6d53e0c@xenhideout.nl>
	<5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
	<CAD+pdNdPKmHb7BQfT4DUj2M+=yy1P3JYtXO4GjNRXn2QA_cwwA@mail.gmail.com>
	<5ABA4D6D020000F9000B1E44@prv-mh.provo.novell.com>
	<8d1d7152bf62372494a0aa5d2be0012c@xenhideout.nl>
	<b9f55f3f-1998-4ca8-b6ce-e0a2be6e2698@gmail.com>
	<e790670450869fed7cdbbea58708ca23@xenhideout.nl>
	<0fd9ce65-75da-f685-b7d1-c5ee9eecda3a@gmail.com>
Message-ID: <7ee70f0127cdc11fcee196aaf2b8c81e@xenhideout.nl>
Subject: Re: [linux-lvm] Can't work normally after attaching disk volumes
 originally in a VG on another machine
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

Zdenek Kabelac schreef op 28-03-2018 0:17:

> Hi
> 
> This is why users do open BZ if they would like to see some 
> enhancement.
> 
> Normally cache is integral part of a volume - so it's partially
> missing - whole volume is considered to be garbage.
> 
> But in 'writethrough' mode there could be likely possible better 
> recovery.
> 
> Of course this case needs usability without --force.
> 
> So please open  RFE BZ for this case.

It goes into the mess I usually get myself into; if you "dd copy" the 
disk containing the origin volume before uncaching it, and then go to 
some live session where you only have the new backup copy, but you want 
to clean up its LVM,

then you now must fix the VGs in isolation of the cache; I suppose this 
is just the wrong order of doing things, but as part of a backup you 
don't really want to uncache first, as that requires more work to get it 
back to normal after.

So you end up in a situation where the new origin copy has a reference 
to the cache disk --- all of this assumes writethrough mode --- and you 
need to clear that reference.

However, you cannot, or should not, attach the cache disk again; it 
might get effected, and you don't want that, you want it to remain in 
its pristine state.

Therefore, you are now left with the task of removing the cache from the 
VG, because you cannot actually run vgimportclone while the cache disk 
is missing.

The obvious solution is to *also* clone the cache disk and then run 
operations on the combined set, but this might not be possible.

Therefore, all that was left was:

   vgreduce --remove-missing --force
   cd /etc/lvm/archive
   cp <latest backup> /etc/lvm/backup/<vg>
   cd /etc/lvm/backup
   vi <vg>
   " remove cache PV, and change origin to regular linear volume, and add
   " the visible tag

   vgcfgrestore <vg>

   # presto, origin is restored as regular volume without the cache

   vgimportclone -i <vg> <bla>

   # now have distinct volume group, VG UUID and PV UUID

So the problem is making dd backups of origin, perhaps dd backups should 
be avoided, but for some purposes (such as system migration) file copies 
are just

more work

in general, and can complicate things as well, for instance if there are 
NTFS partitions or whatnot.

And disk images can be nice to have, in any case.

This was the use case basically.
