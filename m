Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7BKX7a22111
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 16:33:07 -0400
Received: from chaos.ao.net (root@chaos.ao.net [208.5.40.6])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i7BKX5e1024452
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 16:33:05 -0400
Received: from chaos.ao.net (harik@localhost [127.0.0.1])
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) with ESMTP id i7BKWwGK024857
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 16:32:58 -0400
Received: (from harik@localhost)
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) id i7BKWwUd024855
	for linux-lvm@redhat.com; Wed, 11 Aug 2004 16:32:58 -0400
Date: Wed, 11 Aug 2004 16:32:58 -0400
From: Dan Merillat <dmerillat@sequiam.com>
Subject: Re: [linux-lvm] device-mapper: : dm-linear: Device lookup failed
Message-ID: <20040811203257.GL21230@chaos.ao.net>
References: <20040811011709.GK21230@chaos.ao.net>
	<1092220929.11356.0.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Content-Disposition: inline
In-Reply-To: <1092220929.11356.0.camel@leto.cs.pocnet.net>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Aug 2004, Christophe Saout wrote:

> Am Dienstag, den 10.08.2004, 21:17 -0400 schrieb Dan Merillat:
>=20
> > I can't use my CD-rom as a device-mapper target, is this intended?
> >=20
> > "0 2048 linear /dev/hda1 0" works, "0 2048 linear /dev/hdc 0" does not.
>=20
> You have to explicitly create a read-only mapping using -r.

Aha, that fixes it.

Ok, may be useful to return an error message like "read-write mapping
requested on a read-only media", or just do like filesystem mounting:
demote it to read-only and report to the user.

--Dan

--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----

iD8DBQFBGoJ5kycScExRgsgRAk+PAKCecXpJScbaK48+epHxIIIyaVJCVgCfaG2i
jIf+VzQMmGrYPzs9VUwLqvw=
=Dp43
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--
