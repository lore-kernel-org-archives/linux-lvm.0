Return-Path: <hopper@omnifarious.mn.org>
Date: Wed, 24 Jan 2001 13:10:35 -0600
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Message-ID: <20010124131035.A22731@omnifarious.mn.org>
References: <20010124181324.A7233@66bassett.freeserve.co.uk> <Pine.LNX.4.30.0101241041490.11299-100000@beefcake.hdqt.valinux.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0101241041490.11299-100000@beefcake.hdqt.valinux.com>; from jweber@valinux.com on Wed, Jan 24, 2001 at 10:42:07AM -0800
Subject: [linux-lvm] Debugging and testing
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

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

	On a debugging and testing note...

	Has anybody tried building up sets of test data for the ioctl
calls that are designed to crash the kernel?  For example, random ioctls
on the character device, ones with invalid pointers, ones with strangely
inconsistent data, etc...

	Perhaps I'm being a bit too picky, but it seems to me there
should be as few ways as possible for a user space program (even one run
by root) to crash the kernel.  The LVM deice is especially this way
since whenever you're using it you're trying to perform some system
maintenance task with the express desire of not shutting down.  And,
since you're performing a system maintenance task, the system is likely
to be in an interesting state that may make it difficult to recover from
a crash.

	Anyway, I didn't know if anybody had done this or not, so I
thought I'd ask.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6byirG4QeWBeRdS8RAkyTAJ0RxpA3BSq0x3afpMH6Zzg0bUrQUACfcPpA
7FsY2PfU4UURKv81S0RIzdA=
=vSyb
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
