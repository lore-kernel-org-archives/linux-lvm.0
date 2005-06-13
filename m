Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5D5Dgu04547
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2005 01:13:42 -0400
Received: from polop.usc.edu (polop.usc.edu [128.125.10.9])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5D5DaiW017381
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2005 01:13:36 -0400
Received: from polop.usc.edu (localhost.localdomain [127.0.0.1])
	by polop.usc.edu (8.12.11/8.12.11) with ESMTP id j5D5DaFi007461
	for <linux-lvm@redhat.com>; Sun, 12 Jun 2005 22:13:36 -0700
Received: (from garrick@localhost)
	by polop.usc.edu (8.12.11/8.12.11/Submit) id j5D5DVD9007459
	for linux-lvm@redhat.com; Sun, 12 Jun 2005 22:13:31 -0700
Date: Sun, 12 Jun 2005 22:13:31 -0700
From: Garrick Staples <garrick@usc.edu>
Subject: Re: [linux-lvm] how to move data from one PV to other PV automaticly?
Message-ID: <20050613051331.GX2244@polop.usc.edu>
References: <200506130252.j5D2qdVZ029650@mx3.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o/BvujNCPFVhiGON"
Content-Disposition: inline
In-Reply-To: <200506130252.j5D2qdVZ029650@mx3.redhat.com>
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


--o/BvujNCPFVhiGON
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2005 at 10:51:58AM +0800, cwinl alleged:
> hi,all:
>     i have a VG with 3 PV.
> here is 'pvdisplay' information:
>   --- Physical volume ---
>   PV Name               /dev/sdb1
>   Free PE               0
>   =20
>   --- Physical volume ---
>   PV Name               /dev/sdc1
>   Free PE               0
>   =20
>   --- Physical volume ---
>   PV Name               /dev/sdd1
>   Free PE               0
> =20
> i want to move all data from /dev/sdb1 to another two PV (/dev/sdc1 and
> /dev/sdd1) automaticly.
> so i can remove the unstable PV /dev/sdb1 and repair it.
> then i will restore a new /dev/sdb1 device.
> /dev/mapper/nicvg-niclv
>                       2.0T  774G  1.2T  40% /ftproot
> =20
> ---------------------------------
> =20
> the volumn '/dev/mapper/nicvg-niclv' is on the VG above.
> =20
> how can finish it?
> =20
> any suggestion is regarded!

The other 2 PVs (sdc1 and sdd1) are both full.  You can't move any data on =
them
with the current configuration.  You'll need to free up ~840GB on nicvg bef=
ore
you can do it.

The first step would be to shrink the filesystem using the correct utility =
for
the filesystem (you didn't mention the filesystem type).  Fortunately you h=
ave
1.2TB free on the filesystem so this shouldn't be a problem.

Then reduce the size of niclv and you'll be able to move the PEs off of sdb=
1.


--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--o/BvujNCPFVhiGON
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFCrRX70SBUxJbm9HMRAloTAJ0W+mGq5imkYIaanrWD/K/Y5tRHPQCfdeTF
7zLWhWqRfrn7/OTlAFq3Q54=
=/cBW
-----END PGP SIGNATURE-----

--o/BvujNCPFVhiGON--
