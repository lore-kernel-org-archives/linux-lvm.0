Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4VDtVO03536
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 09:55:31 -0400
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4VDtQ2e006063
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 09:55:26 -0400
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1Dd7DJ-0000hh-Fb
	for linux-lvm@redhat.com; Tue, 31 May 2005 13:55:25 +0000
Date: Tue, 31 May 2005 13:55:25 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20050531135525.GZ686@strugglers.net>
References: <20050531110414.GP686@strugglers.net>
	<20050531130024.GV15809@agk.surrey.redhat.com>
	<20050531132812.GT686@strugglers.net>
	<20050531135153.GW15809@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AJu7IxIPovG6hMTN"
Content-Disposition: inline
In-Reply-To: <20050531135153.GW15809@agk.surrey.redhat.com>
Subject: Re: [linux-lvm] deadlock on snapshot creation;
	any way out without a reboot?
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


--AJu7IxIPovG6hMTN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2005 at 02:51:53PM +0100, Alasdair G Kergon wrote:
> So admindata has no snapshots, but it is suspended with an 'inactive' tab=
le loaded
> indicating  some operation got interrupted.
>=20
> Try:
>   lvchange --refresh mainvg/admindata
>=20
> This should reload 'mainvg-admindata' to match the configuration in the l=
vm2 metadata.

Thanks Alasdair, that worked perfectly!

--AJu7IxIPovG6hMTN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCnGzNIJm2TL8VSQsRAoKTAKC1IitH+EhbQZ8J356Ga03FgdyNlQCgp12H
aoysOBqGDdUMPJZPw7E4in8=
=ziXF
-----END PGP SIGNATURE-----

--AJu7IxIPovG6hMTN--
