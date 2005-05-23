Received: from null.msp.redhat.com (null.msp.redhat.com [10.15.80.136])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j4NK41UF018655
	for <linux-lvm@redhat.com>; Mon, 23 May 2005 16:04:03 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.13.4/8.12.11) with ESMTP id j4NK3xck021252
	for <linux-lvm@redhat.com>; Mon, 23 May 2005 15:03:59 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.13.4/8.13.4/Submit) id j4NK3x4T021251
	for linux-lvm@redhat.com; Mon, 23 May 2005 15:03:59 -0500
Date: Mon, 23 May 2005 15:03:59 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] pvcreate issues
Message-ID: <20050523200358.GJ6097@null.msp.redhat.com>
References: <4292256B.7060509@m-cam.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W13SgbpmD6bhZUTM"
Content-Disposition: inline
In-Reply-To: <4292256B.7060509@m-cam.com>
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


--W13SgbpmD6bhZUTM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2005 at 02:48:11PM -0400, Arshavir Grigorian wrote:
> Hi,
>=20
> We have a SAN that exports 4 LUNs. These appear as SCSI devices on the=20
> server (/dev/sd[c-f]). When I try to create physical volumes on these=20
> devices, I get the following error:
>=20
> #>pvcreate /dev/sdc
>   Physical volume "/dev/sdc" successfully created
>=20
> #>pvcreate /dev/sdd
>   Found duplicate PV ZlhU50ejJ1VkoULTcU5ODsl2BP26IjQW: using /dev/sdc=20
> not /dev/sdd
>   Found duplicate PV ZlhU50ejJ1VkoULTcU5ODsl2BP26IjQW: using /dev/sde=20
> not /dev/sdd
>   Found duplicate PV ZlhU50ejJ1VkoULTcU5ODsl2BP26IjQW: using /dev/sdf=20
> not /dev/sdd
>   Physical volume "/dev/sdd" successfully created
>=20
> This happens after pvcreate is run the second time, does not matter in=20
> which order. It looks like when pvcreate sets the device id, it somehow=
=20
> sets it for all the devices.

You're sure sd[c-f] is not the same device on multiple paths?

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


--W13SgbpmD6bhZUTM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCkjcu9QxUqFeMhxURAonDAJ41I3vWSXZN8e/1Jp+6czq2vxuRSQCg2+0r
3cDLZyhD+7OHfUdR4/wVA6o=
=4WUi
-----END PGP SIGNATURE-----

--W13SgbpmD6bhZUTM--
