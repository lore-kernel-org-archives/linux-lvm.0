From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] mounting a reiserfs snaphsot fails
Message-ID: <20011022094426.B5688@sistina.com>
References: <22712.1003733873@joergli.cocolab.de>
Mime-Version: 1.0
In-Reply-To: <22712.1003733873@joergli.cocolab.de>; from juergen@informatik-vollmer.de on Mon, Oct 22, 2001 at 08:57:53AM +0200
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
Date: Mon Oct 22 02:46:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

J=FCrgen,

you need to upgrade the LVM software to the recent CVS one at www.sistina=
.com.

Don't forget to start with a fresh vanilla kernel, patch it with the LVM
driver as describes in INSTALL and PATCHES/README of the LVM source distr=
o
and add the VFS patch contained in it as well.

On Mon, Oct 22, 2001 at 08:57:53AM +0200, J=FCrgen Vollmer wrote:
>=20
> Hi erverybody,
>=20
> I just created a snapshot and tried to mount it:
>=20
>  lvcreate --size 112m --snapshot --name lvm-snapshot /dev/LVMhome_vg/ho=
me
>  mount -oro -t reiserfs /dev/LVMhome_vg/lvm-snapshot /lvm-snapshot
>=20
> but I get only:
>  mount: wrong fs type, bad option, bad superblock on
>         /dev/LVMhome_vg/lvm-snapshot, or too many mounted file systems
>=20
> The logical volumes have been created with SuSe 7.2 (i.e. an older vers=
ion of
> the LVM tools), now I use SuSe 7.3,
>  lvcreate --version
>    lvcreate: Logical Volume Manager 1.0.1-rc2
>    Heinz Mauelshagen, Sistina Software  30/08/2001 (IOP 10)
>=20
> Obviously, /dev/LVMhome_vg/home is a reiserfs.
>=20
> Any idea?
>=20
> J=FCrgen
> --=20
> Dr.rer.nat. Juergen Vollmer, Viktoriastrasse 15, D-76133 Karlsruhe
> office: juergen@informatik-vollmer.de,  vollmer@cocolab.de
> 	    www.informatik-vollmer.de Tel: +49(721) 9204871 Fax: +49(721) 2487=
4
> private: Juergen.Vollmer@acm.org
>=20
>=20



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
