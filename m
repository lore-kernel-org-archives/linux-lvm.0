Message-ID: <20021212050105.25297.qmail@web40705.mail.yahoo.com>
From: udo <udovdh@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] vgcreate on md: vgcreate -- ERROR "pv_read(): read" reading physical volumes
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
Date: Wed Dec 11 23:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

LVM worked OK on my small machine so I wanted to
implement LVM for my /usr, /var and /home.
The box has 2 identical 20G IBM IDE disks and is
running 2.4.20 (LVM 1.05).
Partitions:

Disk /dev/hda: 255 heads, 63 sectors, 2501 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id 
System
/dev/hda1             1         3     24066   fd 
Linux raid autodetect
/dev/hda2             4      2501  20065185    5 
Extended
/dev/hda5             4        23    160618+  fd 
Linux raid autodetect
/dev/hda6            24      2450  19494846   fd 
Linux raid autodetect
/dev/hda7          2451      2465    120456   82 
Linux swap
/dev/hda8          2466      2501    289138+  83 
Linux

I have /boot on /dev/md0, / on /dev/md1 and want the
LVM on /dev/md2 (/dev/hda6 and /dev/hdc6) so I did
vgcreate vg00 /dev/md2 which gives:
vgcreate -- ERROR "pv_read(): read" reading physical
volumes

I couldn't find too much info about this problem in
connection with md. :-/

Please let me know how I can fix this.
The debug output is below:

