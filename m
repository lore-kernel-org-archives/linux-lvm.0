Date: Mon, 1 May 2000 21:06:45 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] RH 6.2 kernel problem with 0.8i
Message-ID: <20000501210645.B25591@omnifarious.mn.org>
References: <20000501194313.A25404@omnifarious.mn.org> <390E294C.698DDB17@t-online.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
In-Reply-To: <390E294C.698DDB17@t-online.de>; from Heinz.Mauelshagen@t-online.de on Tue, May 02, 2000 at 03:03:08AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2000 at 03:03:08AM +0200, Heinz Mauelshagen wrote:
> "Eric M. Hopper" wrote:
>=20
>>         I figured out my problem.  It's the RAID patches that RH adds.
>>
>>         RH adds a LOT of patches to the stock kernel.  Someone suggested
>> grabbing a stock kernel and using that, but a lot of the RH patches are
>> ones I really want, and I don't want to sift through them carefully
>> figuring out which ones.
>>
>>         So, I grabbed the kernel source RPM, used rpm2cpio on it,
>> unpacked the cpio, and then used patch -R (what a wonderful tool) to
>> reverse the patches I didn't want out of the kernel source tree RH
>> ships.
>>
>>         After that, the LVM patches applied just fine.  I only wanted
>> RAID0 anyway, and LVM does that just fine by itself.  :-)

	BTW, I should've mentioned the patches I had to back out.  These
are what they were named in the kernel SRPM.

linux-2.2.12-PIII-xor.patch
linux-2.2.14-sparc-raid.patch
raid-2.2.14-B1.gz

	I believe the patches have to be reverse applied in the given
order.

Have fun (if at all possible),
--=20
Its name is Public Opinion.  It is held in reverence. It settles everything.
Some think it is the voice of God.  Loyalty to petrified opinion never yet
broke a chain or freed a human soul.     ---Mark Twain
-- Eric Hopper (hopper@omnifarious.mn.org  http://omnifarious.mn.org/~hoppe=
r) --

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5Djg1G4QeWBeRdS8RAgUAAKDbLL0aad+mmPyyZ7SuJWFkxzC9dwCgnkP/
9GGcZYrIfah8treMPAl4W9k=
=wscJ
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
