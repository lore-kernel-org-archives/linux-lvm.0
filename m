Received: from null.msp.redhat.com (null.msp.redhat.com [10.15.80.136])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j67EEo7j001347
	for <linux-lvm@redhat.com>; Thu, 7 Jul 2005 10:14:50 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.13.4/8.12.11) with ESMTP id j67EEoVZ011143
	for <linux-lvm@redhat.com>; Thu, 7 Jul 2005 09:14:50 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.13.4/8.13.4/Submit) id j67EEofL011142
	for linux-lvm@redhat.com; Thu, 7 Jul 2005 09:14:50 -0500
Date: Thu, 7 Jul 2005 09:14:48 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] Converting from LVM to LVM on RAID1
Message-ID: <20050707141448.GC15005@null.msp.redhat.com>
References: <1120409514l.9263l.0l@tangerine>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline
In-Reply-To: <1120409514l.9263l.0l@tangerine>
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


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 03, 2005 at 04:51:50PM +0000, Jean-Luc Coulon (f5ibh) wrote:
> Is there a safe way to convert from a working LVM (with root on LVM) to =
=20
> a software RAID1 including the device where is the existing LVM ?

Not yet, but I'm working on it ATM - hopefully I'll have something in CVS
tomorrow or early next week.

--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat                                    E-Mail: alewis@redhat.com
One Main Street SE, Suite 209
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCzTjY9QxUqFeMhxURAmeJAKC7podDgr+25Eb4F7nt+AJtQhY8hACgkCZH
B5nfkAdOZ4+7qZtX5kHLT9I=
=rlBo
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
