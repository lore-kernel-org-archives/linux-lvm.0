Received: from null.msp.redhat.com (null.msp.redhat.com [10.15.80.136])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j6EDol4Q007237
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2005 09:50:47 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.13.4/8.12.11) with ESMTP id j6EDolbC003191
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2005 08:50:47 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.13.4/8.13.4/Submit) id j6EDolNG003190
	for linux-lvm@redhat.com; Thu, 14 Jul 2005 08:50:47 -0500
Date: Thu, 14 Jul 2005 08:50:46 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] (no subject)
Message-ID: <20050714135046.GN14421@null.msp.redhat.com>
References: <H000007200508521.1121327588.fsu50.nll.se@MHS>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DH4/xewco2zMcht6"
Content-Disposition: inline
In-Reply-To: <H000007200508521.1121327588.fsu50.nll.se@MHS>
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


--DH4/xewco2zMcht6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2005 at 09:53:09AM +0200, fredrik.backman@nll.se wrote:
> I'm testing the experimental mirroring support and this doesn't add upp=
=20
> for me?
>=20
>=20
>  pvs
>   PV         VG      Fmt  Attr PSize    PFree
>   /dev/sdb   test_vg lvm2 a-   1020.00M 1020.00M
>   /dev/sdc   test_vg lvm2 a-   1020.00M 1020.00M
>=20
>  vgs
>   VG      #PV #LV #SN Attr  VSize VFree
>   test_vg   2   0   0 wz--n 1.99G 1.99G
>=20
>=20
> lvcreate -m1 -L 100M -v -ntest test_vg
>     Finding volume group "test_vg"
>     Archiving volume group "test_vg" metadata (seqno 8).
>     Creating logical volume test_mlog
>   Not enough PVs with free space available for parallel allocation.
>   Consider --alloc anywhere if desperate.
>=20
>=20
> However, if I add another PV into my volume group, the lvcreate above=20
> succeeds.

Yep - persistant mirrors require a log lv as well as the two mirror lvs, so
with the default allocation right now it will fail if you don't have three
disks.  The log LV keeps track of which regions are dirty and which are cle=
an
for resyncing purposes.

Regards,
--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat                                    E-Mail: alewis@redhat.com
One Main Street SE, Suite 209
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--DH4/xewco2zMcht6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC1m229QxUqFeMhxURAiHnAKC13DdsvjDSTwIJqgWYDZkM8Y0tIACfX63d
8dk7cUFNnI9lWpSpeYbP6j4=
=SJks
-----END PGP SIGNATURE-----

--DH4/xewco2zMcht6--
