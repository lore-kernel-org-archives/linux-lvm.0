Message-ID: <664039ABAA75D5119A9D00B0D0D033C9679F6B@srnamath.lss.emc.com>
From: "yap, joonjack" <yap_joonjack@emc.com>
Date: Tue, 25 Sep 2001 13:54:22 -0400
MIME-Version: 1.0
Subject: [linux-lvm] bug reports
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
Content-Transfer-Encoding: 7bit
To: "'Linux-LVM@sistina.com'" <Linux-LVM@sistina.com>

Hardware: Pentium III 700MHZ
Software: RedHat 7.1 with kernel 2.4.9

Core Dump when trying to create logical volume on top of volume group of 52
G that consists of 6 SCSI disks.
the command that I use is "lvcreate -d -L48G mail_volume"


Here is part of the messages I get when running lvmcreate in debug mode.
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: my_volume_group
<666666> lvm_check_chars -- CALLED with name: "my_volume_group"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<333> lv_check_on_pv -- LEAVING with ret: 1
<22> pv_reserve_pe -- empty PE 1402
<333> lv_check_on_pv -- CALLED
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED with "/dev/sdk"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdk"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: my_volume_group
<666666> lvm_check_chars -- CALLED with name: "my_volume_group"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 1
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<333> lv_check_on_pv -- LEAVING with ret: 1
<22> pv_reserve_pe -- LEAVING with ret: 0
<1> lv_setup_for_create -- pv_reserve_pe returned: 0   pe_last: 1403  pe: 0
<1> lv_setup_for_create -- pe: 0
<1> lv_setup_for_create -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_dont_interrupt -- LEAVING
Segmentation fault (core dumped)

Details about volume group
--- Volume group ---
VG Name               my_volume_group
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                6
Act PV                6
VG Size               51.02 GB
PE Size               4.00 MB
Total PE              13062
Alloc PE / Size       0 / 0
Free  PE / Size       13062 / 51.02 GB
VG UUID               qUUHoR-BAV3-Ngp6-evy2-HJfu-dF1F-fduo3p


Joon Jack Yap
Network Storage Group
EMC Corporation
Ext. 53212
