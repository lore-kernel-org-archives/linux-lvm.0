From: Fabiano Fantini Vitale <ffv@conectiva.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20011105142032.3919438C40@perninha.conectiva.com.br>
Subject: [linux-lvm] trying to pvcreate
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
Date: Mon Nov  5 09:12:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

when I  try to perform a pvcreate a segmentation fault error 
occur. I'm using kernel 2.4.12-BOOT, iop10 and lvm-1.0.1
thanks for any help

/* logs */
pvcreate /dev/hda3

<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> pv_check_name -- CALLED with "/dev/hda3"
<22> lvm_check_chars -- CALLED with name: "/dev/hda3"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<333> lvm_check_partitioned_dev -- CALLED
<4444> lvm_get_device_type called
<4444> lvm_get_device_type leaving with 0
<333> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<22> lvm_check_dev -- LEAVING with ret: 1
<1> pv_check_name -- LEAVING with ret: 0
<1> pv_get_size -- CALLED with /dev/hda3 and 0xbffffa48
<22> lvm_dir_cache -- CALLED
<333> lvm_add_dir_cache -- CALLED with /dev/hda
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hda1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hda2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hda2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_dir_cache -- LEAVING with ret: 3
<22> lvm_dir_cache_find -- CALLED with /dev/hda3
<333> pv_check_name -- CALLED with "/dev/hda3"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 3
<22> lvm_dir_cache_find -- LEAVING with entry: -1
<22> pv_get_dev_size -- CALLED with /dev/hda3 and 0xbffffa48
<22> pv_get_dev_size -- LEAVING with ret: 0
<1> pv_get_size -- LEAVING with ret: 0
<1> pv_create_kdev_t -- CALLED with "/dev/hda3"
<22> pv_check_name -- CALLED with "/dev/hda3"
<333> lvm_check_chars -- CALLED with name: "/dev/hda3"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<1> pv_create_kdev_t -- LEAVING with ret: 303
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 0
<1> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<1> lvm_partition_count -- CALLED for 0x303
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 0
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_dir_cache -- CALLED
<1> lvm_dir_cache -- LEAVING with ret: 3
<1> pv_read -- CALLED with /dev/hda3
<22> pv_check_name -- CALLED with "/dev/hda3"
<333> lvm_check_chars -- CALLED with name: "/dev/hda3"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<22> pv_read_already_red -- CALLED with PV /dev/hda3
<22> pv_read_already_red -- LEAVING with ret: 0
<22> pv_flush -- CALLED to flush /dev/hda3
<333> pv_check_name -- CALLED with "/dev/hda3"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_flush -- LEAVING with ret: 0
<1> pv_read -- going to read /dev/hda3
<1> pv_read -- LEAVING with ret: -282
<1> pv_check_active -- CALLED
Segmentation Fault
