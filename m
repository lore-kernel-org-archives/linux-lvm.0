Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8NEj15j021548
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 10:45:02 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8NEio8Q031196
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 10:44:50 -0400
Received: from linux.interlinx.bc.ca (d67-193-217-194.home3.cgocable.net
	[67.193.217.194])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id B5ECA2803
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 10:44:49 -0400 (EDT)
Received: from [IPv6:2001:4978:161:0:218:f3ff:fee1:65cc] (pc.interlinx.bc.ca
	[IPv6:2001:4978:161:0:218:f3ff:fee1:65cc])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 951BE8768
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 10:44:48 -0400 (EDT)
Subject: Re: [linux-lvm] accidentally removed an lv.  can i restore it?
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <20090923142132.GD3866@agk-dp.fab.redhat.com>
References: <1253715341.26295.521.camel@pc.interlinx.bc.ca>
	<20090923142132.GD3866@agk-dp.fab.redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-rdQEnlV8gWlsvY4YAhpg"
Date: Wed, 23 Sep 2009 10:44:47 -0400
Message-Id: <1253717087.26295.554.camel@pc.interlinx.bc.ca>
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


--=-rdQEnlV8gWlsvY4YAhpg
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2009-09-23 at 15:21 +0100, Alasdair G Kergon wrote:
> Look into vgcfgrestore.

This did the trick.  Thanx Alasdair!

I have never had occasion to use vgcfgrestore prior to this fubar but it
worked like a charm.

Again, many, many, thanx!  I owe you at least one beer.  You saved a lot
of data.

b.


--=-rdQEnlV8gWlsvY4YAhpg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkq6NF8ACgkQl3EQlGLyuXAAUwCfbSRjCxRLgmxK/vPONAsruBdG
3fMAoI/BEWMg4l6Fgn7DCBJ7BRfuRh7g
=pyip
-----END PGP SIGNATURE-----

--=-rdQEnlV8gWlsvY4YAhpg--
