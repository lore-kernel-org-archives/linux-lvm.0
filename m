Return-Path: <bg@blacknet.de>
Date: Mon, 25 Jun 2001 00:57:57 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] LVM configuration question....
Message-ID: <20010625005757.D7709@dragon.blacknet.de>
References: <Pine.LNX.4.33.0106241729370.4554-100000@bobak.net> <20010624234800.B7709@dragon.blacknet.de> <20010624153217.K2299@pc.ilinx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Content-Disposition: inline
In-Reply-To: <20010624153217.K2299@pc.ilinx>; from lvm@interlinx.bc.ca on Sun, Jun 24, 2001 at 03:32:17PM -0700
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

--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Sun, Jun 24 '01 at 15:32, Brian J. Murrell wrote:
> > Well, you can force pvcreate to use /dev/sdc, but you should not.
>=20
> Why not?  I thought for non-system (i.e. boot) disks this was
> perfectly acceptable.
It will gain you about a meg (one cylinder), but will cause all kind of
trouble when you're not very carefyll. lilo, other OSes installers,
user errors can easily cause the rewriting of a MBR. This will kill your
PV, and the VG it belongs to.
Some readers already had this happen, and it was QUITE a pain to recover
the data on the affected VG (I'm not sure if everyone was able to
recover their data, for sure some were (with the help of Heinz IIRC))

    Goetz.

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7NnB1f5srOMkjkQoRAgQfAJwI4vngWXgh+KWsRAMSkZvgZERD3wCcDK9o
Mr6TsBdig4qZWTHgL+xL0H8=
=AzkB
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--
