Return-Path: <bg@blacknet.de>
Date: Thu, 21 Jun 2001 13:08:41 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Help ! raidpatch doesn't work !
Message-ID: <20010621130841.C1278@dragon.blacknet.de>
References: <003b01c0fa4a$342d93e0$97c18fc3@wonderpixel.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline
In-Reply-To: <003b01c0fa4a$342d93e0$97c18fc3@wonderpixel.de>; from oliver@wonderpixel.de on Thu, Jun 21, 2001 at 02:03:37PM +0200
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

--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Thu, Jun 21 '01 at 14:03, Oliver Zeyen wrote:
> I have to patch my Kernel with raid0145-19990713-2.2.10.gz !
While I did not verify this, the version number apears to be ancient.
It seams to be for a 2.2.10 Kernel and from 13. Jul 1999.
You should try to get a more recent version. On
ftp://ftp.de.kernel.org/pub/linux/kernel/v2.2 you can get the latest
linux kernel (of the 2.2 series, it's 2.2.19) and on
ftp://ftp.de.kernel.org/pub/linux/kernel/people/mingo/raid-patches/
You can get the latest RAID patches (raid-2.2.19-A1).=20
Please be carefull when applying the patches in conjunction with the LVM
patches, there is a special section of the README (in LVM/.../PATCHES)
that gives you some IMPORTANT hints.

> BUT I can't decompress this file !
If you download .gz files with MS IE, it tends to uncompress them for
you but still save them as .gz. =20

> Gunzip aways says "uexpected end of file " !
Prhapes you have an incomplete download, try downloading again. To be on
the save side, try wget or lynx from a linux terminal console.=20

    Goetz.

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7MdW4f5srOMkjkQoRAitSAKCcUZTZNjySbYhO/8+cnxl29nWToACgqUpy
YbTsHMbPqyIltKcIFb0wMZQ=
=AY2h
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--
