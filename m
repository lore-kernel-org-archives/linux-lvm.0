Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7CDaja24879
	for <linux-lvm@redhat.com>; Thu, 12 Aug 2004 09:36:45 -0400
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i7CDadXn032207
	for <linux-lvm@redhat.com>; Thu, 12 Aug 2004 09:36:40 -0400
Date: Thu, 12 Aug 2004 15:36:39 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] fix lost vgda
Message-ID: <20040812133638.GW16935@lug-owl.de>
References: <30BB5E9998236744913B2C0E04D24D39061510CE@zonda.eu.tieto.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JsZT+zyIIjunjBOn"
Content-Disposition: inline
In-Reply-To: <30BB5E9998236744913B2C0E04D24D39061510CE@zonda.eu.tieto.com>
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


--JsZT+zyIIjunjBOn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-08-12 09:51:14 +0300, Onni.Rautanen@tietoenator.com <Onni.Raut=
anen@tietoenator.com>
wrote in message <30BB5E9998236744913B2C0E04D24D39061510CE@zonda.eu.tieto.c=
om>:
> Accidentally when creating the partitions for the raid5 array I did it on=
 the wrong machine =3D) and now I've lost the partition table/vgda for thos=
e 160gb disks in the lvm.

For the partition table, try gpart.

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Irak! =
  O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--JsZT+zyIIjunjBOn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBG3JmHb1edYOZ4bsRAv61AJ4/qTyNSFCq/pH+Q+y/XHufrXbg1gCbBOBT
rWEfNjXw6s9P5+6mV9PR8kU=
=h45l
-----END PGP SIGNATURE-----

--JsZT+zyIIjunjBOn--
