Date: Mon, 22 Mar 2004 11:04:43 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] It never rains...
Message-ID: <20040322100443.GA11567@redhat.com>
References: <OFA503F7CB.EA7425E4-ON80256E5D.002A1936-80256E5D.002BCF6E@uk.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFA503F7CB.EA7425E4-ON80256E5D.002A1936-80256E5D.002BCF6E@uk.ibm.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: hjm@redhat.com


On Sat, Mar 20, 2004 at 08:02:03AM +0000, Chris Laycock wrote:
> Hi All, 
> 
> Had a bit a disaster, lost 1 disk from a 3 disk VG and the root partition! 
> All  on fully patched RH 9 system.
> I realise that I need to attach the 2 remaining PV to a LV and VG but if I 
> do the usual vgcreate, lvcreate & pvcreate I'll end up with two dataless 
> disks.

No, you need to replace the failed drive, pvcreate the new one (same size
as the dead one!) and vgcfgrestore the LVM metadata (see /etc/lvmconf/ and
the vgcfgrestore manual page) to it in order to be able to vgscan+vgchange
successfully.

Presumably your 2 surviving drives have most of the data allocated you should
be able to gain access to (most of) your data.
lvdisplay -v ... and pvdisplay -v ... are your friends to display the
actual mappings of LVs to PVs and vice/versa once you recovered
with vgcfgrestore.


> I luckly do have backups of some of the more important data but there not 
> a recenct as I'd like and don't contain all of the data or the root 
> partition.

If critical data is allocated to the dead drive (eg, start of LV and
a contained filesystem), you're in trouble and your (out-of-date) backup
is your best bet.

FYI: LVM2 has a --partial option for vgchange which will activate your VG
     ignoring any missing PVs.

Regards,
Heinz    -- The LVM Guy --


> 
> Outputs from:
> 
> vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
> volume group "datavg" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume 
> group
> 
> pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/sda1"  is associated to unknown VG "datavg" 
> (run vgscan)
> pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "datavg" 
> (run vgscan)
> pvscan -- total: 2 [45.75 GB] / in use: 2 [45.75 GB] / in no VG: 0 [0]
> 
> pvdisplay /dev/hdc1
> 
> --- Physical volume ---
> PV Name               /dev/hdc1
> VG Name               datavg
> PV Size               37.28 GB [78172227 secs] / NOT usable 4.19 MB [LVM: 
> 165 KB]
> PV#                   2
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              9541
> Free PE               0
> Allocated PE          9541
> PV UUID               vozLHH-585D-SSjH-XM9b-A8g2-888k-5tZWI0
> 
> The two remaining disks are /dev/hdc1 & /dev/sda1
> 
> Thanks in advance
> 
> Regards,
> Chris.
> 
> -------------------
> Chris Laycock
> IT Specialist 
> IBM Global Services (IDO)
> 
> LITS, Stevenage
> Mail point: K3 STEV UK
> Email: LaycockC@uk.ibm.com
> Tel : (01438) 76-9460  (internal: 44-9460)
> 

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
