Message-ID: <39D2373B.CEBB2147@marxmeier.com>
Date: Wed, 27 Sep 2000 20:06:51 +0200
From: Michael Marxmeier <mike@msede.com>
Reply-To: mg@plum.de
MIME-Version: 1.0
Subject: [linux-lvm] RE: Ut-Oh! - I need MAJOR help.
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@marxmeier.com

Forwarded message from Michael Glauche (mg@plum.de) ...

-------- Original Message --------
From: "Michael Glauche" <mg@plum.de>
To: <JHamilton@Earthling.Net>
Cc: <linux-lvm@msede.com>
Subject: RE: Ut-Oh! - I need MAJOR help.
Date: Wed, 27 Sep 2000 19:00:35 +0200

Hi,
  I got a very similar problem (with 2.4.0-test6):

After a system-crash with -test8 I can't get lvm working again:
# vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- found inactive volume group "vol1"
vgscan -- reading data of volume group "vol1" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't
get
data of volume group "vol1" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV"
creating
"/etc/lvmtab" and "/etc/lvmtab.d"

lvmdiskscan -- /dev/hde1 [      42.95 GB] Primary  LVM partition
[0x8E]
lvmdiskscan -- /dev/hdi2 [       28.4 GB] Primary  LVM partition
[0x8E]
lvmdiskscan -- /dev/hdk2 [       28.4 GB] Primary  LVM partition
[0x8E]
 pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hde1"  is associated to an unknown VG (run
vgscan)
pvscan -- inactive PV "/dev/hdi2"  is associated to an unknown VG (run
vgscan)
pvscan -- inactive PV "/dev/hdk2"  is associated to an unknown VG (run
vgscan)
pvscan -- total: 3 [99.75 GB] / in use: 3 [99.75 GB] / in no VG: 0 [0]



I did run the vgcfgrestore -n vol1 /dev... for all 3 drives ...

