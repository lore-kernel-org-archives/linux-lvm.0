Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0P8drT4019480
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2013 03:39:54 -0500
Received: from ulysses.noc.ntua.gr (ulysses.noc.ntua.gr [147.102.222.230])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0P8dnxE004153
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2013 03:39:50 -0500
Date: Fri, 25 Jan 2013 10:39:38 +0200
From: Vangelis Koukis <vkoukis@grnet.gr>
Message-ID: <20130125083938.GD22422@daedalus.cslab.ece.ntua.gr>
References: <20130124155312.GA10563@daedalus.cslab.ece.ntua.gr>
	<20130124180834.GA3122@agk-dp.fab.redhat.com>
	<51017F0C.20100@bmsi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline
In-Reply-To: <51017F0C.20100@bmsi.com>
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
To: Stuart D Gathman <stuart@bmsi.com>
Cc: synnefo-devel@googlegroups.com, linux-lvm@redhat.com


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2013 at 01:35:56pm -0500, Stuart D Gathman wrote:
> Long ago, Nostradamus foresaw that on 01/24/2013 01:08 PM, Alasdair G
> Kergon would write:
> > If you've got the capacity to test, create one that's quite a bit
> > larger and see how much space it actually uses up when full, then use
> > that size in future.  There's a header, and then the blocks are written
> > sequentially with an index block inserted ahead of each group of
> > data blocks.
> >
> > Or try out thin LVs available in recent LVM releases/kernels for
> > an alternative 'sparse' approach.
> He doesn't actually want sparse, he wants "instant zero" via copy on
> write.  This is useful for virtual machines by preventing information
> leaks between customers.   Currently, you can create a "template" LV,
> and have a snapshot for each VM.  Since you (almost) never write to the
> template, you don't run into the performance issue.   He proposed a new
> type of LV that is a normal LV plus a small bitmap (1 bit per chunk)
> that tracks which chunks have been written to.  When a chunk is written
> to, the remainder of that chunk is set to zero.  Reads from unwritten
> chunks always return zeroes.
>=20

Spot on!

"Guaranteed initialized to zero" is what I'm looking for.
So the LVM snapshot mechanism would work, but it may be a bit of an
overkill.

I'd rather not do it in a trial-and-error fashion, trying different
values of S just a bit larger than V, until it works. How large is the
overhead per chunk? Ideally, we could quantify the overhead as a
fraction of the chunk size, and use it as a safe margin for estimating
the needed physical size.

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

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlECRMoACgkQ+/w3mR0DjpcGZwCgyXODW4RoCAQKkV65nJqJ3ajF
ymwAn3kH5AX+DhO13F2l9APXvz064Kic
=ecmK
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--
