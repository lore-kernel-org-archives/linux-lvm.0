Return-Path: <jbooth@ccbill.com>
Message-ID: <000701c0e486$66d59d80$5300000a@cavecreek.net>
From: "Justin Booth" <jbooth@ccbill.com>
References: <OF14217A96.084B4790-ON85256A56.00658579@raleigh.ibm.com> <007c01c0e483$46f0aa80$5300000a@cavecreek.net>
Subject: Re: [linux-lvm] Problem deleteing PV's
Date: Thu, 24 May 2001 12:19:06 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Here's an additional dump from my pvscan -d:


<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
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
<1> pv_read_all_pv -- calling stat with "/dev/sda"
<22> pv_read -- CALLED with /dev/sda
<333> pv_check_name -- CALLED with "/dev/sda"
<4444> lvm_check_chars -- CALLED with name: "/dev/sda"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/sda
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/sda
<4444> pv_check_name -- CALLED with "/dev/sda"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/sda
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 8:0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/sda1"
<22> pv_read -- CALLED with /dev/sda1
<333> pv_check_name -- CALLED with "/dev/sda1"
<4444> lvm_check_chars -- CALLED with name: "/dev/sda1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/sda1
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/sda1
<4444> pv_check_name -- CALLED with "/dev/sda1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/sda1
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 8:1
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda1
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/sda2"
<22> pv_read -- CALLED with /dev/sda2
<333> pv_check_name -- CALLED with "/dev/sda2"
<4444> lvm_check_chars -- CALLED with name: "/dev/sda2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/sda2
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/sda2
<4444> pv_check_name -- CALLED with "/dev/sda2"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/sda2
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 8:2
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda2
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/sda5"
<22> pv_read -- CALLED with /dev/sda5
<333> pv_check_name -- CALLED with "/dev/sda5"
<4444> lvm_check_chars -- CALLED with name: "/dev/sda5"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/sda5
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/sda5
<4444> pv_check_name -- CALLED with "/dev/sda5"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda5"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/sda5
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 8:5
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda5
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/sda6"
<22> pv_read -- CALLED with /dev/sda6
<333> pv_check_name -- CALLED with "/dev/sda6"
<4444> lvm_check_chars -- CALLED with name: "/dev/sda6"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/sda6
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/sda6
<4444> pv_check_name -- CALLED with "/dev/sda6"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda6"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/sda6
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 8:6
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda6
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/sda7"
<22> pv_read -- CALLED with /dev/sda7
<333> pv_check_name -- CALLED with "/dev/sda7"
<4444> lvm_check_chars -- CALLED with name: "/dev/sda7"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/sda7
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/sda7
<4444> pv_check_name -- CALLED with "/dev/sda7"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda7"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/sda7
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 8:7
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda7
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/sda8"
<22> pv_read -- CALLED with /dev/sda8
<333> pv_check_name -- CALLED with "/dev/sda8"
<4444> lvm_check_chars -- CALLED with name: "/dev/sda8"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/sda8
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/sda8
<4444> pv_check_name -- CALLED with "/dev/sda8"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda8"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/sda8
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 8:8
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda8
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/sda9"
<22> pv_read -- CALLED with /dev/sda9
<333> pv_check_name -- CALLED with "/dev/sda9"
<4444> lvm_check_chars -- CALLED with name: "/dev/sda9"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/sda9
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/sda9
<4444> pv_check_name -- CALLED with "/dev/sda9"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda9"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/sda9
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 8:9
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda9
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/sdb"
<22> pv_read -- CALLED with /dev/sdb
<333> pv_check_name -- CALLED with "/dev/sdb"
<4444> lvm_check_chars -- CALLED with name: "/dev/sdb"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/sdb
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/sdb
<4444> pv_check_name -- CALLED with "/dev/sdb"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdb"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/sdb
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 8:16
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdb
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/sdb1"
<22> pv_read -- CALLED with /dev/sdb1
<333> pv_check_name -- CALLED with "/dev/sdb1"
<4444> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/sdb1
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/sdb1
<4444> pv_check_name -- CALLED with "/dev/sdb1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/sdb1
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 8:17
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdb1
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/sdc"
<22> pv_read -- CALLED with /dev/sdc
<333> pv_check_name -- CALLED with "/dev/sdc"
<4444> lvm_check_chars -- CALLED with name: "/dev/sdc"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/sdc
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/sdc
<4444> pv_check_name -- CALLED with "/dev/sdc"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/sdc
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 8:32
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdc
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/sdc1"
<22> pv_read -- CALLED with /dev/sdc1
<333> pv_check_name -- CALLED with "/dev/sdc1"
<4444> lvm_check_chars -- CALLED with name: "/dev/sdc1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/sdc1
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/sdc1
<4444> pv_check_name -- CALLED with "/dev/sdc1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdc1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/sdc1
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 8:33
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdc1
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
<1> pv_read_all_pv -- LEAVING with ret: -268
<1> lvm_error -- CALLED with: -268
<1> lvm_error -- LEAVING with: "pv_read(): PV identifier invalid"
pvscan -- ERROR "pv_read(): PV identifier invalid" reading physical volumes

