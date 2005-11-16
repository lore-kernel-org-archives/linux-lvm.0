Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAG6rVV25016
	for <linux-lvm@redhat.com>; Wed, 16 Nov 2005 01:53:31 -0500
Received: from vms040pub.verizon.net (vms040pub.verizon.net [206.46.252.40])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAG6rNcK022651
	for <linux-lvm@redhat.com>; Wed, 16 Nov 2005 01:53:28 -0500
Received: from Chip ([71.241.247.44])
	by vms040.mailsrvcs.net (Sun Java System Messaging Server 6.2-4.02
	(built Sep
	9 2005)) with ESMTPA id <0IQ1000D9CGU7ST0@vms040.mailsrvcs.net> for
	linux-lvm@redhat.com; Wed, 16 Nov 2005 00:53:19 -0600 (CST)
Date: Wed, 16 Nov 2005 01:53:17 -0500
From: "Chip Tondreau" <chip@tondreau.net>
Message-id: <00c901c5ea7a$6c910440$6801a8c0@Chip>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] Help repairing a corrupted superblock in an LVM
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

Hi Folks,

I've been a bad newbie.  After installing a new SuSE 10 installation using
LVM
(4 drives, ~370GB "root" lv mounted at "/" and a 2GB "swap" lv), I migrated
a 
shedload of very important data to the server, I decided to add a fifth
physical 
drive to the volume. It turns out the drive was bad and on reboot, the LVM 
would not mount and the system would not start.

I purchased a new 300GB drive, unhooked the LVM drives and installed a new 
system on the new drive.  Once this was completed, I reattached the LVM
drives 
(except the bad drive) and booted.  SuSE successfully recognized the LVM
and I was able to remove the bad drive definition using pvdelete.  Here is
the
current config:

     server:/ # pvscan -v >
         Wiping cache of LVM-capable devices
         Wiping internal VG cache
         Walking through all physical volumes
       PV /dev/hda2   VG system   lvm2 [74.29 GB / 40.00 MB free]
       PV /dev/hdb1   VG system   lvm2 [76.32 GB / 0    free]
       PV /dev/hde1   VG system   lvm2 [149.04 GB / 0    free]
       PV /dev/hdg1   VG system   lvm2 [74.50 GB / 0    free]
       Total: 4 [374.14 GB] / in use: 4 [374.14 GB] / in no VG: 0 [0   ]

     server:/ # lvscan -v
         Finding all logical volumes
       ACTIVE            '/dev/system/swap' [2.00 GB] inherit
       ACTIVE            '/dev/system/root' [372.10 GB] inherit

     server:/ # vgscan -v
         Wiping cache of LVM-capable devices
         Wiping internal VG cache
         Finding all volume groups
         Finding volume group "system"
       Reading all physical volumes.  This may take a while...
       Found volume group "system" using metadata type lvm2

Unfortunately, my attempt to mount the LVM fails because the superblock for
the file system is not valid.  It turns out that the number of blocks in the

superblock includes the blocks for the drive that was removed.  dd and fsck 
return:

     server:/ # dd if=/dev/system/root of=/dev/null bs=1k count=1024
     1024+0 records in
     1024+0 records out
     1048576 bytes (1.0 MB) copied, 0.032456 seconds, 32.3 MB/s

     server:/ # fsck /dev/system/root
     Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
     bread: Cannot read the block (127559679): (Invalid argument).

     reiserfs_open: Your partition is not big enough to contain the
     filesystem of (127559679) blocks as was specified in the found super
block.
     
     Failed to open the filesystem.
     
     If the partition table has not been changed, and the partition is
     valid  and  it really  contains  a reiserfs  partition,  then the
     superblock  is corrupted and you need to run this utility with
     --rebuild-sb.
     
     Warning... fsck.reiserfs for device /dev/system/root exited with signal
6.
     fsck.reiserfs /dev/system/root failed (status 0x8). Run manually!

I have now reached the end of what little I know about this process.  Does
anyone
have any suggestions as to how to repair the superblock?  I tried the
--rebuild-sb
but it does not work (returns an "unknown -e parameter" error... Strange...)

Thanks,

Chip
