Subject: Re: [linux-lvm] Re: mounting reiserfs snaphost fails
Message-ID: <20021004192508.GC4361@pc.ilinx>
References: <009b01c26ba9$380f3140$5c02a8c0@yckim> <3D9D9C1D.42B8E4C7@silicide.dk> <1033743530.3126.132.camel@saprdlx68> <3D9DBA18.92568359@silicide.dk> <1033749912.2785.138.camel@saprdlx68> <20021004191308.GK11298@maybe.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dKeYJkA19bNVVKdr"
Content-Disposition: inline
In-Reply-To: <20021004191308.GK11298@maybe.net>
From: "Brian J. Murrell" <fbdb029960d4ea13d3d78126a817049f@interlinx.bc.ca>
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
Date: Fri Oct  4 14:41:07 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--dKeYJkA19bNVVKdr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2002 at 12:13:08PM -0700, Chris Jantzen wrote:
>=20
> When I originally evaluated journaled filesystems for use with LVM,
> reiser had the best resize support (in both directions). I believe ext3
> has caught up in that regard.

Ext3 is not quite there yet.  Andreas (Dilger) has some (Alpha or
Beta) patches for online resizing of ext3 filesystem for the 2.4
kernel and I think I recall seeing ext3 online resizing it the last
2.5 kernel status update.

b.

--=20
Brian J. Murrell

--dKeYJkA19bNVVKdr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9nesUl3EQlGLyuXARAhmyAJ4rfKMZkHJLqFVRBfM1dBSqHNsBxwCfSS90
peHYdEHakBVGEQpDo/J3yIU=
=tgG1
-----END PGP SIGNATURE-----

--dKeYJkA19bNVVKdr--
