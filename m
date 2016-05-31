Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VAvsJM021467
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 31 May 2016 06:57:54 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72E55375116
	for <linux-lvm@redhat.com>; Tue, 31 May 2016 10:57:53 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1b7hMs-0004Wy-7S
	for linux-lvm@redhat.com; Tue, 31 May 2016 12:57:50 +0200
Received: from d67-193-213-211.home3.cgocable.net ([67.193.213.211])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 31 May 2016 12:57:50 +0200
Received: from brian by d67-193-213-211.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 31 May 2016 12:57:50 +0200
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Tue, 31 May 2016 06:57:38 -0400
Message-ID: <1464692258.30702.376.camel@interlinx.bc.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5bWNgNQCralH66YNbXR2"
Subject: [linux-lvm] thin: 235:2 pool target (735616 blocks) too small:
	expected 809216
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-5bWNgNQCralH66YNbXR2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have a Fedora 23 system running (presumably, since I can't boot it to
be 100% sure) 2.02.132 of LVM. =C2=A0It has ceased to boot and reports:

device-mapper: resume ioctl on (253:2) failed: Invalid argument
Unable to resume laptop-pool00-tpool (253:2)
thin: Data device (dm-1) dicard unsupported: Disabling discard passdown.
thin: 235:2 pool target (735616 blocks) too small: expected 809216
table: 253:2: thin-pool preresume failed, error =3D -22

Any ideas what the problem could be? =C2=A0I can't imagine why all of a
sudden the pool target would be smaller than it should be.

What further information can I provide to help debug (and very
hopefully repair) this system?

Cheers,
b.

--=-5bWNgNQCralH66YNbXR2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJXTW4iAAoJENrB0DQWy8igITkIAIfS0rA2svnVpYM3lDxLib8c
R1o4XscU+76cmikIphxPVyc5I1/H+Uei/f3pmLY+yuUmWYqcIQcIzTIHWzq7aKil
y9D3go+SW0D+ahn4Vtgm3cQXO4LT5HObCqE+dlWX//Y7Q3RpanbpJtyL6R9amirU
FftR6hcAoSR0k8DrNFKsyE8iY2+Mzj2ddCGwZrDQppzXlWfw/ShwyZIWUEloJbOX
JPz/nic0Tv0ptczN4YnrMPHhPmHUVz4wDuJSF5HdXDkjIWj+Xhuu7DlpxvZoemED
qV85MJLPVNuKizBmLjRVKxRejhtFiTmw0Wo8++wsyioWRoXBMIzxUz+y3LpL+c8=
=TQ6w
-----END PGP SIGNATURE-----

--=-5bWNgNQCralH66YNbXR2--
