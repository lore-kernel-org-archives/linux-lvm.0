Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8IJgwtM009607
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 15:42:58 -0400
Received: from huixtocihuatl.xenguest.geekspirit.net
	(mictlantecuhtli.geekspirit.net [81.56.52.126])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8IJgmsM006456
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 15:42:50 -0400
Received: from localhost (mictecacihuatl.xenguest.geekspirit.net
	[172.24.42.55])
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	E582E71503
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 21:43:34 +0200 (CEST)
Received: from huixtocihuatl.xenguest.geekspirit.net ([172.24.42.53])
	by localhost (mictecacihuatl.xenguest.geekspirit.net [172.24.42.55])
	(amavisd-new, port 10024)
	with ESMTP id CZWKgTCTHM+o for <linux-lvm@redhat.com>;
	Mon, 18 Sep 2006 21:42:15 +0200 (CEST)
Received: from bounty.rider.geekspirit.net (bounty.rider.geekspirit.net
	[172.24.42.200]) (Authenticated sender: rider)
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	B4C5271502
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 21:43:30 +0200 (CEST)
Subject: Re: [linux-lvm] HDD Failure
From: Fabien Jakimowicz <fabien@jakimowicz.com>
In-Reply-To: <1158608077.7182.18.camel@localhost.localdomain>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-PxbflakJsVfGjvaA3uSu"
Date: Mon, 18 Sep 2006 21:42:37 +0200
Message-Id: <1158608557.19905.37.camel@bounty.rider.geekspirit.net>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-PxbflakJsVfGjvaA3uSu
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2006-09-18 at 20:34 +0100, Nick wrote:
> Hi Fabien,
>=20
> Yes, just one LV - "Vol1-share".=20
>=20
> Does this mean I've lost *everything*? I would have though I should be
> still be able to access everything on the two working disks?=20
>=20
> I don't have a backup of this data.
I'm sure you will now have at least one backup of all your data.
>=20
> Thanks, Nick
>=20
> root@nibiru:~# pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/hda4
>   VG Name               Vol1
>   PV Size               106.79 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              27339
>   Free PE               27339
>   Allocated PE          0
>   PV UUID               Cq9xKF-W33m-BCLt-YyIc-EEfm-Btqc-eZLHNh
>=20
>   --- Physical volume ---
>   PV Name               /dev/hdb1
>   VG Name               Vol1
>   PV Size               111.75 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              28609
>   Free PE               28609
>   Allocated PE          0
>   PV UUID               hwQrhH-iXHO-Bots-6zUQ-w8JG-Nmb3-shqZiX
>=20
> root@nibiru:~# vgdisplay
>   --- Volume group ---
>   VG Name               Vol1
>   System ID
>   Format                lvm2
>   Metadata Areas        2
>   Metadata Sequence No  3
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                0
>   Open LV               0
>   Max PV                0
>   Cur PV                2
>   Act PV                2
>   VG Size               218.55 GB
>   PE Size               4.00 MB
>   Total PE              55948
>   Alloc PE / Size       0 / 0
>   Free  PE / Size       55948 / 218.55 GB
>   VG UUID               RORj4f-LAOJ-83YS-34lD-4YRM-FKP8-8hgXLg
As you can see, you have no remaining LV in this VG. And both of your PV
are empty (Total =3D=3D Free).

Now if you read vgreduce manual page :
       --removemissing
              Removes  all  missing physical volumes from the volume
group and makes the volume group consistent again.
              It's a good idea to run this option with --test  first  to
find out what it would remove before running it for real.
              Any  logical volumes and dependent snapshots that were
partly on the missing disks get removed completely.  This  includes
those parts that lie on disks that are still present.
              If your logical volumes spanned several disks including
the ones that are lost, you might want to try to salvage  data  first
by activating  your  logical volumes with --partial as described in
lvm (8).

you can see that you've just lost all of your data.
--=20
Fabien Jakimowicz <fabien@jakimowicz.com>

--=-PxbflakJsVfGjvaA3uSu
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFDvatzTD+AjVP2VIRAl8/AJ44VpRgO5UCVPB/U9oFwnZld6L1mwCglUGd
yQfupwWQRLYO7vX8uIIZA4Q=
=RDwk
-----END PGP SIGNATURE-----

--=-PxbflakJsVfGjvaA3uSu--
