Subject: [linux-lvm] lvdisplay disagrees with df for resized LV
From: Andy Cowling <andy@redeye.com>
Date: 11 Oct 2000 13:25:50 +0100
Message-ID: <m2u2ajmunl.fsf@puma.redeye>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com
Cc: Dan Garcia <dan@redeye.com>

I'm just starting out using LVM under SuSE 7.0. I created a logical
volume which was initially 30Gb but I then resized it to 90Gb (using
lvresize) spanning 3 physical volumes each of 30Gb.

Now, lvdisplay/vgdisplay shows the LV/VG size as 90Gb, but df still
lists the file system as 30Gb.

How can I get df to recognise the addtional space ?

Thanks in advance
-- 
Andy Cowling
Red Eye International
http://www.redeye.com/

root@lynx:/opt/oracle > df -h /lv01
Filesystem            Size  Used Avail Use% Mounted on
/dev/vg01/lv01         30G   17G   13G  58% /lv01

root@lynx:/opt/oracle > lvdisplay  /dev/vg01/lv01
--- Logical volume ---
LV Name               /dev/vg01/lv01
VG Name               vg01
LV Write Access       read/write
LV Status             available
LV #                  1
# open                1
LV Size               90 GB
Current LE            23040
Allocated LE          23040
Allocation            next free
Read ahead sectors    128
Block device          58:0

root@lynx:/opt/oracle > vgdisplay  vg01          
--- Volume group ---
VG Name               vg01
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               90.01 GB
PE Size               4 MB
Total PE              23043
Alloc PE / Size       23040 / 90 GB
Free  PE / Size       3 / 12 MB

root@lynx:/opt/oracle > pvdisplay /dev/sdc5
--- Physical volume ---
PV Name               /dev/sdc5
VG Name               vg01
PV Size               30.01 GB / NOT usable 1.85 MB [LVM: 260 KB]
PV#                   3
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              7681
Free PE               3
Allocated PE          7678


root@lynx:/opt/oracle > pvdisplay /dev/sdd5
--- Physical volume ---
PV Name               /dev/sdd5
VG Name               vg01
PV Size               30.01 GB / NOT usable 1.85 MB [LVM: 260 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              7681
Free PE               0
Allocated PE          7681


root@lynx:/opt/oracle > pvdisplay /dev/sde5
--- Physical volume ---
PV Name               /dev/sde5
VG Name               vg01
PV Size               30.01 GB / NOT usable 1.85 MB [LVM: 260 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              7681
Free PE               0
Allocated PE          7681
