From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] snapshot file zombies
Message-ID: <20021209113719.A18845@sistina.com>
References: <7344.1039265449@joergli.cocolab.de>
Mime-Version: 1.0
In-Reply-To: <7344.1039265449@joergli.cocolab.de>; from juergen@informatik-vollmer.de on Sat, Dec 07, 2002 at 01:50:49PM +0100
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
Date: Mon Dec  9 04:46:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Sat, Dec 07, 2002 at 01:50:49PM +0100, J=FCrgen Vollmer wrote:
>=20
> Hi dear list,
>=20
> I created a snapshot from my /home to do my usual backup with tar.
> Then I got 15 messages of the kind
>=20
>   tar: lvm-snapshot/vollmer/Mail/inbox/,120:  can not stat, no permissi=
on
>       (or so it's translated from german to englich by me)
>=20
>=20
> doing a
>   find /lvm-snapshot/vollmer/Mail/inbox/ -name ",120"
> rsults in
>   /lvm-snapshot/vollmer/Mail/inbox/,120
>=20
> so the file exists, but:
>   ls -l   /lvm-snapshot/vollmer/Mail/inbox/,120
> results in
>   ls: /lvm-snapshot/vollmer/Mail/inbox/,120: Permission denied
>=20
> get some infos via find:
>   find /lvm-snapshot/vollmer/Mail/inbox/ -name ",120" -print "-A@"
> results in:
>   find: /lvm-snapshot/vollmer/Mail/inbox/,120: Permission denied
>=20
> The "original file" ~vollmer/Mail/inbox/,120 is ok and readable.
>=20
> Two weeks ago everything worked fine.
>=20
> So what's wrong with it? Is my corrupted? (tar --compare seems to compl=
ain
> only at those files).

Can you find any nasty messages in your syslog related to the
access fault or _before_ you weren't able to access it?

>=20
> I use SuSe 8.1, Logical Volume Manager 1.0.5(mp-v6)
>=20
> With best regards
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
