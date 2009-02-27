Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1RFkcPD014143
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2009 10:46:42 -0500
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1RFaaY2018873
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2009 10:37:14 -0500
Received: from linux.interlinx.bc.ca (d193-213-184.home3.cgocable.net
	[67.193.213.184])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id 624152803
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2009 10:36:38 -0500 (EST)
Received: from [IPv6:2001:4978:161:0:218:f3ff:fee1:65cc] (pc.interlinx.bc.ca
	[IPv6:2001:4978:161:0:218:f3ff:fee1:65cc])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 46341802C
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2009 10:36:44 -0500 (EST)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-fhcZIGJVvgzzi6YLYXHL"
Date: Fri, 27 Feb 2009 10:36:37 -0500
Message-Id: <1235748997.1193.15.camel@pc.interlinx.bc.ca>
Mime-Version: 1.0
Subject: [linux-lvm] vgchange doesn't enable found VGs
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


--=-fhcZIGJVvgzzi6YLYXHL
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Strange:

+ /usr/sbin/vgscan --ignorelockingfailure
  Reading all physical volumes.  This may take a while...
  Found volume group "foobar" using metadata type lvm2
+ /usr/sbin/vgchange -a y --ignorelockingfailure
  No volume groups found

It seems I have to tell vgchange to enable the foobar VG explicitly.

Why is this?

b.


--=-fhcZIGJVvgzzi6YLYXHL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmoCIIACgkQl3EQlGLyuXBLigCcDnjGHW8hiYF1Zn+Khj0AQj+r
EX4AoN1UYPPArrrAtqYcyDsmTCUroULH
=+hX0
-----END PGP SIGNATURE-----

--=-fhcZIGJVvgzzi6YLYXHL--
