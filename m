Date: Wed, 7 Jun 2000 08:53:13 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] LVM 0.8 and reiser filesystem
Message-ID: <20000607085313.A30493@omnifarious.mn.org>
References: <H0000aed07d348ed@MHS> <20000606184138.A8122@gruyere.muc.suse.de> <20000607140043.B5442@colombina.comedia.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <20000607140043.B5442@colombina.comedia.it>; from bluca@comedia.it on Wed, Jun 07, 2000 at 02:00:43PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2000 at 02:00:43PM +0200, Luca Berra wrote:
> On Tue, Jun 06, 2000 at 06:41:38PM +0200, Andi Kleen wrote:
>> On a real production system you probably should not use software
>> RAID1 or RAID5 though. It is unreliable in the crash case though
>> because it does not support data logging. In this case a hardware
>> RAID controller is the better alternative. Of course you can run LVM
>> on top of it.
>=20
> I fail to get your point, what makes hw raid more reliable than sw
> raid?  why are you saying that sw raid is unreliable.

	Because in RAID1 or 5 (mirroring, or striping with parity), you
have to write both mirrored sectors, or a sector and its parity sector
in one transaction.  Both must be at least attempted.  If one fails,
that drive needs to be flagged as bad.

	In software RAID, software failures can cause this not to
happen.  The kernel might panic at the wrong time, the power might go
out, etc, etc.  If you do it in hardware, you can use capacitors to make
sure the hardware stays up long enough to complete the transaction and
there are fewer things in the chain to fail.

	Since the whole point of RAID5, and especially RAID1 is
reliability, implementing them in ways that reduce reliability is very
questionable.

	Implementing RAID0 (simple striping) in software is just fine.
Simple striping actually reduces reliability, and is only done for
speed.  Implementing it in software does not significantly reduce
reliability beyond the amount it's reduced by having two drives that
could fail instead of one.

Have fun (if at all possible),
--=20
Its name is Public Opinion.  It is held in reverence. It settles everything.
Some think it is the voice of God.  Loyalty to petrified opinion never yet
broke a chain or freed a human soul.     ---Mark Twain
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5PlPJG4QeWBeRdS8RAt52AKDmrX3JiWG/opYS8cKcVawXhDTtvQCeN1xS
elwRJemGGxmyUF5sxe/J59I=
=HSIB
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
