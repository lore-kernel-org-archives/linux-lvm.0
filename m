Return-Path: <bg@blacknet.de>
Date: Fri, 27 Apr 2001 23:33:34 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] LVM on root, Kernel panic: "I have no root and I must scream"
Message-ID: <20010427233334.B10716@dragon.blacknet.de>
References: <3AE91AEF.22ABDC51@home.com> <20010427224740.D2260@colombina.comedia.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <20010427224740.D2260@colombina.comedia.it>; from bluca@comedia.it on Fri, Apr 27, 2001 at 10:47:40PM +0200
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

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Fri, Apr 27 '01 at 22:47, Luca Berra wrote:
> > After activating vg00 and umounting /proc (in initrd/linuxrc), the syst=
em=20
> > dies:
> >=20
> > Kernel panic: I have no root and I must scream!
> >=20
> i use lilo not grub,
Me too ;-)

IMNSHO the problem is neither lilo nor grub.

The kernel does not know what device to boot from, check ther kernele
boot device (rdev /boot/my_kernel) after running lilo / grub. Probably
the device id changes between boots. use rdev to explicitely set it to
/dev/vg00/root.

Cu,
    Goetz.

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE66eWtf5srOMkjkQoRAjzzAKC4a79NqtRxPO26/r7cYkBDEkbQgACghKgd
27W3DfCPuSBf2HcLf9nS1bs=
=MKan
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
