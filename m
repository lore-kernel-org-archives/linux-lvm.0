Date: Tue, 23 Mar 2004 15:58:28 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] It never rains...
Message-ID: <20040323145828.GB29071@redhat.com>
References: <20040322100443.GA11567@redhat.com>
	<OF6A31DE83.6DD8A933-ON80256E5F.0056D8B4-80256E5F.0059CA24@uk.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF6A31DE83.6DD8A933-ON80256E5F.0056D8B4-80256E5F.0059CA24@uk.ibm.com>
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
To: Chris Laycock <LAYCOCKC@uk.ibm.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, mauelshagen@redhat.com

On Mon, Mar 22, 2004 at 04:20:42PM +0000, Chris Laycock wrote:
> Heinz, et al
> 
> Sorry I failed to explain clearly what has happened. I have in fact lost 2 
> disks. 1 disk contained to /boot, / and the swap space, the other disk I 
> lost was from a 3 disk LVM called datavg.
> 
> I have rebuilt the system on a new disk but I have lost /etc/lvmconf, 
> therefore (I assume) I have no metadata to restore the VG from. 

Unless you have actual backups of /etc/lvmconf somewhere, I'm afraid so.

> 
> Unfortunately I don't have access to the system until later tonight to 
> test if you did in fact understand my poor explanation! 

If you really don't have actual LVM metadata backups:

in order to get to the other 2 PVs out of 3 in your VG, you want to use LVM2
and device-mapper and run "vgscan --partial".

Regards,
Heinz    -- The LVM Guy --


> 
> Many thanks,
> 
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
> 
> Please respond to mauelshagen@redhat.com; Please respond to LVM general 
> discussion and development <linux-lvm@redhat.com> 
> Sent by:        linux-lvm-bounces@redhat.com
> To:     LVM general discussion and development <linux-lvm@redhat.com>
> cc:     hjm@redhat.com 
> Subject:        Re: [linux-lvm] It never rains...
> 
> 
> 
> On Sat, Mar 20, 2004 at 08:02:03AM +0000, Chris Laycock wrote:
> > Hi All, 
> > 
> > Had a bit a disaster, lost 1 disk from a 3 disk VG and the root 
> partition! 
> > All  on fully patched RH 9 system.
> > I realise that I need to attach the 2 remaining PV to a LV and VG but if 
> I 
> > do the usual vgcreate, lvcreate & pvcreate I'll end up with two dataless 
> 
> > disks.
> 
> No, you need to replace the failed drive, pvcreate the new one (same size
> as the dead one!) and vgcfgrestore the LVM metadata (see /etc/lvmconf/ and
> the vgcfgrestore manual page) to it in order to be able to vgscan+vgchange
> successfully.
> 
> Presumably your 2 surviving drives have most of the data allocated you 
> should
> be able to gain access to (most of) your data.
> lvdisplay -v ... and pvdisplay -v ... are your friends to display the
> actual mappings of LVs to PVs and vice/versa once you recovered
> with vgcfgrestore.
> 
> 
> > I luckly do have backups of some of the more important data but there 
> not 
> > a recenct as I'd like and don't contain all of the data or the root 
> > partition.
> 
> If critical data is allocated to the dead drive (eg, start of LV and
> a contained filesystem), you're in trouble and your (out-of-date) backup
> is your best bet.
> 
> FYI: LVM2 has a --partial option for vgchange which will activate your VG
>      ignoring any missing PVs.
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> 
> > 
> > Outputs from:
> > 
> > vgscan
> > vgscan -- reading all physical volumes (this may take a while...)
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
> 
> > volume group "datavg" from physical volume(s)
> > vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> > vgscan -- WARNING: This program does not do a VGDA backup of your volume 
> 
> > group
> > 
> > pvscan
> > pvscan -- reading all physical volumes (this may take a while...)
> > pvscan -- inactive PV "/dev/sda1"  is associated to unknown VG "datavg" 
> > (run vgscan)
> > pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "datavg" 
> > (run vgscan)
> > pvscan -- total: 2 [45.75 GB] / in use: 2 [45.75 GB] / in no VG: 0 [0]
> > 
> > pvdisplay /dev/hdc1
> > 
> > --- Physical volume ---
> > PV Name               /dev/hdc1
> > VG Name               datavg
> > PV Size               37.28 GB [78172227 secs] / NOT usable 4.19 MB 
> [LVM: 
> > 165 KB]
> > PV#                   2
> > PV Status             available
> > Allocatable           yes (but full)
> > Cur LV                1
> > PE Size (KByte)       4096
> > Total PE              9541
> > Free PE               0
> > Allocated PE          9541
> > PV UUID               vozLHH-585D-SSjH-XM9b-A8g2-888k-5tZWI0
> > 
> > The two remaining disks are /dev/hdc1 & /dev/sda1
> > 
> > Thanks in advance
> > 
> > Regards,
> > Chris.
> > 
> > -------------------
> > Chris Laycock
> > IT Specialist 
> > IBM Global Services (IDO)
> > 
> > LITS, Stevenage
> > Mail point: K3 STEV UK
> > Email: LaycockC@uk.ibm.com
> > Tel : (01438) 76-9460  (internal: 44-9460)
> > 
> 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

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
