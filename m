Return-Path: <bg@blacknet.de>
Date: Wed, 11 Apr 2001 12:10:23 +0200
From: Goetz Bock <lvm@blacknet.de>
Message-ID: <20010411121023.A27988@dragon.blacknet.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
Subject: [linux-lvm] LVM 0.9.1_beta7 on RAID-2.2.19-A1
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

--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

I've once again tried to get the newst LVM code to patch with the new RAID
code, but I've failed.

While I'm ablt to sort out the conflicts in=20
    ./incude/linux/blkdev.h
I'm not so sure about:
    ./drivers/md.c
and I've no idea what to do with:
    ./drivers/block/ll_rw_blk.c

Has anyone been successfull with patching 2.2.19 with this two patches?

Thanks,=20
    Goetz.

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE61C2Pf5srOMkjkQoRAvLsAKDIFoEurdVb+qfuQZKfEdDz2y44vQCeONN4
xzoGJnd/gdIb+eFJ0Jgy+qI=
=qz/s
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