pvscan -- reading all physical volumes (this may take a while...)

----- Original Message -----
From: "Justin Booth" <jbooth@ccbill.com>
To: <linux-lvm@sistina.com>
Sent: Thursday, May 24, 2001 11:56 AM
Subject: Re: [linux-lvm] Problem deleteing PV's


>
> still getting that pv_read error (PV identifier invalid). I ran a
pvscan -d
> and it's exiting with a -268 from
>  pv_create_name_from_kdev_t -- LEAVEING with ret: -268
>
> Justin Booth
>
>  Thanks for all the help.
>
> ----- Original Message -----
> From: "Kevin M Corry" <corryk@us.ibm.com>
> To: <linux-lvm@sistina.com>
> Sent: Thursday, May 24, 2001 11:35 AM
> Subject: Re: [linux-lvm] Problem deleteing PV's
>
>
> > Well, the first thing I would try is increasing to "count=1000" or
10000.
> I
> > just did that on my machine with my test group. The VG TestGroup
contained
> > a single PV /dev/hdb1. I did "dd if=/dev/zero of=/dev/hdb1 bs=1k
> > count=10000",
> > then reran pvscan, and that PV was gone from the listing. Then I ran
> > vgscan,
> > and TestGroup was gone. Then it was just a matter of removing the
> directory
> > in /dev for that group. If increasing the count in dd doesn't work, I'm
> not
> > sure what else to suggest.
> >
> > -Kevin
> >
> >
> > > Tried doing the "dd if of bs count" stuff and now I'm recieving a
> > > pvscan -- ERROR "pv_reaad(): PV identifier invalid" reading physical
> > volumes
> > >
> > > any ideas ???
> > >
> > > Thanks,
> > >    Justin Both
> > >
> > > ----- Original Message -----
> > >
> > > Justin,
> > >
> > > Do you have any active volumes using any space on /dev/sdb or
/dev/sdc?
> > > (You said below that you are trying to get rid of those entries to
start
> > > over)? When you tried recreating the partition table for those disks,
> > > did you create everything with the same size/location? If so, then the
> > > LVM metadata will still be in the same place that pvscan and vgscan
> > > expect to find it. So, if you don't have any data on those disks to
> > > worry about, you should be able to just clear out the metadata
sectors.
> > >
> > > dd if=/dev/zero of=/dev/sdb1 bs=1k count=10
> > > dd if=/dev/zero of=/dev/sdc1 bs=1k count=10
> > > dd if=/dev/zero of=/dev/sdb bs=1k count=10
> > > dd if=/dev/zero of=/dev/sdc bs=1k count=10
> > >
> > > There are actually 240+ sectors of metadata at the beginning of each
> > > PV, but these commands should wipe away the information about the PVs
> > > and VGs. After this you should repartition the disks again, run
> > > pvcreate on the appropriate partitions, and run pvscan and vgscan.
> > >
> > > I hope I've understood your problem correctly. If you do in fact have
> > > data on those disks, and vgscan/pvscan isn't finding the volumes, then
> > > obviously don't run the above commands. :)
> > >
> > > Kevin
> > >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
