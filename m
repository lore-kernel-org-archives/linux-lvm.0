Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6CJjwBD010282
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 15:45:58 -0400
Received: from webmail.icp-qv1-irony2.iinet.net.au
	(webmail.icp-qv1-irony2.iinet.net.au [203.59.1.107])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6CJjqYc027161
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 15:45:53 -0400
Message-ID: <469684EE.3030405@iinet.net.au>
Date: Fri, 13 Jul 2007 05:45:50 +1000
From: David Timms <dtimms@iinet.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] s-c-lvm fails trying to expand an LV into available
	space in VG.
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi, I am learning about LVM by resizing {expanding mainly} PV through 
the addition of LVM partitions and another disk.

This has been working well, but I have got to a point where I can no 
longer expand an LV. From system-config-lvm, I get:

lvresize command failed. Command attempted: "/usr/sbin/lvextend -l 29172 
/dev/vgstorage/lvhome" - System Error Message:   device-mapper: reload 
ioctl failed: Invalid argument
   Failed to suspend lvhome

At this stage it seems like a bug which I entered as:
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=247112
=====
# mount
/dev/sda3 on / type ext3 (rw)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
/dev/sda2 on /boot type ext3 (rw)
tmpfs on /dev/shm type tmpfs (rw)
none on /proc/sys/fs/binfmt_misc type binfmt_misc (rw)
sunrpc on /var/lib/nfs/rpc_pipefs type rpc_pipefs (rw)
=====
# fdisk -l

Disk /dev/sda: 36.3 GB, 36362518528 bytes
255 heads, 63 sectors/track, 4420 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

    Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1        1759    14129136    7  HPFS/NTFS
/dev/sda2            1760        1762       24097+  83  Linux
/dev/sda3            1763        2272     4096575   83  Linux
/dev/sda4            2273        4420    17253810    5  Extended
/dev/sda5            2273        4218    15631213+  8e  Linux LVM
/dev/sda6            4219        4420     1622533+  82  Linux swap / Solaris

Disk /dev/sdb: 36.3 GB, 36362518528 bytes
255 heads, 63 sectors/track, 4420 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

    Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1           4       32098+  83  Linux
/dev/sdb2               5         557     4441972+  8e  Linux LVM
/dev/sdb3             558        1110     4441972+  8e  Linux LVM
/dev/sdb4            1111        4420    26587575    5  Extended
/dev/sdb5            1111        1663     4441941   8e  Linux LVM
/dev/sdb6            1664        2216     4441941   8e  Linux LVM
/dev/sdb7            2217        2769     4441941   8e  Linux LVM
/dev/sdb8            2770        3322     4441941   8e  Linux LVM
/dev/sdb9            3323        3875     4441941   8e  Linux LVM
/dev/sdb10           3876        4420     4377681   8e  Linux LVM

Disk /dev/sdc: 36.6 GB, 36637245440 bytes
255 heads, 63 sectors/track, 4454 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

    Device Boot      Start         End      Blocks   Id  System
/dev/sdc1               1           3       24066   83  Linux
/dev/sdc2               4         562     4490167+  8e  Linux LVM
/dev/sdc3             563        1121     4490167+  8e  Linux LVM
/dev/sdc4            1122        4454    26772322+   5  Extended
/dev/sdc5            1122        1680     4490136   8e  Linux LVM
/dev/sdc6            1681        2239     4490136   8e  Linux LVM
/dev/sdc7            2240        2798     4490136   8e  Linux LVM
/dev/sdc8            2799        3357     4490136   8e  Linux LVM
/dev/sdc9            3358        3916     4490136   8e  Linux LVM
/dev/sdc10           3917        4454     4321453+  8e  Linux LVM

Disk /dev/sdd: 36.4 GB, 36420075520 bytes
255 heads, 63 sectors/track, 4427 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

    Device Boot      Start         End      Blocks   Id  System
/dev/sdd1               1           3       24066   83  Linux
/dev/sdd2               4         557     4450005   8e  Linux LVM
/dev/sdd3             558        1111     4450005   8e  Linux LVM
/dev/sdd4            1112        4427    26635770    5  Extended
/dev/sdd5            1112        1665     4449973+  8e  Linux LVM
/dev/sdd6            1666        2219     4449973+  8e  Linux LVM
/dev/sdd7            2220        2773     4449973+  8e  Linux LVM
/dev/sdd8            2774        3327     4449973+  8e  Linux LVM
/dev/sdd9            3328        3881     4449973+  8e  Linux LVM
/dev/sdd10           3882        4427     4385713+  8e  Linux LVM

Disk /dev/dm-0: 3313 MB, 3313500160 bytes
255 heads, 63 sectors/track, 402 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/dm-0 doesn't contain a valid partition table

