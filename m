Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6HLnQa22580
	for <linux-lvm@redhat.com>; Sat, 17 Jul 2004 17:49:26 -0400
Received: from home.menalto.com (home.menalto.com [198.144.206.35])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6HLnKXn026047
	for <linux-lvm@redhat.com>; Sat, 17 Jul 2004 17:49:20 -0400
Received: from firebrand.menalto.com ([10.0.5.11])
	by home.menalto.com with esmtp (Exim 4.34) id 1Blx3X-0005f7-S4
	for linux-lvm@redhat.com; Sat, 17 Jul 2004 14:49:19 -0700
Message-ID: <40F99EDF.3070005@menalto.com>
Date: Sat, 17 Jul 2004 14:49:19 -0700
From: Bharat Mediratta <bharat@menalto.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Cleanly removing a PV from an LV or,
 how do I get more available extents?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com


I've been happily using LVM for a couple of months now to aggregate a 
bunch of disks together into one logical drive for a Debian box that I 
use as an over-the-network backup of my various other boxen.  Thus far, 
it's been great.

Recently however, I started getting parity errors on one of the drives 
that's in my logical volume.  It's a tiny drive that I threw in there 
merely because I had it, and its loss will not be missed.  I just want 
to remove it altogether and pretend like it never existed.  I'd like to 
preserve the data that's on the drive, if possible, but if not -- I'm ok 
  with losing it, since that data will come back next time I run my backups.

I read the FAQ, the HOWTO and scanned the mailing list archives and it 
appears that I need to do a pvmove to get the data off of that drive, 
and then a vgreduce to remove it from the volume group.  Unfortunately, 
when I try to do the pvmove, I get:

% pvmove /dev/sdb
No extents available for allocation

I'm assuming that this means that there's nowhere to move the data that 
is on /dev/sdb.  I further assume this means that I need some free 
physical extents somewhere.  This is where I'm confused.  When I set up 
LVM, I allocated all of my spare drives to it.  So I have a 271GB
logical volume of which I'm using only 32GB.  So I know that I have free 
space to move the data around; I just don't know how to do it.

So.  How do I get more free physical extents inside my logical volume? 
I feel confident that there's an easy answer for this that I overlooked, 
but I can't find it.  Hopefully the context below will help a bit.

Thanks in advance,
-Bharat

================================

% lvdisplay
   --- Logical volume ---
   LV Name                /dev/data/data1
   VG Name                data
   LV UUID                abrnMJ-2MqB-tkQl-g8g6-xYXx-KLE8-PMbNdG
   LV Write Access        read/write
   LV Status              available
   # open                 1
   LV Size                275.19 GB
   Current LE             70448
   Segments               4
   Allocation             inherit
   Read ahead sectors     0
   Block device           254:0

% vgdisplay
   --- Volume group ---
   VG Name               data
   System ID
   Format                lvm2
   Metadata Areas        4
   Metadata Sequence No  8
   VG Access             read/write
   VG Status             resizable
   MAX LV                255
   Cur LV                1
   Open LV               1
   Max PV                255
   Cur PV                4
   Act PV                4
   VG Size               275.19 GB
   PE Size               4.00 MB
   Total PE              70448
   Alloc PE / Size       70448 / 275.19 GB
   Free  PE / Size       0 / 0
   VG UUID               PjytLd-X99E-iUTf-drKH-42dl-2QHO-6qBcmB

% pvdisplay
   --- Physical volume ---
   PV Name               /dev/sda
   VG Name               data
   PV Size               34.20 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              8755
   Free PE               0
   Allocated PE          8755
   PV UUID               q8ElTG-XOoB-nQy6-8VTU-wZlR-uj3b-Vrnxlp

   --- Physical volume ---
   PV Name               /dev/sdb
   VG Name               data
   PV Size               8.55 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              2189
   Free PE               0
   Allocated PE          2189
   PV UUID               dDZOFg-nQES-cCgO-l5KF-9JIz-i2hh-OpcP1V

   --- Physical volume ---
   PV Name               /dev/sdc
   VG Name               data
   PV Size               34.25 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              8768
   Free PE               0
   Allocated PE          8768
   PV UUID               B8dtE3-gdB7-aakQ-p4EY-CysX-b6VU-LrBYmc

   --- Physical volume ---
   PV Name               /dev/hde7
   VG Name               data
   PV Size               198.19 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              50736
   Free PE               0
   Allocated PE          50736
   PV UUID               bz31lu-ck6I-439l-IbWs-hb40-g6rm-rWE3oq
