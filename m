From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Message-ID: <20021128075428.GX951@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vo2ArcSjcOqS/fzO"
Content-Disposition: inline
Subject: [linux-lvm] LVM2: Bad LV-UUID?
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Nov 28 01:54:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Vo2ArcSjcOqS/fzO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I've gone to LVM2 yesterday, which included creating LVM2-style PVs, VGs
and one LV. The strange thing for me is that the LV's UUID is
"000000-0000-0000-0000-0000-0000-000000", which doesn't really look like
it was intended... Just a hint for a possible bug somewhere:-)

Btw., userland is what you get with 'apt-get install lvm2', this tells
for version:

	LVM Version:		1.95.10 (2002-05-31)
	Library Version:	0.96.04-ioctl-cvs (2002-08-14)
	Driver Version:		1.0.8

I know, ports of it aren't that up-to-date, but I don't know (yet) if
this is a bug and if it's a _known_ bug...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet!
   Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/

--Vo2ArcSjcOqS/fzO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQE95cu0Hb1edYOZ4bsRAsqbAJ9t5Ac5cTn6dnURFMZYXNZ1LI1YHgCfRJoc
splkAM84+wNlWTluprC6+ww=
=Sgtm
-----END PGP SIGNATURE-----

--Vo2ArcSjcOqS/fzO--
