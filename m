Date: Tue, 31 Oct 2000 20:25:30 -0600
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] Exporting VG
Message-ID: <20001031202530.A11756@omnifarious.mn.org>
References: <20001031203559.A8120@gondor.com> <200010312105.e9VL5XY11520@webber.adilger.net> <20001101013433.B30322@srv.t-online.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <20001101013433.B30322@srv.t-online.de>; from Heinz.Mauelshagen@t-online.de on Wed, Nov 01, 2000 at 01:34:33AM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2000 at 01:34:33AM +0000, Heinz J. Mauelshagen wrote:
>=20
>> From what I have read in the past on this mailing list, running
>> vgscan on boot is likely to delete important info from /etc/lvmtab if
>> there is a minor problem, that has to later be restored (if
>> possible).
>=20
> Assumed that it is really that likely it s rather easy to get /etc/lvmtab=
.d/
> files containing the metadata copies back, because they are format
> identical to /etc/lvmconf/ files.
> /etc/lvmtab contains the 0 delimited volume group names.

	I actually had this problem and it scared the willies out of me.
I was quite surprised to discover I had any left, given my antipathy
towards Microsft and William Gates III, but I digress.

	I didn't know this about /etc/lvmconf and /etc/lvmtab.d.  I had
to very carefully restore them using vcfgrestore.

> If we had a database keeping track of changes in the i/o configuration
> of the system, we could run vgscan conditionally if needed. Because
> there's none I recommended to run it at every boot to avoid i/o path
> inconsistencies.

	You kinda do.  It's called /etc/lvmtab.d.

> /etc/lvmtab.d/VolumeGroupName contains a metadata copy of the current
> state of a volume group. In case of i/o configuration changes it is up
> to vgscan to update this file's contents.

	Why not have vgscan proceed on the initial opinion that the
files contents are correct, and scan the devices mentioned in the file
to see if they still contain exactly the VG data the file says they
ought to?

	This would save a LOT of vgscan time because the most common
case is that everything is the way it was before the machine went down.
If it wasn't, vgscan could revert to its normal behavior.

	It wouldn't help the problem I had though, because apparently
one of the PVs somehow had corrupt VG information, though I have no clue
how it happened.  I should've saved the headers, but I was in too much
of a panic, and too relieved when I got everything working again.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5/38aG4QeWBeRdS8RAtDEAKCkJtqnH3NN9NbNbRe5Wc12ddCuUwCgilCw
Mr55of//VIgiMgjF2Axahls=
=y5Fg
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
