Return-Path: <misiek@pld.ORG.PL>
Date: Mon, 30 Apr 2001 16:58:42 +0200
From: Arkadiusz Miskiewicz <misiek@pld.ORG.PL>
Subject: Re: [linux-lvm] vgcreate doesn't work for me
Message-ID: <20010430165842.A6326@ikar.t17.ds.pwr.wroc.pl>
References: <20010430161149.K19810@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010430161149.K19810@sistina.com>; from Mauelshagen@sistina.com on Mon, Apr 30, 2001 at 04:11:49PM +0000
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On/Dnia Mon, Apr 30, 2001 at 04:11:49PM +0000, Heinz J. Mauelshagen wrote/napisa�(a)
> $ fdisk -l /dev/hdd
[root@arm misiek]# fdisk -l /dev/hdd

Disk /dev/hdd: 32 heads, 63 sectors, 827 cylinders
Units = cylinders of 2016 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hdd1             1       194    195520+  8e  Linux LVM
/dev/hdd2           195       388    195552   8e  Linux LVM
/dev/hdd3           389       827    442512   8e  Linux LVM
> 
> $ pvdisplay /dev/hdd[1-3]
[root@arm misiek]# pvdisplay /dev/hdd[123]
pvdisplay -- "/dev/hdd1" is a new physical volume of 190.94 MB
pvdisplay -- "/dev/hdd2" is a new physical volume of 190.97 MB
pvdisplay -- "/dev/hdd3" is a new physical volume of 432.14 MB

