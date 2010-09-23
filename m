Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8NHhKZn027447
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2010 13:43:20 -0400
Received: from smtp111.sbc.mail.mud.yahoo.com (smtp111.sbc.mail.mud.yahoo.com
	[68.142.198.207])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o8NHh7qA025961
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2010 13:43:07 -0400
Message-ID: <4C9B91A5.5020908@thenewhams.com>
Date: Thu, 23 Sep 2010 10:43:01 -0700
From: Adam Newham <adam@thenewhams.com>
MIME-Version: 1.0
References: <vmime.4c9a232f.1c6f.4fef62426d1bdb0e@pebblebeach.thenewhams.com>
	<20100923064306.GA3078@maude.comedia.it>
In-Reply-To: <20100923064306.GA3078@maude.comedia.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unable to mount LVM partition - table too small
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Luca Berra <bluca@comedia.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

  Here is the info requested - it looks like on this particular boot, 
/dev/sda was mapped for the OS drive and the RAID got mapped to 
/dev/sd[bcde] - therefore I've dump info for /dev/sd[bcde]. So at least 
for this boot sequence it looks like the RAID array doesn't align with 
the device assignment.

In previous emails/logs, the RAID was /dev/sd[abcd] with the OS drive 
mapped top /dev/sde. To confirm this I redid the fdisk -l & cat 
/proc/partitions, /proc/mdstat

