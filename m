Return-Path: <lewis@sistina.com>
Date: Mon, 2 Jul 2001 11:55:10 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Lost my physical volume on reboot?
Message-ID: <20010702115510.A11381@sistina.com>
References: <139803A793E0D311AFF60050DA2BC540030214C3@qtiexch1.qgraph.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <139803A793E0D311AFF60050DA2BC540030214C3@qtiexch1.qgraph.com>; from Ron.Vissers@qtiworld.com on Mon, Jul 02, 2001 at 11:15:52AM -0500
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

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2001 at 11:15:52AM -0500, Vissers, Ron wrote:
> Bear with me, I'm new to LVM in Linux.  More accustomed to HPUX.
>=20
> Anyway, I seem to have lost my /dev/hdc1 physical volume and my /dev/vg02
> volume group, etc. =20
>=20
> Suggestions on where to begin?

Try my uuid_fixer at
ftp://ftp.sistina.com/pub/LVM/contrib/uuid_fixer-0.3-IOP10.tar.gz

Make sure you read the README.

Regards,
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
All good pings must come to an end.
-----End Obligatory Humorous Quote------------------------------------------
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
Einstein said that talking to yourself is a sign of intelligence.
Answering yourself, however, is a sign of insanity.
-----End Obligatory Humorous Quote------------------------------------------

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7QKdupE6/iGtdjLERApfwAJ4lJNUmS3iLFU0XxP0zXa5Q6BpKbgCfbqHi
mb+iMk6NsvWWmUBRSpo75dM=
=Setl
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
