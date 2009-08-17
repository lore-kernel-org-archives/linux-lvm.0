Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n7H09B2i023745
	for <linux-lvm@redhat.com>; Sun, 16 Aug 2009 20:09:11 -0400
Received: from out1.smtp.messagingengine.com (out1.smtp.messagingengine.com
	[66.111.4.25])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n7H08rsG032495
	for <linux-lvm@redhat.com>; Sun, 16 Aug 2009 20:08:53 -0400
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 603414CCCD
	for <linux-lvm@redhat.com>; Sun, 16 Aug 2009 20:08:53 -0400 (EDT)
Message-Id: <1250467733.18434.1330126635@webmail.messagingengine.com>
From: "Edward Siefker" <hatta00@fastmail.fm>
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Date: Sun, 16 Aug 2009 17:08:53 -0700
Subject: [linux-lvm] /dev/dm-* or /dev/mapper/*
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I originally set up raid-luks-lvm on this machine with debian's
installer tool, now I am trying to add another encrypted raid1 device to
the existing volume group.  I already have the raid device set up and
encrypted, that's no problem.  Now the linux gazette
(http://linuxgazette.net/140/pfeiffer.html) tells me I should run
'pvcreate' on the device in /dev/mapper.  However, if I examine my
existing physical volumes with 'pvscan' I get the following:

iblis:/home/hatta# pvscan
  PV /dev/dm-0   VG iblis-volumes   lvm2 [931.32 GB / 0    free]
  Total: 1 [931.32 GB] / in use: 1 [931.32 GB] / in no VG: 0 [0   ]

Apparently I am using /dev/dm-0 instead of /dev/mapper/md1_crypt. I
wondered if these were maybe two names for the same thing, so I checked
ls:

iblis:/home/hatta# ls -ld /dev/dm-0 /dev/mapper/md1_crypt
brw-rw---- 1 root disk 253, 0 2009-08-16 12:02 /dev/dm-0
brw-rw---- 1 root disk 253, 0 2009-08-16 12:02 /dev/mapper/md1_crypt

Same major and minor number, if that means anything.  Next I ran
'dmcrypt info' on each:

iblis:/home/hatta# dmsetup info /dev/dm-0
Device /dev/dm-0 not found
Command failed
iblis:/home/hatta# dmsetup info /dev/mapper/md1_crypt 
Name:              md1_crypt
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        7
Event number:      0
Major, minor:      253, 0
Number of targets: 1


It works on one, and not the other.  So they're not the same thing.  My
new device 'md2_crypt' corresponds to /dev/dm-8, if I am to trust the
major/minor numbers. Should I run pvcreate on /dev/dm-8 or
/dev/mapper/md2_crypt?

And this is a somewhat broader question.  If I have two encrypted
volumes like this in the same volume group, and I have a partition that
spans both physical volumes, what happens when one of those volumes is
not yet unlocked?  There is a short time during bootup that md1_crypt is
unlocked and md2_crypt is not yet unlocked. The boot scripts are
definitely doing something with my logical volumes in that period, since
I can use a keyfile in /root (which is in a logical volume on md1_crypt)
to unlock md2_crypt.  

This seems dangerous to me, what would happen if I added md2_crypt to
that volume group, and extended that filesystem over both physical
volumes?  Is it possible for my keyfile in /root to end up on md2_crypt
and be inaccessible?  Suppose I had trouble entering my passphrase 3
times and cryptsetup gave up. What would happen then?  Would my system
try to mount a logical volume that only half exists?  Could that corrupt
the filesystem?
-- 
  
  hatta00@fastmail.fm

-- 
http://www.fastmail.fm - A fast, anti-spam email service.