You are correct, the original array was /dev/sd[abcd] (or now 
/dev/sd[bcde], with the OS drive on /dev/hda. It looks like Ubuntu maps 
IDE drives to sd[x]. The 4x1TB drives are SATA, the OS drive is IDE. A 
single PV/LV/VG LVM sits on top the the 3TB RAID5 with ext3 on top of 
that should yield 2.7TB of usable data.

I did some Googling and came across this:
http://kevin.deldycke.com/2007/03/how-to-recover-a-raid-array-after-having-zero-ized-superblocks/

The missing superblock error is displayed when dumping /dev/sda which 
makes sense as this isn't part of the RAID.

In the link above, the author recreated the RAID....however I haven't 
wanted to do this (or anything else that might get categorized as 
stupid) without guidance or a dd copy in case I toasted the data.

I also don't remember ever seeing /dev/md0p1 before, just a /dev/md0

root@adam-desktop:~# mdadm --examine --scan --verbose
ARRAY /dev/md0 level=raid5 num-devices=4 
UUID=b5e0fcd0:cfadbb04:a5b6f22e:457f47ae
    devices=/dev/sde,/dev/sdd,/dev/sdc,/dev/sdb
ARRAY /dev/md0 level=raid5 num-devices=4 
UUID=08558923:881d9efd:464c249d:988d2ec6
    devices=/dev/sde1,/dev/sdd1,/dev/sdc1,/dev/sdb1

root@adam-desktop:~# mdadm --examine --verbose /dev/sdb
/dev/sdb:
           Magic : a92b4efc
         Version : 00.90.03
            UUID : b5e0fcd0:cfadbb04:a5b6f22e:457f47ae
   Creation Time : Sat Nov  1 22:14:18 2008
      Raid Level : raid5
   Used Dev Size : 976762496 (931.51 GiB 1000.20 GB)
      Array Size : 2930287488 (2794.54 GiB 3000.61 GB)
    Raid Devices : 4
   Total Devices : 4
Preferred Minor : 0

     Update Time : Mon Sep 20 19:24:26 2010
           State : clean
  Active Devices : 4
Working Devices : 4
  Failed Devices : 0
   Spare Devices : 0
        Checksum : e9cec762 - correct
          Events : 68

          Layout : left-symmetric
      Chunk Size : 64K

       Number   Major   Minor   RaidDevice State
this     0       8        0        0      active sync   /dev/sda

    0     0       8        0        0      active sync   /dev/sda
    1     1       8       16        1      active sync   /dev/sdb
    2     2       8       32        2      active sync   /dev/sdc
    3     3       8       48        3      active sync   /dev/sdd
root@adam-desktop:~# mdadm --examine --verbose /dev/sdc
/dev/sdc:
           Magic : a92b4efc
         Version : 00.90.03
            UUID : b5e0fcd0:cfadbb04:a5b6f22e:457f47ae
   Creation Time : Sat Nov  1 22:14:18 2008
      Raid Level : raid5
   Used Dev Size : 976762496 (931.51 GiB 1000.20 GB)
      Array Size : 2930287488 (2794.54 GiB 3000.61 GB)
    Raid Devices : 4
   Total Devices : 4
Preferred Minor : 0

     Update Time : Mon Sep 20 19:24:26 2010
           State : clean
  Active Devices : 4
Working Devices : 4
  Failed Devices : 0
   Spare Devices : 0
        Checksum : e9cec774 - correct
          Events : 68

          Layout : left-symmetric
      Chunk Size : 64K

       Number   Major   Minor   RaidDevice State
this     1       8       16        1      active sync   /dev/sdb

    0     0       8        0        0      active sync   /dev/sda
    1     1       8       16        1      active sync   /dev/sdb
    2     2       8       32        2      active sync   /dev/sdc
    3     3       8       48        3      active sync   /dev/sdd
root@adam-desktop:~# mdadm --examine --verbose /dev/sdd
/dev/sdd:
           Magic : a92b4efc
         Version : 00.90.03
            UUID : b5e0fcd0:cfadbb04:a5b6f22e:457f47ae
   Creation Time : Sat Nov  1 22:14:18 2008
      Raid Level : raid5
   Used Dev Size : 976762496 (931.51 GiB 1000.20 GB)
      Array Size : 2930287488 (2794.54 GiB 3000.61 GB)
    Raid Devices : 4
   Total Devices : 4
Preferred Minor : 0

     Update Time : Mon Sep 20 19:24:26 2010
           State : clean
  Active Devices : 4
Working Devices : 4
  Failed Devices : 0
   Spare Devices : 0
        Checksum : e9cec786 - correct
          Events : 68

          Layout : left-symmetric
      Chunk Size : 64K

       Number   Major   Minor   RaidDevice State
this     2       8       32        2      active sync   /dev/sdc

    0     0       8        0        0      active sync   /dev/sda
    1     1       8       16        1      active sync   /dev/sdb
    2     2       8       32        2      active sync   /dev/sdc
    3     3       8       48        3      active sync   /dev/sdd
root@adam-desktop:~# mdadm --examine --verbose /dev/sde
/dev/sde:
           Magic : a92b4efc
         Version : 00.90.03
            UUID : b5e0fcd0:cfadbb04:a5b6f22e:457f47ae
   Creation Time : Sat Nov  1 22:14:18 2008
      Raid Level : raid5
   Used Dev Size : 976762496 (931.51 GiB 1000.20 GB)
      Array Size : 2930287488 (2794.54 GiB 3000.61 GB)
    Raid Devices : 4
   Total Devices : 4
Preferred Minor : 0

     Update Time : Mon Sep 20 19:24:26 2010
           State : clean
  Active Devices : 4
Working Devices : 4
  Failed Devices : 0
   Spare Devices : 0
        Checksum : e9cec798 - correct
          Events : 68

          Layout : left-symmetric
      Chunk Size : 64K

       Number   Major   Minor   RaidDevice State
this     3       8       48        3      active sync   /dev/sdd

    0     0       8        0        0      active sync   /dev/sda
    1     1       8       16        1      active sync   /dev/sdb
    2     2       8       32        2      active sync   /dev/sdc
    3     3       8       48        3      active sync   /dev/sdd


root@adam-desktop:~# fdisk -l

Disk /dev/sda: 60.0 GB, 60011642880 bytes
255 heads, 63 sectors/track, 7296 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x0005cd42

    Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1        6993    56165376   83  Linux
/dev/sda2            6993        7296     2437121    5  Extended
/dev/sda5            6993        7296     2437120   82  Linux swap / Solaris

Disk /dev/sdb: 1000.2 GB, 1000204886016 bytes
255 heads, 63 sectors/track, 121601 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

    Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1      121601   976760001   fd  Linux raid 
autodetect

Disk /dev/sdc: 1000.2 GB, 1000204886016 bytes
255 heads, 63 sectors/track, 121601 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

    Device Boot      Start         End      Blocks   Id  System
/dev/sdc1               1      121601   976760001   fd  Linux raid 
autodetect

Disk /dev/sdd: 1000.2 GB, 1000204886016 bytes
255 heads, 63 sectors/track, 121601 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

    Device Boot      Start         End      Blocks   Id  System
/dev/sdd1               1      121601   976760001   fd  Linux raid 
autodetect

Disk /dev/sde: 1000.2 GB, 1000204886016 bytes
255 heads, 63 sectors/track, 121601 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

    Device Boot      Start         End      Blocks   Id  System
/dev/sde1               1      121601   976760001   fd  Linux raid 
autodetect

Disk /dev/md0: 3000.6 GB, 3000614387712 bytes
255 heads, 63 sectors/track, 364803 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 65536 bytes / 196608 bytes
Disk identifier: 0x00000000

     Device Boot      Start         End      Blocks   Id  System
/dev/md0p1               1      121601   976760001   fd  Linux raid 
autodetect
Partition 1 does not start on physical sector boundary.
root@adam-desktop:~# cat /proc/partitions
major minor  #blocks  name

    8        0   58605120 sda
    8        1   56165376 sda1
    8        2          1 sda2
    8        5    2437120 sda5
    8       16  976762584 sdb
    8       17  976760001 sdb1
    8       32  976762584 sdc
    8       33  976760001 sdc1
    8       48  976762584 sdd
    8       49  976760001 sdd1
    8       64  976762584 sde
    8       65  976760001 sde1
    9        0 2930287488 md0
  259        0  976760001 md0p1
root@adam-desktop:~# cat /proc/mdstat
Personalities : [linear] [multipath] [raid0] [raid1] [raid6] [raid5] 
[raid4] [raid10]
md0 : active raid5 sde[3] sdb[0] sdc[1] sdd[2]
       2930287488 blocks level 5, 64k chunk, algorithm 2 [4/4] [UUUU]

unused devices: <none>
