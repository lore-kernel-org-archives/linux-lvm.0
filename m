Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0FE3SO19893
	for <linux-lvm@redhat.com>; Sat, 15 Jan 2005 09:03:28 -0500
Received: from lug-owl.de (lug-owl.de [195.71.106.12])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0FE3M6t023456
	for <linux-lvm@redhat.com>; Sat, 15 Jan 2005 09:03:22 -0500
Date: Sat, 15 Jan 2005 15:03:14 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] devmapper
Message-ID: <20050115140314.GH28037@lug-owl.de>
References: <41E6B060.3030400@berbee.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqCDj3hiknadvR6t"
Content-Disposition: inline
In-Reply-To: <41E6B060.3030400@berbee.com>
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


--AqCDj3hiknadvR6t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2005-01-13 11:31:12 -0600, Alan Jurgensen <jurgensen@berbee.com>
wrote in message <41E6B060.3030400@berbee.com>:
> I love LVM and device mapper functionality...
> I dont like how 'df' spills over many lines now with the=20
> /dev/mapper/myvg-mylv syntax...
> any idea how I can shorten the device path? how about /dev/dm/myvg-mylv

Maybe you want to try posix-correct output, requested by -P ?

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

--AqCDj3hiknadvR6t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB6SKhHb1edYOZ4bsRAncYAJ9VSkwy14hv2jFB2G8tq9JTIt+hwACfZ2mB
1SdKcZXeoNRZHfWtqJhkSFI=
=NfkO
-----END PGP SIGNATURE-----

--AqCDj3hiknadvR6t--
