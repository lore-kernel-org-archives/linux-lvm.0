Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6T1PFa02892
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 21:25:15 -0400
Received: from mailddi.com (209-161-17-11.impact-technologies.boi.fiberpipe.net
	[209.161.17.11])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6T1PEe1015189
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 21:25:14 -0400
From: "Justin R. Mayfield" <mayfield@dedicateddev.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1091064309.3839.19.camel@mayfield-lx.nam.dedicateddev.com>
Mime-Version: 1.0
Date: Wed, 28 Jul 2004 19:25:09 -0600
Subject: [linux-lvm] big endian arm support?
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
To: lvm <linux-lvm@redhat.com>

I'm not able to create Volume groups successfully on a Big Endian Xscale
Intel IXP425;  Here is a log of what happens, along with some
potentially helpful debug...

dd if=/dev/zero of=/dev/discs/disc0/disc bs=1M count=1
1+0 records in
1+0 records out

pvcreate /dev/discs/disc0/disc
  Physical volume "/dev/discs/disc0/disc" successfully created

pvdisplay /dev/discs/disc0/disc
  No physical volume label read from /dev/discs/disc0/disc
  Failed to read physical volume "/dev/discs/disc0/disc"

vgcreate vg00 /dev/discs/disc0/disc
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  No physical volume label read from /dev/discs/disc0/disc
  /dev/discs/disc0/disc not identified as an existing physical volume
  Unable to add physical volume '/dev/discs/disc0/disc' to volume group
'vg00'.

vgdisplay --version
  LVM version:     2.00.20 (2004-07-03)
  Library version: 1.00.19-ioctl (2004-07-03)
  Driver version:  4.1.0

uname -a
Linux mayfield-blueridge 2.6.7-rc3 #27 Mon Jul 26 19:11:25 MDT 2004
armv5teb unknown

I'm using glibc-2.3.2 and a gcc 3.4.0 FYI.

Also, I read the LVM2 is not focusing on performance and may be
extremely slow compared to LVM1 (factor or 2 was thrown around);  Is
this still true?  I need max speed from my disk subsystem, as I'm
already on a slow platform.  I tried using LVM1, but the compile is
massively broken, and it looks like modern 2.6 kernels don't support
this (No def of LVM_MAJOR, etc, etc);  Perhaps I just need to dig some
more into making LVM1 work for me.
