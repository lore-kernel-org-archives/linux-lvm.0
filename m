Date: Tue, 13 Jun 2000 07:29:10 -0400
From: zoo1@corecomm.net
Subject: Re: [linux-lvm] vgscan fails to find vg
Message-ID: <20000613072910.A9094@bar.nowhere>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Tue, Jun 13, 2000 at 12:07:12PM +0200, Heinz J. Mauelshagen wrote:
>On Mon, Jun 12, 2000 at 07:08:24PM -0400, zoo1@corecomm.net wrote:

>> i've got a 32KB debug output file of vgscan failing; what would be
>> the best way of submitting it to whom?

>Send it to the list please.

okay, here it comes... the vg is on /dev/hda11 with no other pv's on the
disk.

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
<1> lvm_remove_recursive -- LEAVING with ret: 0
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
<333> lvm_dir_cache -- LEAVING with ret: 12
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/disc"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/disc
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/disc"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/disc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/disc
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/disc"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/disc"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/disc
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/disc
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part1"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part1
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part1"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part1
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part1"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part1
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:1
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part1
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part2"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part2
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part2"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part2
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part2"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part2
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:2
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part2
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part3"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part3
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part3"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part3
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part3"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part3"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part3
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:3
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part3
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part4"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part4
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part4"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part4"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part4
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part4"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part4"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part4
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:4
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part4
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part5"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part5
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part5"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part5
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part5
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:5
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part5
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part6"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part6
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part6"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part6"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part6
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part6"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part6"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part6
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:6
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part6
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part7"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part7
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part7"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part7"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part7
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part7"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part7"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part7
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:7
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part7
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part8"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part8
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part8"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part8"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part8
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part8"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part8"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part8
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:8
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part8
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part9"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part9
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part9"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part9"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part9
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part9"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part9"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part9
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:9
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part9
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part10"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part10
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part10"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part10"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part10
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part10"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part10"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part10
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:10
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part10
<333> pv_read -- LEAVING with ret: -255
<22> pv_read_all_pv -- pv_read returned: -255
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part11"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part11
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part11"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part11"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part11
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part11"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part11"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part11
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:11
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part11
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 1
<333> pv_read -- LEAVING with ret: -270
<333> pv_get_size -- CALLED with /dev/ide/host0/bus0/target0/lun0/part11 and BFFFFA5C
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part11"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part11"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_part -- CALLED with /dev/ide/host0/bus0/target0/lun0/part11
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part11"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part11"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache_find -- CALLED
<666666> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part11"
<7777777> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part11"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> lvm_dir_cache -- CALLED
<666666> lvm_dir_cache -- LEAVING with ret: 12
<55555> lvm_dir_cache_find -- LEAVING
<55555> lvm_partition_count -- CALLED
<55555> lvm_partition_count -- LEAVING with ret: 16
<4444> pv_check_part -- LEAVING with 11
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<4444> lvm_dir_cache_find -- CALLED
<55555> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part11"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part11"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 12
<4444> lvm_dir_cache_find -- LEAVING
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING
<4444> lvm_partition_count -- CALLED
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: 6  part[0].nr_sects: 952497
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 7  part[1].nr_sects: 4097520
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[2].sys_ind: 83  part[2].nr_sects: 423360
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[3].sys_ind: 5  part[3].nr_sects: 7212240
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- BEFORE llseek 0:5384A0
<333> pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 2056257
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 5  part[1].nr_sects: 423360
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- part[2].sys_ind: 0  part[2].nr_sects: 0
<333> pv_get_size -- part[3].sys_ind: 0  part[3].nr_sects: 0
<333> pv_get_size -- BEFORE llseek 0:72E520
<333> pv_get_size -- part[0].sys_ind: 82  part[0].nr_sects: 423297
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 5  part[1].nr_sects: 423360
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- part[2].sys_ind: 0  part[2].nr_sects: 0
<333> pv_get_size -- part[3].sys_ind: 0  part[3].nr_sects: 0
<333> pv_get_size -- BEFORE llseek 0:795AE0
<333> pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 423297
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 5  part[1].nr_sects: 423360
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- part[2].sys_ind: 0  part[2].nr_sects: 0
<333> pv_get_size -- part[3].sys_ind: 0  part[3].nr_sects: 0
<333> pv_get_size -- BEFORE llseek 0:7FD0A0
<333> pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 423297
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 5  part[1].nr_sects: 211680
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- part[2].sys_ind: 0  part[2].nr_sects: 0
<333> pv_get_size -- part[3].sys_ind: 0  part[3].nr_sects: 0
<333> pv_get_size -- BEFORE llseek 0:864660
<333> pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 211617
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 5  part[1].nr_sects: 211680
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- part[2].sys_ind: 0  part[2].nr_sects: 0
<333> pv_get_size -- part[3].sys_ind: 0  part[3].nr_sects: 0
<333> pv_get_size -- BEFORE llseek 0:898140
<333> pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 211617
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 5  part[1].nr_sects: 3462480
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- part[2].sys_ind: 0  part[2].nr_sects: 0
<333> pv_get_size -- part[3].sys_ind: 0  part[3].nr_sects: 0
<333> pv_get_size -- BEFORE llseek 0:8CBC20
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 3462417
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 3462417
<333> pv_check_volume -- CALLED  dev_name: "/dev/ide/host0/bus0/target0/lun0/part11"  pv: 804D350
<4444> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part11"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part11"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "userPV_EXP"
<55555> lvm_check_chars -- CALLED with name: "userPV_EXP"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/ide/host0/bus0/target0/lun0/part11 userPV_EXP
<22> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 1
<22> pv_read_all_pv -- LEAVING with ret: 0
<1> vg_check_exist_all_vg -- checking vg_name: userPV_EXP[0/0]
<1> vg_check_exist_all_vg -- before vg_check_exist ( userPV_EXP)
<22> vg_check_exist -- CALLED with userPV_EXP
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "userPV_EXP"
<4444> lvm_check_chars -- CALLED with name: "userPV_EXP"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_read -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "userPV_EXP"
<55555> lvm_check_chars -- CALLED with name: "userPV_EXP"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- CALLED with vg_name: "userPV_EXP"
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "userPV_EXP"
<666666> lvm_check_chars -- CALLED with name: "userPV_EXP"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> pv_read_all_pv -- CALLED
<55555> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
<55555> pv_read_all_pv -- LEAVING with ret: 0
<55555> pv_check_consistency -- CALLED
<666666> pv_check_name -- CALLED eith "/dev/ide/host0/bus0/target0/lun0/part11"
<7777777> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part11"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "userPV_EXP"
<7777777> lvm_check_chars -- CALLED with name: "userPV_EXP"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_new -- CALLED
<666666> pv_check_new -- LEAVING with ret: 0
<55555> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg:  pv_name: /dev/ide/host0/bus0/target0/lun0/part11  vg_name: userPV_EXP  p: 0
<4444> pv_read_all_pv_of_vg: /dev/ide/host0/bus0/target0/lun0/part11[0] hit userPV_EXP[0]
<4444> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> vg_read -- pv[0]->pv_name: "/dev/ide/host0/bus0/target0/lun0/part11"
<4444> vg_copy_from_disk -- CALLED
<4444> vg_copy_from_disk -- LEAVING
<333> vg_read -- LEAVING with ret: -350
<22> vg_check_exist -- LEAVING with ret: -350
<1> vg_check_exist_all_vg -- LEAVING with (null)
<1> lvm_tab_create -- CALLED
<22> lvm_tab_write -- CALLED
<22> lvm_tab_write -- LEAVING with ret: 0
<1> lvm_tab_create -- LEAVING
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
vgscan -- no volume groups found

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104
