Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i446ncv28789
	for <linux-lvm@redhat.com>; Tue, 4 May 2004 02:49:38 -0400
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i446nb99022792
	for <linux-lvm@redhat.com>; Tue, 4 May 2004 02:49:37 -0400
Date: Tue, 4 May 2004 08:49:35 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] [PATCH] crypto for LVM2
Message-ID: <20040504064935.GV29503@lug-owl.de>
References: <20040503232018.GD7384@fukurou.paranoiacs.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iO5NTrAl+y2STuOh"
Content-Disposition: inline
In-Reply-To: <20040503232018.GD7384@fukurou.paranoiacs.org>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--iO5NTrAl+y2STuOh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-05-03 19:20:20 -0400, Ben Slusky <sluskyb@paranoiacs.org>
wrote in message <20040503232018.GD7384@fukurou.paranoiacs.org>:
>=20
> I'd like to submit for discussion this patch (against version 2.00.08),
> which adds the ability to create and manipulate encrypted volumes, using
> the dm-crypt target that was merged into kernel 2.6.4.

I'm basically running this (md devices as PVs, which form one VG, which
contains a number of LVs).

Most of the LVs are encrypted using dm-crypt. It's easy - I've just
written a small script to to the dmsetup stuff and mount the newly
available (encrypted) LVs. This way, the box boots up fine and is
useable. If I want to make those additional (encrypted) LVs available, I
may just call that script and supply the password.

So I don't think it's really neccessary to place this functionality into
the lvm2 tools; especially, this could possibly block the boot-up
process (that's bad on a box which has a dozen unencrypted volumes which
would already work fine)...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--iO5NTrAl+y2STuOh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAlzz/Hb1edYOZ4bsRAn7SAJ0T4bYxSjTs6KajsA0vA9/dmYs8UgCfbpvu
TbkT5UJvq4tyi00hoe/W54w=
=Z5h2
-----END PGP SIGNATURE-----

--iO5NTrAl+y2STuOh--
