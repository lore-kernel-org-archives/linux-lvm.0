From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] disk failure
Message-ID: <20020903124137.A21136@sistina.com>
References: <5.1.1.6.2.20020901044548.01d61470@pop.tvnet.hu> <5.1.1.6.2.20020901044548.01d61470@pop.tvnet.hu> <20020902155415.A17591@sistina.com> <5.1.1.6.2.20020902213332.038cd008@pop.tvnet.hu>
Mime-Version: 1.0
In-Reply-To: <5.1.1.6.2.20020902213332.038cd008@pop.tvnet.hu>; from newsmail@satimex.tvnet.hu on Mon, Sep 02, 2002 at 09:36:15PM +0100
Content-Transfer-Encoding: quoted-printable
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
Date: Tue Sep  3 05:58:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Sep 02, 2002 at 09:36:15PM +0100, Newsmail wrote:
> thx for your answer. actually I had this 3 drive linear array, with 170=
=20
> gigs. 60+80+30. the 30 gig one died. Only 20gigs of data were on the ar=
ray.=20
> My big problem is, that I dont even have an idea in which order I added=
=20
> them. is there a way to determine the order of the drives in the array?

If you added them one after the other without ever removing/adding other
disks to the VG in the meantime, "vgdisplay -v" gives you the internal
numbers of the PVs. Higher numbers were added later.

Looks like:

<SNIP>
--- Physical volumes ---
PV Name (#)           /dev/sdc1 (1)
PV Status             available / allocatable
Total PE / Free PE    8808 / 2934
<SNIP>

where the (1) above is the internal number.

BTW: "lvdisplay -v" on any LV shows the allocation table (IOW: the mappin=
g of
     the logical extents to the physical extents on the PVs.

Regards,
Heinz    -- The LVM Guy --

> greg
> At 14:54 2002. 09. 02.=AD, you wrote:
> >On Sun, Sep 01, 2002 at 04:50:27AM +0100, Newsmail wrote:
> > > Hello everybody,
> > > maybe its an already answered problem, I dont know,
> > > I just have an lvm array of 3 disks. and the last disk of the array=
 just
> > > died, as is. I cannot to anything with it, it died, it doesnt even =
spin=20
> > up.
> > > what should I do with my array to make it work, or at least save th=
e=20
> > data I
> > > have on it?
> > > I tried vgchange -an -qn to make it active without a quorum, but af=
ter I
> > > didnt have an idea what to do. how can I remove the faultive, non-e=
xisting
> > > drive from it? what should I do?
> >
> >Well, you should backup any data you can still access this way or copy
> >it to new LVs in a newly created VG.
> >Either way you need to reinitialize the 2 remaining PVs after that to =
use them
> >in some other VG.
> >
> >Your only other option to regain quorum (with all data of the failed P=
V lost!)
> >is to vgcfgrestore the metadata of the failed drive to a replacement o=
ne,
> >and "vgscan ; vgchange -ay".
> >
> > > thanx in advance,
> > > regards,
> > > greg
> > >
> > > ps: I'm using reiserfs.
> > >
> > >
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> >--
> >
> >Regards,
> >Heinz    -- The LVM Guy --
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@sistina.com
> >http://lists.sistina.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
