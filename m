Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i66JF4024077
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 15:15:04 -0400
Received: from polop.usc.edu (polop.usc.edu [128.125.10.9])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i66JF3e1013803
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 15:15:03 -0400
Received: from polop.usc.edu (localhost.localdomain [127.0.0.1])
	by polop.usc.edu (8.12.11/8.12.11) with ESMTP id i66JF3O6004582
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 12:15:03 -0700
Received: (from garrick@localhost)
	by polop.usc.edu (8.12.11/8.12.11/Submit) id i66JF3U9004580
	for linux-lvm@redhat.com; Tue, 6 Jul 2004 12:15:03 -0700
Date: Tue, 6 Jul 2004 12:15:03 -0700
From: Garrick Staples <garrick@usc.edu>
Message-ID: <20040706191502.GL11597@polop.usc.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KE2MUCIIiXMogsnv"
Content-Disposition: inline
Subject: [linux-lvm] dm kernel patch size
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
To: linux-lvm@redhat.com


--KE2MUCIIiXMogsnv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Can someone comment on the size of the dm kernel patches?  They seem to be =
far
too large and patch far more than just dm.  It appears that they patch betw=
een
different kernel versions.

--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--KE2MUCIIiXMogsnv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFA6vo20SBUxJbm9HMRArwUAKDFyyr9QIJ7m4NihDLjQZnevbN1wACcDdp5
qt8vGLD0SsMsQBR7jpeJmhU=
=7SI+
-----END PGP SIGNATURE-----

--KE2MUCIIiXMogsnv--
