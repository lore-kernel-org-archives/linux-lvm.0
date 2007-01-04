Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l04Kbcgu011305
	for <linux-lvm@redhat.com>; Thu, 4 Jan 2007 15:37:38 -0500
Received: from mhw.ulib.iupui.edu (mail@mhw.ulib.iupui.edu [134.68.171.23])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l04Kbafa004223
	for <linux-lvm@redhat.com>; Thu, 4 Jan 2007 15:37:36 -0500
Received: from mwood by mhw.ulib.iupui.edu with local (Exim 4.40)
	id 1H2ZLC-0003FS-Ni
	for linux-lvm@redhat.com; Thu, 04 Jan 2007 15:37:34 -0500
Date: Thu, 4 Jan 2007 15:37:34 -0500
From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] Persistent minor number problem in lvm2
Message-ID: <20070104203734.GB12275@IUPUI.Edu>
References: <200701041524.50995.krienke@uni-koblenz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline
In-Reply-To: <200701041524.50995.krienke@uni-koblenz.de>
Sender: "Mark H. Wood,UL 0115A,+1 317 274 0749," <mwood@mhw.ulib.iupui.edu>
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


--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Mount by LABEL=3D or UUID=3D?

Device node numbers are good for physical things like serial lines,
but not so good for logical things like storage volumes.  If you can
label it, do, and always identify it by your label.

--=20
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
Typically when a software vendor says that a product is "intuitive" he
means the exact opposite.


--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFFnWWOs/NR4JuTKG8RAnTdAKCrBDMDJqV1o5sM7oeRU9xXF4i4bgCeJ8tW
yeqnkk3gavl+I6I2/g6/rA4=
=qUDb
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
