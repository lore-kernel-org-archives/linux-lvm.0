Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i48I49v11224
	for <linux-lvm@redhat.com>; Sat, 8 May 2004 14:04:09 -0400
Received: from polop.usc.edu (polop.usc.edu [128.125.10.9])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i48I490m001760
	for <linux-lvm@redhat.com>; Sat, 8 May 2004 14:04:09 -0400
Received: from polop.usc.edu (localhost.localdomain [127.0.0.1])
	by polop.usc.edu (8.12.10/8.12.10) with ESMTP id i48I2dlv003242
	for <linux-lvm@redhat.com>; Sat, 8 May 2004 11:02:39 -0700
Received: (from garrick@localhost)
	by polop.usc.edu (8.12.10/8.12.10/Submit) id i48I2cPs003240
	for linux-lvm@redhat.com; Sat, 8 May 2004 11:02:38 -0700
Date: Sat, 8 May 2004 11:02:38 -0700
From: Garrick Staples <garrick@usc.edu>
Subject: Re: [linux-lvm] lvcreate --major?
Message-ID: <20040508180238.GE30964@polop.usc.edu>
References: <20040508021255.GU30964@polop.usc.edu>
	<20040508071040.A29383@homer.msp.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="irrheVdOic6+Kbak"
Content-Disposition: inline
In-Reply-To: <20040508071040.A29383@homer.msp.redhat.com>
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


--irrheVdOic6+Kbak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 08, 2004 at 07:10:40AM -0500, Alasdair G Kergon alleged:
> On Fri, May 07, 2004 at 07:12:56PM -0700, Garrick Staples wrote:
> > Adding a persistent minor number works fine, but --major appears to be
> > ignored.=20
>=20
> To set persistent, you have to specify both major and minor=20
> together with --persistent y.
>=20
> Only works with 2.4 kernels - multiple major number support still needs
> adding to 2.6 kernels for situations like yours. =20

Ah, there's the problem.  I'm using 2.6.  Thank you for clearing that up.

--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--irrheVdOic6+Kbak
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAnSC+0SBUxJbm9HMRAlR9AKC9S5JSmyj6SGX6pXOv94L/F8fo9gCfeE55
H/luOmrh1jFivM3qQXl8Zpg=
=k9LG
-----END PGP SIGNATURE-----

--irrheVdOic6+Kbak--
