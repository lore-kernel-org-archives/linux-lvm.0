Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0OFrLX4022809
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2013 10:53:22 -0500
Received: from diomedes.noc.ntua.gr (diomedes.noc.ntua.gr [147.102.222.220])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0OFrE23022141
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2013 10:53:15 -0500
Date: Thu, 24 Jan 2013 17:53:12 +0200
From: Vangelis Koukis <vkoukis@grnet.gr>
Message-ID: <20130124155312.GA10563@daedalus.cslab.ece.ntua.gr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
Subject: [linux-lvm] Sparse LVs, --virtualsize equal to --size
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com
Cc: synnefo-devel@googlegroups.com


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I have been experimenting with LVM's sparse LVs feature.
If I understand correctly, a sparse device of --virtualsize
of V GBs and --size of S GBs is implemented as a snapshot over
two devices:

a) a virtual device of V GBs returning all zero blocks, and
b) a COW device of length S GBs.

Reads from the sparse LV return all zeroes, writes allocate
a new exception and store the newly written data inside the COW device.

If the COW device runs out of space, the snapshot is in trouble:
[11285507.534891] device-mapper: snapshots: Invalidating snapshot: Unable t=
o allocate exception.

For my use case, I don't care about the potential space savings
of having S << V and still see a huge device of size V GB.
I'd like to have S =3D=3D V, since I only care about having a virtual device
that returns all zeroes for yet-unwritten blocks.

Setting S =3D=3D V causes the snapshot to die miserably when the virtual
device is fully overwritten, because it seems the COW device runs out of
space. The manpage for lvcreate(8) does state that:

"Note that a small amount of the space you allocate to the snapshot is used=
 to
track the locations of the chunks of data, so you should allocate slightly =
more
space than you actually need and monitor the rate@which the snapshot data
is growing so you can avoid running out of space."

So, what I'd like to know is:
a) What is the relation between S, V and the snapshot chunk size?
How much is "slightly more", how larger should S be compared to V, to ensure
the COW device *never* runs out of space?

b) How are blocks allocated inside the COW device when establishing mapping=
s?
My guess is they are allocated sequentially, but in my case, when S =3D=3D =
V, I
don't really need a full mapping. All LVM has to do, is remember whether a
chunk has already been written or not, it doesn't need to translate the chu=
nk
number.
Not having to do any translation of chunk numbers from snapshot to COW woul=
d be
great, because the I/O patterns on the COW device would follow the I/O patt=
erns
of the sparse device.
Is there any way I can do that, only exploit the tracking of writes, without
messing up the ordering of chunks between the virtual and COW devices?

Thank you,
Vangelis.

--=20
Vangelis Koukis
vkoukis@grnet.gr
OpenPGP public key ID:
pub  1024D/1D038E97 2003-07-13 Vangelis Koukis <vkoukis@cslab.ece.ntua.gr>
     Key fingerprint =3D C5CD E02E 2C78 7C10 8A00  53D8 FBFC 3799 1D03 8E97

Only those who will risk going too far
can possibly find out how far one can go.
        -- T.S. Eliot

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEBWOgACgkQ+/w3mR0DjpdGUACgg6QeAa0/LOfscvSyJzO73qhu
iYIAnimCzQxRGNvfVY5Vb7j1UwYIn6ZC
=4avD
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
