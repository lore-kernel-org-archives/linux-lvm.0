Return-Path: <raheesom@navpoint.com>
From: Rupert Heesom <raheesom@navpoint.com>
Date: 06 May 2001 21:05:13 -0400
Message-Id: <989197513.8109.6.camel@localhost>
Mime-Version: 1.0
Subject: [linux-lvm] LVM questions & problems.
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm practicing doing some LVM commands, and am coming up with some
problems -

Most disconcerting is that when I try to create a directory in the LV, I
get the following error - (this does not happen all the time, but almost
all the time 99%) -

[root@localhost Tmp]# mkdir test1
mkdir: cannot create directory `test1': Input/output error

Creating normal files on the LV is not a problem.

Also, the figures in the following outputs don't seem to make sense to
me -

287Mb of space taken on my LV lvol1 (shown using du -h).

LV lvol1 - shows all 75 logical extends taken, I'm assuming filling up
the 300Mb LV size.

LV Size                300 MB
Current LE             75
Allocated LE           75


PV shows too many physical extends used for the proportion of disk space
used. -

Total PE              76
Free PE               1

PVdisplay shows too many physical extents used again

Total PE              76
Free PE               1
Allocated PE          75


----------------------------------------

LVM command outputs
-------------------

[root@localhost Tmp]# lvdisplay /dev/vg/lvol1
lvdisplay
--- Logical volume ---
LV Name                /dev/vg/lvol1
VG Name                vg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                300 MB
Current LE             75
Allocated LE           75
Allocation             next free
Read ahead sectors     120
Block device           58:0


[root@localhost Tmp]# pvdisplay /dev/sdb1
pvdisplay
--- Physical volume ---
PV Name               /dev/sdb1
VG Name               vg
PV Size               305.89 MB / NOT usable 1.89 MB [LVM: 121 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              76
Free PE               1
Allocated PE          75
PV UUID               wm3nGp-pEem-0byC-3JOs-OFs4-3kv2-EkPxaK


[root@localhost Tmp]# vgdisplay
vgdisplay
--- Volume group ---
VG Name               vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               304 MB
PE Size               4 MB
Total PE              76
Alloc PE / Size       75 / 300 MB
Free  PE / Size       1 / 4 MB
VG UUID               0ZyZNT-53L9-tAFJ-GCa4-1Zr5-nZli-IFIbIP


-- 
regs
rupert
