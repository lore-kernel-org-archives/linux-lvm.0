Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8IJwPLd014758
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 15:58:25 -0400
Received: from huixtocihuatl.xenguest.geekspirit.net
	(mictlantecuhtli.geekspirit.net [81.56.52.126])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8IJwIL6010701
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 15:58:19 -0400
Received: from localhost (mictecacihuatl.xenguest.geekspirit.net
	[172.24.42.55])
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	5C55671503
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 21:59:00 +0200 (CEST)
Received: from huixtocihuatl.xenguest.geekspirit.net ([172.24.42.53])
	by localhost (mictecacihuatl.xenguest.geekspirit.net [172.24.42.55])
	(amavisd-new, port 10024)
	with ESMTP id MaHYwEjDN6MO for <linux-lvm@redhat.com>;
	Mon, 18 Sep 2006 21:57:37 +0200 (CEST)
Received: from bounty.rider.geekspirit.net (bounty.rider.geekspirit.net
	[172.24.42.200]) (Authenticated sender: rider)
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	633BB71502
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 21:58:51 +0200 (CEST)
Subject: Re: [linux-lvm] HDD Failure
From: Fabien Jakimowicz <fabien@jakimowicz.com>
In-Reply-To: <1158609135.7182.21.camel@localhost.localdomain>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<1158608557.19905.37.camel@bounty.rider.geekspirit.net>
	<1158609135.7182.21.camel@localhost.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-SH+0o57RZNLsUZMs2dV5"
Date: Mon, 18 Sep 2006 21:57:57 +0200
Message-Id: <1158609477.19905.38.camel@bounty.rider.geekspirit.net>
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


--=-SH+0o57RZNLsUZMs2dV5
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2006-09-18 at 20:52 +0100, Nick wrote:
> Oh well, better setup RAID this time!! Thanks for your (And the others
> who replied) help, I appreciate it even though it's bad news.
>=20
> Nick
You can also run a lvm over raid configuration, but you should really
test it before using it, just to exactly know what you are doing.
--=20
Fabien Jakimowicz <fabien@jakimowicz.com>

--=-SH+0o57RZNLsUZMs2dV5
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFDvpFzTD+AjVP2VIRAr8VAJwNPjlfjpteNBV1plynruPDlnAeOgCeMd1m
afpGS6ZcpigPbPDWih1yzhs=
=otza
-----END PGP SIGNATURE-----

--=-SH+0o57RZNLsUZMs2dV5--
