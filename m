Message-ID: <20030110213858.GI3393@pc.ilinx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+RZeZVNR8VILNfK"
Content-Disposition: inline
From: lvm@interlinx.bc.ca
Subject: [linux-lvm] Two drives with the same UUID
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
Date: Fri Jan 10 15:38:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--x+RZeZVNR8VILNfK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

If I had a system with a functional LVM configuration (1.0.6ish) and I
were to "duplicate" the drive in it (i.e. dd if=3D/dev/sda of=3D/dev/sdb)
and then try to boot that system (with both drives installed and
functional), what would happen?

Of course, because I am asking, I have tried it.  :-)  During boot LVM
failed to find any logical volumes.  Is this expected?  It's not
surprising mind you, but I wonder how it was designed to deal with
this situation.

b.

--=20
Brian J. Murrell

--x+RZeZVNR8VILNfK
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+Hz1yl3EQlGLyuXARAikKAJ4mb7VH6sdTPYW1W7UzIa1g4U1hDwCg0j28
9Ii8Eqj9JyH082t+9+B8tSs=
=Y6NP
-----END PGP SIGNATURE-----

--x+RZeZVNR8VILNfK--
--x+RZeZVNR8VILNfK--
