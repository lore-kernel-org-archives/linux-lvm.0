Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KFwAVQ010517
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 11:58:10 -0400
Received: from huixtocihuatl.xenguest.geekspirit.net
	(mictlantecuhtli.geekspirit.net [81.56.52.126])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KFw8YE021823
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 11:58:09 -0400
Received: from localhost (mictecacihuatl.xenguest.geekspirit.net
	[172.24.42.55])
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	774EC71503
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 17:59:08 +0200 (CEST)
Received: from huixtocihuatl.xenguest.geekspirit.net ([172.24.42.53])
	by localhost (mictecacihuatl.xenguest.geekspirit.net [172.24.42.55])
	(amavisd-new, port 10024)
	with ESMTP id TXrH8CIE34io for <linux-lvm@redhat.com>;
	Wed, 20 Sep 2006 17:57:38 +0200 (CEST)
Received: from bounty.rider.geekspirit.net (bounty.rider.geekspirit.net
	[172.24.42.200]) (Authenticated sender: rider)
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	E16D771502
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 17:58:59 +0200 (CEST)
Subject: Re: [linux-lvm] LVM on RAID
From: Fabien Jakimowicz <fabien@jakimowicz.com>
In-Reply-To: <Pine.LNX.4.63.0609200939510.20726@zeus.itg.uiuc.edu>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<1158608557.19905.37.camel@bounty.rider.geekspirit.net>
	<1158609135.7182.21.camel@localhost.localdomain>
	<1158609477.19905.38.camel@bounty.rider.geekspirit.net>
	<Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
	<1158760524.26653.4.camel@merlin.Mines.EDU>
	<Pine.LNX.4.63.0609200939510.20726@zeus.itg.uiuc.edu>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-wnhpeZnb6+Exy3ZgKXIF"
Date: Wed, 20 Sep 2006 17:57:53 +0200
Message-Id: <1158767873.20097.2.camel@bounty.rider.geekspirit.net>
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


--=-wnhpeZnb6+Exy3ZgKXIF
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2006-09-20 at 09:48 -0500, Alexander Lazarevich wrote:
> I should have been more clear. I'm not worried about LVM on one RAID. My=20
> questions is specifically about creating an LVM volume group ACROSS two=20
> RAID's.
>=20
> For example, we have a 64bit linux server, with two different RAID device=
s=20
> attached to the host via Fiber. These RAID's are each 4TB volumes. The=20
> RAID is attached as /dev/sda and /dev/sdb. What I'm asking about is=20
> creating a LVM volume group, and joining /dev/sda AND /dev/sdb to that=20
> same volume group, creating the lv of 8TB (minus overhead of course), and=
=20
> then creating a filesystem on that lv. A 8TB filesystem, which is spanned=
=20
> (via LVM) across both RAID's.
>=20
> Does anyone here do that? Reading all the reply's I realize I wasn't clea=
r=20
> enough about that, and neither was anyone's responses.
>=20
> Alex
I have a 'similar' configuration, with less expansive hardware ;)

i have an LVM VG built with 4 software raid arrays, each array is a two
hard drives in raid1.
--=20
Fabien Jakimowicz <fabien@jakimowicz.com>

--=-wnhpeZnb6+Exy3ZgKXIF
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFEWUBzTD+AjVP2VIRAtAVAJ9KMazcPggMqHSm5RzPcsBfKA+grwCcDkiG
GtzZDxR5WSMebGMhzgttnxU=
=fV3T
-----END PGP SIGNATURE-----

--=-wnhpeZnb6+Exy3ZgKXIF--
