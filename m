From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] help needed
Message-ID: <20030602174554.A6902@sistina.com>
References: <23233866A70C32479532C8D0B8AE7B96032AAC9B@i2km07-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
In-Reply-To: <23233866A70C32479532C8D0B8AE7B96032AAC9B@i2km07-ukbr.domain1.systemhost.net>; from narsimha.kulkarni@bt.com on Mon, Jun 02, 2003 at 04:19:32PM +0100
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
Date: Mon Jun  2 10:56:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Run

pvcreate -ff ...

on all its PVs -or-

dd if=/dev/zero of=/dev/... bs=512 

in case you don't like having new PVs.

Regards,
Heinz    -- The LVM Guy --

On Mon, Jun 02, 2003 at 04:19:32PM +0100, narsimha.kulkarni@bt.com wrote:
> no there is no backup of the metadata.
> otherwise i could have restored it using vgcfgrestore and all.
> that is the problem basically..... 
> no backup and want to either isolate the physical volume from the inactive
> volume group or restore and then delete the volume group....
> is there any way to delete the volume group when there is no metadata
> 
> -----Original Message-----
> From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
> Sent: 02 June 2003 16:03
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] help needed
> 
> 
> On Mon, Jun 02, 2003 at 02:04:25PM +0100, narsimha.kulkarni@bt.com wrote:
> > but Heinz is there anyway I can restore a vol group whose .conf file has
> > been deleted
> 
> Heh! ;)
> 
> You don't want to tell me that the metadata backup files weren't included
> in your regular backup ?
> 
> > 
> > -----Original Message-----
> > From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
> > Sent: 02 June 2003 10:34
> > To: linux-lvm@sistina.com
> > Subject: Re: [linux-lvm] help needed
> > 
> > 
> > On Fri, May 30, 2003 at 09:42:00AM +0530, Sameer Halgatti wrote:
> > > hi narsimha,
> > > If u want to completely remove ur PV (i.e. if u want to lose ur data)
> then
> > > there is a very simple way to get rid of this problem. Just do
> > following....
> > > dd of=/dev/hda3                  ......hda3 becuse ur PV resides on that
> > > <enter approx 50 chars>
> > > <press cntrl+d>
> > > 
> > 
> > This avoids that you type something LVM might consider to be valid
> metadata
> > ;)
> > 
> > dd if=/dev/zero of=/dev/hda3 bs=512
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> > 
> > 
> > > Of course it not the recommend solution, but it will solve ur problem
> :-)
> > > Actually ur VGDA data on the disk may be corrupted, that's why u r
> getting
> > > this error message.
> > > When u create a PV/VG, some data is written on the disk (on some initial
> > > disk blocks). So if u erase that by doing 'dd', then u can create fresh
> > > PV/VG using that disk.
> > > 
> > > 
> > > ----- Original Message -----
> > > From: <narsimha.kulkarni@bt.com>
> > > To: <linux-lvm@sistina.com>
> > > Sent: Thursday, May 29, 2003 8:03 PM
> > > Subject: [linux-lvm] help needed
> > > 
> > > 
> > > > hi following is the log of the commands....
> > > > i want to remove the volume group completely....
> > > > or i want to restore it....
> > > >
> > > > how do i do it
> > > >
> > > > vgscan -- reading all physical volumes (this may take a while...)
> > > > vgscan -- found active volume group "helena_vg"
> > > > vgscan -- ERROR "lv_read_all_lv(): number of LV" can't get data of
> > volume
> > > > group)
> > > > vgscan -- found active volume group "volg"
> > > > vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> > > > vgscan -- WARNING: This program does not do a VGDA backup of your
> volume
> > > > groups
> > > >
> > > > vgremove -- ERROR: can't remove active volume group "helena_vg"
> > > >
> > > >
> > > > vgcfgrestore -- locking logical volume manager
> > > > vgcfgrestore -- restoring volume group "helena_vg" from
> > > > "/etc/lvmconf/helena_vg.conf"
> > > > vgcfgrestore -- checking existence of "/etc/lvmconf/helena_vg.conf"
> > > > vgcfgrestore -- "/etc/lvmconf/helena_vg.conf" doesn't exist
> > > > vgcfgrestore -- a backup for volume group helena_vg is not available
> > > >
> > > >
> > > > pvscan -- reading all physical volumes (this may take a while...)
> > > > pvscan -- inactive PV "/dev/hda3"  is associated to an unknown VG (run
> > > > vgscan)
> > > > pvscan -- ACTIVE   PV "/dev/hdb1" of VG "volg"      [31.48 GB / 31.48
> GB
> > > > free]
> > > > pvscan -- total: 2 [39.08 GB] / in use: 2 [39.08 GB] / in no VG: 0 [0]
> > > >
> > > > pvchange -- locking logical volume manager
> > > > pvchange -- reading physical volume data /dev/hda3 from disk
> > > > pvchange -- checking physical volume "/dev/hda3" consistency
> > > > pvchange -- finding volume group of physical volume "/dev/hda3"
> > > > pvchange -- unable to find volume group of "/dev/hda3" (VG not
> active?)
> > > > pvchange -- unlocking logical volume manager
> > > > pvchange -- 0 physical volumes changed / 0 physical volumes already
> o.k.
> > > >
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@sistina.com
> > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > > 
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> > *** Software bugs are stupid.
> >     Nevertheless it needs not so stupid people to solve them ***
> > 
> >
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > =-
> > 
> > Heinz Mauelshagen                                 Sistina Software Inc.
> > Senior Consultant/Developer                       Am Sonnenhang 11
> >                                                   56242 Marienrachdorf
> >                                                   Germany
> > Mauelshagen@Sistina.com                           +49 2626 141200
> >                                                        FAX 924446
> >
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > =-
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> -- 
> 
> Regards,
> Heinz    -- The LVM Guy --
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
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
