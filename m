From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: Resizing PV
Message-ID: <20030922151356.Z2618@sistina.com>
References: <yw1xzngxktrs.fsf@users.sourceforge.net> <20030922123435.X2618@sistina.com> <yw1xr829kps6.fsf@users.sourceforge.net> <20030922145440.Y2618@sistina.com> <yw1xn0cxkluw.fsf@users.sourceforge.net>
Mime-Version: 1.0
In-Reply-To: <yw1xn0cxkluw.fsf@users.sourceforge.net>; from mru@users.sourceforge.net on Mon, Sep 22, 2003 at 03:12:55PM +0200
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
Date: Mon Sep 22 08:25:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Sep 22, 2003 at 03:12:55PM +0200, M=E5ns Rullg=E5rd wrote:
> "Heinz J . Mauelshagen" <mauelshagen@sistina.com> writes:
>=20
> > pe_start is the sector offset into the device.
>=20
> OK, I thought it might be, but I wasn't sure.
>=20
> > Yes, you need to reduce pe_count by 32 making it 1157 and vgcfgrestor=
e.
> > You need to have recent LVM2 code so that vgcfgrestore updates the pe=
_count
>=20
> How recent?  Is this new enough?
>=20
>   LVM version:     2.00.03 (2003-07-13)
>   Library version: 1.00.02-ioctl (2003-07-12)
>   Driver version:  4.0.0

Should do it.

>=20
> I'm using whatever device-mapper is in Linux 2.6.0-test5.

That's ok. device-mapper isn't involved in such
userspace metadata updates to the PVs.

>=20
> > properly (and of course, the 32 PEs need to be empty).
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
