Date: Wed, 3 May 2000 22:03:59 -0700
From: Ryan Murray <rmurray@cyberhqz.com>
Subject: [linux-lvm] bug in lvm tools 0.8i, 0.8final
Message-ID: <20000503220359.A27090@cyberhqz.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I've just come across a bug in lvm tools when not using /proc/partitions.

lvm_add_dir_cache adds an entry, but checks for duplicates with
lvm_dir_cache_hit.  The problem is simple:

lrwxrwxrwx    1 root     root            9 May  8  1999 /dev/cdrom -> /dev/=
hdd

If you have that symbolic link around, it will show up in the cache as
/dev/cdrom, so if you try to pvcreate /dev/hdd, /dev/hdd never makes it
into the cache.

Either the duplicate mechanism should be taken out, or ignore symlinks
and have things that check the cache dereference the symlinks...

--=20
Ryan Murray, (rmurray@cyberhqz.com, rmurray@stormix.com)
Programmer, Stormix Technologies Inc.
The opinions expressed here are my own.

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5EQS/N2Dbz/1mRasRAvg2AKD5MSjdnOneNhcc0jFos7NHRsoZHgCg7VhP
vPQml4JSE5qn3R4sS4S8XaI=
=Z84H
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
