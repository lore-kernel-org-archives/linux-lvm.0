Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r16G5m27022291
	for <linux-lvm@redhat.com>; Wed, 6 Feb 2013 11:05:49 -0500
Received: from ulysses.noc.ntua.gr (ulysses.noc.ntua.gr [147.102.222.230])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r16G5i65021897
	for <linux-lvm@redhat.com>; Wed, 6 Feb 2013 11:05:45 -0500
Date: Wed, 6 Feb 2013 18:05:39 +0200
From: Vangelis Koukis <vkoukis@grnet.gr>
Message-ID: <20130206160539.GQ27402@daedalus.cslab.ece.ntua.gr>
References: <20130124155312.GA10563@daedalus.cslab.ece.ntua.gr>
	<20130124180834.GA3122@agk-dp.fab.redhat.com>
	<51017F0C.20100@bmsi.com>
	<20130124234235.GB3122@agk-dp.fab.redhat.com>
	<20130125084410.GB10563@daedalus.cslab.ece.ntua.gr>
	<51068238.1090809@redhat.com>
	<20130129082443.GE19318@daedalus.cslab.ece.ntua.gr>
	<20130131162243.GH8837@soda.linbit>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p+/4B2pcxE3X6xU6"
Content-Disposition: inline
In-Reply-To: <20130131162243.GH8837@soda.linbit>
Subject: Re: [linux-lvm] Sparse LVs, --virtualsize equal to --size
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
To: Lars Ellenberg <lars.ellenberg@linbit.com>
Cc: linux-lvm@redhat.com


--p+/4B2pcxE3X6xU6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2013 at 05:22:43pm +0100, Lars Ellenberg wrote:
> > What is old-style snapshots? Old-style compared to what, thin LVs?
>=20
> Yes.
>=20
> > By "activate", do you refer to the problem of very slow VG activation
>=20
> Yes.
>=20
> > If yes, then the question still remains:
> >=20
> > Can you please comment on the exact on-disk format used when doing LVM
> > snapshots? What is the exact format of the blocks being written to the
> > COW volume?
>=20
> I'm pasting parts of an older post to this list
> (from 2008, Restore LVM snapshot without creating a full dump to an "exte=
rnal" device?)
>=20
> "old style snapsthots", aka
> dm-snap and dm-exception-store are implemented in a way that
> for a single snapshot, you get
>    (mapping only) snapshot-origin
>    (real storage) origin-real
>    (mapping only) snapshot
>    (real storage) COW (or exception store)
>=20
> COW on disk format is pretty simple (as of now).
> its all fixed size chunks.
> it starts with a 4x32bit header,
> [SnAp][valid][version][chunk_size in sectors]
> so any valid snapshot looks
> "SnAp" 1 1 [power of two]
>=20
> chunk_size it what you set with the lvcreate "-c" option.
>=20
> the rest of the (just as well chunk_size'ed) header block is unused.
>=20
> expressed in chunks, the COW storage looks like:
> [header chunk][exception area 0][data chunks][....][exception area 1][...]
> where each exception area is one "chunk" itself.
> each exception area holds a mapping table of
> "logic chunk number" to "in COW storage chunk number", both 64bit.
> "logic number" is called "old", "in COW" address is called "new".
> byte number
> 1                     [old][new]
> 2                     [old][new]
> 3                     ...
> (chunk_size*512/16)   [old][new]
> following are as many data chunks.
>=20
> this whole thing is append only.
>=20

Dear Lars,

Thank you very much for the detailed explanation!
This is exactly what I needed, thanks for your time to gather everything
into a single answer.

> On activation,
> it needs to scan all those [exception area ...] blocks,
> until it find the "terminating" zeroed one.
> It reads in and stores this mapping in core memory.
>=20
>=20

Yes, so there is no fixed index or bitmap on disk to determine whether a
block is in an exception list or not. LVM has to scan all blocks, and
build this structure in main memory, on activation time.

This makes old-style snapshots completely unsuitable for our use case.
I guess dm-zeroed is what we should go for, from the available options.

> Hope that helps,
>=20

It was great help.

Thanks again,
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

--p+/4B2pcxE3X6xU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlESf1MACgkQ+/w3mR0DjpdVeQCdEhDZcxqiDSARQFOGlmOx70CR
QI4AnjGPJXngOxhtlThdizxPXF7hwzIL
=ptIR
-----END PGP SIGNATURE-----

--p+/4B2pcxE3X6xU6--
