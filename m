Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBFKKqr23370
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 15:20:52 -0500
Received: from zippy.toger.us (zippy.toger.us [65.19.178.247])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBFKKjKF008801
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 15:20:46 -0500
Date: Wed, 15 Dec 2004 12:20:38 -0800
Subject: Re: [linux-lvm] How to increase/decrease space
Message-ID: <20041215202037.GE22568@zippy.toger.us>
References: <OFF29F4998.D0184014-ON86256F6B.006C59E9-86256F6B.006C87BF@schneider.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXY52bIqOkzyC1te"
Content-Disposition: inline
In-Reply-To: <OFF29F4998.D0184014-ON86256F6B.006C59E9-86256F6B.006C87BF@schneider.com>
From: Jason Martin <jhmartin@toger.us>
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


--kXY52bIqOkzyC1te
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2004 at 01:45:26PM -0600, AdabalaP@schneider.com wrote:
> Thanks Jason, I shall try "lvextend", But what about resizing (decreasing)
> "/" file system.
You'd probably have to reboot onto a rescue disk and approach it
that way.

-Jason Martin
--=20
=2E.. "I'll be Bach." - Johann Sebastian Schwarzenegger
This message is PGP/MIME signed.

--kXY52bIqOkzyC1te
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: --no-verbose

iD8DBQFBwJyVl2ODWuqVSBMRAmExAKCNsOgXv98iGcvyvBndk8PsXv04gACaA1FD
NOfTEFHifKL4jAFaF1bI3dw=
=vdr4
-----END PGP SIGNATURE-----

--kXY52bIqOkzyC1te--