> $ vgcreate -d test /dev/hdd[1-3]
[root@arm misiek]# vgcreate -d test /dev/hdd[123]
<1> vg_check_name -- CALLED with VG: test
<22> lvm_check_chars -- CALLED with name: "test"
<22> lvm_check_chars -- LEAVING with ret: 0
<1> vg_check_name -- LEAVING with ret: 0
<1> vg_check_dir -- CALLED with VG: test
<22> vg_check_name -- CALLED with VG: test
<333> lvm_check_chars -- CALLED with name: "test"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<1> vg_check_dir -- vg_name: "test"
<1> vg_check_dir -- LEAVING with ret: 0
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> lvm_tab_vg_check_exist -- CALLED with vg_name: "test"
<22> vg_check_name -- CALLED with VG: test
<333> lvm_check_chars -- CALLED with name: "test"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> lvm_tab_read -- CALLED
<22> lvm_tab_read -- LEAVING with ret: 0  data: 804CDC0  size: 1
<1> lvm_tab_vg_check_exist -- LEAVING with ret: 0
<1> lvm_tab_vg_check_exist_all_vg -- CALLED
<22> lvm_tab_read -- CALLED
<22> lvm_tab_read -- LEAVING with ret: 0  data: 804CDC0  size: 1
<1> lvm_tab_vg_check_exist_all_vg -- LEAVING with ret: 0
<1> pv_read_all_pv -- CALLED
<1> pv_read_all_pv -- calling lvm_dir_cache
<22> lvm_dir_cache -- CALLED
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 0
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 0
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 0
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 0
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 0
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 0
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 0
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 0
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 0
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 0
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 0
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 0
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<22> lvm_dir_cache -- LEAVING with ret: 12
<1> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/disc"
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/disc
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/disc"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/disc"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/disc
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/disc
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/disc"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/disc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/disc
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 3:0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/disc
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part1"
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part1
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part1"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part1
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part1
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part1"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part1
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 3:1
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part1
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part2"
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part2
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part2"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part2
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part2
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part2"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part2
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 3:2
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part2
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part5"
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part5
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part5
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part5
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part5
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 3:5
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part5
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part6"
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part6
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part6"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part6"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part6
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part6
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part6"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part6"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part6
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 3:6
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part6
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part7"
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part7
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part7"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part7"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part7
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part7
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part7"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part7"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part7
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 3:7
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part7
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part8"
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part8
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part8"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part8"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part8
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part8
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part8"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part8"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part8
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 3:8
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part8
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part9"
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part9
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part9"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part9"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part9
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part9
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part9"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part9"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part9
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 3:9
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part9
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus1/target1/lun0/disc"
<22> pv_read -- CALLED with /dev/ide/host0/bus1/target1/lun0/disc
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/disc"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/disc"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus1/target1/lun0/disc
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus1/target1/lun0/disc
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/disc"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/disc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/ide/host0/bus1/target1/lun0/disc
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 22:64
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus1/target1/lun0/disc
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<22> pv_read -- LEAVING with ret: 0
<22> pv_get_size -- CALLED with /dev/ide/host0/bus1/target1/lun0/disc and 0xbfffef4c
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 12
<333> lvm_dir_cache_find -- CALLED
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/disc"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/disc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> lvm_dir_cache_find -- LEAVING
<333> lvm_check_partitioned_dev -- CALLED
<333> lvm_check_partitioned_dev -- LEAVING
<333> lvm_partition_count -- CALLED
<333> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_dev_size -- CALLED with /dev/ide/host0/bus1/target1/lun0/disc and 0xbfffef4c
<333> pv_get_dev_size -- LEAVING with ret: 1667232
<22> pv_get_size -- LEAVING with ret: 1667232
<22> pv_check_volume -- CALLED  dev_name: "/dev/ide/host0/bus1/target1/lun0/disc"  pv: 804E240
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/disc"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/disc"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_check_new -- CALLED
<333> pv_check_new -- LEAVING with ret: 1
<22> pv_check_volume -- LEAVING with ret: 1
<1> pv_read_all_pv: allocating for /dev/ide/host0/bus1/target1/lun0/disc 
<1> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus1/target1/lun0/part1"
<22> pv_read -- CALLED with /dev/ide/host0/bus1/target1/lun0/part1
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/part1"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/part1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus1/target1/lun0/part1
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus1/target1/lun0/part1
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/part1"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/part1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/ide/host0/bus1/target1/lun0/part1
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 22:65
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus1/target1/lun0/part1
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<22> pv_read -- LEAVING with ret: 0
<22> pv_get_size -- CALLED with /dev/ide/host0/bus1/target1/lun0/part1 and 0xbfffef4c
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 12
<333> lvm_dir_cache_find -- CALLED
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/part1"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/part1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> lvm_dir_cache_find -- LEAVING
<333> lvm_check_partitioned_dev -- CALLED
<333> lvm_check_partitioned_dev -- LEAVING
<333> lvm_partition_count -- CALLED
<333> lvm_partition_count -- LEAVING with ret: 16
<22> pv_get_size -- BEFORE llseek 0:0
<22> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 391041
<22> pv_get_size -- first == 1
<22> pv_get_size -- part_i == part_i_tmp
<22> pv_get_size -- LEAVING with ret: 391041
<22> pv_check_volume -- CALLED  dev_name: "/dev/ide/host0/bus1/target1/lun0/part1"  pv: 804E850
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/part1"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/part1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_check_new -- CALLED
<333> pv_check_new -- LEAVING with ret: 1
<22> pv_check_volume -- LEAVING with ret: 1
<1> pv_read_all_pv: allocating for /dev/ide/host0/bus1/target1/lun0/part1 
<1> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus1/target1/lun0/part2"
<22> pv_read -- CALLED with /dev/ide/host0/bus1/target1/lun0/part2
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/part2"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/part2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus1/target1/lun0/part2
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus1/target1/lun0/part2
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/part2"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/part2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/ide/host0/bus1/target1/lun0/part2
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 22:66
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus1/target1/lun0/part2
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<22> pv_read -- LEAVING with ret: 0
<22> pv_get_size -- CALLED with /dev/ide/host0/bus1/target1/lun0/part2 and 0xbfffef4c
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 12
<333> lvm_dir_cache_find -- CALLED
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/part2"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/part2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> lvm_dir_cache_find -- LEAVING
<333> lvm_check_partitioned_dev -- CALLED
<333> lvm_check_partitioned_dev -- LEAVING
<333> lvm_partition_count -- CALLED
<333> lvm_partition_count -- LEAVING with ret: 16
<22> pv_get_size -- BEFORE llseek 0:0
<22> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 391041
<22> pv_get_size -- first == 1
<22> pv_get_size -- part[1].sys_ind: 8E  part[1].nr_sects: 391104
<22> pv_get_size -- first == 1
<22> pv_get_size -- part_i == part_i_tmp
<22> pv_get_size -- LEAVING with ret: 391104
<22> pv_check_volume -- CALLED  dev_name: "/dev/ide/host0/bus1/target1/lun0/part2"  pv: 804F468
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/part2"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/part2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_check_new -- CALLED
<333> pv_check_new -- LEAVING with ret: 1
<22> pv_check_volume -- LEAVING with ret: 1
<1> pv_read_all_pv: allocating for /dev/ide/host0/bus1/target1/lun0/part2 
<1> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus1/target1/lun0/part3"
<22> pv_read -- CALLED with /dev/ide/host0/bus1/target1/lun0/part3
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/part3"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/part3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus1/target1/lun0/part3
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus1/target1/lun0/part3
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/part3"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/part3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/ide/host0/bus1/target1/lun0/part3
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 22:67
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus1/target1/lun0/part3
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<22> pv_read -- LEAVING with ret: 0
<22> pv_get_size -- CALLED with /dev/ide/host0/bus1/target1/lun0/part3 and 0xbfffef4c
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 12
<333> lvm_dir_cache_find -- CALLED
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/part3"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/part3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> lvm_dir_cache_find -- LEAVING
<333> lvm_check_partitioned_dev -- CALLED
<333> lvm_check_partitioned_dev -- LEAVING
<333> lvm_partition_count -- CALLED
<333> lvm_partition_count -- LEAVING with ret: 16
<22> pv_get_size -- BEFORE llseek 0:0
<22> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 391041
<22> pv_get_size -- first == 1
<22> pv_get_size -- part[1].sys_ind: 8E  part[1].nr_sects: 391104
<22> pv_get_size -- first == 1
<22> pv_get_size -- part[2].sys_ind: 8E  part[2].nr_sects: 885024
<22> pv_get_size -- first == 1
<22> pv_get_size -- part_i == part_i_tmp
<22> pv_get_size -- LEAVING with ret: 885024
<22> pv_check_volume -- CALLED  dev_name: "/dev/ide/host0/bus1/target1/lun0/part3"  pv: 804EEE0
<333> pv_check_name -- CALLED with "/dev/ide/host0/bus1/target1/lun0/part3"
<4444> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus1/target1/lun0/part3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_check_new -- CALLED
<333> pv_check_new -- LEAVING with ret: 1
<22> pv_check_volume -- LEAVING with ret: 1
<1> pv_read_all_pv: allocating for /dev/ide/host0/bus1/target1/lun0/part3 
<1> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 4
<1> pv_read_all_pv -- LEAVING with ret: 0
<1> pv_check_name -- CALLED with "/dev/hdd1"
<22> lvm_check_chars -- CALLED with name: "/dev/hdd1"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<22> lvm_check_dev -- LEAVING with ret: 1
<1> pv_check_name -- LEAVING with ret: 0
<1> pv_check_name -- CALLED with "/dev/hdd2"
<22> lvm_check_chars -- CALLED with name: "/dev/hdd2"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<22> lvm_check_dev -- LEAVING with ret: 1
<1> pv_check_name -- LEAVING with ret: 0
<1> pv_check_name -- CALLED with "/dev/hdd3"
<22> lvm_check_chars -- CALLED with name: "/dev/hdd3"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<22> lvm_check_dev -- LEAVING with ret: 1
<1> pv_check_name -- LEAVING with ret: 0
vgcreate -- no valid physical volumes in command line

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0

> Warning: if you create a VG containing PVs in multiple partitions of the
>          same disk, you will likely run into trouble if you want to
>          test striped LVs.
What kind of trouble?

> Heinz    -- The LVM Guy --

-- 
Arkadiusz Mi�kiewicz, AM2-6BONE    [ PLD GNU/Linux IPv6 ]
http://www.t17.ds.pwr.wroc.pl/~misiek/ipv6/   [ enabled ]
