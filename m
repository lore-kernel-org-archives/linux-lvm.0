Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAEM9iRr031419
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 17:09:44 -0500
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAEM9gW7020790
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 17:09:42 -0500
Received: from wolverine (unknown [192.168.1.127])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id C3F1B12EDE
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 22:09:31 +0000 (GMT)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Contents of read-only LVM snapshot change when both
	LV and SNAP are Read-Only
Date: Tue, 14 Nov 2006 22:11:24 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20061114115201.B155D12EDE@bluewhale.planbit.co.uk>
Message-Id: <20061114220931.C3F1B12EDE@bluewhale.planbit.co.uk>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi,

I've sent a few mails on this subject but I have (finally) narrowed a consistent test sequence that fails.

To re-summarise, this is on a Debian Sarge machine with updated 2.6.16.20 kernel and the latest LVM/DM libraries and tools.

dromedary:~# lvm version
  LVM version:     2.02.14 (2006-11-10)
  Library version: 1.02.12 (2006-10-13)
  Driver version:  4.5.0
dromedary:~# uname -a
Linux dromedary 2.6.16.20.rwl2 #1 Wed Jul 26 12:52:43 BST 2006 i686 GNU/Linux
dromedary:~#

I have a MD RAID-1 disk array with LVM on top of it.  I was backing up the LV "backupimage" when I noticed the problem.   Although
the LV is read-only and reads the same data consistently, if I take a snapshot of the stable LV, the contents of the LV change.
What I am seeing change is a single byte at offset 0x0313CAC6C7 in the snapshot LV and it is changing between values 0x08 and 0x48.
I detected this when I was verifying a copy of the snapshot against an SHA1 checksum of its contents on LVM.  It was at this point
that I found the contents of the snapshot LV to be changing.

My command sequence that reliably repeats this is:

dromedary: dromedary:~# lvs
  LV          VG          Attr   LSize  Origin      Snap%  Move Log Copy%
  backupimage clientstore ori-ao 50.00G
  root        clientstore -wi-ao  5.00G
  userdisk    clientstore -wi-ao 50.00G
dromedary:~# dd if=/dev/clientstore/backupimage bs=1 skip=13216958151 count=1 | hd
1+0 records in
1+0 records out
1 bytes transferred in 0.000097 seconds (10307 bytes/sec)
00000000  08                                                |.|
00000001
dromedary:~# dd if=/dev/clientstore/backupimage bs=1 skip=13216958151 count=1 | hd
1+0 records in
1+0 records out
1 bytes transferred in 0.000094 seconds (10628 bytes/sec)
00000000  08                                                |.|
00000001
dromedary:~# dd if=/dev/clientstore/backupimage bs=1 skip=13216958151 count=1 | hd
1+0 records in
1+0 records out
1 bytes transferred in 0.000095 seconds (10523 bytes/sec)
00000000  08                                                |.|
00000001
dromedary:~#

At this point, the LV in question is read-only and its contents are stable...

dromedary:~# lvcreate -L10G -p r -s -n snapdisk /dev/clientstore/backupimage
  Logical volume "snapdisk" created
dromedary:~# lvs
  LV          VG          Attr   LSize  Origin      Snap%  Move Log Copy%
  backupimage clientstore ori-ao 50.00G
  root        clientstore -wi-ao  5.00G
  snapdisk    clientstore sri-a- 10.00G backupimage   0.00
  userdisk    clientstore -wi-ao 50.00G
dromedary:~#

We now add the snapshot, again it is read-only.

dromedary:~# dd if=/dev/clientstore/backupimage bs=1 skip=13216958151 count=1 | hd
1+0 records in
1+0 records out
1 bytes transferred in 0.000090 seconds (11106 bytes/sec)
00000000  08                                                |.|
00000001
dromedary:~# dd if=/dev/clientstore/backupimage bs=1 skip=13216958151 count=1 | hd
1+0 records in
1+0 records out
1 bytes transferred in 0.000096 seconds (10416 bytes/sec)
00000000  08                                                |.|
00000001
dromedary:~# dd if=/dev/clientstore/backupimage bs=1 skip=13216958151 count=1 | hd
1+0 records in
1+0 records out
1 bytes transferred in 0.000092 seconds (10871 bytes/sec)
00000000  08                                                |.|
00000001
dromedary:~#


