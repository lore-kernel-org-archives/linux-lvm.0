Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8K0aA8E023607
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 20:36:10 -0400
Received: from huixtocihuatl.xenguest.geekspirit.net
	(mictlantecuhtli.geekspirit.net [81.56.52.126])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8K0ZuJX015233
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 20:36:03 -0400
Received: from localhost (mictecacihuatl.xenguest.geekspirit.net
	[172.24.42.55])
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	1976371504
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 02:36:52 +0200 (CEST)
Received: from huixtocihuatl.xenguest.geekspirit.net ([172.24.42.53])
	by localhost (mictecacihuatl.xenguest.geekspirit.net [172.24.42.55])
	(amavisd-new, port 10024)
	with ESMTP id 7uMaAlUHir9t for <linux-lvm@redhat.com>;
	Wed, 20 Sep 2006 02:35:24 +0200 (CEST)
Received: from bounty.rider.geekspirit.net (bounty.rider.geekspirit.net
	[172.24.42.200]) (Authenticated sender: rider)
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	822B971502
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 02:36:43 +0200 (CEST)
Subject: Re: [linux-lvm] Misleading documentation (was: HDD Failure)
From: Fabien Jakimowicz <fabien@jakimowicz.com>
In-Reply-To: <4B875923-CB76-4792-837B-EDA3B9E53756@slamb.org>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<20060918193728.GC28043@arvo.suso.org>
	<4B875923-CB76-4792-837B-EDA3B9E53756@slamb.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-jFMGhfhdg+9sSx/4fFb5"
Date: Wed, 20 Sep 2006 02:35:41 +0200
Message-Id: <1158712541.5366.8.camel@bounty.rider.geekspirit.net>
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


--=-jFMGhfhdg+9sSx/4fFb5
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2006-09-19 at 15:40 -0700, Scott Lamb wrote:
> On Sep 18, 2006, at 12:37 PM, Mark Krenz wrote:
> >   LVM !=3D RAID
> >
> >   You should have been doing RAID if you wanted to be able to =20
> > handle the
> > failure of one drive.
>=20
> This is my biggest beef with LVM - why doesn't *any* of the =20
> documentation point this out? There are very few good reasons to use =20
> LVM without RAID, and "ignorance" certainly isn't among them. I don't =20
> see any mention of RAID or disk failures in the manual pages or in =20
> the HOWTO.
>=20
> For example, the recipes chapter [1] of the HOWTO shows a non-trivial =20
> setup with four volume groups split across seven physical drives. =20
> There's no mention of RAID. This is a ridiculously bad idea - if =20
> *any* of those seven drives are lost, at least one volume group will =20
> fail. In some cases, more than one. This document should be showing =20
> best practices, and it's instead showing how to throw away your data.
>=20
> The "lvcreate" manual page is pretty bad, too. It mentions the =20
> ability to tune stripe size, which on casual read, might suggest that =20
> it uses real RAID. Instead, I think this is just RAID-0.
>=20
> [1] - http://tldp.org/HOWTO/LVM-HOWTO/recipeadddisk.html
>=20
LVM is just a Logical Volume Manager. It sounds like it add a layer
between physical devices and logical volumes. A such layer can take care
of physical devices failure, but lvm does not. Maybe you are right and
it should be pointed out. Maybe not ...

Having a half block device make no sense because there are actually no
filesystem capable of recovering this kind of failure.
--=20
Fabien Jakimowicz <fabien@jakimowicz.com>

--=-jFMGhfhdg+9sSx/4fFb5
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFEIzdzTD+AjVP2VIRAmjFAJ4gMgRwSWVi+hPlrfqeU9LEHUAuegCcDnmF
t+OPTTfwNTFrU1jGcKTtr8I=
=7R3N
-----END PGP SIGNATURE-----

--=-jFMGhfhdg+9sSx/4fFb5--
