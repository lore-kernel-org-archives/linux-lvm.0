Message-ID: <400E263E.8080708@kapp-coburg.de>
From: Roland Morgenroth <Roland.Morgenroth@kapp-coburg.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and HP SecurePath
References: <400CD3A6.9070201@kapp-coburg.de> <20040121001515.GK16867@percy.comedia.it>
In-Reply-To: <20040121001515.GK16867@percy.comedia.it>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms020506090703080700010907"
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
Date: Wed Jan 21 09:59:05 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a cryptographically signed message in MIME format.

--------------ms020506090703080700010907
Content-Type: multipart/mixed;
 boundary="------------040108060103080405030402"

This is a multi-part message in MIME format.
--------------040108060103080405030402
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Luca Berra schrieb:
> On Tue, Jan 20, 2004 at 08:07:18AM +0100, Roland Morgenroth wrote:
> 
>> hi,
>>
>> i cannot use LVM, after activating HP SecurePath (failover and load 
>> balancing driver).
>> lvmdiskscan does not see the devices:
>>
>> kappco1:~ # lvmdiskscan
> 
> weird.
> does unitedlinux use devfs by chance?
it's not included in the kernel.
> could you run lvmdiskscan in debug mode?
kappco1:~ # lvmdiskscan -d
lvmdiskscan -- reading all disks / partitions (this may take a while...)
<1> lvm_dir_cache -- CALLED
<22> lvm_add_dir_cache -- CALLED with /dev/cciss/c0d0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 8
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/cciss/c0d0p1
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 8
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/cciss/c0d0p2
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 8
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/cciss/c0d0p2
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 8
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop1
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop10
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop11
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop12
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop13
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop14
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop15
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop2
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop3
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop4
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop5
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop6
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop7
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop8
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/loop9
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb1
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb10
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb11
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb12
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb13
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb14
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb15
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb2
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb3
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb4
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb5
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb6
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb7
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb8
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/nb9
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with -1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<1> lvm_dir_cache -- LEAVING with ret: 19
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 8
<1> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<1> lvm_check_whole_disk_dev -- CALLED
<22> lvm_partition_count -- CALLED for 0x6800
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 8
<22> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_check_whole_disk_dev -- LEAVING with ret: TRUE
<1> pv_get_size -- CALLED with /dev/cciss/c0d0 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/cciss/c0d0
<333> pv_check_name -- CALLED with "/dev/cciss/c0d0"
<4444> lvm_check_chars -- CALLED with name: "/dev/cciss/c0d0"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 0
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 8
<22> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<22> lvm_partition_count -- CALLED for 0x6800
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 8
<22> lvm_partition_count -- LEAVING with ret: 16
<22> _pv_get_dev_size -- CALLED with /dev/cciss/c0d0 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 35553120
<1> pv_get_size -- LEAVING with ret: 35553120
<1> pv_create_kdev_t -- CALLED with "/dev/cciss/c0d0"
<22> pv_check_name -- CALLED with "/dev/cciss/c0d0"
<333> lvm_check_chars -- CALLED with name: "/dev/cciss/c0d0"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> pv_check_name -- LEAVING with ret: 0
<1> pv_create_kdev_t -- LEAVING with ret: 6800
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 8
<1> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<1> lvm_partition_count -- CALLED for 0x6800
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 8
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_dir_cache -- CALLED
<1> lvm_dir_cache -- LEAVING with ret: 19
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 8
<1> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<1> lvm_check_whole_disk_dev -- CALLED
<22> lvm_partition_count -- CALLED for 0x6801
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 8
<22> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_check_whole_disk_dev -- LEAVING with ret: TRUE
<1> pv_get_size -- CALLED with /dev/cciss/c0d0p1 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/cciss/c0d0p1
<333> pv_check_name -- CALLED with "/dev/cciss/c0d0p1"
<4444> lvm_check_chars -- CALLED with name: "/dev/cciss/c0d0p1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 1
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 8
<22> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<22> lvm_partition_count -- CALLED for 0x6801
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 8
<22> lvm_partition_count -- LEAVING with ret: 16
<1> pv_get_size -- BEFORE llseek 0:0
<1> pv_get_size -- part[0].sys_ind: 82  part[0].nr_sects: 2105248
<1> pv_get_size -- first == 1
<1> pv_get_size -- part_i == part_i_tmp
<1> pv_get_size -- LEAVING with ret: 2105248
<1> pv_create_kdev_t -- CALLED with "/dev/cciss/c0d0p1"
<22> pv_check_name -- CALLED with "/dev/cciss/c0d0p1"
<333> lvm_check_chars -- CALLED with name: "/dev/cciss/c0d0p1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> pv_check_name -- LEAVING with ret: 0
<1> pv_create_kdev_t -- LEAVING with ret: 6801
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 8
<1> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<1> lvm_partition_count -- CALLED for 0x6801
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 8
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_dir_cache -- CALLED
<1> lvm_dir_cache -- LEAVING with ret: 19
<1> pv_check_part -- CALLED with /dev/cciss/c0d0p1
<22> pv_check_name -- CALLED with "/dev/cciss/c0d0p1"
<333> lvm_check_chars -- CALLED with name: "/dev/cciss/c0d0p1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> pv_check_name -- LEAVING with ret: 0
<22> lvm_dir_cache_find -- CALLED with /dev/cciss/c0d0p1
<333> pv_check_name -- CALLED with "/dev/cciss/c0d0p1"
<4444> lvm_check_chars -- CALLED with name: "/dev/cciss/c0d0p1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 1
<22> lvm_partition_count -- CALLED for 0x6801
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 8
<22> lvm_partition_count -- LEAVING with ret: 16
<1> pv_check_part -- LEAVING with 1
<1> lvm_check_extended_partition -- CALLED
<22> lvm_partition_count -- CALLED for 0x6801
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 8
<22> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_check_extended_partition -- LEAVING with ret: 0
lvmdiskscan -- /dev/cciss/c0d0p1 [          1 GB] Primary   [0x82]
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 8
<1> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<1> lvm_check_whole_disk_dev -- CALLED
<22> lvm_partition_count -- CALLED for 0x6802
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 8
<22> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_check_whole_disk_dev -- LEAVING with ret: TRUE
<1> pv_get_size -- CALLED with /dev/cciss/c0d0p2 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/cciss/c0d0p2
<333> pv_check_name -- CALLED with "/dev/cciss/c0d0p2"
<4444> lvm_check_chars -- CALLED with name: "/dev/cciss/c0d0p2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 2
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 8
<22> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<22> lvm_partition_count -- CALLED for 0x6802
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 8
<22> lvm_partition_count -- LEAVING with ret: 16
<1> pv_get_size -- BEFORE llseek 0:0
<1> pv_get_size -- part[0].sys_ind: 82  part[0].nr_sects: 2105248
<1> pv_get_size -- first == 1
<1> pv_get_size -- part[1].sys_ind: 83  part[1].nr_sects: 33447840
<1> pv_get_size -- first == 1
<1> pv_get_size -- part_i == part_i_tmp
<1> pv_get_size -- LEAVING with ret: 33447840
<1> pv_create_kdev_t -- CALLED with "/dev/cciss/c0d0p2"
<22> pv_check_name -- CALLED with "/dev/cciss/c0d0p2"
<333> lvm_check_chars -- CALLED with name: "/dev/cciss/c0d0p2"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> pv_check_name -- LEAVING with ret: 0
<1> pv_create_kdev_t -- LEAVING with ret: 6802
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 8
<1> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<1> lvm_partition_count -- CALLED for 0x6802
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 8
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_dir_cache -- CALLED
<1> lvm_dir_cache -- LEAVING with ret: 19
<1> pv_check_part -- CALLED with /dev/cciss/c0d0p2
<22> pv_check_name -- CALLED with "/dev/cciss/c0d0p2"
<333> lvm_check_chars -- CALLED with name: "/dev/cciss/c0d0p2"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> pv_check_name -- LEAVING with ret: 0
<22> lvm_dir_cache_find -- CALLED with /dev/cciss/c0d0p2
<333> pv_check_name -- CALLED with "/dev/cciss/c0d0p2"
<4444> lvm_check_chars -- CALLED with name: "/dev/cciss/c0d0p2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 2
<22> lvm_partition_count -- CALLED for 0x6802
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 8
<22> lvm_partition_count -- LEAVING with ret: 16
<1> pv_check_part -- LEAVING with 2
<1> lvm_check_extended_partition -- CALLED
<22> lvm_partition_count -- CALLED for 0x6802
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 8
<22> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_check_extended_partition -- LEAVING with ret: 0
lvmdiskscan -- /dev/cciss/c0d0p2 [      15.95 GB] Primary  LINUX native partition [0x83]
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop0 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop0
<333> pv_check_name -- CALLED with "/dev/loop0"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop0"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 3
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop0 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop1 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop1
<333> pv_check_name -- CALLED with "/dev/loop1"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 4
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop1 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop10 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop10
<333> pv_check_name -- CALLED with "/dev/loop10"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop10"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 5
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop10 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop11 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop11
<333> pv_check_name -- CALLED with "/dev/loop11"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop11"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 6
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop11 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop12 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop12
<333> pv_check_name -- CALLED with "/dev/loop12"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop12"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 7
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop12 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop13 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop13
<333> pv_check_name -- CALLED with "/dev/loop13"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop13"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 8
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop13 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop14 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop14
<333> pv_check_name -- CALLED with "/dev/loop14"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop14"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 9
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop14 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop15 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop15
<333> pv_check_name -- CALLED with "/dev/loop15"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop15"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 10
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop15 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop2 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop2
<333> pv_check_name -- CALLED with "/dev/loop2"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 11
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop2 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop3 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop3
<333> pv_check_name -- CALLED with "/dev/loop3"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 12
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop3 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop4 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop4
<333> pv_check_name -- CALLED with "/dev/loop4"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop4"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 13
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop4 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop5 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop5
<333> pv_check_name -- CALLED with "/dev/loop5"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop5"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 14
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop5 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop6 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop6
<333> pv_check_name -- CALLED with "/dev/loop6"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop6"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 15
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop6 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop7 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop7
<333> pv_check_name -- CALLED with "/dev/loop7"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop7"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 16
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop7 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop8 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop8
<333> pv_check_name -- CALLED with "/dev/loop8"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop8"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 17
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop8 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 3
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<1> pv_get_size -- CALLED with /dev/loop9 and 0xbfffdc70
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- CALLED with /dev/loop9
<333> pv_check_name -- CALLED with "/dev/loop9"
<4444> lvm_check_chars -- CALLED with name: "/dev/loop9"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 19
<22> lvm_dir_cache_find -- LEAVING with entry: 18
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 3
<22> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> _pv_get_dev_size -- CALLED with /dev/loop9 and 0xbfffdc70
<22> _pv_get_dev_size -- LEAVING with ret: 4294967062
<1> pv_get_size -- LEAVING with ret: 4294967062
lvmdiskscan -- 1 disk
lvmdiskscan -- 0 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 2 partitions
lvmdiskscan -- 0 LVM physical volume partitions


