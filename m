Date: Fri, 27 Oct 2000 01:55:51 +0200
From: Fionn Behrens <Fionn.Behrens@unix-ag.org>
Subject: [linux-lvm] My VG (100+GB) is gone! HELP please!
Message-ID: <20001027015551.A1611@unix-ag.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="k+w/mQv8wyuph6w0"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii


I recently decided to adopt LVM for my system to be more flexible. I began
to convert one disk after the other to LVM, then relocate data and so on.
Everything worked fine until (as usual) I changed the last of my disks
to LVM today. After having merged all partitions on that disk into
one big chunk (8E) I pvcreated and rebooted.

I use kernel 2.2.16. The lvm module initialized ok but then:

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- no volume groups found

Oh well. There goes my precious data. At first I used hexedit (read-only!)
to examine the first blocks of the partitions involved. Everything looked
very clean and pretty undharmed. The vg name appeared here and there. 

Then I began to read docs and subsequently used vgcfgrestore on all my LVM
partitions as descibed there. Since my last PV wasnt yet used I went back to
the configuration point where it did not exist, backup by backup, disk by 
disk, but vgscan kept telling me the same.

I kept checking back with hexedit and everything looked pretty much the same
as before the restore.

This is what pvscan -v prints:

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- walking through all physical volumes found
pvscan -- inactive PV "/dev/hdb2"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/hdc2"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/hdd2"  is associated to an unknown VG (run vgscan)
pvscan -- total: 3 [104.63 GB] / in use: 3 [104.63 GB] / in no VG: 0 [0]

Oh yeah. "run vgscan". Nice hint :-) For your reading pleasure I append
a "vgscan -d" as well as the output of vgcfgrestore -ll as attachment to this 
mail. I cut out most of the debug output related to unused devices. Hope that
is okay. Please contact me soon,
I have no more ideas!

Desperate,
        Fionn

P.S.: As a sidenote I use lvm 0.8i-3 on Debian Linux 
-- 
"So GEMA will never, ever tire of putting those globalization-addicted
 advocates of absolute freedom of communication and therefor depisers of
 culture and intellectual property in their place"
                                         *** from a German RIAA Press Release

--k+w/mQv8wyuph6w0
Content-Type: text/plain
Content-Disposition: attachment; filename="vgcfg.txt"


Command used:

# vgcfgrestore -t -ll -n rtfm1 >vgcfg.txt

----------------------------------------------------------------

vgcfgrestore -- backup of volume group "rtfm1"  is consistent
--- Volume group ---
VG Name               rtfm1
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                3
Open LV               0
MAX LV Size           1023.97 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               104.61 GB
PE Size               16 MB
Total PE              6695
Alloc PE / Size       6695 / 104.61 GB
Free  PE / Size       0 / 0

--- Logical volume ---
LV Name               /dev/rtfm1/lv1
VG Name               rtfm1
LV Write Access       read/write
LV Status             available
LV #                  1
# open                0
LV Size               57.14 GB
Current LE            3657
Allocated LE          3657
Allocation            next free
Read ahead sectors    120
Block device          58:0

--- Logical volume ---
LV Name               /dev/rtfm1/lv2
VG Name               rtfm1
LV Write Access       read/write
LV Status             available
LV #                  2
# open                0
LV Size               10 GB
Current LE            640
Allocated LE          640
Stripes               2
Stripe size (KByte)   32
Allocation            next free
Read ahead sectors    120
Block device          58:1

--- Logical volume ---
LV Name               /dev/rtfm1/lv3
VG Name               rtfm1
LV Write Access       read/write
LV Status             available
LV #                  3
# open                0
LV Size               37.47 GB
Current LE            2398
Allocated LE          2398
Allocation            next free
Read ahead sectors    120
Block device          58:2


