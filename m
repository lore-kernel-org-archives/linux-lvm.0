Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2MIwoj24460
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 13:58:50 -0500
Received: from zero.voxel.net (postfix@zero.voxel.net [209.123.232.253])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2MIwmWA031315
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 13:58:48 -0500
Received: from wax.hq.voxel.net (hq.voxel.net [66.109.37.2])
	by zero.voxel.net (Postfix) with ESMTP id 10F1024B02A
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 13:58:40 -0500 (EST)
From: Andres Salomon <dilinger@voxel.net>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-ZiMwmZgr5L95pDFSQc84"
Message-Id: <1079981919.25676.3.camel@wax.hq.voxel.net>
Mime-Version: 1.0
Date: Mon, 22 Mar 2004 13:58:39 -0500
Subject: [linux-lvm] lvm2 bugs with s390
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


--=-ZiMwmZgr5L95pDFSQc84
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

(Resending this, as it appears gmane ate the message; presumably
something related to the list switchover broke gmane's setup)

I've had a Debian user complain about broken lvm2 behavior on s390.  The
relevant bugs reports are here:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D237408
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D237409

I had hoped to deal with this, but it's been almost two weeks, and I
haven't had the time, so I'm punting it to the list.  Hopefully someone
will be able to figure out what's happening.


--=-ZiMwmZgr5L95pDFSQc84
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAXzde78o9R9NraMQRAjj4AKCrqnK1asrJBcVwdQxm33qaB5cJpwCgixrI
U8Z2G4UXBBjLjRIcvXiz00c=
=LtqU
-----END PGP SIGNATURE-----

--=-ZiMwmZgr5L95pDFSQc84--