Disk /dev/dm-1: 107.1 GB, 107164467200 bytes
255 heads, 63 sectors/track, 13028 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/dm-1 doesn't contain a valid partition table
=====
# vgdisplay
   --- Volume group ---
   VG Name               vginfrastructure
   System ID
   Format                lvm2
   Metadata Areas        1
   Metadata Sequence No  12
   VG Access             read/write
   VG Status             resizable
   MAX LV                256
   Cur LV                1
   Open LV               0
   Max PV                256
   Cur PV                1
   Act PV                1
   VG Size               4.17 GB
   PE Size               4.00 MB
   Total PE              1068
   Alloc PE / Size       790 / 3.09 GB
   Free  PE / Size       278 / 1.09 GB
   VG UUID               X3a9Nx-EkS6-RuZW-Fnti-iSGu-Q16u-jvkI5K

   --- Volume group ---
   VG Name               vgstorage
   System ID
   Format                lvm2
   Metadata Areas        24
   Metadata Sequence No  43
   VG Access             read/write
   VG Status             resizable
   MAX LV                256
   Cur LV                1
   Open LV               0
   Max PV                256
   Cur PV                24
   Act PV                24
   VG Size               113.95 GB
   PE Size               4.00 MB
   Total PE              29172
   Alloc PE / Size       25550 / 99.80 GB
   Free  PE / Size       3622 / 14.15 GB
   VG UUID               pBSCOY-C0LF-raej-ZjiM-wOcp-6pcE-miV377
=====
# time lvdisplay
   --- Logical volume ---
   LV Name                /dev/vginfrastructure/lvinfrastructure
   VG Name                vginfrastructure
   LV UUID                Ba80ED-T1Ap-DNwu-cDv0-rQlt-yau8-qZeqCW
   LV Write Access        read/write
   LV Status              available
   # open                 0
   LV Size                3.09 GB
   Current LE             790
   Segments               1
   Allocation             inherit
   Read ahead sectors     0
   Block device           253:0

   --- Logical volume ---
   LV Name                /dev/vgstorage/lvhome
   VG Name                vgstorage
   LV UUID                9DmkGv-SEuo-Cj7A-Ylrf-Pz3k-szAi-Tu9ELu
   LV Write Access        read/write
   LV Status              available
   # open                 0
   LV Size                99.80 GB
   Current LE             25550
   Segments               21
   Allocation             inherit
   Read ahead sectors     0
   Block device           253:1


real    0m6.970s
user    0m0.172s
sys     0m0.073s
=====
# time pvscan
   PV /dev/sdb10   VG vginfrastructure   lvm2 [4.17 GB / 1.09 GB free]
   PV /dev/sdc2    VG vgstorage          lvm2 [4.28 GB / 0    free]
   PV /dev/sdc3    VG vgstorage          lvm2 [4.28 GB / 0    free]
   PV /dev/sdc5    VG vgstorage          lvm2 [4.28 GB / 0    free]
   PV /dev/sdc6    VG vgstorage          lvm2 [4.28 GB / 0    free]
   PV /dev/sdc7    VG vgstorage          lvm2 [4.28 GB / 0    free]
   PV /dev/sdc8    VG vgstorage          lvm2 [4.28 GB / 0    free]
   PV /dev/sdc9    VG vgstorage          lvm2 [4.28 GB / 0    free]
   PV /dev/sdc10   VG vgstorage          lvm2 [4.12 GB / 0    free]
   PV /dev/sdd2    VG vgstorage          lvm2 [4.24 GB / 0    free]
   PV /dev/sdd3    VG vgstorage          lvm2 [4.24 GB / 0    free]
   PV /dev/sdd5    VG vgstorage          lvm2 [4.24 GB / 0    free]
   PV /dev/sdd6    VG vgstorage          lvm2 [4.24 GB / 0    free]
   PV /dev/sdd7    VG vgstorage          lvm2 [4.24 GB / 0    free]
   PV /dev/sdb2    VG vgstorage          lvm2 [4.23 GB / 0    free]
   PV /dev/sdb3    VG vgstorage          lvm2 [4.23 GB / 0    free]
   PV /dev/sdd8    VG vgstorage          lvm2 [4.24 GB / 0    free]
   PV /dev/sdd9    VG vgstorage          lvm2 [4.24 GB / 0    free]
   PV /dev/sdd10   VG vgstorage          lvm2 [4.18 GB / 0    free]
   PV /dev/sdb5    VG vgstorage          lvm2 [4.23 GB / 0    free]
   PV /dev/sdb6    VG vgstorage          lvm2 [4.23 GB / 0    free]
   PV /dev/sdb8    VG vgstorage          lvm2 [4.23 GB / 4.23 GB free]
   PV /dev/sda5    VG vgstorage          lvm2 [16.35 GB / 1.45 GB free]
   PV /dev/sdb7    VG vgstorage          lvm2 [4.23 GB / 4.23 GB free]
   PV /dev/sdb9    VG vgstorage          lvm2 [4.23 GB / 4.23 GB free]
   Total: 25 [118.12 GB] / in use: 25 [118.12 GB] / in no VG: 0 [0   ]

real    0m6.997s
user    0m0.166s
sys     0m0.073s
=====
As well as the error message above, I also notice that:
1. The error is repeatable if the command mentioned in the error message 
is entered at the command line.
2. The error message takes many minutes to appear. How could I find out 
what causes the delay ?
3. Once I click OK, the scan LVM function {even when I first start 
s-c-lvm}, takes about three minutes. This seems to be getting longer 
with each pv I added to the vg {and expanded the lv to fill}. I assume 
this is abnormal ?
4. The lv size is 99.8GB. In getting to the point where I can't make it 
any bigger {even by 1x extent}, I noticed that if I try to expand by 
smaller bits, then it was actually succeeding. Is there some 
real/practical limit on lv size {eg 100GB} ?
Does it matter about extent size ?

Can someone shed some light ?

David Timms
