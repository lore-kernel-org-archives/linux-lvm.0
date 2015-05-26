Date: Tue, 26 May 2015 10:06:20 +0200
From: Christian Hesse <mail@eworm.de>
Message-ID: <20150526100620.487e7703@leda.localdomain>
In-Reply-To: <20150525183650.36634482@leda.localdomain>
References: <20150521141955.70ebe714@leda.localdomain>
	<5562CC3F.9010901@redhat.com>
	<20150525183650.36634482@leda.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/r=oZ/fW8nhnUrNOJ/MpgNcu";
	protocol="application/pgp-signature"
Subject: Re: [linux-lvm] autoactivation fails
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
To: Ondrej Kozina <okozina@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--Sig_/r=oZ/fW8nhnUrNOJ/MpgNcu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Christian Hesse <list@eworm.de> on Mon, 2015/05/25 18:36:
> Ondrej Kozina <okozina@redhat.com> on Mon, 2015/05/25 09:16:
> > On 05/21/2015 02:19 PM, Christian Hesse wrote:
> > > Hello everybody,
> > >
> > > with recent lvm2 I had problems booting an Arch Linux system with
> > > non-systemd initramfs. lvmetad is launched, but volumes are not
> > > activated. A git bisect reported this bad commit:
> > >
> > > commit fe30658a4d5fe4e4e6bb346c9c9ee7142a98f49d
> > > Author: Ondrej Kozina <okozina@redhat.com>
> > > Date:   Mon Apr 13 16:29:15 2015 +0200
> >=20
> > Fixed by commit:
> >=20
> > commit f8bf6410954fcf82bf28852e0dba015c6b7f19dc
> > Author: Ondrej Kozina <okozina@redhat.com>
> > Date:   Fri May 22 14:48:28 2015 +0200
> >=20
> >      lvmetad.c: ignore lvmetad global handle on disconnect
> >=20
> >      do not unset lvmetad global handle on disconnect. This is
> >      hotfix for issue described in:
> >      https://www.redhat.com/archives/linux-lvm/2015-May/msg00008.html
> >=20
> >      Reported-by: Christian Hesse <list@eworm.de>
> >=20
> > pvscan --cache --background segfaulted due to NULL ptr dereference.
> >=20
> > Thanks for the report!
>=20
> Looks good. Thanks a lot!

Actually running v2.02.220 with commit f8bf6410 on top. Volumes are
activated, but udev reports:

timeout, giving up waiting for workers to finish

This adds a boot delay of 30 seconds. Not perfectly sure if this is an lvm2
issue though, chances are that this is caused by systemd v220 update. Any
ideas?
--=20
Best regards,
Chris

--Sig_/r=oZ/fW8nhnUrNOJ/MpgNcu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZCl8AAoJEFTtyRYJvJGDG10P/1OEOK53Mr+T86a+Yb33EMr2
yYlR4G/obJ3Ir9qaX4y6wl6WG/PfzTPdDFyMZhWhfqxoBuLbXX4j7I9BQtXQi7TE
M5xHj8WvzkDhoL5SjwKfq65Lx6HNYv/GuKT03hsL85Yp3ULEjAf5Uc9SyzqPAgnP
qKTH0m0i3kLux8m4oGWAhll7EvlmvrzDi2FQQZ9PfQc0Gq/FThmQZM1gGiNXoKYl
dIzC+Zb3pAyar5IZjipeBsmSwHevqt8lnXb2tsoQmBLJ0949mSOGSYU+/6bxZ9Or
B3KZ2N6CgYqETUOd5XyFspHjJRgNnEyok0ZwemHiG1l7USlnsSSZfqnN1o07k0hy
j+YDGiorM1M070oJq+4GbAp+9t5tq2GYVJ75LfHm8fQgC6CDazg24ZvyaO3jAK4M
tqQj6qy/SfAoiY3uNvEwpAVPll26WOFORqYwjvvMhnA+IQjsvTg/jCecVwvPbSEf
lxI11gj9Iuj6AaSzXuxfqPWlytig9Uxyz/z25Xdk2KmtIFENMdfNmAKG+HY0byd0
uVWO4I+017t6r2J68PixPLeEEYr3rfKOuJNTTRiWnhuzGMEUFcoclF4EcFOih9+Y
jgJjzAnoN4mmH6bBdF54/yef1b/Jiuu8LCmpJ8NI822926qLFQG3RJiGreG+FzZn
kTtYDoC8LWUTEOptYZX5
=7wCR
-----END PGP SIGNATURE-----

--Sig_/r=oZ/fW8nhnUrNOJ/MpgNcu--
