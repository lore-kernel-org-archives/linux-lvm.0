Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4KJjvAF024006
	for <linux-lvm@redhat.com>; Sun, 20 May 2012 15:45:57 -0400
Received: from mail.bitfolk.com (bitfolk.com [85.119.80.223])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4KJjuDt028863
	for <linux-lvm@redhat.com>; Sun, 20 May 2012 15:45:56 -0400
Received: from andy by mail.bitfolk.com with local (Exim 4.72)
	(envelope-from <andy@strugglers.net>) id 1SWC4g-0001PR-V8
	for linux-lvm@redhat.com; Sun, 20 May 2012 19:45:55 +0000
Date: Sun, 20 May 2012 19:45:54 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20120520194554.GH3867@bitfolk.com>
References: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
	<20120517181350.2922a70b@bettercgi.com>
	<4FB623AC.9060900@redhat.com>
	<CAGQjrKYrgcx+y8M6NnLGZK5Z+hNpH3Fp4E2EysnKGZuObaFuBA@mail.gmail.com>
	<20120519231404.GF3867@bitfolk.com>
	<CAGQjrKaWT_LnjxbEE57-Mxhn+n+KSvHEGUwC7wapQ7S9Dcb-aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-ripemd160;
	protocol="application/pgp-signature"; boundary="Cou6PmgoyP0+llr2"
Content-Disposition: inline
In-Reply-To: <CAGQjrKaWT_LnjxbEE57-Mxhn+n+KSvHEGUwC7wapQ7S9Dcb-aA@mail.gmail.com>
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


--Cou6PmgoyP0+llr2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tariq,

On Sun, May 20, 2012 at 02:29:56PM +0530, tariq wali wrote:
> I am not sure if reducing by lvreduce alone is safe and will actually
> reduce the underneath file system also,

It won't; I never said it would.

My point was that you said:

> and then lvreduce -n data -L 100G /dev/vg0/data ( to reduce the lvm by
> 100

but that WON'T do what you want. That will reduce the LV *to* 100G.

You need BOTH your resize2fs AND lvreduce commands to be correct.

Cheers,
Andy

--=20
http://bitfolk.com/ -- No-nonsense VPS hosting

--Cou6PmgoyP0+llr2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEAREDAAYFAk+5SfIACgkQIJm2TL8VSQvwrwCgnrJu63MuEY/i5JzhGQz+sTh3
Yp8An38QDovUGj8vKGzMwWTepsfMHgKC
=bPLY
-----END PGP SIGNATURE-----

--Cou6PmgoyP0+llr2--
