From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: Resizing PV
Message-ID: <20030922145440.Y2618@sistina.com>
References: <yw1xzngxktrs.fsf@users.sourceforge.net> <20030922123435.X2618@sistina.com> <yw1xr829kps6.fsf@users.sourceforge.net>
Mime-Version: 1.0
In-Reply-To: <yw1xr829kps6.fsf@users.sourceforge.net>; from mru@users.sourceforge.net on Mon, Sep 22, 2003 at 01:48:09PM +0200
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
Date: Mon Sep 22 08:06:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Sep 22, 2003 at 01:48:09PM +0200, M=E5ns Rullg=E5rd wrote:
> "Heinz J . Mauelshagen" <mauelshagen@sistina.com> writes:
>=20
> >> Is it possible to reduce the size of a PV, freeing some space at the
> >> end?  I can make sure that the end is unused, of course.
> >
> > No such command implemented yet.
> >
> > Hack:
> > you can use LVM2 and change the text format of the metadata by hand
> > before running vgcfgrestore to store it back onto the PVs.
> >
> > If you want to follow this non-supported path, you want to take a
> > copy of the original metadata file in /etc/lvm/backup/ to be able to
> > back out gain.
>=20
> I'm already using lvm2.  I noticed the pvresize command, but it just
> says it's not implemented yet.  Any chance it will be some time soon?

We've got higher priority stuff in the works. Probably later this year.

>=20
> As for editing the metadata, I'm a little confused about the meaning
> of some fields.  After running vgcfgbackup, I have this in the file:
>=20
>         physical_volumes {
>=20
>                 pv0 {
>                         id =3D "eZV4mb-jk4z-pyfm-tGbJ-mBSW-drRT-ZHtgmn"
>                         device =3D "/dev/discs/disc0/part2"       # Hin=
t only
>=20
>                         status =3D ["ALLOCATABLE"]
>                         pe_start =3D 65920
>                         pe_count =3D 1189 # 37.1562 Gigabytes
>                 }
>         }
>=20
> What is the meaning of the pe_start field?  If I wanted to reduce the
> size by, say, 1 GB, would it be correct to reduce pe_count by 32, the
> PE size being 32 MB?

pe_start is the sector offset into the device.
Yes, you need to reduce pe_count by 32 making it 1157 and vgcfgrestore.
You need to have recent LVM2 code so that vgcfgrestore updates the pe_cou=
nt
properly (and of course, the 32 PEs need to be empty).

>=20
> --=20
> M=E5ns Rullg=E5rd
> mru@users.sf.net
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
