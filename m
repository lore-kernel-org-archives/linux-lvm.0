Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJIOGr12091
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 13:24:16 -0500
Received: from polop.usc.edu (polop.usc.edu [128.125.10.9])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAJIOFPq011798
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 13:24:15 -0500
Received: from polop.usc.edu (localhost.localdomain [127.0.0.1])
	by polop.usc.edu (8.12.11/8.12.11) with ESMTP id iAJIOE3X031898
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 10:24:14 -0800
Received: (from garrick@localhost)
	by polop.usc.edu (8.12.11/8.12.11/Submit) id iAJIOE1h031896
	for linux-lvm@redhat.com; Fri, 19 Nov 2004 10:24:14 -0800
Date: Fri, 19 Nov 2004 10:24:14 -0800
From: Garrick Staples <garrick@usc.edu>
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
Message-ID: <20041119182414.GF3139@polop.usc.edu>
References: <1100857645.13422.99.camel@grma-lap>
	<1100885267.19894.217.camel@rct07.cadence.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4MTjg8yAiOaLjoFv"
Content-Disposition: inline
In-Reply-To: <1100885267.19894.217.camel@rct07.cadence.com>
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


--4MTjg8yAiOaLjoFv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2004 at 09:27:47AM -0800, Chris Croswhite alleged:
> I use the ATABoy 2x (dual active/active FC) with great success.  I use
> md to create a failover path (see mdadm) on newer kernels (2.6.9) and I
> have multiple 3.2T LUNS (multiple ataboys).  I use LVM2 to partition
> some of the LUNs with great success.

How do you solve the problem of lvm2 seeing 3 duplicate PVs (2 paths and 1 =
md
device)?  Are you using the filter in /etc/lvm/lvm.conf?

--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--4MTjg8yAiOaLjoFv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBnjpO0SBUxJbm9HMRAu60AJ47ZwsjAzXuatzZszn9lHqelWIf9gCgubBT
WXHx0EXg1QTEV2WMi/3o2Rg=
=mlx0
-----END PGP SIGNATURE-----

--4MTjg8yAiOaLjoFv--
