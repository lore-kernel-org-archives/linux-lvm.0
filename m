From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LV's above 2TB, PV's above 1TB, LBD?
Message-ID: <20021119113639.B30328@sistina.com>
References: <3DD3AEF2.5040900@grc.nasa.gov> <20021118163728.C5567@uk.sistina.com> <20021118175142.D30589@vestdata.no>
Mime-Version: 1.0
In-Reply-To: <20021118175142.D30589@vestdata.no>; from lvm@ragnark.vestdata.no on Mon, Nov 18, 2002 at 05:51:42PM +0100
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
Date: Tue Nov 19 04:47:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Nov 18, 2002 at 05:51:42PM +0100, Ragnar Kj=F8rstad wrote:
> On Mon, Nov 18, 2002 at 04:37:28PM +0000, Alasdair G Kergon wrote:
> > > Aside from this, now that the 2.5 kernel supports LBD's, can the li=
mit
> > > on LV's be raised to 16 TB?
> > For the *new* format of metadata (in beta 4 released today), yes:=20
> > for now, I've knocked out the LV size restriction in CVS.  Further
> > tweaks to the tools may also be required. Please try it and let us
> > know whether it works, or what else needs changing.
>=20
> Is the new metdata format really required?
> Isn't the unit used in the metadata PEs? So should it not work with the
> old format if only the PEs are large enough?

The constraint in the LVM1 format is ~2^16 physical extents maximum.
If we support more than this amount, we'ld be LVM1 format incompatible.
Going beyond that constraint is possible with the new format Alasdair was
refering to but you loose LVM1 format compatibility.
IOW: no way back to running such configuration with LVM1.

But yes, with larger physical extent sizes _and_ less than ~2^16 extents
maximum you can stay with LVM1 format in order to be backwards compatible.

>=20
>=20
>=20
> --=20
> Ragnar Kj=F8rstad
> Big Storage
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
