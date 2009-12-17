Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBHNg5BL006287
	for <linux-lvm@redhat.com>; Thu, 17 Dec 2009 18:42:05 -0500
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBHNfncj004817
	for <linux-lvm@redhat.com>; Thu, 17 Dec 2009 18:41:50 -0500
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NLPyc-0007XN-HR
	for linux-lvm@redhat.com; Fri, 18 Dec 2009 00:41:46 +0100
Received: from d67-193-197-208.home3.cgocable.net ([67.193.197.208])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 18 Dec 2009 00:41:46 +0100
Received: from brian by d67-193-197-208.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 18 Dec 2009 00:41:46 +0100
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Thu, 17 Dec 2009 18:41:23 -0500
Message-ID: <1261093282.21162.564.camel@pc.interlinx.bc.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-YnMcyFisehtvCkHR12/p"
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] brainfart: lilo'd a PV
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


--=-YnMcyFisehtvCkHR12/p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I managed to write a lilo block (lilo) to the start of a PV which I have
on /dev/sda (note, /dev/sda is a whole disk PV, unpartitioned).

However, looking at a number of different PVs here, it appears that the
LVM data starts at 0x200 with: "LABELONE".  i.e.:

# hexdump -C /dev/sdc3
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
*
00000200  4c 41 42 45 4c 4f 4e 45  01 00 00 00 00 00 00 00  |LABELONE......=
..|
...
# hexdump -C /dev/sdb
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
*
000001b0  00 00 00 00 00 00 00 00  dc 59 0f 10 cf c9 00 00  |.........Y....=
..|
000001c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
*
00000200  4c 41 42 45 4c 4f 4e 45  01 00 00 00 00 00 00 00  |LABELONE......=
..|
...
# hexdump -C /dev/sda=20
00000000  fa eb 31 12 00 00 4c 49  4c 4f 16 08 10 00 01 00  |..1...LILO....=
..|
...
00000180  30 e4 cd 13 eb 91 e8 93  fe 44 69 73 6b 20 72 65  |0........Disk =
re|
00000190  61 64 20 65 72 72 6f 72  0d 0a 00 00 00 00 00 00  |ad error......=
..|
000001a0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
000001b0  00 00 00 00 00 00 00 00  c6 08 1a 45 cf c9 00 00  |...........E..=
..|
000001c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
*
000001f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 55 aa  |..............=
U.|
00000200  4c 41 42 45 4c 4f 4e 45  01 00 00 00 00 00 00 00  |LABELONE......=
..|

Is that correct?

Is there anything I should do to repair this or is my brainfart benign
to this PV?

Thanx!

b.


--=-YnMcyFisehtvCkHR12/p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEUEABECAAYFAksqwaIACgkQl3EQlGLyuXAmKACgmh2VUdB6CkU6UbTkes6VO37T
X/8AlRFPQCkUYi35/9rXpd//wUFvtcg=
=JryI
-----END PGP SIGNATURE-----

--=-YnMcyFisehtvCkHR12/p--
