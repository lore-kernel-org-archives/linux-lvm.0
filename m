From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] LVM ext3 support
Message-ID: <20031017184443.GA7317@antimony.eng>
References: <3F903230.9070608@siue.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <3F903230.9070608@siue.edu>
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
Date: Fri Oct 17 15:02:10 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2003 at 01:17:20PM -0500, anthony mayes wrote:
> I am running Redhat 9 with kernel 2.4.20-20.9.  I am getting the=20
> following errors when trying to mount an LVM snapshot:
>=20
> EXT3-fs: INFO: recovery required on readonly filesystem.
> EXT3-fs: write access unavailable, cannot proceed.
>=20
> I saw a thread on redhat.com that said a kernel patch is needed.  My=20
> question is where can I get the patch for this kernel, how do I install=
=20
> it, and why isn't this built into the kernel in the first place?  Any=20
> other suggestions are welcome.

Looks like you don't have the VFS-lock patch installed. something like
linux-2.4.20-VFS-lock.patch, but i don't know what it would be for
Redhat's patched kernels.

Regards,
--
AJ Lewis
Sistina Software Inc.             http://www.sistina.com
720 Washington Ave, Suite 200     Voice:  612-638-0500
Minneapolis, MN 55414             E-Mail: lewis_NOSPAM_(AT)sistina(DOT)com

Current GPG fingerprint =3D B8F8 CEC8 9B0B B169 C5E2  8589 867E 54C8 4984 3=
813
Grab the key at: http://people.sistina.com/~lewis/gpg.html or one of the
many keyservers out there...


--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/kDibhn5UyEmEOBMRAuFWAJwPRhhJH8F13CqlIagTmYzHCSaNOQCeJ/9Y
meR6m1TL5NoPJJlRSPtzk+8=
=9S7l
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
