From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How to activate a vg or lv with same name as active one
Message-ID: <20020812145230.C25041@sistina.com>
References: <20020812090255.GC30185@microdata-pos.de>
Mime-Version: 1.0
In-Reply-To: <20020812090255.GC30185@microdata-pos.de>; from Frank.Matthiess_NOSpam@Microdata-POS.de on Mon, Aug 12, 2002 at 11:02:55AM +0200
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
Date: Mon Aug 12 08:06:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Frank,

you needed to export the volume group *before* you moved the physical dev=
ices
over to the other system :(
After the move you needed to import the volume group giving it a new name.
See vgexport(8) and vgimport(8) for this.

In case you can't move the disks back to achieve this, the only option is
to patch your metadata at the beginning of each of the physical volumes
and change all occurences of vg_sys to vg_WhatEver (hacky!).


On Mon, Aug 12, 2002 at 11:02:55AM +0200, Frank Matthie=DF wrote:
> Hello there,
>=20
> i want to backup a disk which make some strange noise. The problem is
> that the volumegroupname (vg_sys) and the logical volumes (lv_home,
> lv_usr, lv_var) are already active and in use by the running system.
> The weak disk was remove from my home system and attach to a company
> system with a backup solution.
>=20
> My first idea ist to rename the the inactive volume group vg_sys to
> vg_backup. But the man page told me that the vg must be active.
>=20
> Seconf idea is to rename the lv's, but this is the same problem, isn't
> it?
>=20
> How to solve this problem and to get the inactive vg active to mount th=
e
> lv's on it?
>=20
> --=20
> Frank Matthie=DF                                          fm@Microdata-=
pos.de
>=20
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
