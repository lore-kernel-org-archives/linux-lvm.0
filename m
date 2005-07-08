Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j68KgMV02220
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 16:42:22 -0400
Received: from wavehammer.waldi.eu.org (postfix@wavehammer.waldi.eu.org
	[82.139.196.55])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j68KgLM7009756
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 16:42:21 -0400
Date: Fri, 8 Jul 2005 22:42:15 +0200
From: Bastian Blank <bastian@waldi.eu.org>
Subject: Re: [linux-lvm] pvextend
Message-ID: <20050708204215.GB23643@wavehammer.waldi.eu.org>
References: <20050708164536.GE15561@wavehammer.waldi.eu.org>
	<20050708173853.GU12337@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Content-Disposition: inline
In-Reply-To: <20050708173853.GU12337@agk.surrey.redhat.com>
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


--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2005 at 06:38:53PM +0100, Alasdair G Kergon wrote:
> On Fri, Jul 08, 2005 at 06:45:36PM +0200, Bastian Blank wrote:
> > it correctly, I just need to change the value of pe_count and commit the
> > metadata, correct?
> No:-)

Hmm?

> A pvresize command needs to implement that same sequence of commands inte=
rnally.
> (similar to the way vgconvert works)

Hmm, it is not possible to change the number of PEs directly?

Bastian

--=20
There is an order of things in this universe.
		-- Apollo, "Who Mourns for Adonais?" stardate 3468.1

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iEYEARECAAYFAkLO5ScACgkQnw66O/MvCNGUmgCfVPJefvog05DkdiMXbi7iUYjm
zxkAn0FyMICt+g23bc1ptxQ5PH40ZC5I
=inym
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--
