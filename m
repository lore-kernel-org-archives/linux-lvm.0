From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM1 and a dying disk
Message-ID: <20030903143730.D2618@sistina.com>
References: <3F55ABF8.40608@webhackande.se> <20030903111442.C2618@sistina.com> <3F55C7F7.1090305@webhackande.se>
Mime-Version: 1.0
In-Reply-To: <3F55C7F7.1090305@webhackande.se>; from richie@webhackande.se on Wed, Sep 03, 2003 at 12:52:39PM +0200
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
Date: Wed Sep  3 07:46:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 03, 2003 at 12:52:39PM +0200, Rickard Olsson wrote:
> Heinz J . Mauelshagen wrote:
> 
> > you say that you don't have a recent LVM metadata backup reflecting
> > your VG with /dev/ide/host0/bus1/target0/lun0/disc in it ?
> 
> I found a files_vg.conf and put it in /etc/lvmconf, did pvcreate and 
> successful vgcfgrestores on all of them. I had to move the disks around 
> a bit to make them appear in their old places since they're now in a new 
> machine (vgcfgrestore complained otherwise).

"vgcfgrestore -o ..." does the trick without moving disks around
(which might be completely impossible with certain path changes anyway).
"-o" takes the old path, which has been stored in the metadata backup.

"vgcfgrestore -ll ..." long lists the VG metadata stored in the backup.

> The bad disk is now at 
> /dev/ide/host2/bus1/target1/lun0/disc
> 
> 
> majestix root # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/ide/host4/bus1/target0/lun0/disc" of VG "f2" 
>        [
> 149 GB / 0 free]
> pvscan -- inactive PV "/dev/ide/host2/bus1/target0/lun0/disc"  is 
> associated to
> unknown VG "files_vg" (run vgscan)
> pvscan -- inactive PV "/dev/ide/host2/bus1/target1/lun0/disc"  is 
> associated to
> unknown VG "files_vg" (run vgscan)
> pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/disc"  is 
> associated to
> unknown VG "files_vg" (run vgscan)
> pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/disc"  is 
> associated to
> unknown VG "files_vg" (run vgscan)
> pvscan -- inactive PV "/dev/ide/host0/bus1/target0/lun0/disc"  is 
> associated to
> unknown VG "files_vg" (run vgscan)
> pvscan -- inactive PV "/dev/ide/host0/bus1/target1/lun0/disc"  is 
> associated to
> unknown VG "files_vg" (run vgscan)
> pvscan -- total: 7 [819.79 GB] / in use: 7 [819.79 GB] / in no VG: 0 [0]
> 
> 
> majestix root # vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "f2"
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
> volume
> group "files_vg" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume 
> groups
> 
> 
> majestix root # pvdata /dev/ide/host2/bus1/target1/lun0/disc
> --- Physical volume ---
> PV Name               /dev/ide/host2/bus1/target1/lun0/disc
> VG Name               files_vg
> PV Size               93.16 GB [195371568 secs] / NOT usable 16.19 MB 
> [LVM: 151
> KB]
> PV#                   4
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       16384
> Total PE              5961
> Free PE               0
> Allocated PE          5961
> PV UUID               KsET9a-qoKI-a2gr-z1GB-jwM1-vFw7-qHgxeZ
> 
> --- Volume group ---
> VG Name
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                1
> Open LV               0
> MAX LV Size           1023.97 GB
> Max PV                256
> Cur PV                6
> Act PV                6
> VG Size               670.61 GB
> PE Size               16 MB
> Total PE              42919
> Alloc PE / Size       42919 / 670.61 GB
> Free  PE / Size       0 / 0
> VG UUID               Z9MJ9w-UjoI-BO9X-rAb0-DPtF-pXqO-Haiji7
> 
> --- List of logical volumes ---
> 
> pvdata -- logical volume "/dev/files_vg/files_lv" at offset   0
> pvdata -- logical volume struct at offset   1 is empty
> [...]
> 
> 
> What did I do wrong (this time)?

Hmmm, if you pvcreated+vgcfgrestored every PV fine, nothing.

Could you send the output of "pvdata -UPP" for all your PVs of "files_vg"
and files_vg.conf to me in private email, please.


> 
>     / Rickard Olsson,IT-Konsult/
>    / Telefon: +46 70 635 01 42/
>   / http://www.webhackande.se/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

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
