Date: Mon, 27 Aug 2001 10:57:43 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Problem mounting snapshot with reiserfs
Message-ID: <20010827105743.A14120@sistina.com>
References: <E15bMBF-0002FJ-00@hermes.sistina.com> <20010827150751.14611.qmail@web14405.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <20010827150751.14611.qmail@web14405.mail.yahoo.com>; from shahi_aman@yahoo.com on Mon, Aug 27, 2001 at 08:07:51AM -0700
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

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 27, 2001 at 08:07:51AM -0700, Aman Shahi wrote:
> I am having problem in mounting snapshot with
> reiserfs.
>=20
> I am using linux kernel 2.4.8 and lvm 1.0. Here
> is the sequence of steps I did. Same steps with
> ext2 I did not have nay problem. But with reiserfs
> I am not able to do the mounting.

You need to use the linux-2.4.x-VFS-lock.patch against the kernel to enable
snapshotting to work with LVM and reiserfs.

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
Quitters never win, and winners never quit,
but those who never quit AND never win are idiots.
-----End Obligatory Humorous Quote------------------------------------------

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7im33pE6/iGtdjLERAiJqAJoCC8tsaJ/wjzBF0m8VgrJ9gleg/ACglj8m
GRdJ3UrKMApkDl2PGrzykck=
=HDBq
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
