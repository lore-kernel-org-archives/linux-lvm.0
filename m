From: Eric Hopper <hopper@omnifarious.org>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-IoYFRVnzFACsN5JA51Dc"
Message-Id: <1045065586.477.16.camel@dev-ehopper.tiecommerce.com>
Mime-Version: 1.0
Subject: [linux-lvm] Re: How to handle Bad Block relocation with LVM?
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
Date: Fri Feb 14 08:52:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-IoYFRVnzFACsN5JA51Dc
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I manually relocated a few bad blocks on a bad IBM drive I had when I
replaced the drive.  It took a lot of time and effort.  I had to run the
dd command many times very carefully to make it work.

One big problem for me was that read-ahead obscured which actual sectors
were in error.  I needed a 'raw' LVM device, but I don't think such a
thing exists for LVM1 on Linux 2.4.x.

What I did was used pvmove to move the PE containing the bad block to a
different spot on the hard drive, then allocated a new LV that was one
LE long, and forced it to allocate the PE containing the bad block.=20
Then I used dd to carefully copy over the LE in sections, narrowing down
the location of the bad sectors until I had copied everything that could
possibly be read.

After that, I ran fsck on the filesystem that had originally contained
the bad block, and I was fine.  I checked carefully, and it didn't even
seem that I had lost any data.

Long, time consuming process though.

Actually, it may have been even ickier than I first thought.

It could be that pvmove wouldn't work, and I had to shorten the LV
containing the bad block (the BLV) to contain all PEs prior to the bad
one, allocate a new LV (the NLV) containing all the bad PE, lengthen the
BLV by 1 PE, using a brand new PE, then lengthen it to its original
length so it would contain all the PEs after that bad PE, the do the
procedure I outlined above.

Now that I think of it, I'm nearly positive that pvmove didn't work.  I
had dearly wished for some kind of option to pvmove that would force it
to try as hard as it could to get good reads of all the sectors in a PE,
then move the LE to a new PE, even if there were errors.

Have fun (if at all possible),
--=20
Eric Hopper <hopper@omnifarious.org>
Omnifarious Software

--=-IoYFRVnzFACsN5JA51Dc
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iEYEABECAAYFAj5Kb3IACgkQjtsvlOwvazaetQCgindhUeRj/jKQv/8E5JJCPCwT
zFsAoKjCz3QKFgNTYw2aXz9QgPZbBbeO
=Dg4C
-----END PGP SIGNATURE-----

--=-IoYFRVnzFACsN5JA51Dc--
