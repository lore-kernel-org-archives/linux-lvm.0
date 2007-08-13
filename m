Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7DEbAqW021248
	for <linux-lvm@redhat.com>; Mon, 13 Aug 2007 10:37:10 -0400
Received: from smtp-out04.email.it (smtp-out04.email.it [212.97.34.24])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7DEb57c023710
	for <linux-lvm@redhat.com>; Mon, 13 Aug 2007 10:37:05 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp-out04.email.it (Postfix) with ESMTP id E2080C00E
	for <linux-lvm@redhat.com>; Mon, 13 Aug 2007 16:36:58 +0200 (CEST)
Received: from smtp-out04.email.it ([127.0.0.1])
	by localhost (smtp-out04.email.it [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gD14IQq6xyLZ for <linux-lvm@redhat.com>;
	Mon, 13 Aug 2007 16:36:58 +0200 (CEST)
Received: from [10.9.0.10] (host135-150-dynamic.8-87-r.retail.telecomitalia.it
	[87.8.150.135])
	by smtp-out04.email.it (Postfix) with ESMTP id C4DB5C006
	for <linux-lvm@redhat.com>; Mon, 13 Aug 2007 16:36:57 +0200 (CEST)
From: Simone Gotti <simone.gotti@email.it>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-Or+kIKlZGdy0yvZ5nr+Q"
Date: Mon, 13 Aug 2007 16:36:34 +0200
Message-Id: <1187015794.2799.11.camel@localhost>
Mime-Version: 1.0
Subject: [linux-lvm] Some questions on "Mirrors cannot be resized while
	active yet"
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


--=-Or+kIKlZGdy0yvZ5nr+Q
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi all,

lvresize gives the message "Mirrors cannot be resized while active yet."
when trying to resize an active lv.

Simple tests using directly dmsetup let me resize a mirror on the fly
without problems (maybe I'm missing some problematic corner cases). With
a core log everything was resynced every time while with disk log only
the extended part was resynced.=20

So, is there only missing code in lvm2 (curious to know if I should be
able to write the missing part) or also the kernel parts (dm-raid1,
dm-log and future dm-clog) needs some more code?

Thanks!

Bye!
--=20
Simone Gotti

--=-Or+kIKlZGdy0yvZ5nr+Q
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQBGwGxDl0ZU7uYHW3kRApIFAJ9dfQ718JUYVgO8R6T4pFQacN8j5QCbBxok
wywEbvNErZdpKCzxK5BrPOY=
=Q4D+
-----END PGP SIGNATURE-----

--=-Or+kIKlZGdy0yvZ5nr+Q--
