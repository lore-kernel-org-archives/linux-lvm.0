Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB1ISqEf005571
	for <linux-lvm@redhat.com>; Tue, 1 Dec 2009 13:28:52 -0500
Received: from mhw.ulib.iupui.edu (mhw.ulib.iupui.edu [134.68.171.23])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB1ISaxa026184
	for <linux-lvm@redhat.com>; Tue, 1 Dec 2009 13:28:36 -0500
Received: from mwood by mhw.ulib.iupui.edu with local (Exim 4.69)
	(envelope-from <mwood@IUPUI.Edu>) id 1NFXSl-0006TX-Kl
	for linux-lvm@redhat.com; Tue, 01 Dec 2009 13:28:35 -0500
Date: Tue, 1 Dec 2009 13:28:35 -0500
From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] show free space _inside_ logical volume
Message-ID: <20091201182835.GC14760@IUPUI.Edu>
References: <4cd59bf50911301645l51c44579k978225d3fe9e71b0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-ripemd160;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline
In-Reply-To: <4cd59bf50911301645l51c44579k978225d3fe9e71b0@mail.gmail.com>
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
To: linux-lvm@redhat.com


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Well, the LVM tools will tell you the size of the LV, and filesystem
tools will tell you the size of the filesystem.  You have to do the
subtraction yourself.

Depending on what's most important to you, to have either set of tools
work with the other's data would either be a layering violation, cause
unnecessary and fragile coupling of unrelated tools, or make them
needlessly complex.  Both toolsets need to remain small, light,
rugged, and simple, because they're used for standing up and repairing
systems that may not be ready for daily use.

--=20
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
Friends don't let friends publish revisable-form documents.

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEAREDAAYFAksVYFMACgkQs/NR4JuTKG/6yACff7GpBUnpfdx4xB6yxAl230/+
JSMAnRgyw5bslaivS3IVQXFE1DX1AFfl
=oXhz
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
