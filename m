Return-Path: <bg@blacknet.de>
Date: Sun, 24 Jun 2001 23:48:00 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] LVM configuration question....
Message-ID: <20010624234800.B7709@dragon.blacknet.de>
References: <Pine.LNX.4.33.0106241729370.4554-100000@bobak.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0106241729370.4554-100000@bobak.net>; from mark@bobak.net on Sun, Jun 24, 2001 at 05:30:27PM -0400
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

--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Sun, Jun 24 '01 at 17:30, Mark J. Bobak wrote:
> # pvcreate /dev/sdc
> pvcreate -- device "/dev/sdc" has a partition table
>=20
> So, can anyone offer me a clue as to the problem?
Well, you can force pvcreate to use /dev/sdc, but you should not.
use fdisk to make one partition (/dev/sdc1) with the full capacity of
/dev/sdc and make it as LVM (type: 8e). Than use pvcreate /dev/sdc1
(this marks sdc1 as a PV) and add it to the VG as described in the
whitepaper/faq.

    Goetz.

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7NmAQf5srOMkjkQoRAnj0AJsEYWO0GWxd2ySbw40AbvFjYaOyqgCg2s6e
fEWi1hKVZrNEnZgPuBwxATs=
=Mreg
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
