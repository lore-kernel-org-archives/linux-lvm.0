Return-Path: <lda@research.bell-labs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14998.53544.642864.34288@eagle.mh.lucent.com>
Date: Fri, 23 Feb 2001 16:07:52 -0500 (EST)
From: lvm@winux.com
Subject: [linux-lvm] oops on 2.4.2 with lvm-0.9beta5 and Reiserfs 3.6.25
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
To: linux-lvm@sistina.com

I just built a new system based on Linux 2.4.2 with LVM 0.9 beta 5.
I applied the patches, turned on the #define LVM_VFS_ENHANCEMENT,
rebuilt/booted the kernel and the user level tools.

I found a reproducible "kernel oops" as shown in the trace attached below.

// note: I apologize for attaching a long trace, but the problem is often
//       found "in the details" so I felt the attachment was justified.

The oops always happens if I use 

  # lvcreate -L 10g ...
  # lvextend -L +2g ...

but I've never seen it happen if I use

  # lvcreate -L 12g ...

I'm happy to supply any additional details on request.

Larry

-----
# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- no volume groups found

# pvcreate /dev/hda3
pvcreate -- physical volume "/dev/hda3" successfully created

# vgcreate vg0 /dev/hda3
vgcreate -- INFO: using default physical extent size 4 MB
vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
vgcreate -- doing automatic backup of volume group "vg0"
vgcreate -- volume group "vg0" successfully created and activated

# lvcreate -L 10g -n lv0 vg0
lvcreate -- doing automatic backup of "vg0"
lvcreate -- logical volume "/dev/vg0/lv0" successfully created

# lvextend -L +2g /dev/vg0/lv0
lvextend -- extending logical volume "/dev/vg0/lv0" to 12 GB
lvextend -- doing automatic backup of volume group "vg0"
lvextend -- logical volume "/dev/vg0/lv0" successfully extended

# mkreiserfs /dev/vg0/lv0

<-------------mkreiserfs, 2000------------->
reiserfsprogs 3.x.0d
Creating reiserfs of 3.6 format
Block size 4096 bytes
Block count 3145728
Used blocks 8307
Free blocks count 3137421
First 16 blocks skipped
Super block is in 16
Bitmap blocks (96) are : 
        17, 32768, 65536, 98304, 131072, 163840, 196608, 229376, 262144, 294912, 327680, 360448, 393216, 425984, 458752, 491520, 524288, 557056, 589824, 622592, 655360, 688128, 720896, 753664, 786432, 819200, 851968, 884736, 917504, 950272, 983040, 1015808, 1048576, 1081344, 1114112, 1146880, 1179648, 1212416, 1245184, 1277952, 1310720, 1343488, 1376256, 1409024, 1441792, 1474560, 1507328, 1540096, 1572864, 1605632, 1638400, 1671168, 1703936, 1736704, 1769472, 1802240, 1835008, 1867776, 1900544, 1933312, 1966080, 1998848, 2031616, 2064384, 2097152, 2129920, 2162688, 2195456, 2228224, 2260992, 2293760, 2326528, 2359296, 2392064, 2424832, 2457600, 2490368, 2523136, 2555904, 2588672, 2621440, 2654208, 2686976, 2719744, 2752512, 2785280, 2818048, 2850816, 2883584, 2916352, 2949120, 2981888, 3014656, 3047424, 3080192, 3112960
Journal size 8192 (blocks 18-8210 of file /dev/vg0/lv0)
Root block 8211
Hash function "r5"
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
            ALL DATA WILL BE LOST ON '/dev/vg0/lv0'! (y/n)y
Initializing journal - 0%                                                       ....20%....40%....60%....80%....100%                         left 0, 585 /sec
Syncing..

ReiserFS core development sponsored by SuSE Labs (suse.com)

Journaling sponsored by MP3.com.

To learn about the programmers and ReiserFS, please go to
http://www.devlinux.com/namesys

Have fun.

# vgdisplay
--- Volume group ---
VG Name               vg0
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               14.77 GB
PE Size               4 MB
Total PE              3780
Alloc PE / Size       3072 / 12 GB
Free  PE / Size       708 / 2.77 GB
VG UUID               4dsYpg-DTNA-v3n6-Ez2W-5Ht6-ZBOM-mK23YY


# mount /dev/vg0/lv0 /lv
# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda1              4200828   1032508   3168320  25% /
/dev/vg0/lv0          12582524     32840  12549684   0% /lv
# echo hello world > /lv/foo
# lvcreate -L1g -s -n s0 /dev/vg0/lv0
lvcreate -- WARNING: the snapshot must be disabled if it gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for "/dev/vg0/s0"
Segmentation fault
# dmesg | tail 
ReiserFS version 3.6.25
journal-1777: buffer 16 bad state !PREPARED !LOCKED !DIRTY !JDIRTY_WAIT
Unable to handle kernel NULL pointer dereference at virtual address 00000000
 printing eip:
c011370b
*pde = 00000000
Oops: 0002
CPU:    0
EIP:    0010:[<c011370b>]
EFLAGS: 00010086
eax: c697b578   ebx: 00000000   ecx: 00000286   edx: c15bdd68
esi: c15bdd60   edi: c15bc000   ebp: c697bb90   esp: c15bdd48
ds: 0018   es: 0018   ss: 0018
Process lvcreate (pid: 134, stackpage=c15bd000)
Stack: c697b56c c15bdd60 c01079d9 c697ba00 c697b400 c6879000 00000001 c15bc000 
       c697b578 00000000 c0107b38 c697b56c c13b51a0 00000000 c023bf73 4004fe20 
       080989e0 c15bdf9c c6879000 c697ba00 00000001 c68794c4 00000004 c68794c4 
Call Trace: [<c01079d9>] [<c0107b38>] [<c023bf73>] [<c01f3724>] [<c013b967>] [<c0108e2f>] [<c010002b>] 

Code: 89 13 51 9d 5b 5e c3 89 f6 9c 58 fa 8b 4a 0c 8b 52 08 89 4a 
# vgdisplay
--- Volume group ---
VG Name               vg0
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                2
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               14.77 GB
PE Size               4 MB
Total PE              3780
Alloc PE / Size       3328 / 13 GB
Free  PE / Size       452 / 1.77 GB
VG UUID               4dsYpg-DTNA-v3n6-Ez2W-5Ht6-ZBOM-mK23YY


# lvdisplay /dev/vg0/lv0
--- Logical volume ---
LV Name                /dev/vg0/lv0
VG Name                vg0
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                12 GB
Current LE             3072
Allocated LE           3072
Allocation             next free
Read ahead sectors     120
Block device           58:0
