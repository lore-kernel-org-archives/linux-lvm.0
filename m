Date: Thu, 19 Oct 2000 01:29:57 -0500
From: ^chewie <chewie@wookimus.net>
Subject: [linux-lvm] Thanks! and Swap on LVM?
Message-ID: <20001019012957.C699@wookimus.net>
References: <39E3008D.A969BC89@winqvist.net> <200010112229.QAA01048@lynx.turbolabs.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Content-Disposition: inline
In-Reply-To: <200010112229.QAA01048@lynx.turbolabs.com>; from adilger@turbolinux.com on Wed, Oct 11, 2000 at 04:29:05PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2000 at 04:29:05PM -0600, Andreas Dilger wrote:
> Try the updated lvm tools (SRPM) at:
>=20
> ftp://ftp.stelias.com/pub/adilger/

Thank you!!!  I usually stay away from SRPM's, but now that I've got
alien, it's not so bad.  'alien --to-tgz' is a dream.  A plus side to
all of this, my pvscan no longer segfaults! ;-)  Neither does my
vgscan! ;-)  I was actually going to sit down with gdb tonight and do
some backtracing when I saw your update.  Very nice to have a 1:00 in
the morning. ;-)  Again, thanks!

OH.  I've noticed a problem as of late.  While trying lvm on both the
2.4.0-test9 and 2.2.17, I have not been able to use an lv device as a
swap device.  The computer starts acting like it's got bad memory and
segfaults during compile time, most notably during kernel compiles.

Has anyone successfully used a lv parition as a swap device???

{good thing I had an extra HD}

--=20
  Chad "^chewie, gunnarr" Walstrom <chewie@wookimus.net>
              http://wookimus.net/chewie

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.3 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE57pTlDMcLGCBsWv0RAg9WAJ9fOhyGXGMf5oj+cS7z+VDioudL1QCfS5+h
SxxKyi5SQlxoQq4NmN1xR80=
=BwLP
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
