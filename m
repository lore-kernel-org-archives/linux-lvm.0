Date: Sun, 15 Oct 2000 21:12:14 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] lv inactive after reboot
Message-ID: <20001015211214.A8064@omnifarious.mn.org>
References: <01C036EB.4AA7CFA0.smdenton@bellsouth.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <01C036EB.4AA7CFA0.smdenton@bellsouth.net>; from smdenton@bellsouth.net on Sun, Oct 15, 2000 at 09:02:55PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Linux LVM mailing list <linux-lvm@msede.com>


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 15, 2000 at 09:02:55PM -0400, S. Michael Denton wrote:
>=20
> If it hasn't already been mentioned, perhaps you could suggest to
> Heinz:
>=20
> The ability to do raid, specifically raid1, with LVM should be
> included if linux LVM is to mimic the LVM used on HPUX; perhaps
> merging linux md tools/drivers with lvm tools/drivers?

	I could do without this ability.  RAID, other than RAID0 should
be done in hardware, or you're fooling yourself about reliability.  The
only reason to do any RAID besides RAID0 is reliability, so why pick an
option that so clearly doesn't work?  LVM already does RAID0.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE56mP+G4QeWBeRdS8RAiHQAJsHOhRhoD5ICqDuXneSMSkStUIa1ACgxVcV
ATraEsBRpZqb6JhXsI07pig=
=u33a
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
