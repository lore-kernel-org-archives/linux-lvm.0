Return-Path: <lewis@sistina.com>
Date: Fri, 16 Mar 2001 12:44:46 -0600
From: AJ Lewis <lewis@sistina.com>
Message-ID: <20010316124446.B1478@sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline
Subject: [linux-lvm] LVM 0.9.1 Beta6 RPMS
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

--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

LVM 0.9.1 Beta6 RPMS are up on the Sistina FTP site:
ftp://ftp.sistina.com/pub/LVM/0.9.1_beta/binaries/redhat

These are based on the Connectiva LVM packages, but were created on a Redhat
6.2 system.  (I think they will work on any RPM based system though...) They
use a modified version of the wrapper script (it uses sed instead of
basename and the libary name has changed).  You need to grab at a minimum,
the lvm-base, lvm-iop10, and lvm-iop10-lib packages.

This should be considered a Beta version of the package as well as of LVM.
Please don't go using these on your production system and then complain
because they clobber your system.  I'm putting these out there for people to
test so we have them right when we release a production version of LVM.

Debian packages are next in line.  Hopefully I'll have those done by the end
of Monday...

Go forth and test!
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
"Memory is like gasoline. You use it up when you are running. Of
course you get it all back when you reboot..."; Actual explanation
obtained from the Micro help desk.
-----End Obligatory Humorous Quote------------------------------------------

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6sl8epE6/iGtdjLERAtY6AJ4m35kvYvWQrL7yIh4i9YE30ZvaCACdEq7n
ColsMq0Pet0l6LezsfPH6jo=
=6r5u
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
