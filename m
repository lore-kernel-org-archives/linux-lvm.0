Message-ID: <005a01c2608b$f3013b20$1c01a8c0@internal.tripnet.int>
From: "Robin Edgar - Tripany" <red@tripany.com>
References: <00cd01c25f0c$2990ffd0$1c01a8c0@internal.tripnet.int> <00f001c25f1b$3a24ef50$1c01a8c0@internal.tripnet.int> <20020918155938.A28041@sistina.com> <011401c25f21$b15f7da0$1c01a8c0@internal.tripnet.int> <20020919120453.C32578@sistina.com> <020301c25fca$239f7340$1c01a8c0@internal.tripnet.int> <20020919155047.B1017@sistina.com> <001d01c25fee$1ad09e50$1c01a8c0@internal.tripnet.int> <20020919210733.A2352@sistina.com>
Subject: Re: [linux-lvm] Help! unable to mount lv's - can't see why!
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Fri Sep 20 04:29:09 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thanks! I got hde1 back on the vg and I can access it now - I'm surprised
that the dd'ed hdb1 couldn't mount the lv's!
I'm now wondering why the dd copy wouldn't work, because in principle it
should have copied all the faulty blocks exactly (I did it @ 1k block
size)...
Last question (hopefully :)):
does pvmove delete all the files after it has copyed all the files or is it
copy a file, delete a file - I'm worried about the PC hanging during the
operation..

Robin

----- Original Message -----
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
To: <linux-lvm@sistina.com>
Sent: Thursday, September 19, 2002 9:07 PM
Subject: Re: [linux-lvm] Help! unable to mount lv's - can't see why!


