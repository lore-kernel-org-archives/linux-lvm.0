Message-Id: <3.0.6.32.20000809202029.049b7490@post.strato.de>
Date: Wed, 09 Aug 2000 20:20:29 +0200
From: Falk Brockerhoff <falk.brockerhoff@kruchem-schmitt.de>
Subject: [linux-lvm] Problem - vgscan: ...can't get data ... from pv ...
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hello!

Yesterday i installed LVM 0.8final on my debian 2.2 potato system. it was
very easy and powerful .. great stuff ;-) 

after playing around i made my entries in the fstab and reboot the system
after testing it 'by handy'... :-((

vgscan (vgscan -v) at bootup:
-----------------------------
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all
physical volumes (this may take a while...)
vgscan -- scanning for all
active volume group(s) first
vgscan -- found inactive volume group
"vg_store"
vgscan -- reading data of volume group "vg_store" from physical
volume(s)
vgscan -- ERROR "lv_read_all_lv_of_vg(): number of LV" can't get
data of volume group "vg_store" from physical volume(s)
vgscan -- ERROR "lv_read_all_lv_of_vg(): number of LV" creating
"/etc/lvmtab" and "/etc/lvmtab.d"

lvmdiskscan by hand:
--------------------
lvmdiskscan -- reading all disks / partitions (this may take a
while...)
lvmdiskscan -- /dev/hda1 [     171.58 MB] Primary  LINUX native
partition [0x83]
lvmdiskscan -- /dev/hda2 [      72.51 MB] Primary  LINUX
swap partition [0x82]
lvmdiskscan -- /dev/hdb1 [      19.01 GB] Primary
LVM partition [0x8E]
lvmdiskscan -- /dev/hdc1 [       9.44 GB] Primary  LVM
partition [0x8E]
lvmdiskscan -- /dev/hdd1 [      13.99 GB] Primary  LVM
partition [0x8E]
lvmdiskscan -- 4 disks
lvmdiskscan -- 0 whole
disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple
devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 5
partitions
lvmdiskscan -- 3 LVM physical volume partitions

** THIS DATA
SEEMS TO BE ALLRIGHT **

'pvdata -v -P /dev/hdb' by hand:
--- Physical volume ---
PV Name               <**cryptic chars**>
VG Name
            <**cryptic chars**>
PV Size               8 GB / NOT usable
485.03 GB [LVM: 3.73 GB]
PV#                   0
PV Status             NOT
available
Allocatable           NO
Cur LV                260964353
PE Size
(KByte)       2097151
Total PE              1000407040
Free PE
 1000406738
Allocated PE          302


'pvdata -v -P /dev/hdc' by hand:
--- Physical volume ---
PV Name               <**cryptic chars**>
VG Name
            <**cryptic chars**>
PV Size               8 GB / NOT usable
485.03 GB [LVM: 3.73 GB]
PV#                   0
PV Status             NOT
available
Allocatable           NO
Cur LV                260964353
PE Size
(KByte)       2097151
Total PE              1000407040
Free PE
 1000406738
Allocated PE          302

'pvdata -v -P /dev/hdd' by hand:
--- Physical volume ---
PV Name               <**cryptic chars**>
VG Name
            <**cryptic chars**>
PV Size               8 GB / NOT usable
1.29 TB [LVM: 2.31 GB]
PV#                   0
PV Status             NOT
available
Allocatable           NO
Cur LV                260964353
PE Size
(KByte)       2097151
Total PE              2764111872
Free PE
 2764111425
Allocated PE          447


HELP! What can I do to recover my
data on the LVs? I've already searched the archive of the mailinglist but
did'nt found anything (only a person with the same problem, but no
answer).... :-(

Thank you,

Falk
