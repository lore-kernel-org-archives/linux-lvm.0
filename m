From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] /etc ro mounten
Message-ID: <20011024115448.A19684@sistina.com>
References: <20011024110758.D8640@sky.net>
Mime-Version: 1.0
In-Reply-To: <20011024110758.D8640@sky.net>; from U.Wiederhold@gmx.net on Wed, Oct 24, 2001 at 11:07:58AM +0200
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
Date: Wed Oct 24 04:57:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Ulrich,

it is already compile time definable by changing LVMTAB, LVMTAB_DIR
and VG_BACKUP_DIR in liblvm.h.

Will probably be a config file option in LVM 2.

On Wed, Oct 24, 2001 at 11:07:58AM +0200, Ulrich Wiederhold wrote:
> Hello,
> at debian-user-de runs a thread at the moment to mount /etc ro and a
> consens is that in /etc only static files should be stored.
>=20
> lvm need=B4s to write /etc at bootup and for backup-copies. I would pre=
fer
> to stor the files that need to be writeable in /var.=20
>=20
> What do you think about a change for the next release? (or is there
> already a compile-function?).
>=20
> This would solve the problems with / ro at startup, isn=B4t it?
>=20
> Uli
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
