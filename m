Received: from null.msp.redhat.com (null.msp.redhat.com [10.15.80.136])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j5KEgYq9023737
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 10:42:34 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.13.4/8.12.11) with ESMTP id j5KEgXM1030858
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 09:42:33 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.13.4/8.13.4/Submit) id j5KEgXWd030857
	for linux-lvm@redhat.com; Mon, 20 Jun 2005 09:42:33 -0500
Date: Mon, 20 Jun 2005 09:42:33 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] Is LVM safe?
Message-ID: <20050620144233.GB12491@null.msp.redhat.com>
References: <1119268975.25392.34.camel@volt>
	<200506201517.01268.krienke@uni-koblenz.de>
	<1119275366.25392.48.camel@volt>
	<d45c7b521930741fc78fef25d061f74b@anderedomain.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline
In-Reply-To: <d45c7b521930741fc78fef25d061f74b@anderedomain.de>
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


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2005 at 04:09:10PM +0200, Philipp Riegger wrote:
> On 20. Jun 2005, at 15:49 Uhr, John Rowe wrote:
>=20
> >If I have a Physical Volume which is the only Physical Volume in a
> >Volume Group, can I always recover the recover the Volume Group if I
> >have absolutely nothing else just like I can with an ext3 partition?
>=20
> Yes, it's easy. You just need a kernel with DM-Support and the=20
> LVM2-Tools.
>=20
> A simple
>=20
> vgscan
> vgchangs -ay
>=20
> And you have your "Partitions" back.

Well, it's not quite that simple - if something scribbles over your LVM
metadata (i've never seen this happen where it wasn't user error), you need=
 to
do quite a bit more work to get things back so you can activate your LVs so
you can fsck your ext3 partition.  It usually involves at least running a
vgcfgrestore against the backup file in /etc/lvm/backup.  So yes, it can be
more complicated if the lvm metadata gets broken - but this is similar to w=
hat
happens if the partition table gets busted on a normal disk.

--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
One Main Street SE, Suite 209
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCttXZ9QxUqFeMhxURAgt+AJ9j6ZdBy6iY4QdDMdPtdM9jZYUjUACfS/gP
GUDBcA1Qm9WQwsSmbsNuy24=
=1y5l
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
