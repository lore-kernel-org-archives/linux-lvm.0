From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] resize an ext3 on an LV
Message-ID: <20030129152817.GT30184@lug-owl.de>
References: <Pine.LNX.4.44.0301290900350.22463-100000@zeus.itg.uiuc.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XAxdu+gdzyY/jMFv"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0301290900350.22463-100000@zeus.itg.uiuc.edu>
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
Date: Wed Jan 29 09:29:01 2003
List-Id: <linux-lvm.redhat.com>
To: Linux LVM Sistina <linux-lvm@sistina.com>

--XAxdu+gdzyY/jMFv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-01-29 09:16:15 -0600, Alexander Lazarevich <alazarev@itg.uiuc.=
edu>
wrote in message <Pine.LNX.4.44.0301290900350.22463-100000@zeus.itg.uiuc.ed=
u>:
> A rehash of some questions I asked earlier, but I want to clarify:
>=20
> Redhat 7.3, 2.4.18-19.7.xsmp kernel, using LVM 1.03.
>=20
> I've got a 180GB LV (/dev/homevg/userslv) which contains an ext3=20
> filesystem (mount point /home/users).
>=20
> Once I umount the /dev/homevg/userslv, can I use resize2fs to extend the=
=20
> ext3 filesystem? Or must I first remove the journal from ext3, then=20
> resize, then add the journal back to it, then remount?

You can directly enlarge the filesystem, but, of course, you've got to
extend the logical volume before that... You don't need to remove the
journal, at least, this worked numerous times for me:-)

However, backup is always a good idea, though.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet!
   Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/

--XAxdu+gdzyY/jMFv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+N/MRHb1edYOZ4bsRAisgAJ422LqOyEVWyG44T5sHMfF/HpnTLQCfXXEO
QaxeEXX3ZLUUK8GC7oGVs6w=
=vkyf
-----END PGP SIGNATURE-----

--XAxdu+gdzyY/jMFv--
