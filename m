From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] replace bad hard disc
Message-ID: <20011019115733.A22924@sistina.com>
References: <110278234233.20011015163039@difi.de> <20011016105533.A4318@sistina.com> <55520025253.20011018113954@difi.de> <20011018115318.A2771@balu.kawo2.rwth-aachen.de> <20011018222317.C13359@sky.net>
Mime-Version: 1.0
In-Reply-To: <20011018222317.C13359@sky.net>; from U.Wiederhold@gmx.net on Thu, Oct 18, 2001 at 10:23:17PM +0200
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
Date: Fri Oct 19 04:59:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Ulrich,

you can't shrink an XFS.

A hHD contained in a VG can only be removed when it has no LVs on it.

On Thu, Oct 18, 2001 at 10:23:17PM +0200, Ulrich Wiederhold wrote:
> * Markus Dobel <mdobel@kawo2.rwth-aachen.de> [011018 11:53]:
> > On Thu, Oct 18, 2001 at 11:39:54AM +0200, Stefan Onken wrote:
> > >=20
> > > > pvcreate /dev/sde1
> > > > vgextend Stonki2 /dev/sde1
> > > > pvmove /dev/sdd1 /dev/sde1
> > > > vgreduce Stonki2 /dev/sdd1
> > >=20
> > > stupid question: what about resizing the reiserfs file system ?
> > > Is it not necessary ?
>=20
> Oh, but this means in my example I will have to lower the filesystem
> (xfs), because I will remove a hd and added all my scace to the vg and
> lv=B4s, right?
> Is it possible to lower an xfs.filesystem to remove a HD or is it
> possible to remove a HD without resizing (no mount now), add a new
> bigger HD, grow the filesystem, mount it?
>=20
> Uli
> --=20
> 'The box said, 'Requires Windows 95 or better', so i installed Linux - =
TKK 5
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20

Regards,
Heinz    -- The LVM Guy --

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
