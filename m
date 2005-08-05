Received: from null.msp.redhat.com (null.msp.redhat.com [10.15.80.136])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j75LEIED006334
	for <linux-lvm@redhat.com>; Fri, 5 Aug 2005 17:14:18 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.13.4/8.12.11) with ESMTP id j75LEIAB021952
	for <linux-lvm@redhat.com>; Fri, 5 Aug 2005 16:14:18 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.13.4/8.13.4/Submit) id j75LEIug021951
	for linux-lvm@redhat.com; Fri, 5 Aug 2005 16:14:18 -0500
Date: Fri, 5 Aug 2005 16:14:18 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] Problem with Metadata at the beginning of the disk
Message-ID: <20050805211418.GZ4954@null.msp.redhat.com>
References: <82CC5B790FEB854BBD58EEBA156E5C68C0D0CE@SRMOON.eng.emc.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bebzX59uVWocTrAI"
Content-Disposition: inline
In-Reply-To: <82CC5B790FEB854BBD58EEBA156E5C68C0D0CE@SRMOON.eng.emc.com>
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


--bebzX59uVWocTrAI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2005 at 04:28:21PM -0400, krishnakumar, narasimha wrote:
> Hi All,
>=20
> I am having a problem with the metadata at the beginning of the disk. The
> disk is a whole disk with a valid partition table. The disk is part of a
> volume group. The operations I am trying to do are the following
>=20
> 1. pvcreate /dev/sdf
> 2. vgcreate samplevg  /dev/sdf
> 3. Open the device (/dev/sdf) read only (using open system call)
> 4. read 512 bytes from the beginning of the device.
>=20
>  I expect atleast the ID "HM" to be at the beginning of the disk but the
> first block (512 bytes) is all 0. Anybody have any ideas how I can get the
> information like the id, version etc. Any help would be appreciated.

Try going a bit...further.

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


--bebzX59uVWocTrAI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC89aq9QxUqFeMhxURAmGmAJ9/LGwCx/hAZ9NRSB0i8N3e0uonoACgsDe8
TVL9AmVQOS4Wl32ZF0V2jxg=
=Goto
-----END PGP SIGNATURE-----

--bebzX59uVWocTrAI--
