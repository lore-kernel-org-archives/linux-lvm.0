Return-Path: <bg@blacknet.de>
Date: Sun, 22 Apr 2001 20:55:47 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Kernel 2.2.19, RawIO, LVM, RAID -- who has it running?
Message-ID: <20010422205547.C1984@dragon.blacknet.de>
References: <20010422202214.A20864@babbage.hcsd.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Content-Disposition: inline
In-Reply-To: <20010422202214.A20864@babbage.hcsd.de>; from au@hcsd.de on Sun, Apr 22, 2001 at 08:22:14PM +0200
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

--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Sun, Apr 22 '01 at 20:22, Stephan Austermuehle wrote:
> anybody out there who has a running kernel 2.2.19 with Raw-IO patch,
no, but a patched onw
> LVM, and RAID patch 2.2.19-A1? Applying all these patches seems to be
> inpossible.
This actualle workes out of the box (see Patches/README). Get the latest
tar ball from sistina.com, untar it, get the raw-io patch from the
patches dir and apply it to a clean 2.2.19 kernel. then change the
fragments file (see the readme for the location) and do a=20
"make; cd Patches ; make" to get the patch for your kernel.
apply the raid patch, and than the LVM patch.

Good luck,
    Goetz.=20

--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE64ykzf5srOMkjkQoRAhHXAKDk1wnGYHrfl/YLdcVEIOrHaIoxvACg6gQb
g08QR5Uah7fe97NSKt+n7tw=
=sDup
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--
