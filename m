Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u51MraJ5028768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 1 Jun 2016 18:53:36 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2318BC049D5B
	for <linux-lvm@redhat.com>; Wed,  1 Jun 2016 22:53:32 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1b8F0y-0000Bf-EY
	for linux-lvm@redhat.com; Thu, 02 Jun 2016 00:53:28 +0200
Received: from d67-193-213-211.home3.cgocable.net ([67.193.213.211])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 02 Jun 2016 00:53:28 +0200
Received: from brian by d67-193-213-211.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 02 Jun 2016 00:53:28 +0200
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Wed, 01 Jun 2016 18:52:57 -0400
Message-ID: <1464821577.13773.9.camel@interlinx.bc.ca>
References: <1464692258.30702.376.camel@interlinx.bc.ca>
	<4f3ac280-86a3-a63d-803c-5719bca79d3e@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-sdvtaBygTxSO+anRsXL9"
In-Reply-To: <4f3ac280-86a3-a63d-803c-5719bca79d3e@redhat.com>
Subject: Re: [linux-lvm] thin: 235:2 pool target (735616 blocks) too small:
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


--=-sdvtaBygTxSO+anRsXL9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-05-31 at 13:22 +0200, Zdenek Kabelac wrote:
> Hi

Sorry for the delay. =C2=A0It can be a bugger to get an environment on a
laptop that won't boot USB devices to a state where you can access the
PV and store something from it.

> Well - could you post somewhere for download 1st. MB of your
> PV device?
>=20
> dd if=3D/dev/sdX of=3D/tmp/upload_me bs=3D1M count=3D1

You should be able to get that from:

http://www.interlinx.bc.ca/~brian/lvm-pv.img

> Have you already tried to restore in some way ?

I have not tried anything yet for fear of making things worse ("angels
tread" and all that), so this is a blank slate from the point of it
first failing.

Cheers,
b.

--=-sdvtaBygTxSO+anRsXL9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJXT2dJAAoJENrB0DQWy8igxAAH/jIfveKdccLvjuYI70OWpeO2
tKeWs1fhFWu8dO/VUwuJpa9JN+N8M83RK50ZF57dRnsAVNI9c+wrAmqj+7GIrFwJ
m3fOy+8nj4cjhuy9RSFpOX5csmq1BBzK3Q282LVpNOkXV6KrJloth51x3M4srOJ6
Mw8QbOp0jEdEzRrngR1PdJT4xKYM3uF3Dj7j9KjphThPXWPmkr7imGX3uIFC2NtA
4Z8WkbshTNQEGrk5L8x9TKFb53GI5PCFVuHmZEjglpNGMfP/hD7A+az6c0wxaNCa
/KLGQMNkM/0qzLIEPswwCisLWJWtlORdrVbd6KRirekBNSAgzxEc+Zr/E5XoG8A=
=L1AI
-----END PGP SIGNATURE-----

--=-sdvtaBygTxSO+anRsXL9--
