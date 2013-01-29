Date: Tue, 29 Jan 2013 10:24:43 +0200
From: Vangelis Koukis <vkoukis@grnet.gr>
Message-ID: <20130129082443.GE19318@daedalus.cslab.ece.ntua.gr>
References: <20130124155312.GA10563@daedalus.cslab.ece.ntua.gr>
	<20130124180834.GA3122@agk-dp.fab.redhat.com>
	<51017F0C.20100@bmsi.com>
	<20130124234235.GB3122@agk-dp.fab.redhat.com>
	<20130125084410.GB10563@daedalus.cslab.ece.ntua.gr>
	<51068238.1090809@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z8yxTSU1mh2gsre7"
Content-Disposition: inline
In-Reply-To: <51068238.1090809@redhat.com>
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
To: Marian Csontos <mcsontos@redhat.com>
Cc: synnefo-devel@googlegroups.com, LVM general discussion and development <linux-lvm@redhat.com>


--Z8yxTSU1mh2gsre7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 02:50:48pm +0100, Marian Csontos wrote:
> On 01/25/2013 09:44 AM, Vangelis Koukis wrote:
> >On Thu, Jan 24, 2013 at 11:42:35pm +0000, Alasdair G Kergon wrote:
> >>So look at thin provisioning with its zeroing option.
> >>External origin.  (support currently being added to lvm)
> >>
> >>Or this not-yet-upstream target:
> >>http://people.redhat.com/agk/patches/linux/editing/dm-add-zeroed-target=
=2Epatch
> >>
> >>Alasdair
> >
> >Thanks Alasdair,
> >
> >this seems to fit the bill perfectly, it's a shame it's
> >not yet merged upstream.
> >
> >Until then, if we are to go with the "snapshot-over-the-zero-target"
> >route, can you comment on quantifying the space overhead of tracking
> >chunks in the snapshot?
>=20

Hello Marian,

thank you for your answer, here are some points I'm not sure I have
understood completely:

> Beware! Large old-style snapshots may take a very long time to
> activate[1] (reportedly up to few hours) and my guess is many
> smaller snapshots will behave the same[2], the total amount of
> chunks written to all snapshots being the key to slow start...
>=20

What is old-style snapshots? Old-style compared to what, thin LVs?
By "activate", do you refer to the problem of very slow VG activation
e.g., on boot, as described here?

http://unix.stackexchange.com/questions/20152/why-does-activation-of-lvm-pa=
rtition-with-large-snapshot-takes-long-time
https://bugs.launchpad.net/lvm2/+bug/360237

If yes, then the question still remains:

Can you please comment on the exact on-disk format used when doing LVM
snapshots? What is the exact format of the blocks being written to the
COW volume?

I think this would make clear both a) what the space overhead per
snapshot chunk is, b) why it takes so long to activate an LVM VG if the
snapshot has grown too large (i.e., if too much information has found
its way into the COW volume).

> You should definitely try it with your workflow before going too far
> that direction.
>=20
> [1]Just search for 'lvm large snapshot'. Someone here may be able to
> point you to a more complete data.
>=20
> [2] Not even trying to think about many larger ones as your usecase
> suggests: just update kernel and java few times and with journal FS
> you will soon be at few gigabytes per VM.
>=20

I understand this may well be the case, but I'd like to know the
*reason* for the symptom you describe.

Could you point me to information on the exact way snapshots are
implemented, a design doc, a specification? Is the process specified
only by the code that implements it?

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

--Z8yxTSU1mh2gsre7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEHh0sACgkQ+/w3mR0Djpcd3QCfdtslBioTrxCOw2/kZD9YJPTc
hU8Anj0aUapAO2M2ochlqnc0TMl+diBe
=1U19
-----END PGP SIGNATURE-----

--Z8yxTSU1mh2gsre7--
