Date: Thu, 22 Jul 1999 19:34:36 -0400 (EDT)
From: Shane Shrybman <shane@zeke.yi.org>
Reply-To: Shane Shrybman <shane@zeke.yi.org>
Subject: [linux-lvm] e2fsadm and resize2fs
Message-ID: <Pine.LNX.3.96.990722183323.8088A-100000@zeke.sympatico.ca>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm mailing list <linux-lvm@msede.com>


Firstly, Thanks for bringing an LVM to Linux ! Much appreciated !

I have been trying to resize my lv's and fs's using e2fsadm v0.7 and
resize2fs v1.03. Some times it works and some times it doesn't. Have I
dome something wrong? 

I have tried to report my findings below.

Config:
kernel 2.2.10-ac12
lvm modules v0.6
lvm tools   v0.7B

# cat /proc/lvm 
LVM module version 0.6  (26/02/1999)

Total:  1 VG  1 PV  2 LVs (1 LV open 1 times)

Global: 20244 bytes vmalloced   IOP version: 4   1 day 8:15:58 active

VG:  vg1  [1 PV, 2 LV/1 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4190208 /1023 total  4190208 /1023 used  0 /0 free
  PV:  [AA] /dev/sda1              4190208 /1023     4190208 /1023
0 /0     
    LVs: [AWDL  ] lv1                        3997696 /976      1x open
      [AWDL  ] lv2_test                    192512 /47       close

	
block	e2fsadm
size	-L	result
------------------------------------------
1k	+4m	good
1k	-4m	good
1k	-6m	lvreduce -- new size is not
		smaller than old one

1k	+4k	e2fsadm -- logical volume size of "/dev/vg1/lv2_test"
		Bchanged invalid
1k	-4k	resize2fs 1.03 (28-Sep-98)
		Copyright 1998 by Theodore Ts'o and PowerQuest, Inc.  All Rights Reserved.

		The containing partition (or device) is only 98304 blocks.
		You requested a new size of 106488 blocks.

1k	+2m	good
1k	-2m	resize2fs 1.03 (28-Sep-98)
		Copyright 1998 by Theodore Ts'o and PowerQuest, Inc.  All Rights Reserved.

		The containing partition (or device) is only 98304 blocks.
		You requested a new size of 102400 blocks.

1k	-13m	e2fsck 1.14, 9-Jan-1999 for EXT2 FS 0.5b, 95/08/09
		The filesystem size (according to the superblock) is 34816 blocks
		The physical size of the device is 32768 blocks
		Either the superblock or the partition table is likely to be corrupt!
		Abort<y>? 

1k	+13m	lvextend -- logical volume
		"/dev/vg1/lv2_test" successfully extended

		e2fsadm -- logical volume size of "/dev/vg1/lv2_test" changed invalid

1k	+20m	good
1k	-20m	good

1k	-21m	fs corrupt like -13m
1k	+21m	error like +13m

4k 	+4m	resize2fs 1.03 (28-Sep-98)
		Copyright 1998 by Theodore Ts'o and PowerQuest, Inc.  All Rights Reserved.

		The containing partition (or device) is only 48128 blocks.
		You requested a new size of 192512 blocks.

4k	any	No resizes worked for me with a block size
		of 4k. It seems that e2fsadm (regardless of fs block size)  always passes
		the the size in 'k' to resize2fs and resize2fs wants the number of blocks.

The main problem for me is the 4k block size issue. I also noticed that
sometimes the rounding of the increase/decrease of an lv to a PE boundary
is greater than the size of a PE.  

TIA

shane
