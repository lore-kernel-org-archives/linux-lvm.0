Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9S1Hpr21279
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2004 21:17:51 -0400
Received: from eclectic.kluge.net (eclectic.kluge.net [66.92.69.221])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id i9S1HigI005969
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2004 21:17:44 -0400
Date: Wed, 27 Oct 2004 21:17:39 -0400
From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] Software raid on top of lvm logical volume
Message-ID: <20041028011738.GD13737@kluge.net>
References: <41801ADE.6030308@monjoin.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="at83816p314Ixd9l"
Content-Disposition: inline
In-Reply-To: <41801ADE.6030308@monjoin.net>
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


--at83816p314Ixd9l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2004 at 12:02:06AM +0200, Eric Monjoin wrote:
> I would like to know if it's possible (works perfectly) to create a=20
> software mirror (md0) on top of  2 LVM logical volumes :

You'd usually want to make your raid devices first, then put LVM on
top of it.  I can't really think of any benefits of doing it the other
way around.

--=20
Randomly Generated Tagline:
Sarchasm: The gulf between the author of sarcastic wit, and the recipient
 who doesn't get it.
         - Washington Post

--at83816p314Ixd9l
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBgEiy7tgKAJaXVyoRAuUrAJ4s1GHPqskQFtUH3+LwHC5E53E4vgCgkJrP
eolubrW9xo8vQNf11Bgs1y0=
=vhk0
-----END PGP SIGNATURE-----

--at83816p314Ixd9l--
