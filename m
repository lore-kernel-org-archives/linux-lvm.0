Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3MHMEEh024599
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 13:22:14 -0400
Received: from admin-box.com (admin-box.com [81.169.166.147])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3MHMDPj030881
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 13:22:13 -0400
Message-ID: <444A6634.5050406@admin-box.com>
Date: Sat, 22 Apr 2006 19:21:56 +0200
From: Daniel Troeder <daniel@admin-box.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Existing VG (created here) takes precedence over
 VG
References: <4449E411.7050505@admin-box.com>
In-Reply-To: <4449E411.7050505@admin-box.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig55521948DC15D2006BF2C9F8"
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig55521948DC15D2006BF2C9F8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi :)

It seems, that the unstable version of lvm2 caused the problem. Maybe
that's also the case for Moshe (also running gentoo).

I was running 2.01.09 and later 2.02.02, and that seems OK, but when
upgrading to 2.02.04 I got the problem (see posting "[linux-lvm]
Existing VG (created here) takes precedence over VG").

I downgraded to 2.01.09, and everything's fine now :)

If somebody wants me to debug something, or wants to know further info
about my setup, feel free to mail me.

Bye,
the-happy-Daniel :)

--=20
use PGP key @ http://www.pgp.net/wwwkeys.html
gpg --recv-keys --keyserver hkp://subkeys.pgp.net 0xBB9D4887


--------------enig55521948DC15D2006BF2C9F8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFESmY4g3+4tbudSIcRAi6OAJ9MNCD0J4QqAMGbNOJ642V3e75x4QCfVE42
9d3tYT/da/oWITGawRJfUic=
=Kc0W
-----END PGP SIGNATURE-----

--------------enig55521948DC15D2006BF2C9F8--
