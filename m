Date: Fri, 16 Jun 2000 05:38:36 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] LVM for Redhat 6.1 (2.2.12 kernel)
Message-ID: <20000616053836.A18384@omnifarious.mn.org>
References: <DCBFB8E1BD8BD311A94D00A0C9CA44EA0CCCEB@storeage_nt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <DCBFB8E1BD8BD311A94D00A0C9CA44EA0CCCEB@storeage_nt>; from SVichik@store-age.com on Fri, Jun 16, 2000 at 10:37:05AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Sergey Vichik <SVichik@store-age.com>
Cc: "LVM list (E-mail)" <linux-lvm@msede.com>


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2000 at 10:37:05AM +0200, Sergey Vichik wrote:
>=20
> Hello,
>=20
> 	I want to install LVM on  Redhat 6.1 (2.2.12-20 kernel), without
> replacing the kernel to another version.
> All LVM patches fails to do it because of RAID additions in ll_rw_blk.c .
>=20
> 	Is there some other patch that works for this kernel version ?
> Or if isn't, a patch to upgrade to another version, where LVM patches will
> work ?

	In order for me to make this work, I backed out the RAID changes
in ll_rw_blk.c.  There should be a message in the archives where I
detail exactly which patches I had to back out to make things work.

	Looking back on it, I wish that I had been able to leave the
RAID changes in, because I think I would rather have the RAID code
handle RAID0 striping instead of LVM.  Seems cleaner somehow.

Have fun (if at all possible),
--=20
Its name is Public Opinion.  It is held in reverence. It settles everything.
Some think it is the voice of God.  Loyalty to petrified opinion never yet
broke a chain or freed a human soul.     ---Mark Twain
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5SgOsG4QeWBeRdS8RAk0/AJ9H8CtvRiXvjwmI9SK+rvGRYjM1TQCeI/S4
U2jVnQ8Mi1TDfwBB+mhAJ4s=
=D2Xm
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
