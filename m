Date: Wed, 11 Oct 2000 12:20:34 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] lvdisplay disagrees with df for resized LV
Message-ID: <20001011122034.A7418@omnifarious.mn.org>
References: <m2u2ajmunl.fsf@puma.redeye> <20001011084555.A6983@omnifarious.mn.org> <m23di3l4ux.fsf@puma.redeye>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <m23di3l4ux.fsf@puma.redeye>; from andy@redeye.com on Wed, Oct 11, 2000 at 05:28:22PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2000 at 05:28:22PM +0100, Andy Cowling wrote:
> Thanks to all for your help. I'm using reiserfs and on SuSE 7.0, the
> resize utility was hidden away in /sbin/resize_reiserfs.
>=20
> I have resized the file system to 90G successfully but, there always a
> but isn't there :-), df now reports a total of 88Gb.
>=20
> Out of interest is this due to rounding or reisfer/LVM housekeeping ?

	It's due to Resierfs housekeeping.  That represents a 2.2%
overhead, for filesystem housekeeping, which isn't too bad.  I'm a
little surprised it's that large.  I wouldn't be if it were ext2, and
would actually expect it to be more, but it's certainly within the realm
of reasonableness.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE55KFiG4QeWBeRdS8RAuGDAJ9masLID9IXmYBgZ1d8zK2t0I7KjwCg0ybB
XnqtAVueQ5L68TX+bukFyas=
=gK+x
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