<1> vg_check_name -- CALLED with VG: vg00
<22> lvm_check_chars -- CALLED with name: "vg00"
<22> lvm_check_chars -- LEAVING with ret: 0
<1> vg_check_name -- LEAVING with ret: 0
<1> vg_check_dir -- CALLED with VG: vg00
<22> vg_check_name -- CALLED with VG: vg00
<333> lvm_check_chars -- CALLED with name: "vg00"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<1> vg_check_dir -- vg_name: "vg00"
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
<1> lvm_tab_vg_check_exist -- CALLED with vg_name:
"vg00"
<22> vg_check_name -- CALLED with VG: vg00
<333> lvm_check_chars -- CALLED with name: "vg00"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> lvm_tab_read -- CALLED
<22> lvm_tab_read -- LEAVING with ret: 0  data:
804C1F8  size: 1
<1> lvm_tab_vg_check_exist -- LEAVING with ret: 0
<1> lvm_tab_vg_check_exist_all_vg -- CALLED
<22> lvm_tab_read -- CALLED
<22> lvm_tab_read -- LEAVING with ret: 0  data:
804C1F8  size: 1
<1> lvm_tab_vg_check_exist_all_vg -- LEAVING with ret:
0
<1> pv_read_all_pv -- CALLED
<1> pv_read_all_pv -- calling lvm_dir_cache
<22> lvm_dir_cache -- CALLED
<333> lvm_add_dir_cache -- CALLED with /dev/md0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 2
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/md1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 2
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/md2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 2
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hdc
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hdc1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hdc2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hdc5
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hdc6
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hdc7
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hdc8
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hda
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hda1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hda2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hda5
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hda6
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hda7
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hda8
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hda8
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop10
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop11
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop12
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop13
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop14
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop15
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop3
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop4
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop5
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop6
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop7
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop8
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop9
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_dir_cache -- LEAVING with ret: 25
<1> pv_read_all_pv -- calling stat with "/dev/md0"
<22> pv_read -- CALLED with /dev/md0
<333> pv_check_name -- CALLED with "/dev/md0"
<4444> lvm_check_chars -- CALLED with name: "/dev/md0"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/md0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 2
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804cc80
<333> pv_create_name_from_kdev_t -- CALLED with 9:0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 2
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/md0
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/md1"
<22> pv_read -- CALLED with /dev/md1
<333> pv_check_name -- CALLED with "/dev/md1"
<4444> lvm_check_chars -- CALLED with name: "/dev/md1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/md1
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 2
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804ce88
<333> pv_create_name_from_kdev_t -- CALLED with 9:1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 2
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/md1
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/md2"
<22> pv_read -- CALLED with /dev/md2
<333> pv_check_name -- CALLED with "/dev/md2"
<4444> lvm_check_chars -- CALLED with name: "/dev/md2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/md2
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 2
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804d090
<333> pv_create_name_from_kdev_t -- CALLED with 9:2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 2
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/md2
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hdc"
<22> pv_read -- CALLED with /dev/hdc
<333> pv_check_name -- CALLED with "/dev/hdc"
<4444> lvm_check_chars -- CALLED with name: "/dev/hdc"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hdc
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804d298
<333> pv_create_name_from_kdev_t -- CALLED with 22:0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hdc
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hdc1"
<22> pv_read -- CALLED with /dev/hdc1
<333> pv_check_name -- CALLED with "/dev/hdc1"
<4444> lvm_check_chars -- CALLED with name:
"/dev/hdc1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hdc1
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804d4a0
<333> pv_create_name_from_kdev_t -- CALLED with 22:1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hdc1
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hdc2"
<22> pv_read -- CALLED with /dev/hdc2
<333> pv_check_name -- CALLED with "/dev/hdc2"
<4444> lvm_check_chars -- CALLED with name:
"/dev/hdc2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hdc2
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804d6a8
<333> pv_create_name_from_kdev_t -- CALLED with 22:2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hdc2
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hdc5"
<22> pv_read -- CALLED with /dev/hdc5
<333> pv_check_name -- CALLED with "/dev/hdc5"
<4444> lvm_check_chars -- CALLED with name:
"/dev/hdc5"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hdc5
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804d8b0
<333> pv_create_name_from_kdev_t -- CALLED with 22:5
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hdc5
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hdc6"
<22> pv_read -- CALLED with /dev/hdc6
<333> pv_check_name -- CALLED with "/dev/hdc6"
<4444> lvm_check_chars -- CALLED with name:
"/dev/hdc6"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hdc6
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804dab8
<333> pv_create_name_from_kdev_t -- CALLED with 22:6
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hdc6
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hdc7"
<22> pv_read -- CALLED with /dev/hdc7
<333> pv_check_name -- CALLED with "/dev/hdc7"
<4444> lvm_check_chars -- CALLED with name:
"/dev/hdc7"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hdc7
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804dcc0
<333> pv_create_name_from_kdev_t -- CALLED with 22:7
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hdc7
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hdc8"
<22> pv_read -- CALLED with /dev/hdc8
<333> pv_check_name -- CALLED with "/dev/hdc8"
<4444> lvm_check_chars -- CALLED with name:
"/dev/hdc8"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hdc8
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804dec8
<333> pv_create_name_from_kdev_t -- CALLED with 22:8
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hdc8
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hda"
<22> pv_read -- CALLED with /dev/hda
<333> pv_check_name -- CALLED with "/dev/hda"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hda
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804e0d0
<333> pv_create_name_from_kdev_t -- CALLED with 3:0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hda
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hda1"
<22> pv_read -- CALLED with /dev/hda1
<333> pv_check_name -- CALLED with "/dev/hda1"
<4444> lvm_check_chars -- CALLED with name:
"/dev/hda1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hda1
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804e2d8
<333> pv_create_name_from_kdev_t -- CALLED with 3:1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hda1
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hda2"
<22> pv_read -- CALLED with /dev/hda2
<333> pv_check_name -- CALLED with "/dev/hda2"
<4444> lvm_check_chars -- CALLED with name:
"/dev/hda2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hda2
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804e4e0
<333> pv_create_name_from_kdev_t -- CALLED with 3:2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hda2
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hda5"
<22> pv_read -- CALLED with /dev/hda5
<333> pv_check_name -- CALLED with "/dev/hda5"
<4444> lvm_check_chars -- CALLED with name:
"/dev/hda5"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hda5
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804e6e8
<333> pv_create_name_from_kdev_t -- CALLED with 3:5
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hda5
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hda6"
<22> pv_read -- CALLED with /dev/hda6
<333> pv_check_name -- CALLED with "/dev/hda6"
<4444> lvm_check_chars -- CALLED with name:
"/dev/hda6"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hda6
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804e8f0
<333> pv_create_name_from_kdev_t -- CALLED with 3:6
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hda6
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hda7"
<22> pv_read -- CALLED with /dev/hda7
<333> pv_check_name -- CALLED with "/dev/hda7"
<4444> lvm_check_chars -- CALLED with name:
"/dev/hda7"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hda7
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804eaf8
<333> pv_create_name_from_kdev_t -- CALLED with 3:7
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hda7
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/hda8"
<22> pv_read -- CALLED with /dev/hda8
<333> pv_check_name -- CALLED with "/dev/hda8"
<4444> lvm_check_chars -- CALLED with name:
"/dev/hda8"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hda8
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804ed00
<333> pv_create_name_from_kdev_t -- CALLED with 3:8
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 25
<333> pv_create_name_from_kdev_t -- LEAVING with
dev_name: /dev/hda8
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/loop0"
<22> pv_read -- CALLED with /dev/loop0
<333> pv_check_name -- CALLED with "/dev/loop0"
<4444> lvm_check_chars -- CALLED with name:
"/dev/loop0"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop0
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop1"
<22> pv_read -- CALLED with /dev/loop1
<333> pv_check_name -- CALLED with "/dev/loop1"
<4444> lvm_check_chars -- CALLED with name:
"/dev/loop1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop1
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop2"
<22> pv_read -- CALLED with /dev/loop2
<333> pv_check_name -- CALLED with "/dev/loop2"
<4444> lvm_check_chars -- CALLED with name:
"/dev/loop2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop2
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop3"
<22> pv_read -- CALLED with /dev/loop3
<333> pv_check_name -- CALLED with "/dev/loop3"
<4444> lvm_check_chars -- CALLED with name:
"/dev/loop3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop3
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop4"
<22> pv_read -- CALLED with /dev/loop4
<333> pv_check_name -- CALLED with "/dev/loop4"
<4444> lvm_check_chars -- CALLED with name:
"/dev/loop4"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop4
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop5"
<22> pv_read -- CALLED with /dev/loop5
<333> pv_check_name -- CALLED with "/dev/loop5"
<4444> lvm_check_chars -- CALLED with name:
"/dev/loop5"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop5
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop6"
<22> pv_read -- CALLED with /dev/loop6
<333> pv_check_name -- CALLED with "/dev/loop6"
<4444> lvm_check_chars -- CALLED with name:
"/dev/loop6"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop6
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop7"
<22> pv_read -- CALLED with /dev/loop7
<333> pv_check_name -- CALLED with "/dev/loop7"
<4444> lvm_check_chars -- CALLED with name:
"/dev/loop7"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop7
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- avoiding multiple entries in
case of MD; np: 0
<1> pv_read_all_pv -- LEAVING with ret: -282
<1> lvm_error -- CALLED with: -282
<1> lvm_error -- LEAVING with: "pv_read(): read"
vgcreate -- ERROR "pv_read(): read" reading physical
volumes

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0


Kid regards,
Udo

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
