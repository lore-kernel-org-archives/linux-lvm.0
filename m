Date: Mon, 1 May 2000 19:43:13 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: [linux-lvm] RH 6.2 kernel problem with 0.8i
Message-ID: <20000501194313.A25404@omnifarious.mn.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

	I figured out my problem.  It's the RAID patches that RH adds.

	RH adds a LOT of patches to the stock kernel.  Someone suggested
grabbing a stock kernel and using that, but a lot of the RH patches are
ones I really want, and I don't want to sift through them carefully
figuring out which ones.

	So, I grabbed the kernel source RPM, used rpm2cpio on it,
unpacked the cpio, and then used patch -R (what a wonderful tool) to
reverse the patches I didn't want out of the kernel source tree RH
ships.

	After that, the LVM patches applied just fine.  I only wanted
RAID0 anyway, and LVM does that just fine by itself.  :-)

	It works beautifully!

	The only thing I could ask for (and it is something that would
be complicated to dp) is to allow the root filesystem to be a logical
volume.

	A graphical (say tk or Python based) manager might be nice to,
but there are already several people working on that.

	Thanks a LOT for providing such a neat, useful tool.  Virtual
memory for hard drives.  It's great!

	One question...

	Is the warning about moving the physical extents of a mounted
logical volume based on hard evidence, or uneasiness?

	As I recall from Hans's talk, there shouldn't be any problem.  I
think I remember that the blocks are locked from being read or written
to while they're being moved.  And besides, the buffer cache entries
point at the logical volume anyway.

Have fun (if at all possible),
--=20
Its name is Public Opinion.  It is held in reverence. It settles everything.
Some think it is the voice of God.  Loyalty to petrified opinion never yet
broke a chain or freed a human soul.     ---Mark Twain
-- Eric Hopper (hopper@omnifarious.mn.org  http://omnifarious.mn.org/~hoppe=
r) --

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5DiShG4QeWBeRdS8RApjIAKC87iUqqKSHun9VZ2q5JNvMSjlqYQCfS31W
D0il6ow+YHXNnRGXmjin6tw=
=oGAz
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