> On Thu, Sep 19, 2002 at 05:01:46PM +0200, Robin Edgar - Tripany wrote:
> > Due to the dd the 2 disks should be identical - how do i get the VG to
> > activate the PV of choice? I can't figure out how to deactivate hdb1 and
> > activate hde1 or how vgchange decides it wants to use hdb1 instead of
hde1!
>
> Zero the first block of hdb1 (dd if=/dev/zero of=/dev/hdb1 bs=1k count=1)
or
> create a new physical volume on /dev/hdb1 (pvcreate -ff /dev/hdb1).
>
> Regards,
> Heinz    -- The LVM Guy --
>
> >
> > Robin
> >
> > > On Thu, Sep 19, 2002 at 12:45:47PM +0200, Robin Edgar - Tripany wrote:
> > > > Fair enough, but I would very much like to access the files and
> > determine
> > > > later what has errors and what doesn't - at the moment, I can only
do
> > this
> > > > with the docu lv and none of the others...
> > > >
> > > > You were right, I did manage to get a whole load of lost+found
entries
> > using
> > > > fsck after the mount. The docu entry was on the physical extent
though,
> > and
> > > > seems to be working fine.
> > > > Anyway I thought I'd upgrade LVM to 1.0.5 from 1.0.1 and refit the
disks
> > to
> > > > the 'old' configuration (4 disks + 1 for backup), to do a pvmove.
> > > > Now when I do a pvscan, it finds all the disks, but also the disk I
did
> > the
> > > > dd to, as part of the vg. So I de-activated the vg, and tried to
reduce
> > the
> > > > vg /dev/hdb1, hoiwever this is not working:
> > > >
> > > > # vgreduce tripserv_vol /dev/hdb1
> > > > vgreduce -- ERROR: can't reduce volume group "tripserv_vol" by used
> > physical
> > > > volume "/dev/hdb1"
> > >
> > > Well, LVM  still has allocated extents on that PV. You can just remove
> > > empty PVs from a VG.
> > >
> > > >
> > > > # pvscan -v
> > > > pvscan -- reading all physical volumes (this may take a while...)
> > > > pvscan -- walking through all physical volumes found
> > > > pvscan -- ACTIVE   PV "/dev/hdg1" of VG "tripserv_vol" [38.16 GB /
7.93
> > GB
> > > > free]
> > > > pvscan -- ACTIVE   PV "/dev/hdh1" of VG "tripserv_vol" [38.16 GB /
8.01
> > GB
> > > > free]
> > > > pvscan -- inactive PV "/dev/hde1" of VG "tripserv_vol" [55.91 GB / 0
> > free]
> > > > pvscan -- ACTIVE   PV "/dev/hdf1" of VG "tripserv_vol" [55.91 GB /
3.37
> > GB
> > > > free]
> > > > pvscan -- ACTIVE   PV "/dev/hdb1" of VG "tripserv_vol" [55.91 GB / 0
> > free]
> > > > pvscan -- total: 5 [244.08 GB] / in use: 5 [244.08 GB] / in no VG: 0
[0]
> > > >
> > > > If i vgchange -a n it will deactivate them all, but then I get:
> > > > # vgreduce tripserv_vol /dev/hdb1
> > > > vgreduce -- ERROR: volume group "tripserv_vol" is not active
> > >
> > > Doesn't change the situation, because the PV still has extents
allocated.
> > > A PV must be empty and the VG active in order to remove it from the
VG.
> > >
> > > >
> > > > After I restore the vg to it's 'old' configuration, I want to empty
> > > > /dev/hdb1 and add it to the volume group. Then doing a pvmove -i
> > /dev/hde1
> > > > should move all the data it can find there to the rest of the vg
> > shouldn't
> > > > it?
> > >
> > > Yes, presuming that you've got enought space to fit all extents
allocated
> > > to /dev/hde1.
> > >
> > > >
> > > > Thank you for all your help so far,
> > >
> > > You're welcome.
> > >
> > > Regards,
> > > Heinz    -- The LVM Guy --
> > >
> > > > Robin Edgar
> > > >
> > > > ----- Original Message -----
> > > > From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
> > > > To: <linux-lvm@sistina.com>
> > > > Sent: Thursday, September 19, 2002 12:04 PM
> > > > Subject: Re: [linux-lvm] Help! unable to mount lv's - can't see why!
> > > >
> > > >
> > > > > On Wed, Sep 18, 2002 at 04:42:54PM +0200, Robin Edgar - Tripany
wrote:
> > > > > > Doing the lvdisplay -v shows that pv /dev/hde1 had bits of all
of
> > the
> > > > lv's
> > > > > > on it (including the docu lv, which I *can* mount).
> > > > >
> > > > > Then it is most likely, that all filesystems will have errors.
> > > > >
> > > > > Regards,
> > > > > Heinz    -- The LVM Guy --
> > > > >
> > > > >
> > > > > >
> > > > > > ----- Original Message -----
> > > > > > From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
> > > > > > To: <linux-lvm@sistina.com>
> > > > > > Sent: Wednesday, September 18, 2002 3:59 PM
> > > > > > Subject: Re: [linux-lvm] Help! unable to mount lv's - can't see
why!
> > > > > >
> > > > > >
> > > > > > > On Wed, Sep 18, 2002 at 03:56:36PM +0200, Robin Edgar -
Tripany
> > wrote:
> > > > > > > > I've discovered that there is a problem with /all/ the
> > superblocks
> > > > > > except for those of the /docu lv (see below). It does lead me to
> > another
> > > > > > question though - only one of the HDs crashed: is it possible
that
> > LVM
> > > > wrote
> > > > > > all the superblocks on 1 HD?! If so this seems like a pretty
serious
> > bug
> > > > in
> > > > > <SNIP>
> > > > > > > linux-lvm mailing list
> > > > > > > linux-lvm@sistina.com
> > > > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > > > read the LVM HOW-TO at
http://www.sistina.com/lvm/Pages/howto.html
> > > > > > >
> > > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > _______________________________________________
> > > > > > linux-lvm mailing list
> > > > > > linux-lvm@sistina.com
> > > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > > read the LVM HOW-TO at
http://www.sistina.com/lvm/Pages/howto.html
> > > > >
> > > > > *** Software bugs are stupid.
> > > > >     Nevertheless it needs not so stupid people to solve them ***
> > > > >
> > > > >
> > > > > _______________________________________________
> > > > > linux-lvm mailing list
> > > > > linux-lvm@sistina.com
> > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > > > >
> > > > >
> > > >
> > > >
> > > >
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@sistina.com
> > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > >
> > > *** Software bugs are stupid.
> > >     Nevertheless it needs not so stupid people to solve them ***
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > >
> > >
> >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
>
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>
