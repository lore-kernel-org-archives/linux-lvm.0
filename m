Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAK8cKr13940
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2004 03:38:20 -0500
Received: from polop.usc.edu (polop.usc.edu [128.125.10.9])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAK8c9GZ021279
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2004 03:38:09 -0500
Received: from polop.usc.edu (localhost.localdomain [127.0.0.1])
	by polop.usc.edu (8.12.11/8.12.11) with ESMTP id iAK8c8sA003537
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2004 00:38:08 -0800
Received: (from garrick@localhost)
	by polop.usc.edu (8.12.11/8.12.11/Submit) id iAK8c8X0003535
	for linux-lvm@redhat.com; Sat, 20 Nov 2004 00:38:08 -0800
Date: Sat, 20 Nov 2004 00:38:08 -0800
From: Garrick Staples <garrick@usc.edu>
Subject: Re: Re: [linux-lvm] Software RAID 5 Resizing and LVM
Message-ID: <20041120083808.GS3139@polop.usc.edu>
References: <OF26153F74.622A298A-ON86256F4F.005C138B-86256F4F.005CBE3E@austinlogistics.com>
	<1100732495.2496.6.camel@Slacktop.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4uMdeSyPFwfKNOAv"
Content-Disposition: inline
In-Reply-To: <1100732495.2496.6.camel@Slacktop.local>
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


--4uMdeSyPFwfKNOAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Date: Wed, 17 Nov 2004 10:53:00 -0600
> From: Jetkins@austinlogistics.com
> Subject: Re: [linux-lvm] Software RAID 5 Resizing and LVM
> To: adam@slackguy.net
>=20
>=20
> I asked pretty much that exact question on Monday! :)  The only difference
> was that mine is a hardware RAID.  Someone replied with a possible
> workaround if you're using LVM2, but if you're using LVM1 like me, and you
> pvcreate'd your PV across the entire disk like me, then you're screwed li=
ke
> me. :(
>=20
> If you partitioned the logical disk and pvcreate'd a partition, then you
> should be able to create a new partition on the newly-available space, th=
en
> pvcreate a second PV and add it into the VG.  The wonders of 20/20
> hindsight.

I'm using the entire, unpartitioned, block device on my boxes on advice fro=
m my
DataDirect Networks vendor.  Apparently putting a partition table at the fr=
ont
of the block device offsets each write request 512 bytes, which is disaster=
ous
for performance.  By using the whole device, the writes are correctly byte
aligned to the arrays.

--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--4uMdeSyPFwfKNOAv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBnwJw0SBUxJbm9HMRAjnaAJ4xxkIjk56+lX+yib2x/lH7o4WdGgCgkkxQ
fqis/gJ3YDUYg7V+xcgw/Kk=
=WuNq
-----END PGP SIGNATURE-----

--4uMdeSyPFwfKNOAv--
