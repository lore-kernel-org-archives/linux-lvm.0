Return-Path: <root@srv.sistina.com>
Date: Wed, 30 May 2001 11:28:09 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: Help! Upgrade 2.2.18 -> 2.4.4 killed a PV
Message-ID: <20010530112809.C30938@sistina.com>
References: <20010529010628.E1971@jensbenecke.de> <20010529093436.A792@jensbenecke.de> <20010529211128.B27030@sistina.com> <20010529214021.A1594@jensbenecke.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010529214021.A1594@jensbenecke.de>; from lvm@jensbenecke.de on Tue, May 29, 2001 at 09:40:21PM +0200
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

On Tue, May 29, 2001 at 09:40:21PM +0200, Jens Benecke wrote:
> On Tue, May 29, 2001 at 09:11:28PM +0000, Heinz J. Mauelshagen wrote:
> >=20
> > Jens,
> > you need to run pvcreate on the invalid PV before running vgcfgrestore.
>=20
> I did so.=20
>=20
> Now I have a PV that is associated to an unknown VG, and vgcfgrestore says
>=20
> 	vgcfgrestore -- size of physical volume /dev/hdc1 differs from backup
> =20
> although 'vgcfgrestore -n data -ll' and 'pvdata -PP /dev/hdc1' show EXACT=
LY
> the same amount of extents (used/free/..), and GB. And hdc1 certainly
> didn't change in size.
>=20
> Strange: BOTH vgcfgrestore and pvdata -PP know that the PVs belong to the
> VG "data", but vgscan doesn't find it, and pvscan says both belong to an
> unknown VG and I should run vgscan.

If pvdata still tells you, that the PV belongs to some VG it hasn't created
a new one, likely because your didn't use "pvcreate -ff".

Does "pvcreate -ff"/vgcfgrestore help it?

BTW: WRT to your hex dump; see my other answer.

>=20
>=20
> So, I am a little further but not yet there =3D;)
>=20
>=20
> Thanks for the help!
>=20
> --=20
> Jens Benecke             /* Nobody will ever see this error message :-) */
>                             panic("Cannot initialize video hardware\n");
>                                   -- Linux 2.0.38,  arch/m68k/atari/atafb=
.c
> http://www.hitchhikers.de/ - Die kostenlose Mitfahrzentrale f=EF=BF=BDr g=
anz Europa
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
