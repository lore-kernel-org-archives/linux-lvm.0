From: Josh Duncan <linux-lvm@msmd.net>
Subject: Re: [linux-lvm] lvm with gpt partitioning?
Message-ID: <20021015151425.GA18971@msmd.net>
References: <20021014200329.GA4885@msmd.net> <20021015072108.GA31465@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021015072108.GA31465@percy.comedia.it>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Oct 15 10:27:24 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Luca,

this may sound stupid, but if there is a dos-compatibility partition, why
doesn't it show up in fdisk or parted?

I've included the info you mentioned below, as well as the info for sda...
--Josh

> looks like you have both a gpt partition and a compatibility dos-like
> one. i am missing some info (partition detection logs at boot) output of
> /proc/partition and lvmdiskscan. and i don't have an ia64 to play with
> any more. might try modifiyng the partition detection code in the kernel
> config

[root@one sbin]# dmesg|grep sd
Attached scsi disk sdb at scsi0, channel 0, id 1, lun 0
SCSI device sda: 71132960 512-byte hdwr sectors (36420 MB)
 sda: sda1 sda2 sda3 sda4
Attached scsi disk sdb at scsi0, channel 0, id 1, lun 0
SCSI device sdb: 71132960 512-byte hdwr sectors (36420 MB)
 sdb: sdb1 sdb2

/proc/partitions:
major minor  #blocks  name rio rmerge rsect ruse wio wmerge wsect wuse running use aveq
   8     0   35566480 sda 22661 39173 355842 99578 84426 763195 6796456 1992657 0 508375 2093808
   8     1    1024000 sda1 506 17244 17830 1303 14 26 40 3178 0 1183 4482
   8     2   17086318 sda2 4662 463 39842 22586 1604 5020 53800 1135352 0 35906 1158022
   8     3   15360000 sda3 17426 19290 293722 67802 82808 758149 6742616 854132 0 480061 923424
   8     4    2096128 sda4 3 0 96 23 0 0 0 0 0 23 23
   8    16   35566480 sdb 285 8353 17020 25452 11 201 424 114 0 25533 25566
   8    17    2096111 sdb1 9 135 288 6 0 0 0 0 0 6 6
   8    18   17086464 sdb2 25 165 380 12 7 137 288 35 0 47 47

[root@one sbin]# lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/sda1  [      33.92 GB] Primary   [0xEE]
lvmdiskscan -- /dev/sda2  [      16.29 GB] free whole disk
lvmdiskscan -- /dev/sdb1  [      33.92 GB] Primary   [0xEE]
lvmdiskscan -- /dev/sdb2  [      16.29 GB] USED LVM whole disk
lvmdiskscan -- 2 disks
lvmdiskscan -- 2 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 6 partitions
lvmdiskscan -- 0 LVM physical volume partitions

[root@one sbin]# fdisk -l /dev/sda

Disk /dev/sda: 255 heads, 63 sectors, 4427 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1             1      4428  35566479+  ee  EFI GPT

[root@one sbin]# parted /dev/sda print
Disk geometry for /dev/sda: 0.000-34732.890 megabytes
Disk label type: GPT
Minor    Start       End     Filesystem  Name                  Flags
1          0.017   1000.016  FAT                               boot, lba
2       1000.017  17685.874  ext3                              lba
3      17685.875  32685.874  ext3                              lba
4      32685.875  34732.874  linux-swap                        lba

[root@one sbin]# df -k
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/sda3             15118728   3718600  10632128  26% /
/dev/sda1              1023728     10720   1013008   2% /boot/efi
/dev/sda2             16817896   5019860  10943724  32% /home
none                    505568         0    505568   0% /dev/shm
