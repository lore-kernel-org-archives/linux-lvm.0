Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4M2POO21131
	for <linux-lvm@redhat.com>; Sat, 21 May 2005 22:25:24 -0400
Received: from mailout10.sul.t-online.com (mailout10.sul.t-online.com
	[194.25.134.21])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4M2PNM1027910
	for <linux-lvm@redhat.com>; Sat, 21 May 2005 22:25:23 -0400
Message-ID: <428FE064.3060104@web.de>
Date: Sun, 22 May 2005 03:29:08 +0200
From: bill.mair@t-online.de
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM not starting correctly
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

Hi all,

After a HD failure "mid-pvmove" no less, my LVM won't start automatically :(

System: Debian sarge with LVM1.

I knew that a drive was soon to fail due to S.M.A.R.T messages in my 
logs, so I was moving everything off the RAID5 to a new
RAID01 (md7).

While I was moving a volume with pvmove I started received a dma error 
from one of the drives in my RAID5 (md1).

I was in single user mode with the file systems unmounted and it froze 
completely.

*GULP*
*SWEAT*
*CURSE*

I had to reset. :(

After the reboot LVM came up as shown below.

I replaced the defective HD and let the RAID5 do it's magic.

The data is OK and so are the partitions, I verified that doing the 
following:

# cp /etc/lvmconf/rootgv.conf /etc/lvmtab.d/rootvg
# echo -ne "rootvg\0" >> /etc/lvmtab
# vgchange -a y rootvg
# vgmknodes /dev/rootvg

I then ran fsck no all the file systems and they were fine.

But LVM is still refusing to start automatically.

What can I do to restore LVM to normal operation ?


Oh, and "by accident" I managed to get this for /dev/md5:
*** pvscan -- inactive PV "/dev/md5"  is associated to unknown VG 
"rootvg" (run vgscan) ***
I think I did a vgextend or something on the wrong vg, and that was 
called "testvg" which no longers exists because the testing was
completed, How do I remove /dev/md5 from the pvscan list.

Another thing, in my 1st attempt at getting the LVM up manually I had 
typed "vgmknodes /dev/", vgmknodes wiped out ALL of my
devices. I had only "quickly" scanned the docs, maybe a failsafe for the 
above mistake should be added.

Below is a load of information I pulled from LVM.

Thanks for any help you can supply, I'm going to have to stop my 
migration until the LVM problem is sorted, I don't want to break
something else or some recovery option by continuing.

---Bill

# /etc/init.d/lvm start

Setting up LVM Volume Groups...
vgscan -- only found 0 of 2304 LEs for LV /dev/rootvg/lv_usr (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get 
data of volume group "rootvg" from physical volume(s)
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

vgchange -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please 
run vgscan

# vgscan

vgscan -- only found 0 of 2304 LEs for LV /dev/rootvg/lv_usr (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get 
data of volume group "rootvg" from physical volume(s)
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group


# cat /proc/mdstat

Personalities : [raid0] [raid1] [raid5]
read_ahead 1024 sectors

md0 : active raid1 hde1[0] hda1[1]
      289024 blocks [2/2] [UU]

md1 : active raid5 hde5[0] hdg5[1] hdc5[3] hda5[2]
      232794624 blocks level 5, 4k chunk, algorithm 0 [4/4] [UUUU]

md2 : active raid1 hdd1[1] hdh1[3] hdf1[2] hdb1[0]
      1951744 blocks [4/4] [UUUU]

md3 : active raid1 hdf2[1] hdb2[0]
      1951808 blocks [2/2] [UU]

md4 : active raid1 hdd2[0] hdh2[1]
      1951808 blocks [2/2] [UU]

md5 : active raid1 hdf3[1] hdb3[0]
      152384448 blocks [2/2] [UU]

md6 : active raid1 hdd3[0] hdh3[1]
      152384448 blocks [2/2] [UU]

md7 : active raid0 md5[0] md6[1]
      304768768 blocks 4k chunks

unused devices: <none>

# pvscan

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/md1"  is associated to unknown VG "rootvg" 
(run vgscan)
pvscan -- inactive PV "/dev/md5"  is associated to unknown VG "rootvg" 
(run vgscan)
pvscan -- inactive PV "/dev/md7"  is associated to unknown VG "rootvg" 
(run vgscan)
pvscan -- total: 3 [803.31 GB] / in use: 3 [803.31 GB] / in no VG: 0 [0]


# pvdata -E /dev/md1

--- List of physical extents ---

PE: 00000  LV: ---  LE: -----
.....
PE: 00199  LV: ---  LE: -----
PE: 00200  LV: 002  LE: 00000
.....
PE: 05199  LV: 002  LE: 04999
PE: 05200  LV: 003  LE: 00000
.....
PE: 10199  LV: 003  LE: 04999
PE: 10200  LV: 004  LE: 00000
.....
PE: 11449  LV: 004  LE: 01249
PE: 11450  LV: 005  LE: 00000
.....
PE: 12699  LV: 005  LE: 01249
PE: 12700  LV: 006  LE: 00000
.....
PE: 17699  LV: 006  LE: 04999
PE: 17700  LV: ---  LE: -----
.....
PE: 18699  LV: ---  LE: -----
PE: 18700  LV: 004  LE: 01250
.....
PE: 20747  LV: 004  LE: 03297
PE: 20748  LV: 008  LE: 00000
.....
PE: 21771  LV: 008  LE: 01023
PE: 21772  LV: ---  LE: -----
.....
PE: 23051  LV: ---  LE: -----
PE: 23052  LV: 010  LE: 00000
.....
PE: 33291  LV: 010  LE: 10239
PE: 33292  LV: ---  LE: -----
.....
PE: 56832  LV: ---  LE: -----


# pvdata -E /dev/md7

--- List of physical extents ---

PE: 00000  LV: 007  LE: 00000
.....
PE: 00999  LV: 007  LE: 00999
PE: 01000  LV: 001  LE: 00000
.....
PE: 03303  LV: 001  LE: 02303
PE: 03304  LV: ---  LE: -----
.....
PE: 03559  LV: ---  LE: -----
PE: 03560  LV: 009  LE: 00000
.....
PE: 04583  LV: 009  LE: 01023
PE: 04584  LV: ---  LE: -----
.....
PE: 74404  LV: ---  LE: -----


# pvdisplay -v /dev/md1

--- Physical volume ---
PV Name               /dev/md1
VG Name               rootvg
PV Size               222.01 GB [465589248 secs] / NOT usable 4.38 MB 
[LVM: 350 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                7
PE Size (KByte)       4096
Total PE              56833
Free PE               26021
Allocated PE          30812
PV UUID               Dc8Z4y-nkvj-0jJ0-laof-uD5W-KLYW-QwqUx3

   --- Distribution of physical volume ---
   LV Name                   LE of LV  PE for LV
   /dev/rootvg/lv_home       5000      5000   
   /dev/rootvg/lv_progs      5000      5000   
   /dev/rootvg/lv_media      3298      3298   
   /dev/rootvg/lv_games      1250      1250   
   /dev/rootvg/lv_backup     5000      5000   
   /dev/rootvg/lv_var        1024      1024   
   /dev/rootvg/lv_40g        10240     10240  

   --- Physical extents ---
   PE    LV                        LE      Disk sector
   00000 free
   .....
   00199 free
   00200 /dev/rootvg/lv_home       00000   1647360
   .....
   05199 /dev/rootvg/lv_home       04999   42599168
   05200 /dev/rootvg/lv_progs      00000   42607360
   .....
   10199 /dev/rootvg/lv_progs      04999   83559168
   10200 /dev/rootvg/lv_media      00000   83567360
   .....
   11449 /dev/rootvg/lv_media      01249   93799168
   11450 /dev/rootvg/lv_games      00000   93807360
   .....
   12699 /dev/rootvg/lv_games      01249   104039168
   12700 /dev/rootvg/lv_backup     00000   104047360
   .....
   17699 /dev/rootvg/lv_backup     04999   144999168
   17700 free
   .....
   18699 free
   18700 /dev/rootvg/lv_media      01250   153199360
   .....
   20747 /dev/rootvg/lv_media      03297   169968384
   20748 /dev/rootvg/lv_var        00000   169976576
   .....
   21771 /dev/rootvg/lv_var        01023   178356992
   21772 free
   .....
   23051 free
   23052 /dev/rootvg/lv_40g        00000   188850944
   .....
   33291 /dev/rootvg/lv_40g        10239   272728832
   33292 free
   .....
   56832 free


# pvdisplay -v /dev/md1

--- Physical volume ---
PV Name               /dev/md7
VG Name               rootvg
PV Size               290.65 GB [609537536 secs] / NOT usable 4.44 MB 
[LVM: 418 KB]
PV#                   2
PV Status             available
Allocatable           yes
Cur LV                3
PE Size (KByte)       4096
Total PE              74405
Free PE               70077
Allocated PE          4328
PV UUID               7O6i4f-Ywnx-kYhR-JaE8-uDZo-ryW6-sMn3gx

   --- Distribution of physical volume ---
   LV Name                   LE of LV  PE for LV
   /dev/rootvg/lv_cvs        1000      1000   
   /dev/rootvg/lv_usr        2304      2304   
   /dev/rootvg/lv_tmp        1024      1024   

   --- Physical extents ---
   PE    LV                        LE      Disk sector
   00000 /dev/rootvg/lv_cvs        00000   9088
   .....
   00999 /dev/rootvg/lv_cvs        00999   8192896
   01000 /dev/rootvg/lv_usr        00000   8201088
   .....
   03303 /dev/rootvg/lv_usr        02303   27067264
   03304 free
   .....
   03559 free
   03560 /dev/rootvg/lv_tmp        00000   29172608
   .....
   04583 /dev/rootvg/lv_tmp        01023   37553024
   04584 free
   .....
   74404 free


# lvdisplay -v /dev/rootvg/lv_usr

--- Logical volume ---
LV Name                /dev/rootvg/lv_usr
VG Name                rootvg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                9 GB
Current LE             2304
Allocated LE           2304
Allocation             next free
Read ahead sectors     1024
Block device           58:0

   --- Distribution of logical volume on 1 physical volume  ---
   PV Name                  PE on PV     reads      writes
   /dev/md7                 2304         389994     435     

   --- logical volume i/o statistic ---
   389994 reads  435 writes

   --- Logical extents ---
   LE    PV                        PE     reads      writes
   00000 /dev/md7                  01000  3325       197     
   00001 /dev/md7                  01001  15         0       
   00002 /dev/md7                  01002  15         0       
   00003 /dev/md7                  01003  15         0       
   00004 /dev/md7                  01004  800        0       
   .....
   02299 /dev/md7                  03299  0          0       
   02300 /dev/md7                  03300  0          0       
   02301 /dev/md7                  03301  0          0       
   02302 /dev/md7                  03302  0          0       
   02303 /dev/md7                  03303  0          0       
