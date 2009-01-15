Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0F3tloc030666
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 22:55:47 -0500
Received: from blu0-omc3-s11.blu0.hotmail.com (blu0-omc3-s11.blu0.hotmail.com
	[65.55.116.86])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0F3tVRK009833
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 22:55:31 -0500
Message-ID: <BLU117-W51CBAE0430A271DF3DC52FFAD70@phx.gbl>
From: Bob Smith <simon_seys@hotmail.com>
Date: Wed, 14 Jan 2009 22:55:30 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Can no longer mount logical volume after a kernal
	panic. HELP!
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



I have been using LVM for quite a while to create a 3.64 stripe out of 4 x 1TB drives.  I use this as storage for my MythTV.  Tonight my system had a kernel panic, and when I rebooted I was no longer able to mount my LV, when I do I get:

----------------------------------------------------------------------------------------------------------------------------------------------
mount: wrong fs type, bad option, bad superblock on /dev/mapper/stripe-raid,
       missing codepage or helper program, or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so

The system was setup as one logcal volume called stripe, vgscan shows:

  Reading all physical volumes.  This may take a while...
  Found volume group "stripe" using metadata type lvm2
----------------------------------------------------------------------------------------------------------------------------------------------

Doing an lvscan shows:

----------------------------------------------------------------------------------------------------------------------------------------------
ACTIVE            '/dev/stripe/raid' [3.64 TB] inherit
----------------------------------------------------------------------------------------------------------------------------------------------

When I do an fdisk -l /dev/stripe/raid (I know these are really dumb names for the lv and vg):

----------------------------------------------------------------------------------------------------------------------------------------------
Disk /dev/mapper/stripe-raid: 4000.8 GB, 4000812367872 bytes
255 heads, 63 sectors/track, 486404 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x00000000

Disk /dev/mapper/stripe-raid doesn't contain a valid partition table
----------------------------------------------------------------------------------------------------------------------------------------------

Which makes me really worried that something has happened to the partition table when I was forced to reboot after the kernel panic.  Doing fdisk /dev/stripe/raid shows:

----------------------------------------------------------------------------------------------------------------------------------------------
Device contains neither a valid DOS partition table, nor Sun, SGI or OSF disklabel
Building a new DOS disklabel with disk identifier 0xce9c3ab2.
Changes will remain in memory only, until you decide to write them.
After that, of course, the previous content won't be recoverable.


The number of cylinders for this disk is set to 486404.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)
Warning: invalid flag 0x0000 of partition table 4 will be corrected by w(rite)
----------------------------------------------------------------------------------------------------------------------------------------------

I known when I was first playing with LVM I had a similar issue., and remember getting a similar error when starting fdisk like the one above.  Because I was just playing with LVM and had no read data I recall just doing write in FDISK and everything went back to normal.   However now  that I do have a bit of data on here I am afraid to try this without running it by the list.

Can anyone recommend what I should do?

I can provide more details if necessary with regards to my LVM setup.

Thank you.
Simon









_________________________________________________________________
Keep in touch and up to date with friends and family. Make the connection now.
http://www.microsoft.com/windows/windowslive/
