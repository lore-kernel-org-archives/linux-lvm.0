Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i931kYr21267
	for <linux-lvm@redhat.com>; Sat, 2 Oct 2004 21:46:34 -0400
Received: from smtp.newipnet.com (5.Red-80-32-157.pooles.rima-tde.net
	[80.32.157.5])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i931kOQN028754
	for <linux-lvm@redhat.com>; Sat, 2 Oct 2004 21:46:25 -0400
Received: from smtp.newipnet.com (localhost [127.0.0.1])
	by smtp.newipnet.com (ESMTP Server) with ESMTP id 32D2C20574
	for <linux-lvm@redhat.com>; Sun,  3 Oct 2004 03:45:39 +0200 (CEST)
Received: from madre (madre.newipnet.com [192.168.128.4])
	by smtp.newipnet.com (ESMTP Server) with ESMTP
	for <linux-lvm@redhat.com>; Sun,  3 Oct 2004 03:45:38 +0200 (CEST)
Message-ID: <200410030345180850.F0397E42@192.168.128.16>
Date: Sun, 03 Oct 2004 03:45:18 +0200
From: "Carlos Velasco" <lvm@newipnet.com>
Subject: [linux-lvm] LVM1: ERROR "parameter error" creating physical volume
 "(null)"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I get this error when I try to create a physical volume of entire disk with
kernel 2.4.27 patched with 1.0.8 LVM1:
ERROR "parameter error" creating physical volume "(null)"

> pvcreate -d /dev/hdc      
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> pv_check_name -- CALLED with "/dev/hdc"
<22> lvm_check_chars -- CALLED with name: "/dev/hdc"
<22> lvm_check_chars -- LEAVING with ret: 0
<1> pv_check_name -- LEAVING with ret: 0
<1> pv_get_size -- CALLED with /dev/hdc and 0xbffff460
<22> lvm_dir_cache -- CALLED
<333> lvm_add_dir_cache -- CALLED with /dev/hdc
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
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
<333> lvm_add_dir_cache -- CALLED with /dev/loop0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop10
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop11
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop12
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop13
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop14
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop15
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop3
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop4
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop5
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop6
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop7
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop8
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop9
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb10
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb11
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb12
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb13
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb14
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb15
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb3
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb4
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb5
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb6
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb7
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb8
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/nb9
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with -1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_dir_cache -- LEAVING with ret: 4
<22> lvm_dir_cache_find -- CALLED with /dev/hdc
<333> pv_check_name -- CALLED with "/dev/hdc"
<4444> lvm_check_chars -- CALLED with name: "/dev/hdc"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 4
<22> lvm_dir_cache_find -- LEAVING with entry: 0
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 0
<22> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<22> lvm_partition_count -- CALLED for 0x1600
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 0
<22> lvm_partition_count -- LEAVING with ret: 64
<22> _pv_get_dev_size -- CALLED with /dev/hdc and 0xbffff460
<333> pv_create_kdev_t -- CALLED with "/dev/hdc"
<4444> pv_check_name -- CALLED with "/dev/hdc"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_create_kdev_t -- LEAVING with ret: 1600
<333> lvm_check_partitioned_dev -- CALLED
<4444> lvm_get_device_type called
<4444> lvm_get_device_type leaving with 0
<333> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_whole_disk_dev -- CALLED
<4444> lvm_partition_count -- CALLED for 0x1600
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_partition_count -- LEAVING with ret: 64
<333> lvm_check_whole_disk_dev -- LEAVING with ret: TRUE
<22> _pv_get_dev_size -- LEAVING with ret: 234441648
<1> pv_get_size -- LEAVING with ret: 234441648
<1> pv_create_kdev_t -- CALLED with "/dev/hdc"
<22> pv_check_name -- CALLED with "/dev/hdc"
<333> lvm_check_chars -- CALLED with name: "/dev/hdc"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> pv_check_name -- LEAVING with ret: 0
<1> pv_create_kdev_t -- LEAVING with ret: 1600
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 0
<1> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<1> lvm_partition_count -- CALLED for 0x1600
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 0
<1> lvm_partition_count -- LEAVING with ret: 64
<1> lvm_dir_cache -- CALLED
<1> lvm_dir_cache -- LEAVING with ret: 4
<1> pv_read -- CALLED with /dev/hdc
<22> pv_check_name -- CALLED with "/dev/hdc"
<333> lvm_check_chars -- CALLED with name: "/dev/hdc"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> pv_check_name -- LEAVING with ret: 0
<1> pv_read -- going to read /dev/hdc
<22> lvm_check_dev -- CALLED
<333> lvm_check_partitioned_dev -- CALLED
<4444> lvm_get_device_type called
<4444> lvm_get_device_type leaving with 0
<333> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<22> lvm_check_dev -- LEAVING with ret: 1
<22> pv_copy_from_disk -- CALLED
<22> pv_copy_from_disk -- LEAVING ret = 0x804c688
<22> pv_create_name_from_kdev_t -- CALLED with 22:0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 4
<22> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc
<1> pv_read -- LEAVING with ret: -268
<1> pv_check_active -- CALLED
<22> pv_status -- CALLED with VG , PV: "/dev/hdc"
<333> vg_check_name -- CALLED with VG: 
<4444> lvm_check_chars -- CALLED with name: ""
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> pv_check_name -- CALLED with "/dev/hdc"
<4444> lvm_check_chars -- CALLED with name: "/dev/hdc"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_status -- LEAVING with ret: -296
<1> pv_check_active -- LEAVING with ret: -296
<1> lvm_tab_vg_check_exist -- CALLED with vg_name: ""
<22> vg_check_name -- CALLED with VG: 
<333> lvm_check_chars -- CALLED with name: ""
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> lvm_tab_read -- CALLED
<22> lvm_tab_read -- LEAVING with ret: 0  data: 804BCE0  size: 1
<1> lvm_tab_vg_check_exist -- LEAVING with ret: 0
<1> pv_setup_for_create -- CALLED for DEV /dev/hdc, size 234441648
<22> pv_check_name -- CALLED with "/dev/hdc"
<333> lvm_check_chars -- CALLED with name: "/dev/hdc"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> pv_check_name -- LEAVING with ret: 0
<22> system_id_set -- CALLED
<22> system_id_set -- LEAVING with ret: 0
<22> pv_create_kdev_t -- CALLED with "/dev/hdc"
<333> pv_check_name -- CALLED with "/dev/hdc"
<4444> lvm_check_chars -- CALLED with name: "/dev/hdc"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_create_kdev_t -- LEAVING with ret: 1600
<22> lvm_create_uuid -- CALLED
<22> lvm_create_uuid -- LEAVING with uuidstr:
"W6gLd8-Y0Wc-ovt3-5quL-UKA4-r3AI-6RuTxP"
<1> pv_setup_for_create -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_dont_interrupt -- LEAVING
<1> pv_write -- CALLED with (null) BFFFF470
<1> pv_write -- LEAVING with ret: -99
<1> lvm_error -- CALLED with: -99
<1> lvm_error -- LEAVING with: "parameter error"
 -- ERROR "parameter error" creating physical volume "(null)"


> fdisk -l /dev/hdc

Disk /dev/hdc: 120.0 GB, 120034123776 bytes
255 heads, 63 sectors/track, 14593 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot    Start       End    Blocks   Id  System


> uname -a
Linux hyperion 2.4.27 #1 SMP Sun Oct 3 01:28:38 CEST 2004 i686 Intel(R)
Pentium(R) 4 CPU 2.00GHz GenuineIntel GNU/Linux


Any help would be apreciated.

Regards,
Carlos Velasco
