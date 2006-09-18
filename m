Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8IJOLAp002919
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 15:24:21 -0400
Received: from huixtocihuatl.xenguest.geekspirit.net
	(mictlantecuhtli.geekspirit.net [81.56.52.126])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8IJOCVG001238
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 15:24:14 -0400
Received: from localhost (mictecacihuatl.xenguest.geekspirit.net
	[172.24.42.55])
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	DF8EC71503
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 21:24:58 +0200 (CEST)
Received: from huixtocihuatl.xenguest.geekspirit.net ([172.24.42.53])
	by localhost (mictecacihuatl.xenguest.geekspirit.net [172.24.42.55])
	(amavisd-new, port 10024)
	with ESMTP id W7ZP52oxRr+S for <linux-lvm@redhat.com>;
	Mon, 18 Sep 2006 21:23:37 +0200 (CEST)
Received: from bounty.rider.geekspirit.net (bounty.rider.geekspirit.net
	[172.24.42.200]) (Authenticated sender: rider)
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	36EFD71502
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 21:24:52 +0200 (CEST)
Subject: Re: [linux-lvm] HDD Failure
From: Fabien Jakimowicz <fabien@jakimowicz.com>
In-Reply-To: <1158606792.7182.15.camel@localhost.localdomain>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-ds3Qo0/dRvIQot67fPZv"
Date: Mon, 18 Sep 2006 21:23:58 +0200
Message-Id: <1158607438.19905.30.camel@bounty.rider.geekspirit.net>
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


--=-ds3Qo0/dRvIQot67fPZv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2006-09-18 at 20:13 +0100, Nick wrote:
> Hi Mitch,
>=20
> Thanks for the response. I understand I won't be able to get all the
> data back but I have 2x120GB "good" drives left and want to get what's
> left - is this possible?
>=20
> Thanks, Nick
>=20
> On Mon, 2006-09-18 at 14:08 -0500, Mitch Miller wrote:
> > Nick -- if I understand your situation properly, you effectively took=20
> > one of the platters (the bad drive) out of the drive (the vg) and now=20
> > you still want to be able to access the entire drive ... ??  I don't=20
> > think that's going to happen.
> >=20
> > Off to the backups, I'd say ...
> >=20
> > -- Mitch
>=20
did you have only one lv in your vg ?

if yes, you can go to your backups.

what does pvdisplay and vgdisplay says ?
--=20
Fabien Jakimowicz <fabien@jakimowicz.com>

--=-ds3Qo0/dRvIQot67fPZv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFDvJOzTD+AjVP2VIRAg9QAJ9lwGgLzGmwoi/B49+LSdGYTZWj+wCeOxa3
/pkfi4S7thB5xxEYdGH3EXI=
=QneE
-----END PGP SIGNATURE-----

--=-ds3Qo0/dRvIQot67fPZv--
