Return-Path: <lewis@sistina.com>
Date: Wed, 7 Feb 2001 09:17:14 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Re: with 2.4.1, should I use beta2 or beta3 lvm-tools?
Message-ID: <20010207091714.A22166@sistina.com>
References: <61DA682E8A5CD4119CD80050DA4E318BCAC39E@josef.wineasy.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <61DA682E8A5CD4119CD80050DA4E318BCAC39E@josef.wineasy.se>; from h.jettingstad@wineasy.se on Wed, Feb 07, 2001 at 10:41:25AM +0100
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

--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 07, 2001 at 10:41:25AM +0100, H?kan Jettingstad wrote:
> When I try to apply the patch that LVM 0.9.1beta3 creates with:=20
>=20
> ./configure --with-kernel_dir=3D/usr/src/linux-2.4.1 creates, on my
> /usr/src/linux-2.4.1 directory like this:
>=20
> hostname:/usr/src/linux-2.4.1# cat
> /usr/src/LVM/0.9.1_beta3/PATCHES/lvm-0.9.1_beta3-2.4.1.patch | patch -p1
> patching file include/linux/lvm.h
> patching file drivers/md/lvm.c
> patching file drivers/md/lvm-snap.c
> patching file drivers/md/Config.in
> Reversed (or previously applied) patch detected!  Assume -R? [n]=20
> Apply anyway? [n] n
>=20
> I get the above error, should it apply cleanly or can I just ignore this =
and
> answer y to apply anyway?

The problem is that Linux 2.4.1 was not out when we released LVM 0.9.1
Beta3, so we don't have a fragments file for it.  If you create an empty
file in the PATCHES/ directory called 'fragments-2.4.1' and rerun configure
and make in the PATCHES directory, you should get a valid patch for 2.4.1

Regards,
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
File not found. Should I fake it? (Y/N)
-----End Obligatory Humorous Quote------------------------------------------

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6gWb6pE6/iGtdjLERAn57AJ9qhqxrYqYLYdAsg92C5I+cTmfH7wCfeOTB
syzsjtlPBGLOzFdtrO7wkr0=
=Zqey
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
