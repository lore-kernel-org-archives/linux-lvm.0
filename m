Return-Path: <Dominique.Larchey-Wendling@loria.fr>
Message-ID: <3AEEAEAA.93304CBB@loria.fr>
Date: Tue, 01 May 2001 14:40:10 +0200
From: Dominique LARCHEY-WENDLING <Dominique.Larchey-Wendling@loria.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM & high system load
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

Hi, 

I am newbie to LVM. I am experiencing high cpu load (system time > 90%)
and
relatively poor IO perf. (my cpu is only PII 333) on LVM volumes. I have 
tested reiserfs and ext2fs and I only get about 2.5Mb/s with 100% CPU
load,
mostly system time.

Due to some failures of vgscan (no volume found) and vgchange (core
dumps,)
I had to upgrade my 2.4.3 kernel to LVM beta7 and also the system tools.
Now
it seems that theses tools work but I still have very high loads, much
higher than what I would have on a fs lying on a partition.

My logical volumes are not stripped.

Is this a known issue ? 

Thanks in advance,

DL

-- 
Dominique Larchey
LORIA, Nancy, France
Tel. (Work) +33 (0) 3 83 59 20 13

----------------------------

[root@charlie temp]# /usr/sbin/vgdisplay mmedia                       
--- Volume group ---
VG Name               mmedia
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                3
Open LV               3
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               28.49 GB
PE Size               4 MB
Total PE              7294
Alloc PE / Size       5066 / 19.79 GB
Free  PE / Size       2228 / 8.7 GB
VG UUID               dF3isK-xdlk-YF7u-FwxQ-KnPQ-jgG6-qjt73X

[root@charlie temp]# /usr/sbin/pvdisplay /dev/hda1 /dev/hda5 /dev/hda6
--- Physical volume ---
PV Name               /dev/hda1
VG Name               mmedia
PV Size               9.77 GB / NOT usable 1.37 MB [LVM: 130 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              2500
Free PE               0
Allocated PE          2500
PV UUID               3aeAAl-88en-VZxJ-84gE-Uaxu-AWZm-zoA3jC

--- Physical volume ---
PV Name               /dev/hda5
VG Name               mmedia
PV Size               9.77 GB / NOT usable 1.37 MB [LVM: 130 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                3
PE Size (KByte)       4096
Total PE              2500
Free PE               0
Allocated PE          2500
PV UUID               lUiRFu-JEhC-d5JS-Jycy-VFa8-2o2y-6I9V9S

--- Physical volume ---
PV Name               /dev/hda6
VG Name               mmedia
PV Size               8.96 GB / NOT usable 1.73 MB [LVM: 129 KB]
PV#                   3
PV Status             available
Allocatable           yes
Cur LV                0
PE Size (KByte)       4096
Total PE              2294
Free PE               2228
Allocated PE          66
PV UUID               GOf2OV-khJd-w1cJ-AEk3-RvyA-Wdly-p5OuWd

[root@charlie temp]# /usr/sbin/lvdisplay /dev/mmedia/music
/dev/mmedia/temp /dev/mmedia/test 
--- Logical volume ---
LV Name                /dev/mmedia/music
VG Name                mmedia
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                9 GB
Current LE             2304
Allocated LE           2304
Allocation             next free
Read ahead sectors     120
Block device           58:1

--- Logical volume ---
LV Name                /dev/mmedia/temp
VG Name                mmedia
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                9.79 GB
Current LE             2506
Allocated LE           2506
Allocation             next free
Read ahead sectors     120
Block device           58:0

--- Logical volume ---
LV Name                /dev/mmedia/test
VG Name                mmedia
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 1
LV Size                1 GB
Current LE             256
Allocated LE           256
Allocation             next free
Read ahead sectors     120
Block device           58:2
