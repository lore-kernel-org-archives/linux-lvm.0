Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5KGAfu30026
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 12:10:41 -0400
Received: from clown.omnifarious.org (dsl254-016-017.sea1.dsl.speakeasy.net
	[216.254.16.17])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5KGAWZ2001431
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 12:10:35 -0400
Date: Mon, 20 Jun 2005 09:10:21 -0700
From: Eric Hopper <hopper@omnifarious.org>
Subject: Re: [linux-lvm] Is LVM safe?
Message-ID: <20050620161021.GG25606@omnifarious.org>
References: <1119268975.25392.34.camel@volt>
	<200506201517.01268.krienke@uni-koblenz.de>
	<1119275366.25392.48.camel@volt>
	<d45c7b521930741fc78fef25d061f74b@anderedomain.de>
	<20050620144233.GB12491@null.msp.redhat.com>
	<1119279649.18965.24.camel@volt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tvOENZuN7d6HfOWU"
Content-Disposition: inline
In-Reply-To: <1119279649.18965.24.camel@volt>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--tvOENZuN7d6HfOWU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2005 at 04:00:49PM +0100, John Rowe wrote:
>=20
> > > Yes, it's easy. You just need a kernel with DM-Support and the=20
>=20
> > But this is similar to what
> > happens if the partition table gets busted on a normal disk.
>=20
> So the previous poster's "Yes" actually means "No". And a broken
> partition table will zap a disk with an LVM partition too won't it? So
> the bottom line is that if I want to move an LVM partition to a
> different system I have to hold my breath and pray.

No, it means "Yes" just like he said.  There is a condition that you
didn't explicitly state in the original question.  If the LVM metadata
is messed up somehow (which doesn't generally happen unless you do
something stupid), you can't recover the LVM volumes without a
filesystem backup of the metadata.

> The idea that a disk partition needs Unix file to be able to read it is
> absolutely astonishing.

Umm, try this sometime...

dd if=3D/dev/zero of=3D/dev/hda bs=3D512 count=3D1

Then just try to resurrect the partition.

Unless you've created a backup of your partition table into a Unix file,
then you aren't going to recover the partition table, period.

So, poof, there, you have a disk partition that needs a Unix file to be
able to read it.

Since LVM maintains backups of all of this metadata in files, it's
signficantly better for recovery than Unix partitions are.

*sigh*,
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--tvOENZuN7d6HfOWU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFCtuptjtsvlOwvazYRAvU1AKCwY8uVhw5nYmw8f0YhxsFp+DI53gCg1Bft
3/ducRCUpBdeRVfz1T/d+zQ=
=6s4u
-----END PGP SIGNATURE-----

--tvOENZuN7d6HfOWU--
