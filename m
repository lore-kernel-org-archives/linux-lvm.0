Return-Path: <doganello@tiscalinet.it>
Message-ID: <3A69567A.8060008@tiscalinet.it>
Date: Sat, 20 Jan 2001 10:12:26 +0100
From: anchise governatori <doganello@tiscalinet.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvmtab and lvmtab.d   disappeared.
References: <3A51DCD10039F1D2@mail.tiscalinet.it> <20010119124210.J11381@srv.sistina.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi Heinz,

as you asked, I'm reporting the pvscan log.

Thanks.

Saluti,
Anchise.



Heinz J. Mauelshagen wrote:

 > Hi Doganello,
 >
 > the error code 328 returned by vg_check_consistency() shows that you 
might
 > have more PVs in your system which claim to belong to volume group "vg1"
 > than there should be.
 >
 > Please check with pvscan and report again.
 >
 > Thanks,
 > Heinz




lvm_get_iop_version -- CALLED
lvm_get_iop_version -- AFTER ioctl ret: 0
lvm_get_iop_version -- LEAVING with ret: 0
pvscan -- reading all physical volumes (this may take a while...)
pv_read_all_pv -- CALLED
pv_read_all_pv -- calling lvm_dir_cache
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 8
pv_read_all_pv -- calling pv_read with "/dev/hdc"
pv_read -- CALLED with /dev/hdc
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdc
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdc
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 22:0
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 8
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hdc1"
pv_read -- CALLED with /dev/hdc1
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc1"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdc1
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdc1"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdc1
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 22:1
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 8
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc1
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hdd"
pv_read -- CALLED with /dev/hdd
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hdd
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hdd"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hdd
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 22:64
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 8
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdd
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hde"
pv_read -- CALLED with /dev/hde
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hde
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hde
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 33:0
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 8
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hde
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hde1"
pv_read -- CALLED with /dev/hde1
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde1"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hde1
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde1"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hde1
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 33:1
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 8
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hde1
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hde2"
pv_read -- CALLED with /dev/hde2
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde2"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hde2
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde2"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hde2
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 33:2
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 8
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hde2
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hde3"
pv_read -- CALLED with /dev/hde3
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde3"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hde3
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde3"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hde3
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 33:3
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 8
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hde3
pv_read -- LEAVING with ret: -259
pv_read_all_pv -- pv_read returned: -259
pv_read_all_pv -- calling pv_read with "/dev/hde4"
pv_read -- CALLED with /dev/hde4
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde4"
pv_check_name -- LEAVING with ret: 0
pv_flush -- CALLED to flush /dev/hde4
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde4"
pv_check_name -- LEAVING with ret: 0
pv_flush -- LEAVING with ret: 0
pv_read -- going to read /dev/hde4
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 33:4
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 8
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hde4
pv_read -- LEAVING with ret: 0
pv_get_size -- CALLED with /dev/hde4 and BFFFF63C
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde4"
pv_check_name -- LEAVING with ret: 0
pv_check_part -- CALLED with /dev/hde4
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde4"
pv_check_name -- LEAVING with ret: 0
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde4"
pv_check_name -- LEAVING with ret: 0
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 8
pv_check_part -- LEAVING with 4
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 8
pv_get_size -- BEFORE llseek 0:0
pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 722862
pv_get_size -- first == 1
pv_get_size -- part[1].sys_ind: 82  part[1].nr_sects: 530145
pv_get_size -- first == 1
pv_get_size -- part[2].sys_ind: 6  part[2].nr_sects: 2056320
pv_get_size -- first == 1
pv_get_size -- part[3].sys_ind: 8E  part[3].nr_sects: 13189365
pv_get_size -- first == 1
pv_get_size -- part_i == part_i_tmp
pv_get_size -- LEAVING with ret: 13189365
pv_check_volume -- CALLED  dev_name: "/dev/hde4"  pv: 804D450
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde4"
pv_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "vg1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_volume -- LEAVING with ret: 1
pv_read_all_pv: allocating for /dev/hde4 vg1
pv_read_all_pv -- avoiding multiple entries in case of MD; np: 1
pv_read_all_pv -- LEAVING with ret: 0
pv_read -- CALLED with /dev/hde4
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde4"
pv_check_name -- LEAVING with ret: 0
pv_read -- going to read /dev/hde4
pv_copy_from_disk -- CALLED
pv_copy_from_disk -- LEAVING
pv_create_name_from_kdev_t -- CALLED with 33:4
lvm_dir_cache -- CALLED
lvm_dir_cache -- LEAVING with cache_size: 8
pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hde4
pv_read -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pvscan -- pv_check_active -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "vg1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde4"
pv_check_name -- LEAVING with ret: 0
pv_status -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "vg1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hde4"
pv_check_name -- LEAVING with ret: 0
pv_status -- LEAVING with ret: -6
inactive pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
lvm_tab_vg_check_exist -- CALLED with vg_name: "vg1"
vg_check_name -- CALLED
vg_check_name -- vg_name: "vg1"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lvm_tab_read -- CALLED
lvm_tab_read -- LEAVING with ret: 0  data: 804B400  size: 1
lvm_tab_vg_check_exist -- LEAVING with ret: 0
PV "/dev/hde4"  is associated to an unknown VG (run vgscan)
pvscan -- total: 1 [6.29 GB] / in use: 1 [6.29 GB] / in no VG: 0 [0]
