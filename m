Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6N2aIV25005
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2005 22:36:18 -0400
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6N2aHJH006657
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2005 22:36:17 -0400
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1Dw9s3-0000j9-VT
	for linux-lvm@redhat.com; Sat, 23 Jul 2005 02:36:12 +0000
Date: Sat, 23 Jul 2005 02:36:11 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20050723023611.GA8874@strugglers.net>
References: <20050721143622.GC8874@strugglers.net>
	<20050723022823.GZ8874@strugglers.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4h1YAYYGvrs/9Np5"
Content-Disposition: inline
In-Reply-To: <20050723022823.GZ8874@strugglers.net>
Subject: Re: [linux-lvm] Unusable LV, how to unlock it?
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
To: linux-lvm@redhat.com


--4h1YAYYGvrs/9Np5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Cut and paste error, the below is actually the output of:

$ sudo lvs -v | egrep '(LV|admin)'

before anyone gets even more confused.

> $ sudo lvs -v mainvg/adminroot
>     Finding all logical volumes
>   LV                VG     #Seg Attr   LSize   Maj Min KMaj KMin Origin S=
nap%  Move Copy%  LV UUID                           =20
>   admindata         mainvg    1 -wi-a-   5.86G  -1  -1 254  42           =
                  cCHdlP-bllQ-Nt50-aJAN-hLrq-bjUk-K7jCsP
>   adminroot         mainvg    1 -wi-ao 500.00M  -1  -1 254  38           =
                  CjHGy8-QpGK-oH35-P5U5-8Di1-NKeY-speIR2
>   adminswap         mainvg    1 -wi-a- 256.00M  -1  -1 254  43           =
                  8Q2Z20-jIew-K2Vd-t47K-n4IO-6KBI-28PIAm

--4h1YAYYGvrs/9Np5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC4a0bIJm2TL8VSQsRAsdjAKCVn3Greq8QumA1IFcYqP1hZOFPogCg3YDj
8hqT2qnOJ1USHmBOjlo3ahI=
=7ahw
-----END PGP SIGNATURE-----

--4h1YAYYGvrs/9Np5--
