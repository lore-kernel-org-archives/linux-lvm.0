Message-ID: <B8E11CED6182E246A9A427A68A9F640670E595@OA4-SERVER.oa.oclc.org>
From: "Fought,Tom" <foughtt@oclc.org>
Subject: RE: [linux-lvm] pv problem?
Date: Wed, 17 Oct 2001 11:27:19 -0400
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

That was it Heinz. Thanks so much!

-----Original Message-----
From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
Sent: Tuesday, October 16, 2001 5:38 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] pv problem?



Tom,

you seem to have hit the gcc 2.96 or similar optimizer bug.

Please regenerate the LVM software *without* optimization (change "-O2"
to "-O0" in the configure script;run "make distclean";
run "./configure;make;make install").

With regard to PVs displayed as "NOT available": they simply belong
to a not activated volume group and hence have that status.

Regards,
Heinz    -- The LVM Guy --


On Tue, Oct 16, 2001 at 02:57:32PM -0400, Fought,Tom wrote:
> Just started working with LVM.
> I have 2 6GB IDE drives. Had test logical volumes working.
> Destroyed and attempted to create new PVs, VGs, LVs.
> I can create PVs, and VGs but I get a segmentation violation/core dump
> when trying to create LVs.
>  
> I have /dev/hdb1 and /dev/hdb2 assigned to a VG. 
> When I try to create an LV with lvcreate it errors out.
>  
> The curious thing for me is the pvdisplay.. the PVs have a 
> status of NOT Available. I am trying to determine why this would be.
>  
> Here is what I have:
> vgdisplay -v
> --- Volume group ---
> VG Name               testvg
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                255
> Cur LV                0
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                255
> Cur PV                2
> Act PV                2
> VG Size               3.80 GB
> PE Size               4.00 MB
> Total PE              974
> Alloc PE / Size       0 / 0
> Free  PE / Size       974 / 3.80 GB
> VG UUID               yawi5j-Trcb-fYu0-7xFZ-A467-63hW-MTJzMM
>  
> --- No logical volumes defined in "testvg" ---
>  
> 
> --- Physical volumes ---
> PV Name (#)           /dev/hdb1 (1)
> PV Status             available / allocatable
> Total PE / Free PE    487 / 487
>  
> PV Name (#)           /dev/hdb2 (2)
> PV Status             available / allocatable
> Total PE / Free PE    487 / 487
> 
>  
>  
> pvdisplay /dev/hdb1
> --- Physical volume ---
> PV Name               /dev/hdb1
> VG Name               testvg
> PV Size               1.91 GB / NOT usable 5.18 MB [LVM: 125.00 KB]
> PV#                   1
> PV Status             NOT available
> Allocatable           yes
> Cur LV                0
> PE Size (KByte)       4096
> Total PE              487
> Free PE               487
> Allocated PE          0
> PV UUID               CwulSL-NPB0-Bega-3tTP-S0qR-Nlcu-T3wYQb
>  
> pvdisplay /dev/hdb2
> --- Physical volume ---
> PV Name               /dev/hdb2
> VG Name               testvg
> PV Size               1.91 GB / NOT usable 5.21 MB [LVM: 125.00 KB]
> PV#                   2
> PV Status             NOT available
> Allocatable           yes
> Cur LV                0
> PE Size (KByte)       4096
> Total PE              487
> Free PE               487
> Allocated PE          0
> PV UUID               FyLY4F-odGj-1iHA-KRnD-YVhV-Mf8O-jlhB4z
>  
>  
> trying to create the lv... just the last part of debug included..
> lvcreate -d -v -L1G -n testlv testvg
>  
> <4444> pv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_on_pv -- LEAVING with ret: 1
> <22> pv_reserve_pe -- LEAVING with ret: 0
> <1> lv_setup_for_create -- pv_reserve_pe returned: 0   pe_last: 256  pe: 0
> <1> lv_setup_for_create -- pe: 0
> <1> lv_setup_for_create -- LEAVING with ret: 0
> lvcreate -- setting read ahead sectors
> <1> lvm_dont_interrupt -- CALLED
> <1> lvm_dont_interrupt -- LEAVING
> lvcreate -- creating logical volume VGDA in kernel
> Segmentation fault (core dumped)
>  

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
