From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] removing a failed disk from VG
Message-ID: <20030128114724.A17531@sistina.com>
References: <E18dFrq-00042Q-00@adroit.an-dns.com>
Mime-Version: 1.0
In-Reply-To: <E18dFrq-00042Q-00@adroit.an-dns.com>; from alois@pustertal-info.net on Mon, Jan 27, 2003 at 09:28:08PM +0100
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
Date: Tue Jan 28 04:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 27, 2003 at 09:28:08PM +0100, Alois Schneider wrote:
> I had a VG scsi_vg consisting of 4 PV's (sda1, sdb1, hdb1,hdc1). 
> Now /dev/sdb1 failed and was no longer recogniced by th SCSI-
> controller. I had to remove it.
> 

Alois,

then you probably lost data with the gone disk. Backup time :-(
Please make sure that you've got backups of /etc/lvmconf/* and /etc/lvmtab*
before you proceed.

There's 2 options:

a. you get a replacement drive (which can be a loop device)
   of the same size (4G), run pvcreate on it, restore the metadata onto
   it (vgcfgrestore) and run "vgscan ; vgchange -ay"

b. you implement LVM2/device-mapper and run "vgscan ; vgchange -P -ay", which
   will activate your VG without the missing drive. This solution enables
   you to retrieve the data still accessable _but_ won't let you change
   your volume group configuration. We are working on an enhancement supporting
   such changes.

Regards,
Heinz    -- The LVM Guy --


> vgscan now fails with the following error:
> 
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data 
> of volume group "scsi_vg" from physical volume(s)
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your 
> volume group
>  
> vgchange -ay gives
> -- no volume group found
> 
> The remaining PV's seem to be ok and the failed disk was only 4Gb 
> large.
> 
> Here is the output of pvdisplay:
> 
> --- Physical volume ---
> PV Name               /dev/sda1
> VG Name               scsi_vg
> PV Size               4.04 GB [8466192 secs] / NOT usable 1.88 MB 
> [LVM: 125 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              1033
> Free PE               0
> Allocated PE          1033
> PV UUID               pJsMFv-ci9Q-orNK-3cRr-2aTl-w1N9-TEHDI1
> 
> 
> --- Physical volume ---
> PV Name               /dev/hdb1
> VG Name               scsi_vg
> PV Size               76.69 GB [160826652 secs] / NOT usable 4.25 MB 
> [LVM: 200 KB]
> PV#                   3
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                2
> PE Size (KByte)       4096
> Total PE              19631
> Free PE               0
> Allocated PE          19631
> PV UUID               u5I40y-Op34-nnVV-aInj-Jekc-VJT7-s2q8OK
> 
> 
> --- Physical volume ---
> PV Name               /dev/hdc1
> VG Name               scsi_vg
> PV Size               19.01 GB [39873267 secs] / NOT usable 4.18 MB 
> [LVM: 143 KB]
> PV#                   5
> PV Status             available
> Allocatable           yes
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              4866
> Free PE               2040
> Allocated PE          2826
> PV UUID               3PCGsY-hUr6-QEUt-MkoJ-fKlX-24vG-pS0HJY
> 
> What can I do? How can I remove the no longer existing PV sdb1 from 
> scsi_vg?
> 
> Any help will be appreciated.
> Regards
> Alois
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
