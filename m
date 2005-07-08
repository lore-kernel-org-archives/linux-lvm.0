Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j68GjhV21417
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 12:45:43 -0400
Received: from wavehammer.waldi.eu.org (postfix@wavehammer.waldi.eu.org
	[82.139.196.55])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j68GjbRM006586
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 12:45:38 -0400
Date: Fri, 8 Jul 2005 18:45:36 +0200
From: Bastian Blank <bastian@waldi.eu.org>
Message-ID: <20050708164536.GE15561@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EgVrEAR5UttbsTXg"
Content-Disposition: inline
Subject: [linux-lvm] pvextend
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


--EgVrEAR5UttbsTXg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks

I found some mails about a pvextend but noone implemented it. If I see
it correctly, I just need to change the value of pe_count and commit the
metadata, correct?

If yes, a poor mans pvextend is vi and pvcreate with the changed
metadata backup.

Bastian

--=20
Respect is a rational process
		-- McCoy, "The Galileo Seven", stardate 2822.3

--EgVrEAR5UttbsTXg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iEYEARECAAYFAkLOrbAACgkQnw66O/MvCNGCtACcC4nw9NRhqOHfyYQAzXHUgZ/o
GX4An1clAe+dCUc/3M1FOEDAOrVnKinM
=9OeG
-----END PGP SIGNATURE-----

--EgVrEAR5UttbsTXg--
