Date: Mon, 16 Oct 2000 07:49:09 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] RAID in LVM
Message-ID: <20001016074909.A8930@omnifarious.mn.org>
References: <01C03701.8B2003C0.smdenton@bellsouth.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <01C03701.8B2003C0.smdenton@bellsouth.net>; from smdenton@bellsouth.net on Sun, Oct 15, 2000 at 11:42:12PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Linux LVM mailing list <linux-lvm@msede.com>


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 15, 2000 at 11:42:12PM -0400, S. Michael Denton wrote:
>=20
> Possibly, but even hardware RAID has points of failure... some
> hardware RAID is even designed so poorly as to inadvertently -create-
> more points of failure...

	If your hardware fails, software RAID will not help you recover.
Actually, I take that back.  Mirroring, which LVM does also already do
(if I'm not mistaken) is a way that software can compensate for a
hardware failure.  Parity RAID is not helped this way.

>> only reason to do any RAID besides RAID0 is reliability, so why pick
>> an option that so clearly doesn't work?  LVM already does RAID0.
>=20
> On the point of reliability I agree, the only reason to do RAID is for
> reliability... and the reliability factor becomes additive so the more
> options you have, the better.  None of them are perfect... none of
> them work 100% of the time.  But eliminating an option, even if it is
> only partially viable, only reduces the tools you have at your
> disposal.

	Software solutions aside from mirroring do not give you any
additive benefit.  In fact, they reduce overall MTBF by being a possible
point of failure in themselves.

	Actually, software does improve reliability when you can't get a
hardware parity striping solution.  But only then.  I don't consider
that to be worthwhile enough to add software parity striping.
Especially since using software parity striping kills the benefits that
a good journaling filesystem will give you.

	If implementation of software RAID5 has the effect of driving
down costs of good harware RAID5 solutions, then I'm all for it.
Usually though, what drives down costs in the hardware world is volume,
and software RAID5 could have the effect of lowering volume.

> Besides, wouldn't it be better to have a single tool for software
> volume management instead of multiple?  If we could merge the mdtools
> into lvmtools then we'd have one point for software raid AND logical
> volume management... much better in my opinion :)

	IMHO, the mdtools should go away, and this can already be done
in all reasonable cases.  The recent RedHat kernels appear to have
modifications that make LVM and md incompatible, so I've been skipping
on compiling in md.

	Actually, I think the IBM stackable block driver idea is
probably the best bet here.  Although, with simple striping, it's
possible that LVM might be able to 'undo' the striping and move the
filesystem off of a physical volume that is part of the stripe.  I'm not
sure if LVM does this right now, and if it doesn't, it's a capability I
would like to see added.

> BTW as a side note, RAID0 doesn't provide any reliability enhancement
> or protection against failures... it's only striping.

	I know.  That's why I think its implementation in software is
just fine.  :-)

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE56vlFG4QeWBeRdS8RAtOPAJ44Bn8m32cyvxqaVsfKPjbRbwAoJwCgh39X
YRcc7qdrUhPzQY6xeNiwqlM=
=WdYv
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
