Date: Sun, 24 Sep 2000 18:32:36 -0500
From: ^chewie <chewie@wookimus.net>
Subject: [linux-lvm] Which kernel?
Message-ID: <20000924183236.B14632@wookimus.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Which of the recent kernels should I "upgrade" to in order to use LVM? =20

A little background.  I recently, sometime last month, went to
2.4.0-test6 and put almost every parition I had under LVM.  It worked
great!  The only problem is that test6 isn't the most stable of
kernels at the moment.  I haven't had any large problems with it, but
I've been unable to do certain things, such as use the printer port,
etc.  Basically, I need to recompile the kernel, and I'm not confident
that the "testX" series will do me good.

I was looking into going to a recent 2.2.x kernel (as in > 15 ), but
noticed that the LVM patch wasn't available for these kernel versions.
The last patch I saw on the "test" versions (2.3.x) was for 99, but
since I'm not sure what the status is even on this test kernel, I'm
still not sure I want to use "test" kernels any more.  (Being bitten a
couple times makes one nervous when handling the snake-like test's.)

What do you recommend I use?  What's the status of the LVM patches to
2.2.x kernels?  Anyone had overall success with the 2.4.0-testX
series?

--=20
  Chad "^chewie, gunnarr" Walstrom <chewie@wookimus.net>
              http://wookimus.net/chewie

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5zo8UDMcLGCBsWv0RAracAJwI9K05MEDLJCQ+pHeLPYSUvI6qOwCeKi1O
shuQ+JFyePtHrZAcs9sEcqQ=
=G13g
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
