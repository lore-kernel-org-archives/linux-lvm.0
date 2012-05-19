Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q4JBbUJb014424
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 07:37:30 -0400
Received: from mail-lpp01m010-f46.google.com (mail-lpp01m010-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4JBbQJh029769
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 07:37:26 -0400
Received: by lahd3 with SMTP id d3so3899972lah.33
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 04:37:25 -0700 (PDT)
Message-ID: <1337427443.2041.26.camel@koala>
From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Sat, 19 May 2012 14:37:23 +0300
In-Reply-To: <jp804k$r4o$3@dough.gmane.org>
References: <20120317175827.GB12111@agk-dp.fab.redhat.com>
	<1332008213-3940-1-git-send-email-maximlevitsky@gmail.com>
	<jp804k$r4o$3@dough.gmane.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Mh5ecpQdd018BJXQYThK"
Mime-Version: 1.0
Subject: Re: [linux-lvm] [PATCH] mtd: sm_ftl: fix typo in major number.
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
To: Alex Elsayed <eternaleye+usenet@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-lvm@redhat.com


--=-Mh5ecpQdd018BJXQYThK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-05-19 at 04:28 -0700, Alex Elsayed wrote:
> Maxim Levitsky wrote:
>=20
> > major =3D=3D 0 allocates dynamic major, not major =3D=3D -1
>=20
> I would appreciate if this could be submitted for -stable, since the=20
> negative major number breaks LVM (regardless of whether any such devices =
are=20
> present). I found this out the hard way when my system failed to boot.=
=20
>=20
> -stable note: This is in Linus' tree as=20
> 452380efbd72d8d41f53ea64c8a6ea1fedc4394d

It is in Linuses tree already, so I cannot add the "Cc:
stable@kernel.org" tag anymore. You should send a request to Greg and
explain that you want this patch in -stable.

--=20
Best Regards,
Artem Bityutskiy

--=-Mh5ecpQdd018BJXQYThK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPt4XzAAoJECmIfjd9wqK03+4QALksHhNbOLYBQVC5nyg/jSNm
hpldoW4ykfKTyqpAgnFKB6bYjcQxeoItH4T803CkETiLSG6ewGXNFI8/P6RxoyW1
yXfmzZtXzqUoFPV4Z+mhg89ryv5A1sprRrxYPQ76lJHMLWv595NU0ztyfjk6SyMS
AMd0IbCM3JY/sXwfyxSIGJt45VJN9k8BVp9gbXGp4185MXf9jM2qs8J8XcJDIP+3
uB9HDv7MhB7oiJ+CiJCQ/0guCh47uRq7mbOi5hV47k0WolSQdf8Mmc1KxpnkTbQd
jwCZO7hwHtACErKHqH6jFYVqqLY3vWQCdhF82LEzobUhbY1TuP0mXMt+TqDx1R4s
Z2kN8Xe0giehPKA5xh9Oyk7t+rXTfJQs5Zk30skQLEpdTbVZjSs2JvbT9mw0PRZ6
cfgUEckCVyZccj5Eg04mQSd9XkMhl/GOi+2gVJVVE/ymOjub/fUBO/tKX3EidbHt
q8tidEnye8CkADMRafpVbfzHYzukrX/5wqh/Rue/qjoJgorKL2+RQPNHXlOfqYGh
e+CS731DZUD9hMBxCuLSf9TbT95bsuZuS0PdCCy1+kFw1dcqT7G7SAdERr6j6Lrp
W+aD3EaWPzRGoOSJKBOqDQ6ScMe0gckf0YPhUQKZ7vCR5esvKceNugNmjyKybA1N
zfXhM17ZQcBjXdpJ7G8i
=6Aem
-----END PGP SIGNATURE-----

--=-Mh5ecpQdd018BJXQYThK--
