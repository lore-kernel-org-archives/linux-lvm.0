Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i482EOv24223
	for <linux-lvm@redhat.com>; Fri, 7 May 2004 22:14:24 -0400
Received: from polop.usc.edu (polop.usc.edu [128.125.10.9])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i482EO0m006754
	for <linux-lvm@redhat.com>; Fri, 7 May 2004 22:14:24 -0400
Received: from polop.usc.edu (localhost.localdomain [127.0.0.1])
	by polop.usc.edu (8.12.10/8.12.10) with ESMTP id i482Culv031739
	for <linux-lvm@redhat.com>; Fri, 7 May 2004 19:12:56 -0700
Received: (from garrick@localhost)
	by polop.usc.edu (8.12.10/8.12.10/Submit) id i482Cu3n031737
	for linux-lvm@redhat.com; Fri, 7 May 2004 19:12:56 -0700
Date: Fri, 7 May 2004 19:12:56 -0700
From: Garrick Staples <garrick@usc.edu>
Message-ID: <20040508021255.GU30964@polop.usc.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3dBJfKlFjfsS/piO"
Content-Disposition: inline
Subject: [linux-lvm] lvcreate --major?
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


--3dBJfKlFjfsS/piO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,
   I'm curious about adding a persistent major device number to my LVs.
Adding a persistent minor number works fine, but --major appears to be igno=
red.

It seems that the major number is always 253, no matter what is set using
lvcreate or lvchange.  Earlier today I realized that --major is NOT
mentioned in the manpage, but it is listed in 'lvm lvcreate help'.

I assume that either there is a bug with major persistent numbers, it isn't
(yet) implemented, or it is incorrectly listed in the help output.

For the curious, persistent device numbers are useful for NFS because nfsd
creates a filehandle out of the major and minor device numbers.

And finally, HUGE thanks to the developers or LVM.  It's the best thing for
disk storage since sliced bread!

--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--3dBJfKlFjfsS/piO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAnEIn0SBUxJbm9HMRAgyUAJ9biQyJsGoW4BnvN1miLGW2qDtZJwCffpS3
Q1+zmIZaWsrCUAtr4k9VTXY=
=OteQ
-----END PGP SIGNATURE-----

--3dBJfKlFjfsS/piO--
