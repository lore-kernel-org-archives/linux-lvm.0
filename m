From: Todd Troxell <ttroxell@debian.org>
Message-ID: <20020826052131.GA5267@caffeine.rapidpacket.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
Subject: [linux-lvm] pvscan fails
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
Date: Sun Aug 25 22:39:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I'm having trouble setting up physical volumes.

caffeine:~# pvcreate /dev/hdd1
pvcreate -- physical volume "/dev/hdd1" successfully created

caffeine:~# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ERROR "pv_read(): read" reading physical volumes

After looking at debug messages, I think it is related to my 
ide cdrom (/dev/hdc).

Does this seem to be the case?  Is there a way to ignore /dev/hdc?

(attached is output from pvscan -d) (2.2.18, lvm 1.0.4)

-Todd

p.s. please cc: 

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=pvscan_debug

<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> pv_read_all_pv -- CALLED
<1> pv_read_all_pv -- calling lvm_dir_cache
<22> lvm_dir_cache -- CALLED
<333> lvm_add_dir_cache -- CALLED with /dev/hdc
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus1/target1/lun0/disc
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus1/target1/lun0/part1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/disc
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/part1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/part2
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/part5
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/part6
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/part7
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/part8
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target1/lun0/disc
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target1/lun0/part1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/scsi/host0/bus0/target6/lun0/disc
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/scsi/host0/bus0/target6/lun0/part1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/scsi/host0/bus0/target6/lun0/part2
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/scsi/host0/bus0/target6/lun0/part3
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/scsi/host0/bus0/target6/lun0/part5
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/scsi/host0/bus0/target6/lun0/part6
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/scsi/host0/bus0/target6/lun0/part7
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/scsi/host0/bus0/target6/lun0/part8
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/scsi/host0/bus0/target6/lun0/part9
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/scsi/host0/bus0/target6/lun0/part9
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop3
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop4
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop5
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop6
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/loop7
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 3
<55555> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_dir_cache -- LEAVING with ret: 9
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
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804cd08
<333> pv_create_name_from_kdev_t -- CALLED with 22:0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 9
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- calling stat with "/dev/loop0"
<22> pv_read -- CALLED with /dev/loop0
<333> pv_check_name -- CALLED with "/dev/loop0"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop0"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop0
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop1"
<22> pv_read -- CALLED with /dev/loop1
<333> pv_check_name -- CALLED with "/dev/loop1"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop1
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop2"
<22> pv_read -- CALLED with /dev/loop2
<333> pv_check_name -- CALLED with "/dev/loop2"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop2
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop3"
<22> pv_read -- CALLED with /dev/loop3
<333> pv_check_name -- CALLED with "/dev/loop3"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop3
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop4"
<22> pv_read -- CALLED with /dev/loop4
<333> pv_check_name -- CALLED with "/dev/loop4"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop4"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop4
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop5"
<22> pv_read -- CALLED with /dev/loop5
<333> pv_check_name -- CALLED with "/dev/loop5"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop5"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop5
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop6"
<22> pv_read -- CALLED with /dev/loop6
<333> pv_check_name -- CALLED with "/dev/loop6"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop6"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop6
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- calling stat with "/dev/loop7"
<22> pv_read -- CALLED with /dev/loop7
<333> pv_check_name -- CALLED with "/dev/loop7"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop7"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/loop7
<22> pv_read -- LEAVING with ret: -282
<1> pv_read_all_pv -- pv_read returned: -282
<1> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
<1> pv_read_all_pv -- LEAVING with ret: -282
<1> lvm_error -- CALLED with: -282
<1> lvm_error -- LEAVING with: "pv_read(): read"
pvscan -- ERROR "pv_read(): read" reading physical volumes

pvscan -- reading all physical volumes (this may take a while...)

--M9NhX3UHpAaciwkO--
