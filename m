Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i2QGGjj21268
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2004 11:16:45 -0500
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.12.11/8.12.11) with ESMTP id i2QGGj7c021162
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2004 10:16:45 -0600
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.12.11/8.12.11/Submit) id i2QGGjQm021161
	for linux-lvm@redhat.com; Fri, 26 Mar 2004 10:16:45 -0600
Date: Fri, 26 Mar 2004 10:16:44 -0600
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] 2 TB limit
Message-ID: <20040326161644.GF12948@null.msp.redhat.com>
References: <005601c412af$748d71a0$1fa0a8c0@blec>
	<200403261813.50041.krustev@krustev.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="byLs0wutDcxFdwtm"
Content-Disposition: inline
In-Reply-To: <200403261813.50041.krustev@krustev.net>
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


--byLs0wutDcxFdwtm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2004 at 06:13:50PM +0200, Delian Krustev wrote:
> On Thursday 25 March 2004 23:23, Brad Vrabete wrote:
>=20
> > Is there any was to create a logigal volume larger than 2TB? Can LVM2 do
> > that?
>=20
> I think it can. However tha maximum size for a block device in 2.4 kernels
> is 2TB. You should try 2.6, and use large enough PE size.

The PE size limitation isn't present in lvm2 (The version of lvm that works
in 2.6) if you use the native lvm2 format.  So you should be able to create
larger than 2TB LVs with LVM2.  Just FYI.

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
File not found. Should I fake it? (Y/N)
-----End Obligatory Humorous Quote------------------------------------------

--byLs0wutDcxFdwtm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAZFds9QxUqFeMhxURAv51AJwNQ3yH3+kcNIH5qyeFKrycxMCXogCdExFx
u/77LFh20W/KpzluxZeaP8Y=
=8nfE
-----END PGP SIGNATURE-----

--byLs0wutDcxFdwtm--
