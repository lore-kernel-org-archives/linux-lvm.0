Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3MHq5om028405
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 13:52:05 -0400
Received: from mail1.cc.huji.ac.il (real-outmail.cc.huji.ac.il [132.64.1.17])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3MHpwLK015075
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 13:51:59 -0400
Received: from kaminsky.dyndns.org (di8-32047.dialin.huji.ac.il [132.64.32.47])
	by mail1.cc.huji.ac.il (8.12.11.20060308/8.12.11) with ESMTP id
	k3MHptkC019869
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 20:51:56 +0300
Date: Sat, 22 Apr 2006 20:52:18 +0300
From: Moshe Kaminsky <kaminsky@math.huji.ac.il>
Subject: Re: [linux-lvm] volume group uuid not found
Message-ID: <20060422175217.GA439@kaminsky>
References: <20060422125954.GA5908@kaminsky>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <20060422125954.GA5908@kaminsky>
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


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Moshe Kaminsky <kaminsky@math.huji.ac.il> [22/04/06 16:15]:
> Hi,
>=20
> I have the following problem: when running
>=20
> vgchange -a y vg
>=20
> I get errors of the following type:
>=20
> Volume group uuid not found: ...
>=20

Turned out to be a problem in the specific version I used (2.02.03). I=20
managed to upgrade from a boot cd and it solved the problem.

Moshe


--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2-ecc0.1.6 (GNU/Linux)

iD8DBQFESm1RkBjmVsKMBeMRAuVKAJ0Q5ou67e2YtQegDNpnIJKvjArC6wCgu7jo
f2QBB1atKyZ5NowVh/ufIMc=
=PMFY
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
