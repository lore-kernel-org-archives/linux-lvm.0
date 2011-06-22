Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p5MN8rOb015407
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2011 19:08:53 -0400
Received: from wombat.san-francisco.ca.us (wombat.san-francisco.ca.us
	[75.101.60.64])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5MN8pCZ002081
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2011 19:08:51 -0400
Date: Wed, 22 Jun 2011 16:08:50 -0700
From: Keith Keller <kkeller@wombat.san-francisco.ca.us>
Message-ID: <20110622230850.GA9313@wombat.san-francisco.ca.us>
References: <20110616193230.GA7267@wombat.san-francisco.ca.us>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <20110616193230.GA7267@wombat.san-francisco.ca.us>
Subject: Re: [linux-lvm] removing a disk prematurely
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
To: linux-lvm@redhat.com


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello again all,

I didn't get an answer here, but I thought that for posterity I should
post what I hope is a potential solution.

On Thu, Jun 16, 2011 at 12:32:30PM -0700, Keith Keller wrote:
>=20
> I have been looking everywhere for a good answer to this issue, with no
> success (including searching this list's archives); I hope that coming
> directly to the source will help.
>=20
> I made a mistake in removing physical media from a hot-swap drive bay
> before telling LVM I was going to remove it.  I don't actually care
> about the data on those disks at all--it was an old test volume that I
> hadn't even had mounted for over a year.  But now, when I do any lvm
> commands, I get an error like so:
>=20
> # pvdisplay=20
>   /dev/testVG/testLV: read failed after 0 of 4096 at 0: Input/output error
>=20
> and an error like this in the logs:
>=20
> scsi 1:0:2:0: rejecting I/O to dead device

I was able to clear the error on a test machine, without destroying any
(simulated) ''important'' data, using dmsetup:

dmsetup remove testVG-testLV

Does that seem like a reasonable course of action?

--keith


--=20
kkeller@wombat.san-francisco.ca.us


--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAk4CdgEACgkQhVcNCxZ5ID/jUgCeMV54Wazyl1MwjzVvnS/5/lP8
j5sAn1qiG4ZbTTGVfUSMJ1bzQyy36j+h
=nQjt
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
