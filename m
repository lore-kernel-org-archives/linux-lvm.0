Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id i3UGTvV2028788
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 12:29:58 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.12.11/8.12.11) with ESMTP id i3UGTv8B027403
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 11:29:57 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.12.11/8.12.11/Submit) id i3UGTvSw027402
	for linux-lvm@redhat.com; Fri, 30 Apr 2004 11:29:57 -0500
Date: Fri, 30 Apr 2004 11:29:57 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] LVM and hardware device re-ordering?
Message-ID: <20040430162957.GA8717@null.msp.redhat.com>
References: <409276F4.7060305@easystreet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <409276F4.7060305@easystreet.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2004 at 08:55:32AM -0700, Don Buchholz wrote:
> The one nagging question in my mind is:
>=20
>  How resilient is LVM to a sudden renumbering of
>  physical hard disks?
>=20
> Assume no disks have actually failed, just that a new disk
> gets added and suddenly all the LVM drives get notched up
> a drive letter.=20

It's fine.  Each disk (PV) is labeled with a UUID, which uniquely identifies
it to the system.  'vgscan' identifies this after a new disk is added that
changes your drive numbering.  Most distros run vgscan in the lvm startup
scripts to cope with this on reboot after a hardware addition.  If you're
doing a hot-add, you'll have to run this by hand I think.  OTOH, if your vg
is activated and being used, the renumbering should not affect it at all.
It's only the activation that needs the identifier, and the worst case
scenario is that the activation will fail without a vgscan with a complaint
about a missing PV.

Regards,
--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414

Current GPG fingerprint =3D FE77 4B43 6A9B F982 A731  02FA 2BF5 7574 294A A=
A5A
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...
-----Begin Obligatory Humorous Quote----------------------------------------
Computers make very fast, very accurate mistakes.
-----End Obligatory Humorous Quote------------------------------------------

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAkn8F9QxUqFeMhxURAnq7AKCOs6mAPTch730Bb6IMinlDQ05AZgCfWnG/
wTtM7/94amhFa53wqcgwIsg=
=uQn4
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
