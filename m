Date: Thu, 11 Oct 2001 16:30:29 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems after restarting my debian
Message-ID: <20011011163029.B8752@sistina.com>
References: <20011011011444.A2302@sky.net>
Mime-Version: 1.0
In-Reply-To: <20011011011444.A2302@sky.net>; from U.Wiederhold@gmx.net on Thu, Oct 11, 2001 at 01:14:44AM +0200
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Ulrich,

please use LVM 1.0.1 rc4.


On Thu, Oct 11, 2001 at 01:14:44AM +0200, Ulrich Wiederhold wrote:
> Hello,
> I had to restart my PC because of a power-failure...
> Now I can=B4t mount my lvm-volume anymore.
>=20
> I fixed the uuids using the uuid_fixer on all my pv=B4s.
>=20
> home:/home/fzzgrr# vgscan=20
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volum=
e
> group
>=20
> Now I wanna restore my backups using
> home:/home/fzzgrr# vgcfgrestore -n vg01 -l
> Speicherzugriffsfehler
>=20
> (memory access failure)
>=20
>=20
> I can=B4t even make a pvscan or pvdisplay:
> home:/home/fzzgrr# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ERROR "pv_read(): LVM structure version" reading physical
> volumes
>=20
> home:/home/fzzgrr# pvdisplay /dev/sdb1
> pvdisplay -- ERROR "pv_read(): LVM structure version" no VALID physical
> volume "/dev/sdb1"
>=20
>=20
> What can I do?
> Uli
>=20
>=20
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
