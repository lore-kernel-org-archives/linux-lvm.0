From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM One Harddisk died
Message-ID: <20030821150544.E8426@sistina.com>
References: <168603751.20030820164532@reetz.de>
Mime-Version: 1.0
In-Reply-To: <168603751.20030820164532@reetz.de>; from newsletter@reetz.de on Wed, Aug 20, 2003 at 04:45:32PM +0200
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
Date: Thu Aug 21 08:13:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, Aug 20, 2003 at 04:45:32PM +0200, Sascha Reetz wrote:
> Hallo,
>=20
> I  am  a  lvm running with several hard disks. One of the hard disks
> died.
>=20
> What can I do, to have access to left data?

LVM1, I assume ?

Raplace the dead hard disk with one of the same size, pvcreate the new on=
e
and vgcfgrestore the data to it. Run "vgscan ; vgchange -ay" afterwards
(which will probably run anyway in one of your boot scripts).

- Or -

Install device-mapper and LVM2 and use LVM2's partial activation feature
(vgchange -ay -P). You must recreate the VG after you saved any data stil=
l
accessible.

- Or -

if you want a quick hack taking the risk that accessing parts of
logical volumes mapped to the dead disk (assuming your volume grous
name is "VG" and that VG is the only one in the system):

# mkdir /etc/lvmtab.d
# cp /etc/lvmconf/VG.conf /etc/lvmtab.d/
# echo -ne "VG\0" > /etc/lvmtab
# vgchange -ay

That should get you temporary access to all data you still _can_ access.
Save it and if you don't replace the failed disk, recreate your volume
group, logical volumes and filesystems in order to restore your data.

>=20
>=20
>=20
> --=20
>   ... in diesem Sinne ...
>       Sascha    Reetz            +---------------------------------+
>   ------++-------++------        |  Website : http://www.reetz.de  |
>         ||       ||              |  ICQ UNI : 20345264             |
>   +-----++-------++--------------+  Tkom-Net: 0173 - 2643341       +--
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   =3D Die letzten Worte ...   ...eines Chemikers                       =
=3D
>   =3D ''Mu=DF das warm werden?''                                       =
  =3D
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
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
