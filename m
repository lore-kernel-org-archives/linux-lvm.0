Message-ID: <38EE298D.8661D248@ednet.ns.ca>
Date: Fri, 07 Apr 2000 15:31:41 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: [linux-lvm] Vgscan problem
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

I am getting the following EROR -364 when running vgscan. The volume
group and logical volumes are actually in use and reiser filesystems
mounted on them.

Should I be able to run vgscan when the vg is active? If so what could
the problem be? The machine was rebooted 15 days agao with 2.2.15pre17
and vgscan worked fine then. I ran accross the problem today when I was
trying to run lvm-viewer which runs vgscan when it starts.

Thanks.


vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- found active volume group "data_vg"
vgscan -- reading data of volume group "data_vg" from physical volume(s)

vgscan -- ERROR -364: can't get data of volume group "data_vg" from
physical volume(s)
vgscan -- ERROR -364 creating "/etc/lvmtab" and "/etc/lvmtab.d"



--- Volume group ---
VG Name               data_vg
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                6
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               133.36 GB
PE Size               4 MB
Total PE              34140
Alloc PE / Size       27125 / 105.96 GB
Free  PE / Size       7015 / 27.4 GB
vg_show -- LEAVING
pv_read_all_pv_of_vg -- CALLED with vg_name: "data_vg"
vg_check_name -- CALLED
vg_check_name -- vg_name: "data_vg"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv_of_vg -- LEAVING with ret: 0
vg_read_with_pv_and_lv -- AFTER pv_read_all_pv_of_vg
pv_read_all_pe_of_vg -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "data_vg"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv_of_vg -- CALLED with vg_name: "data_vg"
vg_check_name -- CALLED
vg_check_name -- vg_name: "data_vg"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv_of_vg -- LEAVING with ret: 0
pv_read_all_pe_of_vg -- pv_count: 1
pv_read_pe -- CALLED with /dev/sda7 and 34140
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/sda7"
pv_check_name -- LEAVING with ret: 0
pe_copy_from_disk -- CALLED
pe_copy_from_disk -- LEAVING
pv_read_pe -- ret: 0
pv_read_pe -- LEAVING with ret: 0
pv_read_all_pe_of_vg -- /dev/sda7 with 34140 PE at address 8071258
pv_check_number -- CALLED
pv_check_number -- LEAVING with ret: 0
pv_read_all_pe_of_vg -- AFTER LOOP of pv_read_pe
pv_read_all_pe_of_vg -- /dev/sda7 with 34140 PE at address 40151008 for
PV #0
pv_read_all_pe_of_vg -- LEAVING with ret: 0
vg_read_with_pv_and_lv -- AFTER pv_read_all_pe_of_vg
lv_read_all_lv_of_vg -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "data_vg"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vg_read -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "data_vg"
vg_check_name -- CALLED
vg_check_name -- vg_name: "data_vg"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv_of_vg -- CALLED with vg_name: "data_vg"
vg_check_name -- CALLED
vg_check_name -- vg_name: "data_vg"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv_of_vg -- LEAVING with ret: 0
vg_read -- pv[0]->pv_name: "/dev/sda7"
vg_copy_from_disk -- CALLED
vg_copy_from_disk -- LEAVING
vg_read -- LEAVING with ret: 0
lv_read_all_lv_of_vg -- lv_max: 256
lv_read_all_lv_of_vg -- BEFORE pv_read_all_pv_of_vg
pv_read_all_pv_of_vg -- CALLED with vg_name: "data_vg"
vg_check_name -- CALLED
vg_check_name -- vg_name: "data_vg"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_read_all_pv_of_vg -- LEAVING with ret: 0
lv_copy_from_disk -- CALLED
lv_copy_from_disk -- LEAVING
lv_copy_from_disk -- CALLED
lv_copy_from_disk -- LEAVING
lv_copy_from_disk -- CALLED
lv_copy_from_disk -- LEAVING
lv_copy_from_disk -- CALLED
lv_copy_from_disk -- LEAVING
lv_copy_from_disk -- CALLED
lv_copy_from_disk -- LEAVING
lv_copy_from_disk -- CALLED
lv_copy_from_disk -- LEAVING
lv_read_all_lv_of_vg -- l: 256  nl: 6  vg_this->lv_cur: 6
lv_read_all_lv_of_vg -- LEAVING with ret: 0
vg_read_with_pv_and_lv -- AFTER lv_read_all_lv_of_vg; vg_this->pv_cur:
1  vg_this->pv_max: 256  ret: 0
vg_read_with_pv_and_lv -- BEFORE for PE
vg_read_with_pv_and_lv -- AFTER for PE
vg_read_with_pv_and_lv -- BEFORE for LV
vg_read_with_pv_and_lv -- vg_this->lv[0]->lv_allocated_le: 5000
vg_read_with_pv_and_lv -- vg_this->lv[1]->lv_allocated_le: 5000
vg_read_with_pv_and_lv -- vg_this->lv[2]->lv_allocated_le: 6250
vg_read_with_pv_and_lv -- vg_this->lv[3]->lv_allocated_le: 5000
vg_read_with_pv_and_lv -- vg_this->lv[4]->lv_allocated_le: 875
vg_read_with_pv_and_lv -- vg_this->lv[5]->lv_allocated_le: 1
vg_check_active -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "data_vg"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vg_status -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "data_vg"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vg_status -- LEAVING
vg_check_active -- LEAVING
