Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j68GItV10901
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 12:18:55 -0400
Received: from wavehammer.waldi.eu.org (postfix@wavehammer.waldi.eu.org
	[82.139.196.55])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j68GImd3021013
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 12:18:48 -0400
Date: Fri, 8 Jul 2005 18:18:37 +0200
From: Bastian Blank <bastian@waldi.eu.org>
Subject: Re: [linux-lvm] Moving PEs within a PV for defragmentation
Message-ID: <20050708161837.GB15561@wavehammer.waldi.eu.org>
References: <20050708143331.GA15561@wavehammer.waldi.eu.org>
	<20050708144006.GR12337@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline
In-Reply-To: <20050708144006.GR12337@agk.surrey.redhat.com>
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


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2005 at 03:40:06PM +0100, Alasdair G Kergon wrote:
> On Fri, Jul 08, 2005 at 04:33:31PM +0200, Bastian Blank wrote:
> > Is their a reason why pvmove refuses to move PEs within one PV?
> Does --alloc anywhere help?
> (see an old Debian bug report)

Seems so.

Bastian

--=20
Hailing frequencies open, Captain.

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iEYEARECAAYFAkLOp10ACgkQnw66O/MvCNF6cACgm2bAXCoMgO6oiDpUG5jFL7/h
a/IAnjtrg9cdmt6YRkKFl7CTWVIX74JS
=1WwH
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
