Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4JNE8Zu017615
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 19:14:08 -0400
Received: from mail.bitfolk.com (bitfolk.com [85.119.80.223])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4JNE6cq016207
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 19:14:07 -0400
Received: from andy by mail.bitfolk.com with local (Exim 4.72)
	(envelope-from <andy@strugglers.net>) id 1SVsqb-0004UY-T9
	for linux-lvm@redhat.com; Sat, 19 May 2012 23:14:06 +0000
Date: Sat, 19 May 2012 23:14:05 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20120519231404.GF3867@bitfolk.com>
References: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
	<20120517181350.2922a70b@bettercgi.com>
	<4FB623AC.9060900@redhat.com>
	<CAGQjrKYrgcx+y8M6NnLGZK5Z+hNpH3Fp4E2EysnKGZuObaFuBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-ripemd160;
	protocol="application/pgp-signature"; boundary="8R/sMIKPJVD0CT2D"
Content-Disposition: inline
In-Reply-To: <CAGQjrKYrgcx+y8M6NnLGZK5Z+hNpH3Fp4E2EysnKGZuObaFuBA@mail.gmail.com>
Subject: Re: [linux-lvm] lvreduce nightmare
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


--8R/sMIKPJVD0CT2D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi tariq,

On Fri, May 18, 2012 at 07:43:40PM +0530, tariq wali wrote:
> so to i guess to do this right i should have
>=20
> resize2fs /dev/vg0/data 1.6T or (1600G)
>=20
> and then lvreduce -n data -L 100G /dev/vg0/data ( to reduce the lvm by 100
> )

I believe that will also reduce the LV *to* 100G. You want:

# lvreduce -n data -L-100G

if you want to reduce it *by* 100G.

Nothing like FS/LV shrinking to keep you on your toes..

Cheers,
Andy

--=20
http://bitfolk.com/ -- No-nonsense VPS hosting

--8R/sMIKPJVD0CT2D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEAREDAAYFAk+4KTsACgkQIJm2TL8VSQvadgCdFfn/WdMLPkSsEdiF/+4Py8Ds
hCcAoIVocvHCvD/4lft601QFLqjPHFPC
=pgU1
-----END PGP SIGNATURE-----

--8R/sMIKPJVD0CT2D--
