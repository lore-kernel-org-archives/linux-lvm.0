From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] snapshot file zombies
Message-ID: <20021209144653.B19400@sistina.com>
References: <20021209113719.A18845@sistina.com> <19352.1039432905@joergli.cocolab.de>
Mime-Version: 1.0
In-Reply-To: <19352.1039432905@joergli.cocolab.de>; from juergen@informatik-vollmer.de on Mon, Dec 09, 2002 at 12:21:45PM +0100
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
Date: Mon Dec  9 07:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

J=FCrgen,

those are Reiserfs errors telling that the filesystem isn't able to
search an entry by key. Could well be an io error on the snapshot LV but
then we should have a related entry in the syslog.

If you are able to read the snapshot fine (for eg. with=20
(dd if=3D/dev/SNAPSHOT of=3D/dev/null bs=3D1024k), I assume a reiserfs er=
ror.

If reading the snapshot LV fails, let's go forward analyzing LVM, if not
there might be a reiserfs fix for that.

On Mon, Dec 09, 2002 at 12:21:45PM +0100, J=FCrgen Vollmer wrote:
>=20
> Dear heinz,
>=20
> "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
> > Can you find any nasty messages in your syslog related to the
> > access fault or _before_ you weren't able to access it?
>=20
> the only obscure message I found was:
>=20
> Dec  7 01:22:07 joergli kernel: vs-7000: search_by_entry_key: search_by=
_key returned item position =3D=3D 0<4>vs-7000: search_by_entry_key: sear=
ch_by_key returned item position =3D=3D 0<4>vs-7000: search_by_entry_key:=
 search_by_key returned item position =3D=3D 0<4>zam-7001: io error in re=
iserfs_find_entry
>=20
> Dec  7 01:22:07 joergli kernel: vs-7000: search_by_entry_key: search_by=
_key returned item position =3D=3D 0<4>zam-7001: io error in reiserfs_fin=
d_entry
>=20
> but the failure was around 15:00 on that day
>=20
> J=FCrgen
>=20
> --=20
> Dr.rer.nat. Juergen Vollmer, Viktoriastrasse 15, D-76133 Karlsruhe
> Tel: +49(721) 9204871 Fax: +49(721) 24874
> juergen@informatik-vollmer.de,vollmer@cocolab.de,Juergen.Vollmer@acm.or=
g
> www.informatik-vollmer.de
>=20

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