vgscan -d gives:
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 6
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_remove_recursive -- CALLED with dir: /etc/lvmtab.d
<1> lvm_remove_recursive -- LEAVING with ret: -297
<1> vg_check_exist_all_vg -- CALLED
<22> pv_read_all_pv -- CALLED
<22> pv_read_all_pv -- calling lvm_dir_cache
<333> lvm_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<333> lvm_dir_cache -- LEAVING with ret: 14
<22> pv_read_all_pv -- calling stat with "/dev/md0"
<333> pv_read -- CALLED with /dev/md0
<4444> pv_check_name -- CALLED eith "/dev/md0"
<55555> lvm_check_chars -- CALLED with name: "/dev/md0"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/md0
<55555> pv_check_name -- CALLED eith "/dev/md0"
<666666> lvm_check_chars -- CALLED with name: "/dev/md0"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/md0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 9:0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/md0
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/hda"
<333> pv_read -- CALLED with /dev/hda
<4444> pv_check_name -- CALLED eith "/dev/hda"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hda
<55555> pv_check_name -- CALLED eith "/dev/hda"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hda
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/hda1"
<333> pv_read -- CALLED with /dev/hda1
<4444> pv_check_name -- CALLED eith "/dev/hda1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hda1
<55555> pv_check_name -- CALLED eith "/dev/hda1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hda1
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:1
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda1
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/hda2"
<333> pv_read -- CALLED with /dev/hda2
<4444> pv_check_name -- CALLED eith "/dev/hda2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hda2
<55555> pv_check_name -- CALLED eith "/dev/hda2"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hda2
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:2
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda2
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/hda5"
<333> pv_read -- CALLED with /dev/hda5
<4444> pv_check_name -- CALLED eith "/dev/hda5"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda5"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hda5
<55555> pv_check_name -- CALLED eith "/dev/hda5"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda5"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hda5
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:5
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda5
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/hda6"
<333> pv_read -- CALLED with /dev/hda6
<4444> pv_check_name -- CALLED eith "/dev/hda6"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda6"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hda6
<55555> pv_check_name -- CALLED eith "/dev/hda6"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda6"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hda6
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:6
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda6
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/hde"
<333> pv_read -- CALLED with /dev/hde
<4444> pv_check_name -- CALLED eith "/dev/hde"
<55555> lvm_check_chars -- CALLED with name: "/dev/hde"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hde
<55555> pv_check_name -- CALLED eith "/dev/hde"
<666666> lvm_check_chars -- CALLED with name: "/dev/hde"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hde
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 33:0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hde
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/hde1"
<333> pv_read -- CALLED with /dev/hde1
<4444> pv_check_name -- CALLED eith "/dev/hde1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hde1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hde1
<55555> pv_check_name -- CALLED eith "/dev/hde1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hde1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hde1
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 33:1
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hde1
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/hde1 and BFFFFA58
<4444> pv_check_name -- CALLED eith "/dev/hde1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hde1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_part -- CALLED with /dev/hde1
<55555> pv_check_name -- CALLED eith "/dev/hde1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hde1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache_find -- CALLED
<666666> pv_check_name -- CALLED eith "/dev/hde1"
<7777777> lvm_check_chars -- CALLED with name: "/dev/hde1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> lvm_dir_cache -- CALLED
<666666> lvm_dir_cache -- LEAVING with ret: 14
<55555> lvm_dir_cache_find -- LEAVING
<55555> lvm_partition_count -- CALLED
<55555> lvm_partition_count -- LEAVING with ret: 16
<4444> pv_check_part -- LEAVING with 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 14
<4444> lvm_dir_cache_find -- CALLED
<55555> pv_check_name -- CALLED eith "/dev/hde1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hde1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> lvm_dir_cache_find -- LEAVING
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING
<4444> lvm_partition_count -- CALLED
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 90069777
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 90069777
<333> pv_check_volume -- CALLED  dev_name: "/dev/hde1"  pv: 804CDF8
<4444> pv_check_name -- CALLED eith "/dev/hde1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hde1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "vol1"
<55555> lvm_check_chars -- CALLED with name: "vol1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/hde1 vol1
<22> pv_read_all_pv -- calling stat with "/dev/hdi"
<333> pv_read -- CALLED with /dev/hdi
<4444> pv_check_name -- CALLED eith "/dev/hdi"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdi"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdi
<55555> pv_check_name -- CALLED eith "/dev/hdi"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdi"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdi
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 56:0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdi
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/hdi1"
<333> pv_read -- CALLED with /dev/hdi1
<4444> pv_check_name -- CALLED eith "/dev/hdi1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdi1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdi1
<55555> pv_check_name -- CALLED eith "/dev/hdi1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdi1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdi1
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 56:1
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdi1
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/hdi2"
<333> pv_read -- CALLED with /dev/hdi2
<4444> pv_check_name -- CALLED eith "/dev/hdi2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdi2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdi2
<55555> pv_check_name -- CALLED eith "/dev/hdi2"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdi2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdi2
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 56:2
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdi2
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/hdi2 and BFFFFA58
<4444> pv_check_name -- CALLED eith "/dev/hdi2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdi2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_part -- CALLED with /dev/hdi2
<55555> pv_check_name -- CALLED eith "/dev/hdi2"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdi2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache_find -- CALLED
<666666> pv_check_name -- CALLED eith "/dev/hdi2"
<7777777> lvm_check_chars -- CALLED with name: "/dev/hdi2"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> lvm_dir_cache -- CALLED
<666666> lvm_dir_cache -- LEAVING with ret: 14
<55555> lvm_dir_cache_find -- LEAVING
<55555> lvm_partition_count -- CALLED
<55555> lvm_partition_count -- LEAVING with ret: 16
<4444> pv_check_part -- LEAVING with 2
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 14
<4444> lvm_dir_cache_find -- CALLED
<55555> pv_check_name -- CALLED eith "/dev/hdi2"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdi2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> lvm_dir_cache_find -- LEAVING
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING
<4444> lvm_partition_count -- CALLED
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: FD  part[0].nr_sects: 20482812
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 8E  part[1].nr_sects: 59552955
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 59552955
<333> pv_check_volume -- CALLED  dev_name: "/dev/hdi2"  pv: 804D740
<4444> pv_check_name -- CALLED eith "/dev/hdi2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdi2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "vol1"
<55555> lvm_check_chars -- CALLED with name: "vol1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/hdi2 vol1
<22> pv_read_all_pv -- calling stat with "/dev/hdk"
<333> pv_read -- CALLED with /dev/hdk
<4444> pv_check_name -- CALLED eith "/dev/hdk"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdk"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdk
<55555> pv_check_name -- CALLED eith "/dev/hdk"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdk"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdk
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 57:0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdk
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/hdk1"
<333> pv_read -- CALLED with /dev/hdk1
<4444> pv_check_name -- CALLED eith "/dev/hdk1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdk1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdk1
<55555> pv_check_name -- CALLED eith "/dev/hdk1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdk1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdk1
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 57:1
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdk1
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/hdk2"
<333> pv_read -- CALLED with /dev/hdk2
<4444> pv_check_name -- CALLED eith "/dev/hdk2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdk2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdk2
<55555> pv_check_name -- CALLED eith "/dev/hdk2"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdk2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdk2
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 57:2
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdk2
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/hdk2 and BFFFFA58
<4444> pv_check_name -- CALLED eith "/dev/hdk2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdk2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_part -- CALLED with /dev/hdk2
<55555> pv_check_name -- CALLED eith "/dev/hdk2"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdk2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache_find -- CALLED
<666666> pv_check_name -- CALLED eith "/dev/hdk2"
<7777777> lvm_check_chars -- CALLED with name: "/dev/hdk2"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> lvm_dir_cache -- CALLED
<666666> lvm_dir_cache -- LEAVING with ret: 14
<55555> lvm_dir_cache_find -- LEAVING
<55555> lvm_partition_count -- CALLED
<55555> lvm_partition_count -- LEAVING with ret: 16
<4444> pv_check_part -- LEAVING with 2
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 14
<4444> lvm_dir_cache_find -- CALLED
<55555> pv_check_name -- CALLED eith "/dev/hdk2"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdk2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 14
<4444> lvm_dir_cache_find -- LEAVING
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING
<4444> lvm_partition_count -- CALLED
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: FD  part[0].nr_sects: 20480481
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 8E  part[1].nr_sects: 59560704
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 59560704
<333> pv_check_volume -- CALLED  dev_name: "/dev/hdk2"  pv: 804E208
<4444> pv_check_name -- CALLED eith "/dev/hdk2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdk2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "vol1"
<55555> lvm_check_chars -- CALLED with name: "vol1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/hdk2 vol1
<22> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 3
<22> pv_read_all_pv -- LEAVING with ret: 0
<1> vg_check_exist_all_vg -- checking vg_name: vol1[0/0]
<1> vg_check_exist_all_vg -- before vg_check_exist ( vol1)
<22> vg_check_exist -- CALLED with vol1
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "vol1"
<4444> lvm_check_chars -- CALLED with name: "vol1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_read -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "vol1"
<55555> lvm_check_chars -- CALLED with name: "vol1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- CALLED with vg_name: "vol1"
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "vol1"
<666666> lvm_check_chars -- CALLED with name: "vol1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> pv_read_all_pv -- CALLED
<55555> pv_read_all_pv -- avoiding multiple entries in case of MD; np:
0
<55555> pv_read_all_pv -- LEAVING with ret: 0
<55555> pv_check_consistency -- CALLED
<666666> pv_check_name -- CALLED eith "/dev/hde1"
<7777777> lvm_check_chars -- CALLED with name: "/dev/hde1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "vol1"
<7777777> lvm_check_chars -- CALLED with name: "vol1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_new -- CALLED
<666666> pv_check_new -- LEAVING with ret: 0
<55555> pv_check_consistency -- LEAVING with ret: 0
<55555> pv_check_consistency -- CALLED
<666666> pv_check_name -- CALLED eith "/dev/hdi2"
<7777777> lvm_check_chars -- CALLED with name: "/dev/hdi2"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "vol1"
<7777777> lvm_check_chars -- CALLED with name: "vol1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_new -- CALLED
<666666> pv_check_new -- LEAVING with ret: 0
<55555> pv_check_consistency -- LEAVING with ret: 0
<55555> pv_check_consistency -- CALLED
<666666> pv_check_name -- CALLED eith "/dev/hdk2"
<7777777> lvm_check_chars -- CALLED with name: "/dev/hdk2"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "vol1"
<7777777> lvm_check_chars -- CALLED with name: "vol1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_new -- CALLED
<666666> pv_check_new -- LEAVING with ret: 0
<55555> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg:  pv_name: /dev/hde1  vg_name: vol1  p: 0
<4444> pv_read_all_pv_of_vg: /dev/hde1[0] hit vol1[0]
<4444> pv_read_all_pv_of_vg:  pv_name: /dev/hdi2  vg_name: vol1  p: 1
<4444> pv_read_all_pv_of_vg: /dev/hdi2[1] hit vol1[1]
<4444> pv_read_all_pv_of_vg:  pv_name: /dev/hdk2  vg_name: vol1  p: 2
<4444> pv_read_all_pv_of_vg: /dev/hdk2[2] hit vol1[2]
<4444> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> vg_read -- pv[0]->pv_name: "/dev/hde1"
<333> vg_read -- pv[1]->pv_name: "/dev/hdi2"
<333> vg_read -- pv[2]->pv_name: "/dev/hdk2"
<4444> vg_copy_from_disk -- CALLED
<4444> vg_copy_from_disk -- LEAVING
<333> vg_read -- LEAVING with ret: 0
<22> vg_check_exist -- before pv_read_all_pv_of_vg
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "vol1"
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "vol1"
<55555> lvm_check_chars -- CALLED with name: "vol1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv -- CALLED
<4444> pv_read_all_pv -- avoiding multiple entries in case of MD; np:
0
<4444> pv_read_all_pv -- LEAVING with ret: 0
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED eith "/dev/hde1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hde1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "vol1"
<666666> lvm_check_chars -- CALLED with name: "vol1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED eith "/dev/hdi2"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdi2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "vol1"
<666666> lvm_check_chars -- CALLED with name: "vol1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED eith "/dev/hdk2"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdk2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "vol1"
<666666> lvm_check_chars -- CALLED with name: "vol1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg:  pv_name: /dev/hde1  vg_name: vol1  p: 0
<333> pv_read_all_pv_of_vg: /dev/hde1[0] hit vol1[0]
<333> pv_read_all_pv_of_vg:  pv_name: /dev/hdi2  vg_name: vol1  p: 1
<333> pv_read_all_pv_of_vg: /dev/hdi2[1] hit vol1[1]
<333> pv_read_all_pv_of_vg:  pv_name: /dev/hdk2  vg_name: vol1  p: 2
<333> pv_read_all_pv_of_vg: /dev/hdk2[2] hit vol1[2]
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<22> vg_check_exist -- before vg->pv_cur check with vg->pv_cur: 3 
pv_count:
3
<22> vg_check_exist -- LEAVING with ret: 1
<1> vg_check_exist_all_vg -- HIT vg_name: vol1
<1> vg_check_exist_all_vg -- vg_name_ptr[0]: vol1
<1> vg_check_exist_all_vg -- checking vg_name: vol1[1/1]
<1> vg_check_exist_all_vg -- checking vg_name: vol1[2/1]
<1> vg_check_exist_all_vg -- LEAVING with ��
<1> vg_check_active -- CALLED
<22> vg_check_name -- CALLED
<22> vg_check_name -- vg_name: "vol1"
<333> lvm_check_chars -- CALLED with name: "vol1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- CALLED
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "vol1"
<4444> lvm_check_chars -- CALLED with name: "vol1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- LEAVING with ret: -6
<1> vg_check_active -- LEAVING with ret: -6
<1> vg_check_active -- CALLED
<22> vg_check_name -- CALLED
<22> vg_check_name -- vg_name: "vol1"
<333> lvm_check_chars -- CALLED with name: "vol1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- CALLED
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "vol1"
<4444> lvm_check_chars -- CALLED with name: "vol1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- LEAVING with ret: -6
<1> vg_check_active -- LEAVING with ret: -6
<1> vg_read_with_pv_and_lv -- CALLED
<22> vg_check_name -- CALLED
<22> vg_check_name -- vg_name: "vol1"
<333> lvm_check_chars -- CALLED with name: "vol1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_read -- CALLED
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "vol1"
<4444> lvm_check_chars -- CALLED with name: "vol1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "vol1"
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "vol1"
<55555> lvm_check_chars -- CALLED with name: "vol1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<22> vg_read -- pv[0]->pv_name: "/dev/hde1"
<22> vg_read -- pv[1]->pv_name: "/dev/hdi2"
<22> vg_read -- pv[2]->pv_name: "/dev/hdk2"
<333> vg_copy_from_disk -- CALLED
<333> vg_copy_from_disk -- LEAVING
<22> vg_read -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER vg_read;  vg_this->lv_cur: 1
<22> pv_read_all_pv_of_vg -- CALLED with vg_name: "vol1"
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "vol1"
<4444> lvm_check_chars -- CALLED with name: "vol1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER pv_read_all_pv_of_vg
<22> pv_read_all_pe_of_vg -- CALLED
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "vol1"
<4444> lvm_check_chars -- CALLED with name: "vol1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "vol1"
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "vol1"
<55555> lvm_check_chars -- CALLED with name: "vol1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- pv_count: 3
<333> pv_read_pe -- CALLED with /dev/hde1 and 10994
<4444> pv_check_name -- CALLED eith "/dev/hde1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hde1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/hde1 with 10994 PE at address
804CDD8
<333> pv_read_pe -- CALLED with /dev/hdi2 and 7269
<4444> pv_check_name -- CALLED eith "/dev/hdi2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdi2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/hdi2 with 7269 PE at address 804CDDC
<333> pv_read_pe -- CALLED with /dev/hdk2 and 7270
<4444> pv_check_name -- CALLED eith "/dev/hdk2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdk2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/hdk2 with 7270 PE at address 804CDE0
<333> pv_check_number -- CALLED
<333> pv_check_number -- LEAVING with ret: 2
<22> pv_read_all_pe_of_vg -- AFTER LOOP of pv_read_pe
<22> pv_read_all_pe_of_vg -- /dev/hde1 with 10994 PE at address
805B4D8 for
PV #0
<22> pv_read_all_pe_of_vg -- /dev/hdi2 with 7269 PE at address 80660A8
for
PV #1
<22> pv_read_all_pe_of_vg -- /dev/hdk2 with 7270 PE at address 806D240
for
PV #2
<22> pv_read_all_pe_of_vg -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER pv_read_all_pe_of_vg
<22> lv_read_all_lv_of_vg -- CALLED
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "vol1"
<4444> lvm_check_chars -- CALLED with name: "vol1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_read -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "vol1"
<55555> lvm_check_chars -- CALLED with name: "vol1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- CALLED with vg_name: "vol1"
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "vol1"
<666666> lvm_check_chars -- CALLED with name: "vol1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> vg_read -- pv[0]->pv_name: "/dev/hde1"
<333> vg_read -- pv[1]->pv_name: "/dev/hdi2"
<333> vg_read -- pv[2]->pv_name: "/dev/hdk2"
<4444> vg_copy_from_disk -- CALLED
<4444> vg_copy_from_disk -- LEAVING
<333> vg_read -- LEAVING with ret: 0
<22> lv_read_all_lv_of_vg -- lv_max: 256
<22> lv_read_all_lv_of_vg -- BEFORE pv_read_all_pv_of_vg
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "vol1"
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "vol1"
<55555> lvm_check_chars -- CALLED with name: "vol1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<22> lv_read_all_lv_of_vg -- l: 256  nl: 1  vg_this->lv_cur: 1
<22> lv_read_all_lv_of_vg -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER lv_read_all_lv_of_vg;
vg_this->pv_cur: 3
vg_this->pv_max: 256  ret: 0
<1> vg_read_with_pv_and_lv -- BEFORE for PE
<1> vg_read_with_pv_and_lv -- AFTER for PE
<1> vg_read_with_pv_and_lv -- BEFORE for LV
<1> vg_read_with_pv_and_lv -- vg_this->lv[1]->lv_allocated_le: 25532
<1> vg_read_with_pv_and_lv -- LEAVING with ret: -351
<1> lvm_error -- CALLED with: -351
<22> lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): allocated
LE of
LV"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't
get
data of volume group "vol1" from physical volume(s)
<333> lvm_interrupt -- CALLED
<333> lvm_interrupt -- LEAVING
<333> lvm_unlock -- CALLED
<333> lvm_unlock -- LEAVING with ret: 0
<333> lvm_error -- CALLED with: -351
<4444> lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): allocated
LE of
LV"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV"
creating
"/etc/lvmtab" and "/etc/lvmtab.d"

<55555> lvm_unlock -- CALLED
<55555> lvm_unlock -- LEAVING with ret: -104

is there any hope ?

TIA,
   Michael
