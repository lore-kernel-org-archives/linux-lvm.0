Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6NDpFa04695
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2004 09:51:15 -0400
Received: from smtp.mailbox.co.uk (smtp.mailbox.co.uk [195.82.125.32])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6NDp9Xn031302
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2004 09:51:09 -0400
Received: from core.penguinpowered.org ([212.18.250.170]
	helo=smtp.penguinpowered.org)
	by smtp.mailbox.co.uk with esmtp (Exim 4.30) id 1Bo0S2-0004GN-MO
	for linux-lvm@redhat.com; Fri, 23 Jul 2004 14:51:06 +0100
Received: from localhost ([127.0.0.1] helo=webmail.penguinpowered.org)
	by smtp.penguinpowered.org with smtp (Exim 4.30; FreeBSD)
	id 1Bo0PA-0006HS-Ll
	for linux-lvm@redhat.com; Fri, 23 Jul 2004 14:48:08 +0100
Message-ID: <9644.195.50.100.20.1090590488.squirrel@webmail.penguinpowered.org>
Date: Fri, 23 Jul 2004 14:48:08 +0100 (BST)
From: "Wayne Pascoe" <lists-june2004@penguinpowered.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Sanity check - Raid 0+1 solution
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi all,

I think I've found a solution that will provide for our Raid 0+1
needs, and I'd just like to bounce it off of people for a sanity
check... I would like to explore EVMS, but Red Hat will not be
including it in the current version of AS (3). The same goes for LVM2
I believe. So I need to try and make this work with LVM1, or admit I
was wrong about this and go the Veritas route. I really don't want to
admit I was wrong just yet :D

I've started with a fresh RHEL AS installation (thanks to pxeboot and
kickstart, this is easy enough). My base system is all installed on 1
disk (/dev/sda), leaving me 5 to play with.

I've then done the following:

Created a 10GB partition on sdb, sdc, sdd and sde with a type of fd
(Linux raid autodetect). I've then created two RAID-1 devices in
/etc/raidtab, and used mkraid to create the raid devices.

Next, I've used
vgscan
pvcreate /dev/md0 /dev/md1
vgcreate vol01 /dev/md0 /dev/md1
lvcreate -i 2 -I 64 -n data01 -L6G vol01
mkfs.ext3 /dev/vol01/data01
mkdir /data01
mount /dev/vol01/data01 /data01

I then get a usable filesystem that I can copy things to. Next, I
unmounted the filesystem, and expanded it to 19G. When I remounted the
filesystem, it still looks healthy. I then attempted to copy 24GB of
data to the disk, and it barfed at 19GB, as expected. All files that
_were_ successfully copied looked healthy and checksums matched the
source files. So it looks like the expanded volume worked.

I then added /dev/vol01/data01  /data01  ext3   defaults  0 0 to
/etc/fstab and rebooted. My LVM volume was still there at boot time.
The only problem is that after the reboot, /proc/mdstat doesn't appear
to have my raid devices listed. I've seen this before, where if they
are not mounted at boot time, they do not appear in /proc/mdstat. If I
manually raidstart /dev/md0; raidstart /dev/md1, then they appear in
/proc/mdstat.

So where I am now :)

1. Is this sane ? I figure that I can loose any 1 disk, and my volumes
will still be ok. Is that correct ?

2. Can anyone advise how to bring the raid devices up at boot time,
since mounting the volume that is made up of these devices does not
appear to do the trick.

The biggest downside I can see to this solution is that I _HAVE_ to
assign the whole disk to the mirror at the beginning of my process.
Unlike with VxVM, I can't have part of a disk mirrored, and another
part of that disk part of a striped array, and still maintain the
ability to resize the mirrored part of the disk.

Having said that, disk is a lot cheaper than VxVM licences, and I
should be able to justify this solution.

Can anyone confirm, deny, or change my mind on these points ?

-- 
Wayne Pascoe
