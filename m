Date: Mon, 27 Aug 2001 12:27:47 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Re: Problem mounting snapshot with reiserfs
Message-ID: <20010827122747.A1308@sistina.com>
References: <20010827161137.97280.qmail@web14406.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <20010827161137.97280.qmail@web14406.mail.yahoo.com>; from shahi_aman@yahoo.com on Mon, Aug 27, 2001 at 09:11:37AM -0700
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

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 27, 2001 at 09:11:37AM -0700, Aman Shahi wrote:
> >> You need to use the linux-2.4.x-VFS-lock.patch=20
> >> against the kernel to enable snapshotting to work=20
> >> with LVM and reiserfs.
>=20
> Thanx AJ.
> Sorry my fault, I assumed without checking whether I
> need to apply the VFS Lock patch for 2.4.8 or not. I=20
> applied the patch, and it works fine.

Cool!  Glad it's working for you now.

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
I have yet to meet a C compiler that is more friendly and easier to use
than eating soup with a knife.
-----End Obligatory Humorous Quote------------------------------------------

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7ioMTpE6/iGtdjLERAucvAJ4jhJco2MPjOmdLfbY6ghcy5TXDyACeMBYL
6GVClY6Lq2d/IV9r2nraWF0=
=5+ym
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
