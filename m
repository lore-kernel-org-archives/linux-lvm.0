Return-Path: <lewis@sistina.com>
Date: Sun, 25 Feb 2001 17:52:46 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Slackware init
Message-ID: <20010225175246.A31937@sistina.com>
References: <Pine.LNX.4.20.0102251304220.27667-100000@rdb.linux-help.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.20.0102251304220.27667-100000@rdb.linux-help.org>; from ardy@rdb.linux-help.org on Sun, Feb 25, 2001 at 01:33:05PM -0500
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2001 at 01:33:05PM -0500, ardy@rdb.linux-help.org wrote:
> What happens is when vgscan starts, it takes about 1.5 minutes to scan,
> and while its scanning, the kernel is reporting a whole lot of modprobe
> errors for modules I don't have/need. What I ended up doing was aliasing
> off the block-major devices that were being scanned that I don't have on
> my system:
>=20
> alias block-major-9     off
> alias block-major-22    off
> alias block-major-33    off
> alias block-major-34    off
> alias block-major-48    off
> alias block-major-49    off
> alias block-major-50    off
> alias block-major-51    off
> alias block-major-52    off
> alias block-major-53    off
> alias block-major-54    off
> alias block-major-55    off
>=20
> Consequently, the loop block module gets loaded because it too is scanned=
.=20
> After the 1.5 minute scan, everything is mounted from fstab, including the
> LVM volumes.=20

Are you by chance using a 2.4.x kernel with devfs support compiled in, but
not being mounted?  I am seeing the same thing with that setup.

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Carpe Aptenodytes! (Seize the Penguins!)
-----End Obligatory Humorous Quote------------------------------------------

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6mZrOpE6/iGtdjLERAhMNAJ0W4YS0Z8hBjaJeSQJxWsJsguLGIQCgkIVK
oZxIGk6+AWyEg5HigeQB0lM=
=COUl
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