** It looks like the main disk is still stable...


dromedary:~# dd if=/dev/clientstore/snapdisk bs=1 skip=13216958151 count=1 | hd
00000000  48                                                |H|
00000001
1+0 records in
1+0 records out
1 bytes transferred in 0.013386 seconds (75 bytes/sec)
dromedary:~# dd if=/dev/clientstore/snapdisk bs=1 skip=13216958151 count=1 | hd
00000000  08                                                |.|
00000001
1+0 records in
1+0 records out
1 bytes transferred in 0.013048 seconds (77 bytes/sec)
dromedary:~# dd if=/dev/clientstore/snapdisk bs=1 skip=13216958151 count=1 | hd
00000000  48                                                |H|
00000001
1+0 records in
1+0 records out
1 bytes transferred in 0.012758 seconds (78 bytes/sec)
dromedary:~# dd if=/dev/clientstore/snapdisk bs=1 skip=13216958151 count=1 | hd
00000000  08                                                |.|
00000001
1+0 records in
1+0 records out
1 bytes transferred in 0.001883 seconds (531 bytes/sec)
dromedary:~# dd if=/dev/clientstore/snapdisk bs=1 skip=13216958151 count=1 | hd
00000000  48                                                |H|
00000001
1+0 records in
1+0 records out
1 bytes transferred in 0.001794 seconds (557 bytes/sec)
dromedary:~# dd if=/dev/clientstore/snapdisk bs=1 skip=13216958151 count=1 | hd
00000000  08                                                |.|
00000001
1+0 records in
1+0 records out
1 bytes transferred in 0.001800 seconds (556 bytes/sec)
dromedary:~#

** The snapshot's values is toggling between two different values!!!!

dromedary:~# dd if=/dev/clientstore/backupimage bs=1 skip=13216958151 count=1 | hd
1+0 records in
1+0 records out
1 bytes transferred in 0.000093 seconds (10739 bytes/sec)
00000000  08                                                |.|
00000001
dromedary:~# dd if=/dev/clientstore/backupimage bs=1 skip=13216958151 count=1 | hd
1+0 records in
1+0 records out
1 bytes transferred in 0.000088 seconds (11352 bytes/sec)
00000000  08                                                |.|
00000001
dromedary:~# dd if=/dev/clientstore/backupimage bs=1 skip=13216958151 count=1 | hd
1+0 records in
1+0 records out
1 bytes transferred in 0.000087 seconds (11482 bytes/sec)
00000000  08                                                |.|
00000001
dromedary:~#


** And it looks like the main disk is still stable...

Based on information found on the Internet, I put together a simple tool that reads back the contents of the COW structure to see if
the snapshot thinks anything has been written to it.

dromedary:~# ~/lvcowmap --hdr /dev/mapper/clientstore-snapdisk-cow
# Header Info
#  Magic:      0x70416e53
#  Valid:      0x00000001
#  Version:    0x00000001
#  Chunk Size: 16 sectors (8192 bytes)
# Reading exceptions...
SEEKING: 0x0000000000002000 EXCEPTION INFO: OLD=0x0000000000000000  NEW=0x0000000000000000 (END)
LV Name = /dev/mapper/clientstore-snapdisk-cow
ChunkSize = 16 sectors
SECTORSIZE = 512 bytes
TrueOffset       CowOffset       Num_of_ContigSectors    (all values in sectors)
CoW List :
0                0               0
dromedary:~#


So the snapshot thinks that it has no changes, the original LV's data is unchanging, but the snapshot has data that is changing.

This data error is extremely consistent.  It has existed for several days now with in excess of 100 tests run against it and has
stayed in exactly the same bit across reboots.  I don't see how it can be a hardware fault such as a RAM error given the
repeatability of it and its repeatability.  It doesn't make sense that it is a disk error since we are running Linux' software MD in
RAID-1 and should be protected against that kind of thing.  I have tried removing and re-creating the snapshot but the bit error
still happens.

We are talking about a single bit on a 10GB image.

I am now getting very stuck.  Does anyone have any ideas?

For what it is worth, the motherboard is a Gigabyte 8I865GVMF-775 with a Celeron 2.8GHz processor and two Seagate 160GB SATA-150
(ST3160812AS) hard disks attached to the Intel 82810EB (ICH5) disk controller on the motherboard.

Thanks,

Roger
