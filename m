Date: Thu, 23 Aug 2001 07:06:31 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] segfault running vgscan
Message-ID: <20010823070631.A2885@sistina.com>
References: <20010823011053.45493.qmail@web20310.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <20010823011053.45493.qmail@web20310.mail.yahoo.com>; from bwlang@yahoo.com on Wed, Aug 22, 2001 at 06:10:53PM -0700
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

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 22, 2001 at 06:10:53PM -0700, Brad Langhorst wrote:
> I've carefully followed the instructions in INSTALL
> and the build seems to go fine.
> This is the first install of lvm so there are no vgs
> or pvs or anything yet.
>=20
> I patched the kernel  (2.4.9)
> installed the kernel
> make in LVM
> make install
> reboot
> run vgscan -d =20
>=20
> this just generates a segfault and dumps core

Are you linking the tools statically or dynamically?  I have seen a
seg-fault with the tools that call at_exit() and static linking with glibc -
apparently the bug is in glibc, not LVM, and is fixed in newer versions.  I
have yet to verify this.
=20
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
All wiyht. Rho sritched mg kegtops awound?
-----End Obligatory Humorous Quote------------------------------------------

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7hPHHpE6/iGtdjLERAhzQAJ9byZRONTkP5qd8x/xaQemr+ExVkwCfaL9R
9jgZQcfMGUz6U9PU2ZOpGkE=
=usCO
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
