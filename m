Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8HEGsf8019564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 10:16:54 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDADD80086
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 14:16:51 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id B9A5AA6808
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 16:16:52 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 17 Sep 2016 16:16:50 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <368387847.156920.1474117496841@mail.yahoo.com>
References: <368387847.156920.1474117496841.ref@mail.yahoo.com>
	<368387847.156920.1474117496841@mail.yahoo.com>
Message-ID: <8340e33605f0a84b10ed1d626cfecfbe@dds.nl>
Subject: Re: [linux-lvm] creating DD copies of disks
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

matthew patton schreef op 17-09-2016 15:04:
>> What is the proper procedure when duplicating a disk with DD?
> 
> If you're literally duplicating the entire disk, what on earth are you
> doing keeping it in the same system?

That's very simple, I'm surprised you wouldn't see it.

> OF COURSE you remove it from the
> origin box if you expect to do anything with it.

Why would you? That's like making a photo-copy of something and then 
moving to another house before you can read it.

If anything, it's only technical limitations that would mandate such a 
thing. This also doesn't answer the question of what to do if you have 
VG with identical names.

> And I presume there
> are no active filesystems or frankly writable LVM components on the
> source disk while the DD is running?

Nope. All VGS had been deactivated (was running from a bootable stick).


> Most times it's only the filesystems that contain interesting data an
> so a DD of the filesystem is understandable even though there are
> other tools like RSYNC which are more logical.

Trouble is making a backup of a complex setup is also complex if you 
don't have the required tools for it and even "clonezilla" cannot really 
handle LVM that well. So you're down to manually writing scripts to do 
all of the steps that you need to do to back up the required data (e.g. 
LVM metadata, and such) and then the steps to recreate it when you 
restore a backup (if any).

So in this case I was just making a backup of a disk because I might be 
needing to send the origin disk out for repair, so to speak. The disk 
contains various partitions and LVM structures. A clonezilla backup is 
possible, but cannot handle encryption. But because the new disk is 
meant to replace the old one (for a time) I need a literal copy anyway. 
Now of course I could clone the non-LVM partitions and then recreate 
volume groups etc. with different names, but this is arduous.

In that case I would have unique UUIDs but would still need to change my 
new volume group names so the systems can coexist while the copy is 
running.

At this point I'm not even sure.... well.

Let's just say I need to ensure the operation of this disk in this 
system completely prior to dumping the old one. There are only two ways: 
disconnect the source disk (and try to boot from the new system, etc.) 
or run from usb stick and disconnect the source disk, in that case. But 
if issues arise, I may need the source disk as well. Why would there not 
be an option to have it loaded at the same time? They are separate 
disks, and should ideally not directly conflict. In the days prior to 
UUID, this never happened; there were never any conflicts in that sense 
(unless you use filesystem labels and partition labels of course).

So I first want to settle into a peaceful coexistence because that is 
the most potent place to move forward from, I'm sure you understand. 
First cover the basics, then move on.

One answer.... well.

In any case it is clear that after changing the UUID of the PV and VG 
and changing the VG name, the duplicate disk can serve just fine for the 
activation of certain things, because LVM doesn't care what your VG is 
called, it will just find your LV by its UUID, if that makes sense.

So the duplicate LVS still have identical UUIDs and hence still perform 
in the old way (and cannot really coexist now).

However it seems not possible to change the UUID of a LV.

https://www.redhat.com/archives/rhl-list/2008-March/msg00329.html

Not answered to satisfaction. Why would you need to use two different 
systems to copy data between two disks? That seems hardly possible.

I have now two VGS with different UUIDs:

VG UUID               jrDQRC-6tlI-n1xK-O7nh-xVAt-Y5SL-Ou8X7b
VG UUID               KyWokE-ddUN-8GXO-HgWA-5bqU-9HN2-57Qyho

But when I allow the 2nd one (the new one) to be activated, and activate 
something else as well, its LVs will be used just fine as PV for 
something else, based on UUID and nothing else.


Indeed, blkid will show them as having identical UUIDs.

Now I had forgot to run pvchange -u on those LVs, so I guess Alistair 
was right in that thread. But the pvchange -u also instantly updated the 
VGS that referenced it; which is not so bad, but now the system will run 
with the new disk, and not the old disk.

But that means part of the "migration" is at least complete from this 
point of view. So thank you.

Now that Linux has no issues whatsoever I will have to see what Windows 
is going to do.

It's nice to know that when you change the UUID of a LV that is used as 
PV for something else, that something else is updated automatically. 
That was part of my question: how do I inform the "user" of the changed 
PVS (UUIDS)?

So what I have now is basically a duplicate disk but all the UUIDs are 
different (at least for the LVM).

But generally I do not mount with UUID so for the partitions it is not 
really an issue now.

The backup was also made for safety at this point.

I just won't be able to use the old system until I change it back. Time 
to test, isn't it.
