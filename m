Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5NCYAu19742
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 08:34:10 -0400
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5NCY94j010037
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 08:34:10 -0400
Subject: Re: [linux-lvm] Logical volume > 2TB question
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <200506230338.j5N3cAsI002588@mx3.redhat.com>
References: <200506230338.j5N3cAsI002588@mx3.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-WpPdixn73EEVPv32XH+/"
Date: Thu, 23 Jun 2005 08:34:03 -0400
Message-Id: <1119530043.5503.4.camel@localhost.localdomain>
Mime-Version: 1.0
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


--=-WpPdixn73EEVPv32XH+/
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2005-06-23 at 11:38 +0800, Felix Chu wrote:
> Hi all,
>=20
assumed u use iet as target. it support >2TB device.

> I have a 4TB storage on iscsi target(Linux). Volume group can show 4TB. W=
hen
> I create a 3TB logical volume, I find that Windows initiator cannot use t=
his
for windows, that is windows problem.

> 3TB storage. If I use Linux initiator, it can connect but only 2TB is
> available.=20
for linux, which iscsi initiator u use? check the source code and change
the max cdb len to 16 instead of 12, which is default.

>=20
> I know that there is limitation of LV with 2TB max. Any method to solve i=
t?
what u mean? u already create a 3TB lv...

> I am using Fedora core 3 with kernel 2.6.11.12.
>=20
> Thanks,
> Felix
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=-WpPdixn73EEVPv32XH+/
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCuqw7SYbkL5BnVYoRAquBAJ0d+gzRgrbJ7bHSoaCM7Q1B6Zbv/wCfU+Gx
TitRq8eBFOwbWncU9Nrr32E=
=+hNe
-----END PGP SIGNATURE-----

--=-WpPdixn73EEVPv32XH+/--
