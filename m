From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgimport problem
Message-ID: <20021025144030.C4081@sistina.com>
References: <3DB72212.3030407@emco.dyndns.org> <20021024093357.B29870@sistina.com> <3DB8A08A.20201@emco.dyndns.org>
Mime-Version: 1.0
In-Reply-To: <3DB8A08A.20201@emco.dyndns.org>; from eman@emco.dyndns.org on Thu, Oct 24, 2002 at 06:38:18PM -0700
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
Date: Fri Oct 25 07:43:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Emanuel,

IIRC from your other mail, you had the out-of-sequence number problem fixed
with your PV numbers (recent LVM1 CVS contains a fix for this already) and
have your VG back, right?


On Thu, Oct 24, 2002 at 06:38:18PM -0700, eman wrote:
> 
> 
> Heinz J . Mauelshagen wrote:
> > Emmanuel,
> > 
> > the error tells you, that the physical extend count is wrong in the
> > volume group which might be caused by your hexediting.
> > What excatly did you do?
> 
> I've taken a look at the physical extent count and hde, hdb1, hdc1 agree 
> on what it should be. During my hexediting, I changed hdg1 to match the 
> other three. Is there a way that I can calculate or scan the true PE 
> count so I can compare it to the number stored at the top of the PVs?
> 
> Also, in case you missed it, I listed the other changes that I made via 
> hexediting a couple of postings back.
> 
> I'm too, along with a recent poster, am interested implementation 
> documentation. Specifically, at what offset does lvm end and the actual 
> filesystem and data begin?

"pvdata -PP" gives you offset onfo such as:

<SNIP>
pv_on_disk.base          0
pv_on_disk.size          1024
vg_on_disk.base          1024
vg_on_disk.size          5120
pv_uuidlist_on_disk.base 6144
pv_uuidlist_on_disk.size 32896
lv_on_disk.base          39040
lv_on_disk.size          10824
pe_on_disk.base          53248
pe_on_disk.size          4259840

The definitions of the various structures and tables are in lvm.h (pv_disk_t,
vg_disk_t etc.).

Regards,
Heinz    -- The LVM Guy --


