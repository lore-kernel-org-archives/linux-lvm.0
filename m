Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i481bMv17680
	for <linux-lvm@redhat.com>; Fri, 7 May 2004 21:37:22 -0400
Received: from toybox.mhill.net (c-67-166-18-167.client.comcast.net
	[67.166.18.167])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i481bM0m032128
	for <linux-lvm@redhat.com>; Fri, 7 May 2004 21:37:22 -0400
Date: Fri, 7 May 2004 19:37:16 -0600
From: Michael Hill <michael@mhill.net>
Message-ID: <20040508013716.GH1226@toybox.mhill.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jHkwA2TBA/ec6v+"
Content-Disposition: inline
Subject: [linux-lvm] Problem with LVs
Reply-To: Michael Hill <michael@mhill.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
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


--9jHkwA2TBA/ec6v+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm having a strange problem, and I haven't found any help in the
regular places so far.

I have a VG, data_vg, with three LVs (data, games, and winex).  After
doing some disk-related work (not involving the PV on which data_vg
resides), I found that one of the filesystems (data) contained the
content of another (winex) instead.  /dev/data_vg looks like this:

brw-r-----    1 root     root      58,   6 Dec 31  1969 data
brw-r-----    1 root     root      58,   7 Dec 31  1969 games
crw-r-----    1 root     root     109,   3 Dec 31  1969 group
brw-r-----    1 root     root      58,   7 Dec 31  1969 lvol2
brw-r-----    1 root     root      58,   6 Dec 31  1969 winex

The minor device number for data and winex is the same.  I'm hoping that
the blocks belonging to LV data are still intact on the PV.  I need to
figure out how to get LV data pointing back to where it should be.  Any
help toward that end will be GREATLY appreciated.

--=20
			--Michael

---------------------------------------------------------------------------=
----
Michael Hill   <><  Isaiah 9:6 |
michael AT mhill DOT net       | # find / -name '*[Bb][Aa][Ss][Ee]*' \
Aerospace/Software Engineer    | > -user your -print | xargs chown us:cats
http://www.qadas.com/~msh/     |
---In a marketplace (like the one of ideas), not everything has equal value=
!---
Did you ever notice that everybody in favor of abortion has already been bo=
rn?!

--9jHkwA2TBA/ec6v+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFAnDnMlSecBhO4gLERAr8kAJ9dxCJZgMo/3hso46pAIxMMfI+KgwCcCozb
SB/wk/r5kAG2RSnJ8YJF+mU=
=PCio
-----END PGP SIGNATURE-----

--9jHkwA2TBA/ec6v+--
