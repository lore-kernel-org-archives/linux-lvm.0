Message-ID: <20021211202224.79940.qmail@web40906.mail.yahoo.com>
From: Tru64 User <tru64user@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] pvcreate -- ERROR "Success"
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
Date: Wed Dec 11 14:22:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Firsttimer, trying to take advantage of LVM on Linux.
I have used it on AIX, so i have the concept.

I have a RAID Array (1.1Tb) SCSI-ATA drive (sdb) that
i was trying to create a volume out of (pvcreate).

However, it gives me an ERROR "Success" message.
I initially had it formatted with with reiserfs, but
then wiped it clean, and erased partition table as
described in howtos (dd /dev/zero....). Debug also
posted below.
Any leads to get this working?
Exact error below. Thnks in advance.

******************
chinook@/home/moll# pvcreate /dev/sdb
Password:
pvcreate -- ERROR "Success" getting size of physical
volume "/dev/sdb"


pvcreate [-d|--debug] [-f[f]|--force [--force]]
[-h|--help] [-y|--yes]
        [-v|--verbose] [--version] PhysicalVolume
[PhysicalVolume...]

chinook@/home/moll$ 

**********BEGIN_Debug*****************

Script started on Wed Dec 11 15:17:09 2002
cerebus@/home/mollel$ s pvcreate --debug /dev/sdb
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> pv_check_name -- CALLED with "/dev/sdb"
<22> lvm_check_chars -- CALLED with name: "/dev/sdb"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<333> lvm_check_partitioned_dev -- CALLED
<4444> lvm_get_device_type called
<4444> lvm_get_device_type leaving with 1
<333> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<22> lvm_check_dev -- LEAVING with ret: 1
<1> pv_check_name -- LEAVING with ret: 0
<1> pv_get_size -- CALLED with /dev/sdb and 0xbfffdfa0
<22> lvm_dir_cache -- CALLED
<333> lvm_add_dir_cache -- CALLED with /dev/sda
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/sda1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/sdb
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
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
<333> lvm_add_dir_cache -- CALLED with /dev/hda9
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hda9
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_dir_cache -- LEAVING with ret: 11
<22> lvm_dir_cache_find -- CALLED with /dev/sdb
<333> pv_check_name -- CALLED with "/dev/sdb"
<4444> lvm_check_chars -- CALLED with name: "/dev/sdb"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 11
<22> lvm_dir_cache_find -- LEAVING with entry: 2
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 1
<22> lvm_check_partitioned_dev -- LEAVING with ret:
TRUE
<22> lvm_partition_count -- CALLED for 0x810
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 1
<22> lvm_partition_count -- LEAVING with ret: 16
<22> pv_get_dev_size -- CALLED with /dev/sdb and
0xbfffdfa0
<22> pv_get_dev_size -- LEAVING with ret: -1951217920
<1> pv_get_size -- LEAVING with ret: -1951217920
<1> lvm_error -- CALLED with: -1951217920
<1> lvm_error -- LEAVING with: "Success"
pvcreate -- ERROR "Success" getting size of physical
volume "/dev/sdb"
pvcreate [-d|--debug] [-f[f]|--force [--force]]
[-h|--help] [-y|--yes]
        [-v|--verbose] [--version] PhysicalVolume
[PhysicalVolume...]
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
chinook@/home/moll# exit
exit
Script done on Wed Dec 11 15:17:21 2002
***************END_DEBUG********************




=====


__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
