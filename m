From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] rescuing a VG with one missing PV
Message-Id: <20020212102228.A2360@sistina.com>
References: <20020209142411.GA10226@xulfad.ton.tut.fi>
    <20020209150956.GA11057@xulfad.ton.tut.fi>
    <20020211205325.GA25253@xulfad.ton.tut.fi>
MIME-Version: 1.0
In-Reply-To: <20020211205325.GA25253@xulfad.ton.tut.fi>; from
    flux-lvm@inside.org on Mon, Feb 11, 2002 at 10:53:25PM +0200
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
Date: Tue Feb 12 03:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Feb 11, 2002 at 10:53:25PM +0200, Erkki Seppala wrote:
> The drive I got was two gigabytes smaller than the original, and thus:
>=20
> [21:42] lectric(pts/8):~# vgcfgrestore -n archive /dev/ide/host0/bus0/t=
arget1/lun0/part1
> vgcfgrestore -- size of physical volume /dev/ide/host0/bus0/target1/lun=
0/part1 differs from backup
>=20
> The original disc was:
>=20
>   PVs: [AN] ide/host0/bus0/target1/lun0/part1 60030976 /3664   =20
> 		21331968 /1302    38699008/2362 =20
>=20
> and it now is 58633312 blocks according to fdisk.

Change your partition to have the very same size as before and vgcfgresto=
re.

>=20
> Is there a way to still restore the remaining VG?-o Sounds like the
> backup would need to be modified. The physical extents that were in
> the dead device would need to be either removed from the VG or
> allocated from another device?
> --=20
>   _____________________________________________________________________
>      / __// /__ ____  __                              Erkki Sepp=E4l=E4=
\   \
>     / /_ / // // /\ \/ //ircnet                           Modeemi Ry\  =
/
>    /_/  /_/ \___/ /_/\_\@modeemi.fi        http://www.modeemi.fi/~flux/
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
