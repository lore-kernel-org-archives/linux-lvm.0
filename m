Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8L3ctDi031183
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 23:38:55 -0400
Received: from sccrmhc13.comcast.net (sccrmhc13.comcast.net [204.127.200.83])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8L3cnFg030535
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 23:38:49 -0400
Message-ID: <4512093F.1050802@macfadden.org>
Date: Wed, 20 Sep 2006 21:38:39 -0600
From: Michael MacFadden <mike@macfadden.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM Missing Space
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
Cc: Derrick Hudson <dman@dman13.dyndns.org>

Hello,

I have been trying to setup LVM for the first time on an RAID 5 Array.
The problem I have is that the raid array has 640Gb of usable space, but
when I create the LVM Physical Volume and Volume group I wind up with
596Gb.  I don't know where 44 gigs went to.  I am on Debian with a
2.6.17 kernel.

When I do fdisk -l I get this:

 fdisk -l

Disk /dev/sda: 639.9 GB, 639977390080 bytes
255 heads, 63 sectors/track, 77806 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/sda doesn't contain a valid partition table

Disk /dev/hda: 163.9 GB, 163928604672 bytes
255 heads, 63 sectors/track, 19929 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1       19740   158561518+  83  Linux
/dev/hda2           19741       19929     1518142+   5  Extended
/dev/hda5           19741       19929     1518111   82  Linux swap / Solaris


Here you can see /dev/sda is 639.9GB.

I then do:

 $ pvcreate /dev/sda
  Physical volume "/dev/sda" successfully created
$ pvdisplay /dev/sda
  --- NEW Physical volume ---
  PV Name               /dev/sda
  VG Name
  PV Size               596.03 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               po9rKd-gOKR-jfmx-yjUm-R5Wl-us2j-s6qZN1

You see here I only get 596Gb.  Also if I run the lvmdiskscan utility I get:

lvmdiskscan
  /dev/ram0  [        8.00 MB]
  /dev/sda   [      596.03 GB] LVM physical volume
  /dev/ram1  [        8.00 MB]
  /dev/hda1  [      151.22 GB]
  /dev/ram2  [        8.00 MB]
  /dev/ram3  [        8.00 MB]
  /dev/ram4  [        8.00 MB]
  /dev/ram5  [        8.00 MB]
  /dev/hda5  [        1.45 GB]
  /dev/ram6  [        8.00 MB]
  /dev/ram7  [        8.00 MB]
  /dev/ram8  [        8.00 MB]
  /dev/ram9  [        8.00 MB]
  /dev/ram10 [        8.00 MB]
  /dev/ram11 [        8.00 MB]
  /dev/ram12 [        8.00 MB]
  /dev/ram13 [        8.00 MB]
  /dev/ram14 [        8.00 MB]
  /dev/ram15 [        8.00 MB]
  0 disks
  18 partitions
  1 LVM physical volume whole disk
  0 LVM physical volumes


Again listing 596.03Gb.  What's going on here.  Why do I seem to be
getting less capacity in the physical volume than actually on the drive.
I really would like to use LVM but if I am going to lose 40Gigs then its
not really worth it.  Any help or ideas would be appreciated.

Regards,
Michael MacFadden
