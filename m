Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5SNPIu14932
	for <linux-lvm@redhat.com>; Tue, 28 Jun 2005 19:25:18 -0400
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5SNPGaw009284
	for <linux-lvm@redhat.com>; Tue, 28 Jun 2005 19:25:16 -0400
From: Ming Zhang <mingz@ele.uri.edu>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-ZqppH459mSBagCp5N09c"
Date: Tue, 28 Jun 2005 19:25:10 -0400
Message-Id: <1120001110.5484.105.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [linux-lvm] how to recover data on other PV if one PV fails in same
	group
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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


--=-ZqppH459mSBagCp5N09c
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi, folks

I know this is a question that must be asked many times, but that lvm
list search function is not user friendly to me.

How to recover data on other PV if only one PV fails in same volume
group?

And a might more complex question is what if that PV comes back from 1
days. for example, this is a PV from iscsi and thus it can be broken for
a while. Then how I rejoin the PV and begin to access it again?


Thanks!


Ming




--=-ZqppH459mSBagCp5N09c
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCwdxWSYbkL5BnVYoRAtHsAJ4l2ozv0NoFIG38xmclPs7/qsWXDwCeKAfH
svYvrlwPdFusUB0b3l7PRBk=
=l8U8
-----END PGP SIGNATURE-----

--=-ZqppH459mSBagCp5N09c--
