Message-ID: <3BBCBF87.5520C8F9@legis.state.ak.us>
Date: Thu, 04 Oct 2001 11:59:03 -0800
From: Bill Ellis <bill_ellis@legis.state.ak.us>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvcreate fails on a software RAID metadisk
References: <3BBC8B5B.1A484028@legis.state.ak.us>
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

Hi again,

Some more playing around led me to discover that 'lvmdiskscan' is also not
recognizing my software RAID metadisks correctly.  Here's what I think are the
relevant portions of the ~5600 lines of output from the 'lvmdiskscan -d -v'
command:

<1> lvm_dir_cache -- CALLED
<22> lvm_add_dir_cache -- CALLED with /dev/md3
...
<22> lvm_add_dir_cache -- CALLED with /dev/md7
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 2
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
...
<1> pv_get_size -- CALLED with /dev/md7 and 0xbffff8ac
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 50
<22> lvm_dir_cache_find -- CALLED with /dev/md7
<333> pv_check_name -- CALLED with "/dev/md7"
<4444> lvm_check_chars -- CALLED with name: "/dev/md7"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 2
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 50
<22> lvm_dir_cache_find -- LEAVING with entry: 4
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 2
<22> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<22> lvm_partition_count -- CALLED for 0x907
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 2
<22> lvm_partition_count -- LEAVING with ret: 16
<1> pv_get_size -- LEAVING with ret: 0
...
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- filling directory cache...
lvmdiskscan -- walking through all found disks / partitions
lvmdiskscan -- /dev/md3  [             0] Primary   [0x07]
lvmdiskscan -- /dev/md4  [             0] Primary   [0x07]
lvmdiskscan -- /dev/md5  [             0] Extended  [0x07]
lvmdiskscan -- /dev/md6  [             0] Extended  [0x07]
lvmdiskscan -- /dev/md7  [             0] Extended  [0x07]
lvmdiskscan -- /dev/sda1 [      19.98 MB] Primary  LINUX native partition
[0x83]
lvmdiskscan -- /dev/sda2 [      80.00 MB] Primary  LINUX swap partition [0x82]

lvmdiskscan -- /dev/sda3 [       5.76 GB] Primary   [0xFD]
lvmdiskscan -- /dev/sda4 [      28.34 GB] DOS extended partition [0x05]
lvmdiskscan -- /dev/sda5 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sda6 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sda7 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sda8 [       5.86 GB] Extended LVM partition [0x8E]
lvmdiskscan -- /dev/sdb1 [      19.98 MB] Primary  LINUX native partition
[0x83]
lvmdiskscan -- /dev/sdb2 [      80.00 MB] Primary  LINUX swap partition [0x82]

lvmdiskscan -- /dev/sdb3 [       5.76 GB] Primary   [0xFD]
lvmdiskscan -- /dev/sdb4 [      28.34 GB] DOS extended partition [0x05]
lvmdiskscan -- /dev/sdb5 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sdb6 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sdb7 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sdb8 [       5.86 GB] Extended LVM partition [0x8E]
lvmdiskscan -- /dev/sdc1 [      19.98 MB] Primary  LINUX native partition
[0x83]
lvmdiskscan -- /dev/sdc2 [      80.00 MB] Primary  LINUX swap partition [0x82]

lvmdiskscan -- /dev/sdc3 [       5.76 GB] Primary   [0xFD]
lvmdiskscan -- /dev/sdc4 [      28.34 GB] DOS extended partition [0x05]
lvmdiskscan -- /dev/sdc5 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sdc6 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sdc7 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sdc8 [       5.86 GB] Extended LINUX native partition
[0x83]
lvmdiskscan -- /dev/sdd1 [      19.98 MB] Primary  LINUX native partition
[0x83]
lvmdiskscan -- /dev/sdd2 [      80.00 MB] Primary  LINUX swap partition [0x82]

lvmdiskscan -- /dev/sdd3 [       5.76 GB] Primary   [0xFD]
lvmdiskscan -- /dev/sdd4 [      28.34 GB] DOS extended partition [0x05]
lvmdiskscan -- /dev/sdd5 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sdd6 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sdd7 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sdd8 [       5.86 GB] Extended LINUX native partition
[0x83]
lvmdiskscan -- /dev/sde1 [      19.98 MB] Primary  LINUX native partition
[0x83]
lvmdiskscan -- /dev/sde2 [      80.00 MB] Primary  LINUX swap partition [0x82]

lvmdiskscan -- /dev/sde3 [       5.76 GB] Primary  LINUX native partition
[0x83]
lvmdiskscan -- /dev/sde4 [      28.34 GB] DOS extended partition [0x05]
lvmdiskscan -- /dev/sde5 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sde6 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sde7 [       5.86 GB] Extended  [0xFD]
lvmdiskscan -- /dev/sde8 [       5.86 GB] Extended LINUX native partition
[0x83]
lvmdiskscan -- 5 disks
lvmdiskscan -- 0 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 45 partitions
lvmdiskscan -- 2 LVM physical volume partitions


Again, if anyone can give me any leads as to what might be going wrong here,
I'd appreciate it.  Also, if there is any more information I can provide on
this matter, just let me know...

Thanks,
Bill