--- Physical volume ---
PV Name               /dev/hdc2
VG Name               rtfm1
PV Size               57.15 GB / NOT usable 13.83 MB [LVM: 136 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              3657
Free PE               0
Allocated PE          3657

--- Physical volume ---
PV Name               /dev/hdb2
VG Name               rtfm1
PV Size               23.74 GB / NOT usable 5.6 MB [LVM: 128 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                2
PE Size (KByte)       16384
Total PE              1519
Free PE               0
Allocated PE          1519

--- Physical volume ---
PV Name               /dev/hdd2
VG Name               rtfm1
PV Size               23.74 GB / NOT usable 5.6 MB [LVM: 128 KB]
PV#                   3
PV Status             available
Allocatable           yes (but full)
Cur LV                2
PE Size (KByte)       16384
Total PE              1519
Free PE               0
Allocated PE          1519




--k+w/mQv8wyuph6w0
Content-Type: text/plain
Content-Disposition: attachment; filename="vgscan.txt"

Command used:

# vgscan -d >vgscan.txt

-----------------------------------------------------------------------

lvm_get_iop_version -- CALLED
lvm_get_iop_version -- AFTER ioctl ret: 0
lvm_get_iop_version -- LEAVING with ret: 0
vgscan -- reading all physical volumes (this may take a while...)
vg_check_exist_all_vg -- CALLED
pv_read_all_pv -- CALLED
pv_read_all_pv -- calling lvm_dir_cache
lvm_dir_cache -- CALLED
lvm_dir_cache -- calling scandir() with /dev/ida
lvm_dir_cache -- AFTER calling scandir() with /dev/ida
lvm_dir_cache -- calling scandir() with /dev/ide/hd
lvm_dir_cache -- AFTER calling scandir() with /dev/ide/hd
lvm_dir_cache -- calling scandir() with /dev/loop
lvm_dir_cache -- AFTER calling scandir() with /dev/loop
lvm_dir_cache -- calling scandir() with /dev/md
lvm_dir_cache -- AFTER calling scandir() with /dev/md
lvm_dir_cache -- calling scandir() with /dev/rd
lvm_dir_cache -- AFTER calling scandir() with /dev/rd
lvm_dir_cache -- calling scandir() with /dev/sd
lvm_dir_cache -- AFTER calling scandir() with /dev/sd
lvm_dir_cache -- calling scandir() with /dev
lvm_dir_cache -- AFTER calling scandir() with /dev
lvm_dir_cache -- LEAVING with cache_size: 308
pv_read_all_pv -- calling pv_read with "/dev/hda"
pv_read -- CALLED with /dev/hda
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hda
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hda
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 3:0
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hda1"
pv_read -- CALLED with /dev/hda1
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda1"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hda1
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda1"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hda1
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 3:1
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda1
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
[...]
pv_read_all_pv -- calling pv_read with "/dev/hda2"
pv_read -- CALLED with /dev/hda2
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda2"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hda2
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda2"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hda2
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 3:2
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda2
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
[...]
pv_read_all_pv -- calling pv_read with "/dev/hda3"
pv_read -- CALLED with /dev/hda3
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda3"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hda3
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda3"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hda3
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 3:3
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda3
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hda4"
pv_read -- CALLED with /dev/hda4
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda4"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hda4
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda4"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hda4
pv_read -- LEAVING with ret: -276
pv_read_all_pv -- pv_read returned: -276
[...]
pv_read_all_pv -- calling pv_read with "/dev/hdb"
pv_read -- CALLED with /dev/hdb
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdb
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdb
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 3:64
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdb
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hdb1"
pv_read -- CALLED with /dev/hdb1
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb1"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdb1
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb1"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdb1
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 3:65
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdb1
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
[...]
pv_read_all_pv -- calling pv_read with "/dev/hdb2"
pv_read -- CALLED with /dev/hdb2
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb2"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdb2
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb2"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdb2
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 3:66
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdb2
pv_read -- LEAVING with ret: 0
pv_get_size -- CALLED with /dev/hdb2 and BFFFF9DC
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb2"
pv_check_name -- LEAVING with ret: 0
pv_check_part -- CALLED with /dev/hdb2
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb2"
pv_check_name -- LEAVING with ret: 0
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb2"
pv_check_name -- LEAVING with ret: 0
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_check_part -- LEAVING with 2
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_get_size -- BEFORE llseek 0:0
pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 195552
pv_get_size -- first == 1
pv_get_size -- part[1].sys_ind: 8E  part[1].nr_sects: 49786065
pv_get_size -- first == 1
pv_get_size -- part_i == part_i_tmp
pv_get_size -- LEAVING with ret: 49786065
pv_check_volume -- CALLED  dev_name: "/dev/hdb2"  pv: 805E3A8
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb2"
pv_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_volume -- LEAVING with ret: 1
pv_read_all_pv: allocating for /dev/hdb2 rtfm1
[...]
pv_check_name -- CALLED  pv_name: "/dev/hdb3"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdb3
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb3"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdb3
pv_read -- LEAVING with ret: -276
pv_read_all_pv -- pv_read returned: -276
[...]
pv_check_name -- CALLED  pv_name: "/dev/hdb9"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdb9
pv_read -- LEAVING with ret: -276
pv_read_all_pv -- pv_read returned: -276
pv_read_all_pv -- calling pv_read with "/dev/hdc"
pv_read -- CALLED with /dev/hdc
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdc
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdc
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 22:0
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hdc1"
pv_read -- CALLED with /dev/hdc1
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc1"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdc1
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc1"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdc1
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 22:1
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc1
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hdc10"
pv_read -- CALLED with /dev/hdc10
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
[...]
pv_check_name -- CALLED  pv_name: "/dev/hdc19"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdc19
pv_read -- LEAVING with ret: -276
pv_read_all_pv -- pv_read returned: -276
pv_read_all_pv -- calling pv_read with "/dev/hdc2"
pv_read -- CALLED with /dev/hdc2
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc2"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdc2
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc2"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdc2
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 22:2
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc2
pv_read -- LEAVING with ret: 0
pv_get_size -- CALLED with /dev/hdc2 and BFFFF9DC
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc2"
pv_check_name -- LEAVING with ret: 0
pv_check_part -- CALLED with /dev/hdc2
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc2"
pv_check_name -- LEAVING with ret: 0
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc2"
pv_check_name -- LEAVING with ret: 0
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_check_part -- LEAVING with 2
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_get_size -- BEFORE llseek 0:0
pv_get_size -- part[0].sys_ind: 82  part[0].nr_sects: 192780
pv_get_size -- first == 1
pv_get_size -- part[1].sys_ind: 8E  part[1].nr_sects: 119860902
pv_get_size -- first == 1
pv_get_size -- part_i == part_i_tmp
pv_get_size -- LEAVING with ret: 119860902
pv_check_volume -- CALLED  dev_name: "/dev/hdc2"  pv: 805FEE0
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc2"
pv_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_volume -- LEAVING with ret: 1
pv_read_all_pv: allocating for /dev/hdc2 rtfm1
pv_read_all_pv -- calling pv_read with "/dev/hdc20"
pv_read -- CALLED with /dev/hdc20
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc20"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdc20
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc20"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdc20
pv_read -- LEAVING with ret: -276
pv_read_all_pv -- pv_read returned: -276
pv_read_all_pv -- calling pv_read with "/dev/hdc3"
pv_read -- CALLED with /dev/hdc3
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc3"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdc3
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc3"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdc3
pv_read -- LEAVING with ret: -276
pv_read_all_pv -- pv_read returned: -276
[...]
pv_check_name -- CALLED  pv_name: "/dev/hdc9"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdc9
pv_read -- LEAVING with ret: -276
pv_read_all_pv -- pv_read returned: -276
pv_read_all_pv -- calling pv_read with "/dev/hdd"
pv_read -- CALLED with /dev/hdd
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdd
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdd
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 22:64
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdd
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hdd1"
pv_read -- CALLED with /dev/hdd1
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd1"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdd1
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd1"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdd1
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 22:65
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdd1
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hdd10"
pv_read -- CALLED with /dev/hdd10
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd10"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdd10
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
[...]
pv_read_all_pv -- calling pv_read with "/dev/hdd19"
pv_read -- CALLED with /dev/hdd19
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd19"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdd19
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd19"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdd19
pv_read -- LEAVING with ret: -276
pv_read_all_pv -- pv_read returned: -276
pv_read_all_pv -- calling pv_read with "/dev/hdd2"
pv_read -- CALLED with /dev/hdd2
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd2"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdd2
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd2"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdd2
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 22:66
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdd2
pv_read -- LEAVING with ret: 0
pv_get_size -- CALLED with /dev/hdd2 and BFFFF9DC
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd2"
pv_check_name -- LEAVING with ret: 0
pv_check_part -- CALLED with /dev/hdd2
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd2"
pv_check_name -- LEAVING with ret: 0
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd2"
pv_check_name -- LEAVING with ret: 0
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_check_part -- LEAVING with 2
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 308
pv_get_size -- BEFORE llseek 0:0
pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 195552
pv_get_size -- first == 1
pv_get_size -- part[1].sys_ind: 8E  part[1].nr_sects: 49786065
pv_get_size -- first == 1
pv_get_size -- part_i == part_i_tmp
pv_get_size -- LEAVING with ret: 49786065
pv_check_volume -- CALLED  dev_name: "/dev/hdd2"  pv: 805D480
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd2"
pv_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_volume -- LEAVING with ret: 1
pv_read_all_pv: allocating for /dev/hdd2 rtfm1
pv_read_all_pv -- calling pv_read with "/dev/hdd20"
pv_read -- CALLED with /dev/hdd20
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd20"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdd20
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd20"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdd20
pv_read -- LEAVING with ret: -276
pv_read_all_pv -- pv_read returned: -276
pv_read_all_pv -- calling pv_read with "/dev/hdd3"
pv_read -- CALLED with /dev/hdd3
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd3"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdd3
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd3"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdd3
pv_read -- LEAVING with ret: -276
pv_read_all_pv -- pv_read returned: -276
[...]
pv_read_all_pv -- calling pv_read with "/dev/sdh4"
pv_read_all_pv -- calling pv_read with "/dev/sdh5"
pv_read_all_pv -- calling pv_read with "/dev/sdh6"
pv_read_all_pv -- calling pv_read with "/dev/sdh7"
pv_read_all_pv -- calling pv_read with "/dev/sdh8"
pv_read_all_pv -- calling pv_read with "/dev/sdh9"
pv_read_all_pv -- avoiding multiple entries in case of MD; np: 3
pv_read_all_pv -- LEAVING with ret: 0
vg_check_exist_all_vg -- checking vg_name: rtfm1[0/0]
vg_check_exist_all_vg -- before vg_check_exist ( rtfm1)
vg_check_exist -- CALLED with rtfm1
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vg_read -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv_of_vg -- CALLED with vg_name: "rtfm1"
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv -- CALLED
pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
pv_read_all_pv -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_read_all_pv_of_vg:  pv_name: /dev/hdb2  vg_name: rtfm1  p: 0
pv_read_all_pv_of_vg: /dev/hdb2[1] hit rtfm1[0]
pv_read_all_pv_of_vg:  pv_name: /dev/hdc2  vg_name: rtfm1  p: 1
pv_read_all_pv_of_vg: /dev/hdc2[0] hit rtfm1[1]
pv_read_all_pv_of_vg:  pv_name: /dev/hdd2  vg_name: rtfm1  p: 2
pv_read_all_pv_of_vg: /dev/hdd2[2] hit rtfm1[2]
pv_read_all_pv_of_vg -- LEAVING with ret: 0
vg_read -- pv[0]->pv_name: "/dev/hdc2"
vg_read -- pv[1]->pv_name: "/dev/hdb2"
vg_read -- pv[2]->pv_name: "/dev/hdd2"
vg_copy_from_disk -- CALLED
vg_copy_from_disk -- LEAVING
vg_read -- LEAVING with ret: 0
vg_check_exist -- before pv_read_all_pv_of_vg
pv_read_all_pv_of_vg -- CALLED with vg_name: "rtfm1"
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv -- CALLED
pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
pv_read_all_pv -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_read_all_pv_of_vg:  pv_name: /dev/hdb2  vg_name: rtfm1  p: 0
pv_read_all_pv_of_vg: /dev/hdb2[1] hit rtfm1[0]
pv_read_all_pv_of_vg:  pv_name: /dev/hdc2  vg_name: rtfm1  p: 1
pv_read_all_pv_of_vg: /dev/hdc2[0] hit rtfm1[1]
pv_read_all_pv_of_vg:  pv_name: /dev/hdd2  vg_name: rtfm1  p: 2
pv_read_all_pv_of_vg: /dev/hdd2[2] hit rtfm1[2]
pv_read_all_pv_of_vg -- LEAVING with ret: 0
vg_check_exist -- before vg->pv_cur check with vg->pv_cur: 4  pv_count: 3
vg_check_exist_all_vg -- checking vg_name: rtfm1[1/0]
vg_check_exist_all_vg -- before vg_check_exist ( rtfm1)
vg_check_exist -- CALLED with rtfm1
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vg_read -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv_of_vg -- CALLED with vg_name: "rtfm1"
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv_of_vg -- LEAVING with ret: 0
vg_read -- pv[0]->pv_name: "/dev/hdc2"
vg_read -- pv[1]->pv_name: "/dev/hdb2"
vg_read -- pv[2]->pv_name: "/dev/hdd2"
vg_copy_from_disk -- CALLED
vg_copy_from_disk -- LEAVING
vg_read -- LEAVING with ret: 0
vg_check_exist -- before pv_read_all_pv_of_vg
pv_read_all_pv_of_vg -- CALLED with vg_name: "rtfm1"
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv -- CALLED
pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
pv_read_all_pv -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_read_all_pv_of_vg:  pv_name: /dev/hdb2  vg_name: rtfm1  p: 0
pv_read_all_pv_of_vg: /dev/hdb2[1] hit rtfm1[0]
pv_read_all_pv_of_vg:  pv_name: /dev/hdc2  vg_name: rtfm1  p: 1
pv_read_all_pv_of_vg: /dev/hdc2[0] hit rtfm1[1]
pv_read_all_pv_of_vg:  pv_name: /dev/hdd2  vg_name: rtfm1  p: 2
pv_read_all_pv_of_vg: /dev/hdd2[2] hit rtfm1[2]
pv_read_all_pv_of_vg -- LEAVING with ret: 0
vg_check_exist -- before vg->pv_cur check with vg->pv_cur: 4  pv_count: 3
vg_check_exist_all_vg -- checking vg_name: rtfm1[2/0]
vg_check_exist_all_vg -- before vg_check_exist ( rtfm1)
vg_check_exist -- CALLED with rtfm1
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vg_read -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv_of_vg -- CALLED with vg_name: "rtfm1"
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv_of_vg -- LEAVING with ret: 0
vg_read -- pv[0]->pv_name: "/dev/hdc2"
vg_read -- pv[1]->pv_name: "/dev/hdb2"
vg_read -- pv[2]->pv_name: "/dev/hdd2"
vg_copy_from_disk -- CALLED
vg_copy_from_disk -- LEAVING
vg_read -- LEAVING with ret: 0
vg_check_exist -- before pv_read_all_pv_of_vg
pv_read_all_pv_of_vg -- CALLED with vg_name: "rtfm1"
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv -- CALLED
pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
pv_read_all_pv -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdb2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "rtfm1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_read_all_pv_of_vg:  pv_name: /dev/hdb2  vg_name: rtfm1  p: 0
pv_read_all_pv_of_vg: /dev/hdb2[1] hit rtfm1[0]
pv_read_all_pv_of_vg:  pv_name: /dev/hdc2  vg_name: rtfm1  p: 1
pv_read_all_pv_of_vg: /dev/hdc2[0] hit rtfm1[1]
pv_read_all_pv_of_vg:  pv_name: /dev/hdd2  vg_name: rtfm1  p: 2
pv_read_all_pv_of_vg: /dev/hdd2[2] hit rtfm1[2]
pv_read_all_pv_of_vg -- LEAVING with ret: 0
vg_check_exist -- before vg->pv_cur check with vg->pv_cur: 4  pv_count: 3
vg_check_exist_all_vg -- LEAVING with (null)
lvm_tab_write -- CALLED
lvm_tab_write -- LEAVING

--k+w/mQv8wyuph6w0--