--------------040108060103080405030402
Content-Type: text/x-vcard; charset=utf8;
 name="Roland.Morgenroth.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Roland.Morgenroth.vcf"

begin:vcard
fn:Morgenroth, Roland
n:Morgenroth;Roland
org:KAPP GmbH Werkzeugmaschinenfabrik;C-ITE
adr;quoted-printable:;;Callenberger Stra=C3=9Fe 52;Coburg;Bayern;96450;Deutschland
email;internet:Roland.Morgenroth@kapp-coburg.de
tel;work:+49 9561 866371
tel;fax:+49 9561 866271
tel;cell:+49 172 8393602
version:2.1
end:vcard


--------------040108060103080405030402--

--------------ms020506090703080700010907
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKSjCC
AzgwggKhoAMCAQICEGZFcrfMdPXPY3ZFhNAukQEwDQYJKoZIhvcNAQEEBQAwgdExCzAJBgNV
BAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcTCUNhcGUgVG93bjEaMBgG
A1UEChMRVGhhd3RlIENvbnN1bHRpbmcxKDAmBgNVBAsTH0NlcnRpZmljYXRpb24gU2Vydmlj
ZXMgRGl2aXNpb24xJDAiBgNVBAMTG1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBDQTErMCkG
CSqGSIb3DQEJARYccGVyc29uYWwtZnJlZW1haWxAdGhhd3RlLmNvbTAeFw0wMDA4MzAwMDAw
MDBaFw0wNDA4MjcyMzU5NTlaMIGSMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBD
YXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xDzANBgNVBAoTBlRoYXd0ZTEdMBsGA1UECxMUQ2Vy
dGlmaWNhdGUgU2VydmljZXMxKDAmBgNVBAMTH1BlcnNvbmFsIEZyZWVtYWlsIFJTQSAyMDAw
LjguMzAwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAN4zMqZjxwklRT7SbngnZ4HF2ogZ
gpcO40QpimM1Km1wPPrcrvfudG8wvDOQf/k0caCjbZjxw0+iZdsN+kvx1t1hpfmFzVWaNRqd
knWoJ67Ycvm6AvbXsJHeHOmr4BgDqHxDQlBRh4M88Dm0m1SKE4f/s5udSWYALQmJ7JRr6aFp
AgMBAAGjTjBMMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwxLTI5NzAS
BgNVHRMBAf8ECDAGAQH/AgEAMAsGA1UdDwQEAwIBBjANBgkqhkiG9w0BAQQFAAOBgQAxsUtH
XfkBceX1U2xdedY9mMAmE2KBIqcS+CKV6BtJtyd7BDm6/ObyJOuR+r3sDSo491BVqGz3Da1M
G7wD9LXrokefbKIMWI0xQgkRbLAaadErErJAXWr5edDqLiXdiuT82w0fnQLzWtvKPPZE6iZp
h39Ins6ln+eE2MliYq0FxjCCA4MwggLsoAMCAQICAwpUwjANBgkqhkiG9w0BAQQFADCBkjEL
MAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3du
MQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYD
VQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAwMC44LjMwMB4XDTAzMDcxMTE3MzA1NloX
DTA0MDcxMDE3MzA1NlowgZwxEzARBgNVBAQTCk1vcmdlbnJvdGgxDzANBgNVBCoTBlJvbGFu
ZDEaMBgGA1UEAxMRUm9sYW5kIE1vcmdlbnJvdGgxJzAlBgkqhkiG9w0BCQEWGFJvbGFuZC5N
b3JnZW5yb3RoQHdlYi5kZTEvMC0GCSqGSIb3DQEJARYgUm9sYW5kLk1vcmdlbnJvdGhAa2Fw
cC1jb2J1cmcuZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDPpjIXODcoYSKZ
zqdMCbtjRSApQKtYTYeWD02N6KG0x5mMHDwoMQp+KHRp3bc3bpNoa70tfg8NOU1NyJbOPC6L
R1lQToCnyw3BurlNFjl7cuPHZuoAHp2VSElRUa11Shf0DcIH0GN5WBxIOONCzIZ/AWMM0ZK2
sWMmo4QMlaQEdhCNlHU0UWSzWlhF9Lr7FWYKu27q52JAyrfUqkEM00r18AloA5b8oK6KXh45
Z3vHVl7MhMIv0BzquRUqoZOMzuRfNE05h38Y5GcxajVhCeaG6Zr1vNPVh8NzaM28Im2e0QE0
OQa82J0zpr0hMjnI4efqbyhs+JZJBBat0wu6ltrVAgMBAAGjVzBVMEUGA1UdEQQ+MDyBGFJv
bGFuZC5Nb3JnZW5yb3RoQHdlYi5kZYEgUm9sYW5kLk1vcmdlbnJvdGhAa2FwcC1jb2J1cmcu
ZGUwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQQFAAOBgQDBH2krJyBXb4rE3pmA/E8lxMl6
O0cg3ZTo4UrcNEJclrA/2hWdp+KkpP/tcM9l9tG6jiQ1lKO8XzEZ7xM1i7O9i9fIVLrmk+Fx
MNzYTT3ZvJo8bMBml0lc2CZ/ztDyWbw5yVecNpYWmW9fcO04sAZeshz2HDpJZNOm4K8d3g7p
mzCCA4MwggLsoAMCAQICAwpUwjANBgkqhkiG9w0BAQQFADCBkjELMAkGA1UEBhMCWkExFTAT
BgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3
dGUxHTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBG
cmVlbWFpbCBSU0EgMjAwMC44LjMwMB4XDTAzMDcxMTE3MzA1NloXDTA0MDcxMDE3MzA1Nlow
gZwxEzARBgNVBAQTCk1vcmdlbnJvdGgxDzANBgNVBCoTBlJvbGFuZDEaMBgGA1UEAxMRUm9s
YW5kIE1vcmdlbnJvdGgxJzAlBgkqhkiG9w0BCQEWGFJvbGFuZC5Nb3JnZW5yb3RoQHdlYi5k
ZTEvMC0GCSqGSIb3DQEJARYgUm9sYW5kLk1vcmdlbnJvdGhAa2FwcC1jb2J1cmcuZGUwggEi
MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDPpjIXODcoYSKZzqdMCbtjRSApQKtYTYeW
D02N6KG0x5mMHDwoMQp+KHRp3bc3bpNoa70tfg8NOU1NyJbOPC6LR1lQToCnyw3BurlNFjl7
cuPHZuoAHp2VSElRUa11Shf0DcIH0GN5WBxIOONCzIZ/AWMM0ZK2sWMmo4QMlaQEdhCNlHU0
UWSzWlhF9Lr7FWYKu27q52JAyrfUqkEM00r18AloA5b8oK6KXh45Z3vHVl7MhMIv0BzquRUq
oZOMzuRfNE05h38Y5GcxajVhCeaG6Zr1vNPVh8NzaM28Im2e0QE0OQa82J0zpr0hMjnI4efq
byhs+JZJBBat0wu6ltrVAgMBAAGjVzBVMEUGA1UdEQQ+MDyBGFJvbGFuZC5Nb3JnZW5yb3Ro
QHdlYi5kZYEgUm9sYW5kLk1vcmdlbnJvdGhAa2FwcC1jb2J1cmcuZGUwDAYDVR0TAQH/BAIw
ADANBgkqhkiG9w0BAQQFAAOBgQDBH2krJyBXb4rE3pmA/E8lxMl6O0cg3ZTo4UrcNEJclrA/
2hWdp+KkpP/tcM9l9tG6jiQ1lKO8XzEZ7xM1i7O9i9fIVLrmk+FxMNzYTT3ZvJo8bMBml0lc
2CZ/ztDyWbw5yVecNpYWmW9fcO04sAZeshz2HDpJZNOm4K8d3g7pmzGCA9UwggPRAgEBMIGa
MIGSMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBl
IFRvd24xDzANBgNVBAoTBlRoYXd0ZTEdMBsGA1UECxMUQ2VydGlmaWNhdGUgU2VydmljZXMx
KDAmBgNVBAMTH1BlcnNvbmFsIEZyZWVtYWlsIFJTQSAyMDAwLjguMzACAwpUwjAJBgUrDgMC
GgUAoIICDzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wNDAx
MjEwNzExNThaMCMGCSqGSIb3DQEJBDEWBBQDvj2cAS5kzZFUq27gyKA/sVqiRzBSBgkqhkiG
9w0BCQ8xRTBDMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAH
BgUrDgMCBzANBggqhkiG9w0DAgIBKDCBqwYJKwYBBAGCNxAEMYGdMIGaMIGSMQswCQYDVQQG
EwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xDzANBgNV
BAoTBlRoYXd0ZTEdMBsGA1UECxMUQ2VydGlmaWNhdGUgU2VydmljZXMxKDAmBgNVBAMTH1Bl
cnNvbmFsIEZyZWVtYWlsIFJTQSAyMDAwLjguMzACAwpUwjCBrQYLKoZIhvcNAQkQAgsxgZ2g
gZowgZIxCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcTCUNh
cGUgVG93bjEPMA0GA1UEChMGVGhhd3RlMR0wGwYDVQQLExRDZXJ0aWZpY2F0ZSBTZXJ2aWNl
czEoMCYGA1UEAxMfUGVyc29uYWwgRnJlZW1haWwgUlNBIDIwMDAuOC4zMAIDClTCMA0GCSqG
SIb3DQEBAQUABIIBAGDXEMirQFlhFlzIQazZPpspdfax3a618sS5zl0vk5oTikDLkxuA8qF3
g53KRO1eDufXd6gr0IpJYgyEzI81h6QRTSAuMsm2yX/zjv4Rk+q+MmjE5MNeVR03jylSIS30
Z0gbx+gptBWbXBO64v+6rHidbWNrsF76PXppfR8A+n+6I4+gNL0PZ7vYLEzkAfJ75c1Aa9wL
JY+PMJA6skEfpgfAEjXqgI00ULO1YvNYmWgednY2DDrgrBZppuKq+nm0CPMHoBoYQXJnNRHr
prGwJf3NReu9Ld8sNNR/xAIwmTbWmY+a+QjQZzTYFhbWTTudLdIPxKgbz1zosciGmZiuzBQA
AAAAAAA=
--------------ms020506090703080700010907--
