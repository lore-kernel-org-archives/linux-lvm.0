Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j22I5jK32724
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 13:05:45 -0500
Received: from lug-owl.de (lug-owl.de [195.71.106.12])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j22I5d9I003459
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 13:05:40 -0500
Date: Wed, 2 Mar 2005 19:05:37 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] Partition table gone? Any way to restore?
Message-ID: <20050302180537.GO17589@lug-owl.de>
References: <4225FBC8.9020904@are-b.org> <20050302174819.GN17589@lug-owl.de>
	<4225FEBC.2060505@are-b.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6UN8o5L9lg84kB7u"
Content-Disposition: inline
In-Reply-To: <4225FEBC.2060505@are-b.org>
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


--6UN8o5L9lg84kB7u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-03-02 18:58:20 +0100, oliver <oliver@are-b.org>
wrote in message <4225FEBC.2060505@are-b.org>:
> When i do a less -f /dev/hde I can see a lot of data.
>=20
> E.g. I see a string looking a lot like ReiserFS and scrolling down=20
> further I see /dev/vg00/<nameofparts created> so I'm sure a LOT is still=
=20
> there. I'll give it a shot. Any other ideas are still welcome!

So let gpart guess and re-install a partition record. Though, you'd
better prepare a backup of that given HDD...

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=C3=BCrger" | im Internet! |   im Ira=
k!   O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--6UN8o5L9lg84kB7u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCJgBwHb1edYOZ4bsRAh2tAJ0fAjwZ0Xq0B4J5E5QjA0Kp3NwrWwCbBCWp
29uzjaGysoYEUwadtFWVqoU=
=8LYQ
-----END PGP SIGNATURE-----

--6UN8o5L9lg84kB7u--
