Message-ID: <3C05EC29.B7D04B94@entory.com>
From: Bernhard Erdmann <bernhard.erdmann@entory.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------091ACFF212094831B8867AE7"
Subject: [linux-lvm] vgscan -- only found 696 of 1250 LEs for LV /dev/vg1/rawhide (2)
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
Date: Thu Nov 29 02:03:02 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.
--------------091ACFF212094831B8867AE7
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

please help...

After some pvmove and reboot, vgscan fails activating the volume group
and reports 

vgscan -- only found 696 of 1250 LEs for LV /dev/vg1/rawhide (2)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "vg1" from physical volume(s)

The VG can't be activated.

The system has linux-2.4.14-xfs patched with lvm-1.0.1rc4. The output of
"vgscan -d -ay" is attached.
--------------091ACFF212094831B8867AE7
Content-Type: text/plain; charset=us-ascii;
 name="vgscan.out.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="vgscan.out.txt"

<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_dont_interrupt -- LEAVING
<1> lvm_remove_recursive -- CALLED with dir: /etc/lvmtab.d
<1> lvm_remove_recursive -- LEAVING with ret: 0
<1> lvm_tab_create -- CALLED
<22> lvm_tab_write -- CALLED
<22> lvm_tab_write -- LEAVING with ret: 0
<1> lvm_tab_create -- LEAVING with ret: 0
<1> vg_check_exist_all_vg -- CALLED
<22> pv_read_all_pv -- CALLED
<22> pv_read_all_pv -- calling lvm_dir_cache
<333> lvm_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- CALLED with /dev/sda
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/sda1
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/sda2
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/sda3
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/sdb
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/sdb1
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/sdc
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/sdc1
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/sdd
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/sdd1
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/sdd2
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/hdc
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/hdc1
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/hda
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/hda1
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/hda2
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/hda3
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/hda4
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/hdb
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/hdb1
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/hdb2
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/hdb3
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/hdb4
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/hdb4
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_dir_cache -- LEAVING with ret: 23
<22> pv_read_all_pv -- calling stat with "/dev/sda"
<333> pv_read -- CALLED with /dev/sda
<4444> pv_check_name -- CALLED with "/dev/sda"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/sda
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sda
<55555> pv_check_name -- CALLED with "/dev/sda"
<666666> lvm_check_chars -- CALLED with name: "/dev/sda"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sda
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804bd88
<4444> pv_create_name_from_kdev_t -- CALLED with 8:0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/sda1"
<333> pv_read -- CALLED with /dev/sda1
<4444> pv_check_name -- CALLED with "/dev/sda1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/sda1
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sda1
<55555> pv_check_name -- CALLED with "/dev/sda1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sda1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sda1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804c098
<4444> pv_create_name_from_kdev_t -- CALLED with 8:1
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda1
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/sda2"
<333> pv_read -- CALLED with /dev/sda2
<4444> pv_check_name -- CALLED with "/dev/sda2"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/sda2
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sda2
<55555> pv_check_name -- CALLED with "/dev/sda2"
<666666> lvm_check_chars -- CALLED with name: "/dev/sda2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sda2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804c428
<4444> pv_create_name_from_kdev_t -- CALLED with 8:2
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda2
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/sda3"
<333> pv_read -- CALLED with /dev/sda3
<4444> pv_check_name -- CALLED with "/dev/sda3"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/sda3
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sda3
<55555> pv_check_name -- CALLED with "/dev/sda3"
<666666> lvm_check_chars -- CALLED with name: "/dev/sda3"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sda3
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804c838
<4444> pv_create_name_from_kdev_t -- CALLED with 8:3
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda3
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/sda3 and 0xbffffcdc
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- CALLED with /dev/sda3
<55555> pv_check_name -- CALLED with "/dev/sda3"
<666666> lvm_check_chars -- CALLED with name: "/dev/sda3"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- LEAVING with entry: 3
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_partition_count -- CALLED for 0x803
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 1
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 411616
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 82  part[1].nr_sects: 1026048
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[2].sys_ind: 8E  part[2].nr_sects: 34404352
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 34404352
<333> pv_check_volume -- CALLED  dev_name: "/dev/sda3"  pv: 804C838
<4444> pv_check_name -- CALLED with "/dev/sda3"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: vg1
<55555> lvm_check_chars -- CALLED with name: "vg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/sda3 vg1
<22> pv_read_all_pv -- calling stat with "/dev/sdb"
<333> pv_read -- CALLED with /dev/sdb
<4444> pv_check_name -- CALLED with "/dev/sdb"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdb"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/sdb
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sdb
<55555> pv_check_name -- CALLED with "/dev/sdb"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdb"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sdb
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804c630
<4444> pv_create_name_from_kdev_t -- CALLED with 8:16
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdb
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/sdb1"
<333> pv_read -- CALLED with /dev/sdb1
<4444> pv_check_name -- CALLED with "/dev/sdb1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/sdb1
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sdb1
<55555> pv_check_name -- CALLED with "/dev/sdb1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sdb1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804cf50
<4444> pv_create_name_from_kdev_t -- CALLED with 8:17
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdb1
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/sdb1 and 0xbffffcdc
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- CALLED with /dev/sdb1
<55555> pv_check_name -- CALLED with "/dev/sdb1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- LEAVING with entry: 5
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_partition_count -- CALLED for 0x811
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 1
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 35842016
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 35842016
<333> pv_check_volume -- CALLED  dev_name: "/dev/sdb1"  pv: 804CF50
<4444> pv_check_name -- CALLED with "/dev/sdb1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: vg1
<55555> lvm_check_chars -- CALLED with name: "vg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/sdb1 vg1
<22> pv_read_all_pv -- calling stat with "/dev/sdc"
<333> pv_read -- CALLED with /dev/sdc
<4444> pv_check_name -- CALLED with "/dev/sdc"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/sdc
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sdc
<55555> pv_check_name -- CALLED with "/dev/sdc"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdc"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sdc
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804cc48
<4444> pv_create_name_from_kdev_t -- CALLED with 8:32
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdc
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/sdc1"
<333> pv_read -- CALLED with /dev/sdc1
<4444> pv_check_name -- CALLED with "/dev/sdc1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdc1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/sdc1
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sdc1
<55555> pv_check_name -- CALLED with "/dev/sdc1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdc1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sdc1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804d768
<4444> pv_create_name_from_kdev_t -- CALLED with 8:33
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdc1
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/sdc1 and 0xbffffcdc
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- CALLED with /dev/sdc1
<55555> pv_check_name -- CALLED with "/dev/sdc1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdc1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- LEAVING with entry: 7
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_partition_count -- CALLED for 0x821
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 1
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 35842016
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 35842016
<333> pv_check_volume -- CALLED  dev_name: "/dev/sdc1"  pv: 804D768
<4444> pv_check_name -- CALLED with "/dev/sdc1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdc1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: vg1
<55555> lvm_check_chars -- CALLED with name: "vg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/sdc1 vg1
<22> pv_read_all_pv -- calling stat with "/dev/sdd"
<333> pv_read -- CALLED with /dev/sdd
<4444> pv_check_name -- CALLED with "/dev/sdd"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdd"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/sdd
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sdd
<55555> pv_check_name -- CALLED with "/dev/sdd"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdd"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sdd
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804d360
<4444> pv_create_name_from_kdev_t -- CALLED with 8:48
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdd
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/sdd1"
<333> pv_read -- CALLED with /dev/sdd1
<4444> pv_check_name -- CALLED with "/dev/sdd1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdd1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/sdd1
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sdd1
<55555> pv_check_name -- CALLED with "/dev/sdd1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdd1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sdd1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804e080
<4444> pv_create_name_from_kdev_t -- CALLED with 8:49
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdd1
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/sdd2"
<333> pv_read -- CALLED with /dev/sdd2
<4444> pv_check_name -- CALLED with "/dev/sdd2"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdd2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/sdd2
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sdd2
<55555> pv_check_name -- CALLED with "/dev/sdd2"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdd2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sdd2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804db78
<4444> pv_create_name_from_kdev_t -- CALLED with 8:50
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdd2
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/sdd2 and 0xbffffcdc
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- CALLED with /dev/sdd2
<55555> pv_check_name -- CALLED with "/dev/sdd2"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdd2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- LEAVING with entry: 10
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_partition_count -- CALLED for 0x832
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 1
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 411616
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 8E  part[1].nr_sects: 35430400
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 35430400
<333> pv_check_volume -- CALLED  dev_name: "/dev/sdd2"  pv: 804DB78
<4444> pv_check_name -- CALLED with "/dev/sdd2"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdd2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: vg1
<55555> lvm_check_chars -- CALLED with name: "vg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/sdd2 vg1
<22> pv_read_all_pv -- calling stat with "/dev/hdc"
<333> pv_read -- CALLED with /dev/hdc
<4444> pv_check_name -- CALLED with "/dev/hdc"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hdc
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdc
<55555> pv_check_name -- CALLED with "/dev/hdc"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdc"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdc
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804e890
<4444> pv_create_name_from_kdev_t -- CALLED with 22:0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/hdc and 0xbffffcdc
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- CALLED with /dev/hdc
<55555> pv_check_name -- CALLED with "/dev/hdc"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdc"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- LEAVING with entry: 11
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_partition_count -- CALLED for 0x1600
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_partition_count -- LEAVING with ret: 16
<4444> pv_get_dev_size -- CALLED with /dev/hdc and 0xbffffcdc
<4444> pv_get_dev_size -- LEAVING with ret: 44150400
<333> pv_get_size -- LEAVING with ret: 44150400
<333> pv_check_volume -- CALLED  dev_name: "/dev/hdc"  pv: 804E890
<4444> pv_check_name -- CALLED with "/dev/hdc"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 1
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/hdc 
<22> pv_read_all_pv -- calling stat with "/dev/hdc1"
<333> pv_read -- CALLED with /dev/hdc1
<4444> pv_check_name -- CALLED with "/dev/hdc1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdc1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hdc1
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdc1
<55555> pv_check_name -- CALLED with "/dev/hdc1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdc1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdc1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804e288
<4444> pv_create_name_from_kdev_t -- CALLED with 22:1
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc1
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/hdc1 and 0xbffffcdc
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- CALLED with /dev/hdc1
<55555> pv_check_name -- CALLED with "/dev/hdc1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdc1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- LEAVING with entry: 12
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_partition_count -- CALLED for 0x1601
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 44146557
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 44146557
<333> pv_check_volume -- CALLED  dev_name: "/dev/hdc1"  pv: 804E288
<4444> pv_check_name -- CALLED with "/dev/hdc1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdc1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: vg1
<55555> lvm_check_chars -- CALLED with name: "vg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/hdc1 vg1
<22> pv_read_all_pv -- calling stat with "/dev/hda"
<333> pv_read -- CALLED with /dev/hda
<4444> pv_check_name -- CALLED with "/dev/hda"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hda
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hda
<55555> pv_check_name -- CALLED with "/dev/hda"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hda
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804f3a8
<4444> pv_create_name_from_kdev_t -- CALLED with 3:0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/hda1"
<333> pv_read -- CALLED with /dev/hda1
<4444> pv_check_name -- CALLED with "/dev/hda1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hda1
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hda1
<55555> pv_check_name -- CALLED with "/dev/hda1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hda1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804eca0
<4444> pv_create_name_from_kdev_t -- CALLED with 3:1
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda1
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/hda2"
<333> pv_read -- CALLED with /dev/hda2
<4444> pv_check_name -- CALLED with "/dev/hda2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hda2
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hda2
<55555> pv_check_name -- CALLED with "/dev/hda2"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hda2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804eea8
<4444> pv_create_name_from_kdev_t -- CALLED with 3:2
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda2
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/hda3"
<333> pv_read -- CALLED with /dev/hda3
<4444> pv_check_name -- CALLED with "/dev/hda3"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hda3
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hda3
<55555> pv_check_name -- CALLED with "/dev/hda3"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda3"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hda3
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804f0b0
<4444> pv_create_name_from_kdev_t -- CALLED with 3:3
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda3
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/hda4"
<333> pv_read -- CALLED with /dev/hda4
<4444> pv_check_name -- CALLED with "/dev/hda4"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda4"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hda4
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hda4
<55555> pv_check_name -- CALLED with "/dev/hda4"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda4"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hda4
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804feb8
<4444> pv_create_name_from_kdev_t -- CALLED with 3:4
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda4
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/hda4 and 0xbffffcdc
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- CALLED with /dev/hda4
<55555> pv_check_name -- CALLED with "/dev/hda4"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda4"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- LEAVING with entry: 17
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_partition_count -- CALLED for 0x304
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 32067
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 83  part[1].nr_sects: 32130
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[2].sys_ind: 83  part[2].nr_sects: 514080
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[3].sys_ind: 8E  part[3].nr_sects: 39503835
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 39503835
<333> pv_check_volume -- CALLED  dev_name: "/dev/hda4"  pv: 804FEB8
<4444> pv_check_name -- CALLED with "/dev/hda4"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda4"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: vg1
<55555> lvm_check_chars -- CALLED with name: "vg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/hda4 vg1
<22> pv_read_all_pv -- calling stat with "/dev/hdb"
<333> pv_read -- CALLED with /dev/hdb
<4444> pv_check_name -- CALLED with "/dev/hdb"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdb"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hdb
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdb
<55555> pv_check_name -- CALLED with "/dev/hdb"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdb"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdb
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804f5b0
<4444> pv_create_name_from_kdev_t -- CALLED with 3:64
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdb
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/hdb1"
<333> pv_read -- CALLED with /dev/hdb1
<4444> pv_check_name -- CALLED with "/dev/hdb1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdb1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hdb1
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdb1
<55555> pv_check_name -- CALLED with "/dev/hdb1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdb1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdb1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804f7b8
<4444> pv_create_name_from_kdev_t -- CALLED with 3:65
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdb1
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/hdb2"
<333> pv_read -- CALLED with /dev/hdb2
<4444> pv_check_name -- CALLED with "/dev/hdb2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdb2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hdb2
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdb2
<55555> pv_check_name -- CALLED with "/dev/hdb2"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdb2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdb2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804f9c0
<4444> pv_create_name_from_kdev_t -- CALLED with 3:66
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdb2
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/hdb3"
<333> pv_read -- CALLED with /dev/hdb3
<4444> pv_check_name -- CALLED with "/dev/hdb3"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdb3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hdb3
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdb3
<55555> pv_check_name -- CALLED with "/dev/hdb3"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdb3"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdb3
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x804fbc8
<4444> pv_create_name_from_kdev_t -- CALLED with 3:67
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdb3
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/hdb4"
<333> pv_read -- CALLED with /dev/hdb4
<4444> pv_check_name -- CALLED with "/dev/hdb4"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdb4"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hdb4
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdb4
<55555> pv_check_name -- CALLED with "/dev/hdb4"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdb4"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdb4
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret = 0x8050e50
<4444> pv_create_name_from_kdev_t -- CALLED with 3:68
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdb4
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/hdb4 and 0xbffffcdc
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- CALLED with /dev/hdb4
<55555> pv_check_name -- CALLED with "/dev/hdb4"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdb4"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 23
<4444> lvm_dir_cache_find -- LEAVING with entry: 22
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_partition_count -- CALLED for 0x344
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: 82  part[0].nr_sects: 626472
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 83  part[1].nr_sects: 32130
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[2].sys_ind: 83  part[2].nr_sects: 417690
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[3].sys_ind: 8E  part[3].nr_sects: 88984035
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 88984035
<333> pv_check_volume -- CALLED  dev_name: "/dev/hdb4"  pv: 8050E50
<4444> pv_check_name -- CALLED with "/dev/hdb4"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdb4"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: vg1
<55555> lvm_check_chars -- CALLED with name: "vg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/hdb4 vg1
<22> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 8
<22> pv_read_all_pv -- LEAVING with ret: 0
<1> vg_check_exist_all_vg -- checking vg_name: vg1[0/0]
<1> vg_check_exist_all_vg -- before vg_check_exist ( vg1)
<22> vg_check_exist -- CALLED with VG: vg1
<333> vg_check_name -- CALLED with VG: vg1
<4444> lvm_check_chars -- CALLED with name: "vg1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_check_exist -- before pv_read_all_pv_of_vg
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "vg1"
<4444> vg_check_name -- CALLED with VG: vg1
<55555> lvm_check_chars -- CALLED with name: "vg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv -- CALLED
<4444> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
<4444> pv_read_all_pv -- LEAVING with ret: 0
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED with "/dev/sda3"
<666666> lvm_check_chars -- CALLED with name: "/dev/sda3"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: vg1
<666666> lvm_check_chars -- CALLED with name: "vg1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_read_uuidlist -- CALLED with /dev/sda3
<55555> lvm_check_uuid -- CALLED with uuidstr: "2sb7f54sa8MDWa7CUR2qY1UVG97VZloZ"
<55555> lvm_check_uuid -- LEAVING with ret: 0
<55555> lvm_check_uuid -- CALLED with uuidstr: "NGJNxhzR6z0h5PT1xWv784WsH3SmW9wy"
<55555> lvm_check_uuid -- LEAVING with ret: 0
<55555> lvm_check_uuid -- CALLED with uuidstr: "HMv1Ape7cAnsr2JhbTEEAikhvA5LZZfI"
<55555> lvm_check_uuid -- LEAVING with ret: 0
<55555> lvm_check_uuid -- CALLED with uuidstr: "VOqcchecruCXIjGf3HEhiXI6FlzCr6b5"
<55555> lvm_check_uuid -- LEAVING with ret: 0
<55555> lvm_check_uuid -- CALLED with uuidstr: "nPQQ9KvazbUa3XjH76jAoSTcUjpUoUZE"
<55555> lvm_check_uuid -- LEAVING with ret: 0
<55555> lvm_check_uuid -- CALLED with uuidstr: "7fdIlmDPCtZAyFtCPSXiPnMpbu6waYOj"
<55555> lvm_check_uuid -- LEAVING with ret: 0
<55555> lvm_check_uuid -- CALLED with uuidstr: "L9yEIP3TwIGodAk3POHgjArJwuJv0WmU"
<55555> lvm_check_uuid -- LEAVING with ret: 0
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<4444> pv_read_uuidlist -- LEAVING with ret: 7
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
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> vg_read -- CALLED
<4444> vg_check_name -- CALLED with VG: vg1
<55555> lvm_check_chars -- CALLED with name: "vg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- CALLED with vg_name: "vg1"
<55555> vg_check_name -- CALLED with VG: vg1
<666666> lvm_check_chars -- CALLED with name: "vg1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> vg_read -- pv[0]->pv_name: "/dev/hdc1"
<333> vg_read -- pv[1]->pv_name: "/dev/hda4"
<333> vg_read -- pv[2]->pv_name: "/dev/hdb4"
<333> vg_read -- pv[3]->pv_name: "/dev/sdb1"
<333> vg_read -- pv[4]->pv_name: "/dev/sdc1"
<333> vg_read -- pv[5]->pv_name: "/dev/sda3"
<333> vg_read -- pv[6]->pv_name: "/dev/sdd2"
<4444> vg_read_from_pv -- CALLED
<55555> pv_check_name -- CALLED with "/dev/hdc1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdc1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> pv_read -- CALLED with /dev/hdc1
<666666> pv_check_name -- CALLED with "/dev/hdc1"
<7777777> lvm_check_chars -- CALLED with name: "/dev/hdc1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<88888888> lvm_check_partitioned_dev -- CALLED
<999999999> lvm_get_device_type called
<999999999> lvm_get_device_type leaving with 0
<88888888> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> pv_read_already_red -- CALLED with PV /dev/hdc1
<666666> pv_read_already_red -- LEAVING with ret: 1
<55555> pv_read -- going to read /dev/hdc1
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_copy_from_disk -- CALLED
<666666> pv_copy_from_disk -- LEAVING ret = 0x8059268
<666666> pv_create_name_from_kdev_t -- CALLED with 22:1
<7777777> lvm_check_dev -- CALLED
<88888888> lvm_check_partitioned_dev -- CALLED
<999999999> lvm_get_device_type called
<999999999> lvm_get_device_type leaving with 0
<88888888> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache -- CALLED
<7777777> lvm_dir_cache -- LEAVING with ret: 23
<666666> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc1
<666666> system_id_check_exported -- CALLED
<666666> system_id_check_exported -- LEAVING with ret: 0
<55555> pv_read -- LEAVING with ret: 0
<55555> vg_copy_from_disk -- CALLED
<55555> vg_copy_from_disk -- LEAVING
<4444> vg_read_from_pv -- LEAVING with ret: 0
<333> vg_read -- LEAVING with ret: 0
<22> vg_check_exist -- before vg->pv_cur check with vg->pv_cur: 7  pv_count: 7
<22> vg_check_exist -- LEAVING with ret: 1
<1> vg_check_exist_all_vg -- HIT vg_name: vg1
<1> vg_check_exist_all_vg -- vg_name_ptr[0]: vg1
<1> vg_check_exist_all_vg -- checking vg_name: vg1[1/1]
<1> vg_check_exist_all_vg -- checking vg_name: vg1[2/1]
<1> vg_check_exist_all_vg -- checking vg_name: vg1[3/1]
<1> vg_check_exist_all_vg -- checking vg_name: vg1[5/1]
<1> vg_check_exist_all_vg -- checking vg_name: vg1[6/1]
<1> vg_check_exist_all_vg -- checking vg_name: vg1[7/1]
<1> vg_check_exist_all_vg -- LEAVING with 1 VGs
<1> vg_check_active -- CALLED with VG: vg1
<22> vg_check_name -- CALLED with VG: vg1
<333> lvm_check_chars -- CALLED with name: "vg1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- CALLED with VG: vg1
<333> vg_check_name -- CALLED with VG: vg1
<4444> lvm_check_chars -- CALLED with name: "vg1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- LEAVING with ret: -6
<1> vg_check_active -- LEAVING with ret: -6
<1> vg_check_active -- CALLED with VG: vg1
<22> vg_check_name -- CALLED with VG: vg1
<333> lvm_check_chars -- CALLED with name: "vg1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- CALLED with VG: vg1
<333> vg_check_name -- CALLED with VG: vg1
<4444> lvm_check_chars -- CALLED with name: "vg1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- LEAVING with ret: -6
<1> vg_check_active -- LEAVING with ret: -6
<1> vg_read_with_pv_and_lv -- CALLED
<22> vg_check_name -- CALLED with VG: vg1
<333> lvm_check_chars -- CALLED with name: "vg1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_read -- CALLED
<333> vg_check_name -- CALLED with VG: vg1
<4444> lvm_check_chars -- CALLED with name: "vg1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "vg1"
<4444> vg_check_name -- CALLED with VG: vg1
<55555> lvm_check_chars -- CALLED with name: "vg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<22> vg_read -- pv[0]->pv_name: "/dev/hdc1"
<22> vg_read -- pv[1]->pv_name: "/dev/hda4"
<22> vg_read -- pv[2]->pv_name: "/dev/hdb4"
<22> vg_read -- pv[3]->pv_name: "/dev/sdb1"
<22> vg_read -- pv[4]->pv_name: "/dev/sdc1"
<22> vg_read -- pv[5]->pv_name: "/dev/sda3"
<22> vg_read -- pv[6]->pv_name: "/dev/sdd2"
<333> vg_read_from_pv -- CALLED
<4444> pv_check_name -- CALLED with "/dev/hdc1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdc1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read -- CALLED with /dev/hdc1
<55555> pv_check_name -- CALLED with "/dev/hdc1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdc1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> pv_read_already_red -- CALLED with PV /dev/hdc1
<55555> pv_read_already_red -- LEAVING with ret: 1
<4444> pv_read -- going to read /dev/hdc1
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_copy_from_disk -- CALLED
<55555> pv_copy_from_disk -- LEAVING ret = 0x8059e28
<55555> pv_create_name_from_kdev_t -- CALLED with 22:1
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache -- CALLED
<666666> lvm_dir_cache -- LEAVING with ret: 23
<55555> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc1
<55555> system_id_check_exported -- CALLED
<55555> system_id_check_exported -- LEAVING with ret: 0
<4444> pv_read -- LEAVING with ret: 0
<4444> vg_copy_from_disk -- CALLED
<4444> vg_copy_from_disk -- LEAVING
<333> vg_read_from_pv -- LEAVING with ret: 0
<22> vg_read -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER vg_read;  vg_this->lv_cur: 26
<22> pv_read_all_pv_of_vg -- CALLED with vg_name: "vg1"
<333> vg_check_name -- CALLED with VG: vg1
<4444> lvm_check_chars -- CALLED with name: "vg1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER pv_read_all_pv_of_vg
<22> pv_read_all_pe_of_vg -- CALLED
<333> vg_check_name -- CALLED with VG: vg1
<4444> lvm_check_chars -- CALLED with name: "vg1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "vg1"
<4444> vg_check_name -- CALLED with VG: vg1
<55555> lvm_check_chars -- CALLED with name: "vg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- pv_count: 7
<333> pv_read_pe -- CALLED with /dev/hdc1 and 5388
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/hdc1 with 5388 PE at address 804B3C8
<333> pv_read_pe -- CALLED with /dev/hda4 and 4822
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/hda4 with 4822 PE at address 804B3CC
<333> pv_read_pe -- CALLED with /dev/hdb4 and 10862
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/hdb4 with 10862 PE at address 804B3D0
<333> pv_read_pe -- CALLED with /dev/sdb1 and 4374
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/sdb1 with 4374 PE at address 804B3D4
<333> pv_read_pe -- CALLED with /dev/sdc1 and 4374
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/sdc1 with 4374 PE at address 804B3D8
<333> pv_read_pe -- CALLED with /dev/sda3 and 4198
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/sda3 with 4198 PE at address 804B3DC
<333> pv_read_pe -- CALLED with /dev/sdd2 and 4323
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/sdd2 with 4323 PE at address 804B3E0
<333> pv_check_number -- CALLED
<333> pv_check_number -- LEAVING with ret: 6
<22> pv_read_all_pe_of_vg -- AFTER LOOP of pv_read_pe
<22> pv_read_all_pe_of_vg -- /dev/hdc1 with 5388 PE at 805FE20 for PV #0
<22> pv_read_all_pe_of_vg -- /dev/hda4 with 4822 PE at 8065258 for PV #1
<22> pv_read_all_pe_of_vg -- /dev/hdb4 with 10862 PE at 8074778 for PV #2
<22> pv_read_all_pe_of_vg -- /dev/sdb1 with 4374 PE at 8069DB8 for PV #3
<22> pv_read_all_pe_of_vg -- /dev/sdc1 with 4374 PE at 805A9E8 for PV #4
<22> pv_read_all_pe_of_vg -- /dev/sda3 with 4198 PE at 807F138 for PV #5
<22> pv_read_all_pe_of_vg -- /dev/sdd2 with 4323 PE at 80832D8 for PV #6
<22> pv_read_all_pe_of_vg -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER pv_read_all_pe_of_vg
<22> lv_read_all_lv -- CALLED
<333> vg_check_name -- CALLED with VG: vg1
<4444> lvm_check_chars -- CALLED with name: "vg1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_read -- CALLED
<4444> vg_check_name -- CALLED with VG: vg1
<55555> lvm_check_chars -- CALLED with name: "vg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- CALLED with vg_name: "vg1"
<55555> vg_check_name -- CALLED with VG: vg1
<666666> lvm_check_chars -- CALLED with name: "vg1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> vg_read -- pv[0]->pv_name: "/dev/hdc1"
<333> vg_read -- pv[1]->pv_name: "/dev/hda4"
<333> vg_read -- pv[2]->pv_name: "/dev/hdb4"
<333> vg_read -- pv[3]->pv_name: "/dev/sdb1"
<333> vg_read -- pv[4]->pv_name: "/dev/sdc1"
<333> vg_read -- pv[5]->pv_name: "/dev/sda3"
<333> vg_read -- pv[6]->pv_name: "/dev/sdd2"
<4444> vg_read_from_pv -- CALLED
<55555> pv_check_name -- CALLED with "/dev/hdc1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdc1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> pv_read -- CALLED with /dev/hdc1
<666666> pv_check_name -- CALLED with "/dev/hdc1"
<7777777> lvm_check_chars -- CALLED with name: "/dev/hdc1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<88888888> lvm_check_partitioned_dev -- CALLED
<999999999> lvm_get_device_type called
<999999999> lvm_get_device_type leaving with 0
<88888888> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> pv_read_already_red -- CALLED with PV /dev/hdc1
<666666> pv_read_already_red -- LEAVING with ret: 1
<55555> pv_read -- going to read /dev/hdc1
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_copy_from_disk -- CALLED
<666666> pv_copy_from_disk -- LEAVING ret = 0x805ee48
<666666> pv_create_name_from_kdev_t -- CALLED with 22:1
<7777777> lvm_check_dev -- CALLED
<88888888> lvm_check_partitioned_dev -- CALLED
<999999999> lvm_get_device_type called
<999999999> lvm_get_device_type leaving with 0
<88888888> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache -- CALLED
<7777777> lvm_dir_cache -- LEAVING with ret: 23
<666666> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc1
<666666> system_id_check_exported -- CALLED
<666666> system_id_check_exported -- LEAVING with ret: 0
<55555> pv_read -- LEAVING with ret: 0
<55555> vg_copy_from_disk -- CALLED
<55555> vg_copy_from_disk -- LEAVING
<4444> vg_read_from_pv -- LEAVING with ret: 0
<333> vg_read -- LEAVING with ret: 0
<22> lv_read_all_lv -- lv_max: 256
<22> lv_read_all_lv -- BEFORE pv_read_all_pv_of_vg
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "vg1"
<4444> vg_check_name -- CALLED with VG: vg1
<55555> lvm_check_chars -- CALLED with name: "vg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<22> lv_read_all_lv -- l: 256  nl: 26  vg_this->lv_cur: 26
<22> lv_read_all_lv -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER lv_read_all_lv; vg_this->pv_cur: 7  vg_this->pv_max: 256  ret: 0
<1> vg_read_with_pv_and_lv -- BEFORE for PE
<1> vg_read_with_pv_and_lv -- AFTER for PE
<1> vg_read_with_pv_and_lv -- BEFORE for LV
<1> vg_read_with_pv_and_lv -- vg_this->lv[0]->lv_allocated_le: 506
<1> vg_read_with_pv_and_lv -- vg_this->lv[1]->lv_allocated_le: 1375
<1> vg_read_with_pv_and_lv -- vg_this->lv[2]->lv_allocated_le: 1250
vgscan -- only found 696 of 1250 LEs for LV /dev/vg1/rawhide (2)
<1> vg_read_with_pv_and_lv -- LEAVING with ret: -365
<1> lvm_error -- CALLED with: -365
<1> lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): allocated LE of LV"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "vg1" from physical volume(s)
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
<1> lvm_error -- CALLED with: -365
<1> lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): allocated LE of LV"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "vg1"

--------------091ACFF212094831B8867AE7--
