Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5NHqcu02723
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 13:52:38 -0400
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5NHqbsJ003562
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 13:52:37 -0400
Subject: RE: [linux-lvm] Logical volume > 2TB question
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <200506231716.j5NHG49e012592@leviathan.ele.uri.edu>
References: <200506231716.j5NHG49e012592@leviathan.ele.uri.edu>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-7Y3aETuFkseftEjBm35J"
Date: Thu, 23 Jun 2005 13:52:30 -0400
Message-Id: <1119549150.5503.70.camel@localhost.localdomain>
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
To: Felix Chu <felixchu@powernetix.com>
Cc: 'LVM general discussion and development' <linux-lvm@redhat.com>


--=-7Y3aETuFkseftEjBm35J
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2005-06-24 at 01:16 +0800, Felix Chu wrote:
> I am using IETD, linux-iscsi initiator.
>=20
> By "lvdisplay" , it shows that LV 3TB was created successfully. Is that m=
ean
> the LVM can support 3TB?
>=20
yes

> By the way, what is the mean of "max cdb len" ? also what is the meaning =
of
> "12"? Which file I should change if I use "linux-iscsi" initiator?
>=20
linux-iscsi code version ?


> Thanks.
>=20
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
On
> Behalf Of Ming Zhang
> Sent: Thursday, June 23, 2005 8:34 PM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Logical volume > 2TB question
>=20
> On Thu, 2005-06-23 at 11:38 +0800, Felix Chu wrote:
> > Hi all,
> >=20
> assumed u use iet as target. it support >2TB device.
>=20
> > I have a 4TB storage on iscsi target(Linux). Volume group can show 4TB.
> When
> > I create a 3TB logical volume, I find that Windows initiator cannot use
> this
> for windows, that is windows problem.
>=20
> > 3TB storage. If I use Linux initiator, it can connect but only 2TB is
> > available.=20
> for linux, which iscsi initiator u use? check the source code and change
> the max cdb len to 16 instead of 12, which is default.
>=20
> >=20
> > I know that there is limitation of LV with 2TB max. Any method to solve
> it?
> what u mean? u already create a 3TB lv...
>=20
> > I am using Fedora core 3 with kernel 2.6.11.12.
> >=20
> > Thanks,
> > Felix
> >=20
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20

--=-7Y3aETuFkseftEjBm35J
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCuvbeSYbkL5BnVYoRAngFAKCBPwtPysYaNashqavPkwYLG+8jVQCffqmm
Mp8e4wkBcwrxJSmttlAxbE4=
=3HvD
-----END PGP SIGNATURE-----

--=-7Y3aETuFkseftEjBm35J--
