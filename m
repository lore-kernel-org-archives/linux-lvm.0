Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j22HmSK26992
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 12:48:28 -0500
Received: from lug-owl.de (lug-owl.de [195.71.106.12])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j22HmN37032469
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 12:48:23 -0500
Date: Wed, 2 Mar 2005 18:48:19 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] Partition table gone? Any way to restore?
Message-ID: <20050302174819.GN17589@lug-owl.de>
References: <4225FBC8.9020904@are-b.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DIHcrpw6feLlKbIE"
Content-Disposition: inline
In-Reply-To: <4225FBC8.9020904@are-b.org>
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


--DIHcrpw6feLlKbIE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-03-02 18:45:44 +0100, oliver <oliver@are-b.org>
wrote in message <4225FBC8.9020904@are-b.org>:
> The raid controller complained about a corrupt volume and destroyed it.=
=20
> It was done within a blink of an eye. (So i don't think everything is wip=
ed.
>=20
> However LVM can't find my VG anymore. fdisk -l /dev/hde shows me that=20
> there simply isn't anything on it. Where as fdisk -l /dev/hdg tells me=20
> "Disk /dev/hdg doesn't contain a valid partition table" as I would have=
=20
> expected.

gpart could possibly help by guessing a partition table. This helped me
several times getting some friend's broken Windoze machines to work
again. (@gpart author: if we ever meet IRL, I owe you a beer!)

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

--DIHcrpw6feLlKbIE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCJfxjHb1edYOZ4bsRAh9HAJ94mNNWsJV3QeCs0Nv6G1aPhHhoQQCggznN
r0XZjX0xfNH09E0cFQ3KPXE=
=xAnO
-----END PGP SIGNATURE-----

--DIHcrpw6feLlKbIE--
