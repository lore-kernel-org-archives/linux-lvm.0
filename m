From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] LVM 1 volumes and 2.6.2 kernel
Message-ID: <20040216142123.GA30713@antimony.msp.redhat.com>
References: <200402151804.14727.dhill@nacnud.force9.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
In-Reply-To: <200402151804.14727.dhill@nacnud.force9.co.uk>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 16 09:25:00 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com
Cc: Duncan Hill <dhill@nacnud.force9.co.uk>

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2004 at 06:04:14PM +0000, Duncan Hill wrote:
> Silly me decided a month or so back to migrate to 2.6, but I forgot that I
> had a LVM1 installation on my portable drive.  Said installation doesn't
> seem to work now - even with dm-mod loaded, I get errors about
> /dev/mapper/control.  What parts am I missing?
>=20
> Fedora Core 1
> 2.6.2 kernel
> lvm1 and lvm2 packages installed.

There is a script called devmap_mknod.sh in the device mapper tarball's
scripts directory - you need to run this script to create
/dev/mapper/control.  I don't know for sure, but I'd guess that it is
included in the debian packages for device-mapper.

Regards,
--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414

Current GPG fingerprint =3D FE77 4B43 6A9B F982 A731  02FA 2BF5 7574 294A A=
A5A
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...
-----Begin Obligatory Humorous Quote----------------------------------------
I can bend minds with my spoon.
-----End Obligatory Humorous Quote------------------------------------------

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAMNHjhn5UyEmEOBMRAlCgAKCCS0NuWj7SKROX6gtkQY9Ti6FhrgCfQkKE
iL6Kl9zV8URDOkZIE/VQvKI=
=pdj7
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
