Date: Mon, 16 Oct 2000 08:09:24 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: [linux-lvm] LVM success story + suggestion
Message-ID: <20001016080924.B8930@omnifarious.mn.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

	I wipe out my / partition and re-installed my entire OS over
this weekend without losing any user data.  This would not have been
even remotely feasible without the fine grained partitioning that LVM
permits.

	I also converted filesystems over to reiserfs.  I think that
doing this has caused my LVM partitions to become rather fragmented.  It
would be nice to have a vgdefragment tool that would move around logical
extents in an attempt to make them all contiguous again.  I doubt that
fragmentation on a 4Mb block basis has that huge of an effect, but I
still think it would be nice.  :-)

	The defragment tool is probably something you'd want to do on a
live system, so it should be done in a transactional sort of way with
data structures being updated on stable storage in such a way that if
things crash in the middle the LVM structures are recoverable.  I think
this could be done though.

	In fact, here's a sketch of how it could be done...

	Allocate new PEs to move a bunch of LEs to, but don't update the
data structures to say they're allocated.  Copy the LEs to the new PEs,
flush the blocks to disk.  Update the data structures to say the LEs are
now at the new location.  Flush those blocks to disk.  Repeat as
necessary.

	This requires that the update of an individual disk block be an
atomic operation and that there be no interblock dependencies in the LVM
data structures being updated.

	This could also make pvmove operations safe.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE56v4EG4QeWBeRdS8RAoRTAKDAIkn7Op1yvPtceB338lE71qvK3wCdHpKp
+peVIBGpI+sx7lTr4y9myoY=
=zDvP
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
