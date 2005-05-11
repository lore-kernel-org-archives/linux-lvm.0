Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j4BGn75C026429
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 12:49:07 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.13.4/8.12.11) with ESMTP id j4BGn79s003645
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 11:49:07 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.13.4/8.13.4/Submit) id j4BGn7TU003644
	for linux-lvm@redhat.com; Wed, 11 May 2005 11:49:07 -0500
Date: Wed, 11 May 2005 11:49:06 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] Re: ide / debian
Message-ID: <20050511164906.GB16497@null.msp.redhat.com>
References: <20050510173249.GJ2445@openlib.org>
	<20050511163957.GA14252@openlib.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline
In-Reply-To: <20050511163957.GA14252@openlib.org>
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


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2005 at 11:39:57AM -0500, Thomas Krichel wrote:
>   Thomas Krichel writes
>=20
> > I want to combine hdb hdc and hdd to one logical volume.
> > Each is 80G. All had a single partition. I have a 2.6.8 kernel.=20
> > I  run the latest Debian testing version of lvm2.
>=20
>   I played on and found:
>=20
>   * OS sees all three disks
>   * I can pvcreate all disks
>   * pvscan does not find hdc

Look in /etc/lvm/lvm.conf for a filter line - it probably has hdc or cdrom =
in
it.  You need to remove this.
=20
--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCgjeC9QxUqFeMhxURAoclAJ96WQgiC9KWeIjdY1PsOsg0X2eftgCdFlpL
AMAc1HcKz6LEz3i1KY4XPbk=
=fPuT
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
