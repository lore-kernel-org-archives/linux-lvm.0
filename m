Date: Mon, 10 Sep 2001 13:17:50 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems with pvmove
Message-ID: <20010910131750.E31313@sistina.com>
References: <20010909.16553000@host.domain.de>
Mime-Version: 1.0
In-Reply-To: <20010909.16553000@host.domain.de>; from estevesgorf@freenet.de on Sun, Sep 09, 2001 at 04:55:30PM +0000
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@sistina.com

Andreas,

could you provide a "pvdisplay -v | tail -22" output of the PV in questio=
n
in order to check if you suffer from a misalocation problem which would l=
ead
to a last PE being allocated partially beyond the end of the underlying d=
evive.

Regards,
Heinz    -- The LVM Guy --


On Sun, Sep 09, 2001 at 04:55:30PM +0000, Andreas Gorf wrote:
> I've followed the discussion started by =84fejf=93.
>=20
> Indeed i have the same problem that pvmove exits with an error when i t=
ry=20
> to
> move PEs from one PV to another.
>=20
> To exclude the possibility of a defect HD i tried to reproduce the erro=
r=20
> on several
> independent systems.
>=20
> The error always occurs when i try to move a complete filled PV to=20
> another. In this case all but the last
> PE on this PV are moved. The last one isn't movable whatever i did.
>=20
> If the PV wasn't filled at 100% everything goes fine.
>=20
> To reproduce the error try the following:
>=20
> - create a VG with three Pvs at the same size
> - create a LV which covers the first PV completely and the second partl=
y
> - try to all PEs from the first PV to the third - the error will occur
> - move the moved PEs back to the first PV - everything goes fine
> - try to move the PEs lying on the second PV to the third - everything=20
> goes fine
>=20
>=20
> ...any ideas?
>=20
>=20
> Andreas...
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
