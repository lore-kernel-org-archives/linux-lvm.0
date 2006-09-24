Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8OHidNN010382
	for <linux-lvm@redhat.com>; Sun, 24 Sep 2006 13:44:39 -0400
Received: from linux.interlinx.bc.ca (linux.interlinx.bc.ca [66.11.173.224])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8OHicsB008399
	for <linux-lvm@redhat.com>; Sun, 24 Sep 2006 13:44:39 -0400
Received: from [10.75.22.1] (pc.ilinx [10.75.22.1])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id B2851D7906
	for <linux-lvm@redhat.com>; Sun, 24 Sep 2006 13:44:37 -0400 (EDT)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-vU34CsxL2GWY5aNoU8FX"
Date: Sun, 24 Sep 2006 13:44:34 -0400
Message-Id: <1159119874.5445.4.camel@pc.ilinx>
Mime-Version: 1.0
Subject: [linux-lvm] removing a PV to split a volume group
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


--=-vU34CsxL2GWY5aNoU8FX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I had to do some maintenance on my VG so added a new PV.  I now have two
PVs in my VG with several LVs each of which is wholly on single PV (i.e.
no LV has PEs from both disks.

I now want to separate the PVs into self-contained VGs such that the VG
on each does not reference the other PV.

How can I go about this?  It seems that as soon as I remove an "unused"
PV from a VG it fails to start up again, probably because I need the
--partial switch.  But how do I fix up the VG so that I don't need the
--partial switch without destroying the PV that I want to remove?

Thanx,
b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-vU34CsxL2GWY5aNoU8FX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBFFsQBl3EQlGLyuXARArniAKDSl2kUZrV8uCOR8sxJyz0sEkne0wCeMWx+
kkYS+AcpbpDMb7/rqahTkqc=
=nkX9
-----END PGP SIGNATURE-----

--=-vU34CsxL2GWY5aNoU8FX--
