Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i87IQT309049
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2004 14:26:29 -0400
Received: from linux.interlinx.bc.ca (linux.interlinx.bc.ca [66.11.173.224])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i87IQNS0009853
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2004 14:26:28 -0400
Received: from pc.interlinx.bc.ca (pc [10.75.22.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 7D35A81CFB
	for <linux-lvm@redhat.com>; Tue,  7 Sep 2004 14:26:05 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by pc.interlinx.bc.ca (Postfix) with ESMTP id BC2F4C466
	for <linux-lvm@redhat.com>; Tue,  7 Sep 2004 14:26:04 -0400 (EDT)
Subject: Re: [linux-lvm] LVM2 snapshots on root fs
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <20040907181748.GD6264@agk.surrey.redhat.com>
References: <20040907110330.GE2689@server.klaube.net>
	<20040907181748.GD6264@agk.surrey.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-OKR4q1+3uNzsE5+c4zwx"
Date: Tue, 07 Sep 2004 14:26:03 -0400
Message-Id: <1094581563.9586.98.camel@pc>
Mime-Version: 1.0
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


--=-OKR4q1+3uNzsE5+c4zwx
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-09-07 at 19:17 +0100, Alasdair G Kergon wrote:
>=20
> We don't support pvmove or snapshots of volumes used by the tools themsel=
ves.

That seems rather limiting.  Is this something that should change in the
future?

> It is possible to snapshot the root volume, but the method is probably=20
> distribution-specific.

Like what?  Using a copy of the /sbin/lvm2 binary not living in the
rootfs when you want to snapshot it?  What about /lib/libdevmapper.so.*?
Does it have the same problem?

b.


--=-OKR4q1+3uNzsE5+c4zwx
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBPf07l3EQlGLyuXARArLOAJ4vBUW79RGS9vf1oBChDqmA0YCHoQCdE6HZ
E68hBS9vd5GyEp/2IBqZvq4=
=9PSS
-----END PGP SIGNATURE-----

--=-OKR4q1+3uNzsE5+c4zwx--
