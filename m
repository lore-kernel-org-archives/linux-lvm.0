From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] RE: ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "data_disks" from physical volume(s)
Message-ID: <20020704113454.D9129@sistina.com>
References: <JPELLJPKALBKDDKAFGGLEEFECDAA.lw@mih-assoc.com> <JPELLJPKALBKDDKAFGGLAEFGCDAA.lw@mih-assoc.com>
Mime-Version: 1.0
In-Reply-To: <JPELLJPKALBKDDKAFGGLAEFGCDAA.lw@mih-assoc.com>; from lw@mih-assoc.com on Wed, Jul 03, 2002 at 02:25:20PM +0100
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
Date: Thu Jul  4 04:43:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jul 03, 2002 at 02:25:20PM +0100, Leigh Waldie wrote:
> Further...
> 
> Output from pvdata /dev/hde reveals that there is no vg info on the disk,
> however there is vg info on the second disk /dev/hdb...

Then the vgcfgrestore must have been unsuccessfull :(

"vgchange -an" is not needed. It doesn't write to the PVs it just tries
to deactivate the VGs in core.

> 
> Is there any way of recovering the vg info from hdb onto hde ?

vgcfgrestore!

Look with "vgcfgrestore -ll ..." if your backup fits your config,
run

	pvcreate -ff /dev/hde

and

	vgcfgrestore -n data_disks -f /etc/lvmconf/YourPreferedArchive /dev/hde

and

	vgscan ; vgchange -ay


That should do the trick.


The open question is, what overwrote your LVM metadata (and hopefully just
it) on /dev/hde in the first place.

Regards,
Heinz    -- The LVM Guy --


> 
> Leigh Waldie
> 
> -----Original Message-----
> From: Leigh Waldie [mailto:lw@mih-assoc.com]
> Sent: 03 July 2002 10:51
> To: linux-lvm@sistina.com
> Subject: ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
> volume group "data_disks" from physical volume(s)
> 
> 
> Dear List,
> 
> I have seen this problem in the archives, but cannot find a solution that
> works for me.
> 
> Redhat 7.3 kernel 2.4.18-5
> LVM module LVM version 1.0.1-rc4(ish)(03/10/2001)
> 
> I have two physical disks /dev/hde and /dev/hdb configured in LVM as Volume
> Group data_disks.
> 
> I shutdown the system to add a new disk , but I did not execute
> "vgchange -an" - my big mistake I think.
> 
> Having rebooted with the new disk I now have a problem trying to mount the
> original vg.
> 
> The /proc/lvm/VGs directory is empty and /dev/data_disks is gone.
> 
> pvdisplay shows that the physical volumes are seemingly intact and still
> have the correct configuration.
> 
> I have tried restoring the config from /etc/lvmconf/data_disks.conf to the
> disks using vgcfgrestore - this makes no difference to my problem.
> 
> Basically, everything looks ok physically, but I need to figure out why
> vgscan cant read the disks.
> 
> I have appended the output of vgscan,pvscan and pvdisplay below.
> 
> Thanks for any help anyone can offer...
> 
> Leigh Waldie
> "desperately hoping I dont have to restore 190GB from CDs"
> 
> vgscan gives:
> 
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
> volume group "data_disks" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> 
> and pvscan gives:
> 
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hde"  is associated to unknown VG "data_disks"
> (run vgscan)
> pvscan -- inactive PV "/dev/hdb"  is associated to unknown VG "data_disks"
> (run vgscan)
> pvscan -- total: 2 [191.02 GB] / in use: 2 [191.02 GB] / in no VG: 0 [0]
> 
> pvdisplay /dev/hde:
> 
> PV Name               /dev/hde
> VG Name               data_disks
> PV Size               152.67 GB [320173056 secs] / NOT usable 4.31 MB [LVM:
> 280 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              39082
> Free PE               0
> Allocated PE          39082
> PV UUID               KrYG4H-I9DI-3shN-1DnA-oXzh-uaDS-t4h55e
> 
> pvdisplay /dev/hdb:
> 
> PV Name               /dev/hdb
> VG Name               data_disks
> PV Size               38.35 GB [80418240 secs] / NOT usable 4.19 MB [LVM:
> 166 KB]
> PV#                   2
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              9815
> Free PE               0
> Allocated PE          9815
> PV UUID               eYw77b-g1s6-mWyO-avX2-z0mM-SXLE-Q6ZqUD
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.372 / Virus Database: 207 - Release Date: 20/06/2002
> 
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.372 / Virus Database: 207 - Release Date: 20/06/2002
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
