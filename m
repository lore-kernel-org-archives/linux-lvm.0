Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m51N0sFI012604
	for <linux-lvm@redhat.com>; Sun, 1 Jun 2008 19:00:54 -0400
Received: from lug-owl.de (lug-owl.de [195.71.106.12])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m51N0e1V014554
	for <linux-lvm@redhat.com>; Sun, 1 Jun 2008 19:00:41 -0400
Date: Mon, 2 Jun 2008 01:00:39 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] Distributed LVM/filesystem/storage
Message-ID: <20080601230039.GO19431@lug-owl.de>
References: <20080529231213.GY19431@lug-owl.de>
	<48430FED.1080306@theendofthetunnel.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oNVW4gaiVGQBzhrj"
Content-Disposition: inline
In-Reply-To: <48430FED.1080306@theendofthetunnel.de>
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


--oNVW4gaiVGQBzhrj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2008-06-01 23:09:01 +0200, Hannes Dorbath <light@theendofthetunnel.=
de> wrote:
> Jan-Benedict Glaw wrote:
> > However I still fail to find a good approach. One initial idea was to
> > export all physical volumes (partitions or full disks) vie NBD, join
> > them all on a single machine into one VG/LV, create a filesystem and
> > re-export that via NFS/SMB/...  However, all data would need to go
> > through the net twice. While speed isn't the most important thing here
> > (but storage is!), that's way suboptimal.
>=20
> GlusterFS with Unify translator is exactly what you are asking for.
>=20
> http://www.gluster.org/docs/index.php/GlusterFS

Already had a look at that, too. "Unify" seems to not directly
implement any measure of redundancy. So if one Brick goes down,
everything that was there is gone. Maybe its possible to play with the
`mirror' translator as well, but on the first look, it seems to be
non-trivial to accomodate for a steady loss and addition of bricks.

MfG, JBG

--=20
      Jan-Benedict Glaw      jbglaw@lug-owl.de              +49-172-7608481
Signature of: 23:53 <@jbglaw> So, ich kletter' jetzt mal ins Bett.
the second  : 23:57 <@jever2> .oO( kletter ..., hat er noch Gitter vorm Bet=
t, wie fr=C3=BCher meine Kinder?)
              00:00 <@jbglaw> jever2: *patsch*
              00:01 <@jever2> *aua*, wof=C3=BCr, Gedanken sind frei!
              00:02 <@jbglaw> Nee, freie Gedanken, die sind seit 1984 doch =
aus!
              00:03 <@jever2> 1984? ich bin erst seit 1985 verheiratet!

--oNVW4gaiVGQBzhrj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIQyoXHb1edYOZ4bsRAoxrAJwIqoBKgtlZheBQwlOMlaKzSxV+rgCdE7EL
N9oMwfFYAObZocZ0QbgIhxQ=
=neRO
-----END PGP SIGNATURE-----

--oNVW4gaiVGQBzhrj--