> 
> Thank you,
> Emmanuel
> 
> > 
> > That vgimport fails might be caused by out-of-sequence physical volume
> > number. LVM1 CVS (Branch: LVM_BRANCH_1-0) contains a fix for that which
> > will be in LVM 1.0.6 as well.
> > You can display the PV numbers with
> > "pvdata -P/dev/hdg1 /dev/hdb1 /dev/hdc1 /dev/hde".
> > 
> > But don't change anything _before_ we checked the impact of your first hexedits!
> >      
> > Regards,
> > Heinz    -- The LVM Guy --
> > 
> > On Wed, Oct 23, 2002 at 03:26:26PM -0700, Emmanuel wrote:
> > 
> >>Hello,
> >>
> >>I'm having trouble importing my VG after an export.
> >>
> >>The system that exported the group was Redhat 7.3, I'm trying to import
> >>on Redhat 8.0; Logical Volume Manager 1.0.3
> >>Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)
> >>
> >>Unfortunately, I don't have access to the metadata so I can't try
> >>vgcfgrestore. Also, note that I've modified the first 512 bytes of
> >>/dev/hdg1 with a hex editor in an effort to fix this problem. It seems
> >>to have helped (pvscan /dev/hdg1 now works) but I still cann't import.
> >>
> >>Any help and/or pointers to technical documentation beyond the howto
> >>would be greatly appreciated.
> >>
> >>-Emmanuel
> >>
> >>The VG consists of
> >>/dev/hdg1 /dev/hde /dev/hdc1 and /dev/hdb1 (/dev/hda4 is not part of
> >>group). Here's the summary after lvmdiskscan:
> >>
> >>lvmdiskscan -- reading all disks / partitions (this may take a while...)
> >>lvmdiskscan -- /dev/hdg1  [  76.33 GB] Primary  LVM partition [0x8E]
> >>lvmdiskscan -- /dev/hde   [  93.16 GB] free whole disk
> >>lvmdiskscan -- /dev/hdc1  [  16.80 GB] Primary  LVM partition [0x8E]
> >>lvmdiskscan -- /dev/hda1  [  47.03 MB] Primary  LINUX native partition 
> >>[0x83]
> >>lvmdiskscan -- /dev/hda2  [   4.88 GB] Primary  LINUX native partition 
> >>[0x83]
> >>lvmdiskscan -- /dev/hda3  [ 251.02 MB] Primary  LINUX swap partition [0x82]
> >>lvmdiskscan -- /dev/hda4  [  13.91 GB] Primary  LVM partition [0x8E]
> >>lvmdiskscan -- /dev/hdb1  [  38.16 GB] Primary  LVM partition [0x8E]
> >>...
> >>
> >>--- List of logical volumes ---
> >>pvdata -- logical volume "/dev/my_lvm/testlv" at offset   0
> >>pvdata -- logical volume struct at offset   1 is empty
> >>pvdata -- logical volume "/dev/my_lvm/music" at offset   2
> >>pvdata -- logical volume "/dev/my_lvm/home" at offset   3
> >>
> >>
> >>vgscan appears to run correctly:
> >>
> >>vgscan -- reading all physical volumes (this may take a while...)
> >>vgscan -- found exported volume group "my_lvmPV_EXP"
> >>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> >>vgscan -- WARNING: This program does not do a VGDA backup of your
> >>volume group
> >>
> >>But vgimport fails:
> >>vgimport storage /dev/hdg1 /dev/hdb1 /dev/hdc1 /dev/hde
> >>
> >>vgimport storage /dev/hde /dev/hdg1 /dev/hdb1 /dev/hdc1
> >>vgimport -- ERROR "pv_check_consistency_all_pv(): PE" exported volume 
> >>group "my_lvm" is inconsistent
> >>vgimport -- it's system id is "PV_EXPmy.host.name1034722745"
> >>
> >>
> >>vgimport -d storage /dev/hde /dev/hdg1 /dev/hdb1 /dev/hdc1
> >>---cut---
> >><22> pv_read_all_pe_of_vg -- /dev/hde with 23848 PE at address 80518D4
> >><22> pv_read_all_pe_of_vg -- AFTER LOOP of pv_read_pe
> >><22> pv_read_all_pe_of_vg -- /dev/hdb1 with 9768 PE at 8065008 for PV #0
> >><22> pv_read_all_pe_of_vg -- /dev/hdc1 with 4300 PE at 805FA98 for PV #1
> >><22> pv_read_all_pe_of_vg -- /dev/hdg1 with 19795 PE at 8081E00 for PV #2
> >><22> pv_read_all_pe_of_vg -- /dev/hde with 23848 PE at 80AC7F8 for PV #3
> >><22> pv_read_all_pe_of_vg -- LEAVING with ret: 0
> >><1> vg_read_with_pv_and_lv -- AFTER pv_read_all_pe_of_vg
> >><22> lv_read_all_lv -- CALLED
> >><333> vg_check_name -- CALLED with VG: my_lvmPV_EXP
> >><4444> lvm_check_chars -- CALLED with name: "my_lvmPV_EXP"
> >><4444> lvm_check_chars -- LEAVING with ret: 0
> >><333> vg_check_name -- LEAVING with ret: 0
> >><333> vg_read -- CALLED
> >><4444> vg_check_name -- CALLED with VG: my_lvmPV_EXP
> >><55555> lvm_check_chars -- CALLED with name: "my_lvmPV_EXP"
> >><55555> lvm_check_chars -- LEAVING with ret: 0
> >><4444> vg_check_name -- LEAVING with ret: 0
> >><4444> pv_read_all_pv_of_vg -- CALLED with vg_name: "my_lvmPV_EXP"
> >><55555> vg_check_name -- CALLED with VG: my_lvmPV_EXP
> >><666666> lvm_check_chars -- CALLED with name: "my_lvmPV_EXP"
> >><666666> lvm_check_chars -- LEAVING with ret: 0
> >><55555> vg_check_name -- LEAVING with ret: 0
> >><4444> pv_read_all_pv_of_vg -- LEAVING with ret: 0
> >><333> vg_read -- pv[0]->pv_name: "/dev/hdb1"
> >><333> vg_read -- pv[1]->pv_name: "/dev/hdc1"
> >><333> vg_read -- pv[2]->pv_name: "/dev/hdg1"
> >><333> vg_read -- pv[3]->pv_name: "/dev/hde"
> >><4444> vg_read_from_pv -- CALLED
> >><55555> pv_check_name -- CALLED with "/dev/hdb1"
> >><666666> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> >><666666> lvm_check_chars -- LEAVING with ret: 0
> >><55555> pv_check_name -- LEAVING with ret: 0
> >><55555> pv_read -- CALLED with /dev/hdb1
> >><666666> pv_check_name -- CALLED with "/dev/hdb1"
> >><7777777> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> >><7777777> lvm_check_chars -- LEAVING with ret: 0
> >><666666> pv_check_name -- LEAVING with ret: 0
> >><55555> pv_read -- going to read /dev/hdb1
> >><666666> lvm_check_dev -- CALLED
> >><7777777> lvm_check_partitioned_dev -- CALLED
> >><88888888> lvm_get_device_type called
> >><88888888> lvm_get_device_type leaving with 0
> >><7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
> >><666666> lvm_check_dev -- LEAVING with ret: 1
> >><666666> pv_copy_from_disk -- CALLED
> >><666666> pv_copy_from_disk -- LEAVING ret = 0x804ec20
> >><666666> pv_create_name_from_kdev_t -- CALLED with 3:65
> >><7777777> lvm_check_dev -- CALLED
> >><88888888> lvm_check_partitioned_dev -- CALLED
> >><999999999> lvm_get_device_type called
> >><999999999> lvm_get_device_type leaving with 0
> >><88888888> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
> >><7777777> lvm_check_dev -- LEAVING with ret: 1
> >><7777777> lvm_dir_cache -- CALLED
> >><7777777> lvm_dir_cache -- LEAVING with ret: 20
> >><666666> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdb1
> >><666666> system_id_check_exported -- CALLED
> >><666666> system_id_check_exported -- LEAVING with ret: 1
> >><55555> pv_read -- LEAVING with ret: -279
> >><55555> vg_copy_from_disk -- CALLED
> >><666666> vg_check_vg_disk_t_consistency -- CALLED
> >><7777777> vg_check_name -- CALLED with VG:
> >><88888888> lvm_check_chars -- CALLED with name: ""
> >><88888888> lvm_check_chars -- LEAVING with ret: 0
> >><7777777> vg_check_name -- LEAVING with ret: 0
> >><666666> vg_check_vg_disk_t_consistency -- LEAVING with ret: 0
> >><55555> vg_copy_from_disk -- LEAVING
> >><4444> vg_read_from_pv -- LEAVING with ret: -364
> >><333> vg_read -- LEAVING with ret: -364
> >><22> lv_read_all_lv -- lv_max: 256
> >><22> lv_read_all_lv -- BEFORE pv_read_all_pv_of_vg
> >><333> pv_read_all_pv_of_vg -- CALLED with vg_name: "my_lvmPV_EXP"
> >><4444> vg_check_name -- CALLED with VG: my_lvmPV_EXP
> >><55555> lvm_check_chars -- CALLED with name: "my_lvmPV_EXP"
> >><55555> lvm_check_chars -- LEAVING with ret: 0
> >><4444> vg_check_name -- LEAVING with ret: 0
> >><333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
> >><333> lv_copy_from_disk -- CALLED
> >><333> lv_copy_from_disk -- LEAVING
> >><333> lv_copy_from_disk -- CALLED
> >><333> lv_copy_from_disk -- LEAVING
> >><333> lv_copy_from_disk -- CALLED
> >><333> lv_copy_from_disk -- LEAVING
> >><22> lv_read_all_lv -- l: 256  nl: 3  vg_this->lv_cur: 3
> >><22> lv_read_all_lv -- LEAVING with ret: 0
> >><1> vg_read_with_pv_and_lv -- AFTER lv_read_all_lv; vg_this->pv_cur: 4 
> >>vg_this->pv_max: 256  ret: 0
> >><1> vg_read_with_pv_and_lv -- BEFORE for PE
> >><1> vg_read_with_pv_and_lv -- AFTER for PE
> >><1> vg_read_with_pv_and_lv -- BEFORE for LV
> >><1> vg_read_with_pv_and_lv -- vg_this->lv[0]->lv_allocated_le: 15360
> >><1> vg_read_with_pv_and_lv -- vg_this->lv[2]->lv_allocated_le: 18688
> >><1> vg_read_with_pv_and_lv -- vg_this->lv[3]->lv_allocated_le: 512
> >><22> vg_setup_pointers_for_snapshots -- CALLED
> >><22> vg_setup_pointers_for_snapshots -- LEAVING
> >><1> vg_read_with_pv_and_lv -- LEAVING with ret: 0
> >><1> vg_check_consistency_with_pv_and_lv -- CALLED
> >><22> vg_check_consistency -- CALLED
> >><333> vg_check_name -- CALLED with VG: my_lvmPV_EXP
> >><4444> lvm_check_chars -- CALLED with name: "my_lvmPV_EXP"
> >><4444> lvm_check_chars -- LEAVING with ret: 0
> >><333> vg_check_name -- LEAVING with ret: 0
> >><22> vg_check_consistency -- LEAVING with ret: 0
> >><22> pv_check_consistency_all_pv -- CALLED
> >><333> vg_check_consistency -- CALLED
> >><4444> vg_check_name -- CALLED with VG: my_lvmPV_EXP
> >><55555> lvm_check_chars -- CALLED with name: "my_lvmPV_EXP"
> >><55555> lvm_check_chars -- LEAVING with ret: 0
> >><4444> vg_check_name -- LEAVING with ret: 0
> >><333> vg_check_consistency -- LEAVING with ret: 0
> >><333> pv_check_consistency -- CALLED
> >><4444> pv_check_name -- CALLED with "/dev/hdb1"
> >><55555> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> >><55555> lvm_check_chars -- LEAVING with ret: 0
> >><4444> pv_check_name -- LEAVING with ret: 0
> >><4444> vg_check_name -- CALLED with VG: my_lvmPV_EXP
> >><55555> lvm_check_chars -- CALLED with name: "my_lvmPV_EXP"
> >><55555> lvm_check_chars -- LEAVING with ret: 0
> >><4444> vg_check_name -- LEAVING with ret: 0
> >><4444> pv_check_new -- CALLED
> >><4444> pv_check_new -- LEAVING with ret: 0
> >><333> pv_check_consistency -- LEAVING with ret: 0
> >><333> pv_check_consistency -- CALLED
> >><4444> pv_check_name -- CALLED with "/dev/hdc1"
> >><55555> lvm_check_chars -- CALLED with name: "/dev/hdc1"
> >><55555> lvm_check_chars -- LEAVING with ret: 0
> >><4444> pv_check_name -- LEAVING with ret: 0
> >><4444> vg_check_name -- CALLED with VG: my_lvmPV_EXP
> >><55555> lvm_check_chars -- CALLED with name: "my_lvmPV_EXP"
> >><55555> lvm_check_chars -- LEAVING with ret: 0
> >><4444> vg_check_name -- LEAVING with ret: 0
> >><4444> pv_check_new -- CALLED
> >><4444> pv_check_new -- LEAVING with ret: 0
> >><333> pv_check_consistency -- LEAVING with ret: 0
> >><333> pv_check_consistency -- CALLED
> >><4444> pv_check_name -- CALLED with "/dev/hdg1"
> >><55555> lvm_check_chars -- CALLED with name: "/dev/hdg1"
> >><55555> lvm_check_chars -- LEAVING with ret: 0
> >><4444> pv_check_name -- LEAVING with ret: 0
> >><4444> vg_check_name -- CALLED with VG: my_lvmPV_EXP
> >><55555> lvm_check_chars -- CALLED with name: "my_lvmPV_EXP"
> >><55555> lvm_check_chars -- LEAVING with ret: 0
> >><4444> vg_check_name -- LEAVING with ret: 0
> >><4444> pv_check_new -- CALLED
> >><4444> pv_check_new -- LEAVING with ret: 0
> >><333> pv_check_consistency -- LEAVING with ret: 0
> >><22> pv_check_consistency_all_pv -- LEAVING with ret: -212
> >><1> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: -212
> >><1> lvm_error -- CALLED with: -212
> >><1> lvm_error -- LEAVING with: "pv_check_consistency_all_pv(): PE"
> >>vgimport -- ERROR "pv_check_consistency_all_pv(): PE" exported volume 
> >>group "my_lvm" is inconsistent
> >>vgimport -- it's system id is "PV_EXPmy.host.name1034722745"
> >>
> >><1> lvm_unlock -- CALLED
> >><1> lvm_unlock -- LEAVING with ret: 0
> >>
> >>
> >>
> >>
> >>
> >>pvdata -PP /dev/hdg1
> >>--- Physical volume ---
> >>PV Name               /dev/hdg1
> >>VG Name               my_lvmPV_EXP
> >>PV Size               76.33 GB [160075695 secs] / NOT usable 4.19 MB 
> >>[LVM: 205 KB]
> >>PV#                   3
> >>PV Status             available
> >>Allocatable           yes (but full)
> >>Cur LV                2
> >>PE Size (KByte)       4096
> >>Total PE              19795
> >>Free PE               0
> >>Allocated PE          19795
> >>PV UUID               LrbEp4-ofHi-xbK4-NTnA-PHtC-OmZz-KSu3zg
> >>pv_dev                   0:34
> >>system_id                PV_EXPmy.host.name1034722745
> >>pv_on_disk.base          0
> >>pv_on_disk.size          1024
> >>vg_on_disk.base          4096
> >>vg_on_disk.size          4096
> >>pv_uuidlist_on_disk.base 8192
> >>pv_uuidlist_on_disk.size 32896
> >>lv_on_disk.base          45056
> >>lv_on_disk.size          84296
> >>pe_on_disk.base          131072
> >>pe_on_disk.size          4259840
> >>
> >>
> >>
> >>pvdata -PP /dev/hdc1
> >>--- Physical volume ---
> >>PV Name               /dev/hdc1
> >>VG Name               my_lvmPV_EXP
> >>PV Size               16.80 GB [35239617 secs] / NOT usable 4.19 MB 
> >>[LVM: 144 KB]
> >>PV#                   2
> >>PV Status             available
> >>Allocatable           yes (but full)
> >>Cur LV                2
> >>PE Size (KByte)       4096
> >>Total PE              4300
> >>Free PE               0
> >>Allocated PE          4300
> >>PV UUID               tHIk77-ZUfH-PM5J-THWw-isIZ-jXCP-7wRfKx
> >>pv_dev                   0:22
> >>system_id                PV_EXPmy.host.name1034722745
> >>pv_on_disk.base          0
> >>pv_on_disk.size          1024
> >>vg_on_disk.base          4096
> >>vg_on_disk.size          4096
> >>pv_uuidlist_on_disk.base 8192
> >>pv_uuidlist_on_disk.size 32896
> >>lv_on_disk.base          45056
> >>lv_on_disk.size          84296
> >>pe_on_disk.base          131072
> >>pe_on_disk.size          4259840
> >>
> >>
> >>pvdata -PP /dev/hdb1
> >>--- Physical volume ---
> >>PV Name               /dev/hdb1
> >>VG Name               my_lvmPV_EXP
> >>PV Size               38.16 GB [80035767 secs] / NOT usable 4.19 MB 
> >>[LVM: 166 KB]
> >>PV#                   1
> >>PV Status             available
> >>Allocatable           yes (but full)
> >>Cur LV                2
> >>PE Size (KByte)       4096
> >>Total PE              9768
> >>Free PE               0
> >>Allocated PE          9768
> >>PV UUID               SVMkOB-j3cN-V7ZT-Ru86-fIQS-9uFL-JykVaI
> >>pv_dev                   0:3
> >>system_id                PV_EXPmy.host.name1034722745
> >>pv_on_disk.base          0
> >>pv_on_disk.size          1024
> >>vg_on_disk.base          4096
> >>vg_on_disk.size          4096
> >>pv_uuidlist_on_disk.base 8192
> >>pv_uuidlist_on_disk.size 32896
> >>lv_on_disk.base          45056
> >>lv_on_disk.size          84296
> >>pe_on_disk.base          131072
> >>pe_on_disk.size          4259840
> >>
> >>
> >>pvdata -PPV /dev/hde
> >>--- Physical volume ---
> >>PV Name               /dev/hde
> >>VG Name               my_lvmPV_EXP
> >>PV Size               93.16 GB [195371568 secs] / NOT usable 4.25 MB 
> >>[LVM: 221 KB]
> >>PV#                   4
> >>PV Status             available
> >>Allocatable           yes
> >>Cur LV                1
> >>PE Size (KByte)       4096
> >>Total PE              23848
> >>Free PE               22895
> >>Allocated PE          953
> >>PV UUID               5M4kvR-aYFr-Ai8L-EaO0-8KuR-dEkq-LjsHts
> >>pv_dev                   0:33
> >>system_id                PV_EXPmy.host.name1034722745
> >>pv_on_disk.base          0
> >>pv_on_disk.size          1024
> >>vg_on_disk.base          4096
> >>vg_on_disk.size          4096
> >>pv_uuidlist_on_disk.base 8192
> >>pv_uuidlist_on_disk.size 32896
> >>lv_on_disk.base          45056
> >>lv_on_disk.size          84296
> >>pe_on_disk.base          131072
> >>pe_on_disk.size          4325376
> >>
> >>
> >>--- Volume group ---
> >>VG Name
> >>VG Access             read/write
> >>VG Status             NOT available/exported/resizable
> >>VG #                  0
> >>MAX LV                256
> >>Cur LV                3
> >>Open LV               0
> >>MAX LV Size           255.99 GB
> >>Max PV                256
> >>Cur PV                4
> >>Act PV                4
> >>VG Size               224.43 GB
> >>PE Size               4 MB
> >>Total PE              57455
> >>Alloc PE / Size       34560 / 135 GB
> >>Free  PE / Size       22895 / 89.43 GB
> >>VG UUID               BmXG6A-AV6g-db4z-yPaj-4mnI-2hme-AqBKI7
> >>
> >>
> >>_______________________________________________
> >>linux-lvm mailing list
> >>linux-lvm@sistina.com
> >>http://lists.sistina.com/mailman/listinfo/linux-lvm
> >>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> > 
> > *** Software bugs are stupid.
> >     Nevertheless it needs not so stupid people to solve them ***
> > 
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > 
> > Heinz Mauelshagen                                 Sistina Software Inc.
> > Senior Consultant/Developer                       Am Sonnenhang 11
> >                                                   56242 Marienrachdorf
> >                                                   Germany
> > Mauelshagen@Sistina.com                           +49 2626 141200
> >                                                        FAX 924446
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> > 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
