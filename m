Return-Path: <hopper@omnifarious.mn.org>
Date: Thu, 5 Jul 2001 12:09:34 -0500
From: "Eric M. Hopper" <hopper@omnifarious.org>
Subject: Re: [linux-lvm] Re: [PATCH] 64 bit scsi read/write
Message-ID: <20010705120934.A30277@omnifarious.org>
References: <20010705083402.D11805@vestdata.no> <Pine.LNX.4.33.0107050310570.1063-100000@toomuch.toronto.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0107050310570.1063-100000@toomuch.toronto.redhat.com>; from bcrl@redhat.com on Thu, Jul 05, 2001 at 03:35:31AM -0400
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2001 at 03:35:31AM -0400, Ben LaHaise wrote:
> On Thu, 5 Jul 2001, Ragnar Kj=F8rstad wrote:
>=20
> > What do you mean?
> > Is it not feasible to fix this in LVM as well, or do you just not know
> > what needs to be done to LVM?
>=20
> Fixing LVM is not on the radar of my priorities.  The code is sorely in
> need of a rewrite and violates several of the basic planning tenents that
> any good code in the block layer should follow.  Namely, it should have 1)
> planned on supporting 64 bit offsets, 2) never used multiplication,
> division or modulus on block numbers, and 3) don't allocate memory
> structures that are indexed by block numbers.

	It would seem to me that it would be nearly impossible to write
something that does the kind of block remapping that LVM does without
violating tenets 2 and 3.

	To me, that's like saying that no code that deals with memory
can have a data structure indexed by address, and you can't do masking
operations on memory addresses.  That would completely kill virtual
memory right there.

Have fun (if at all possible),
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7RJ9OG4QeWBeRdS8RAlQPAJsFUZ0gvRmTLD0Xg1PvFWNTDPIvVQCgw6Ey
aUVpn9KMKx5IrqBN6Tb5wZ4=
=Iklr
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
