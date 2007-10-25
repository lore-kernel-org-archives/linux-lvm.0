Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9PMJ3kX019385
	for <linux-lvm@redhat.com>; Thu, 25 Oct 2007 18:19:03 -0400
Received: from mail.backcountry.com (mail.backcountry.com [206.71.94.246])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9PMIuet003222
	for <linux-lvm@redhat.com>; Thu, 25 Oct 2007 18:18:56 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.backcountry.com (Postfix) with ESMTP id 50B3523E1AC8
	for <linux-lvm@redhat.com>; Thu, 25 Oct 2007 16:18:52 -0600 (MDT)
Received: from mail.backcountry.com ([127.0.0.1])
	by localhost (mail.backcountry.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id y--FwA8wF7hO for <linux-lvm@redhat.com>;
	Thu, 25 Oct 2007 16:18:49 -0600 (MDT)
Received: from skrugerlt.local (unknown [4.71.96.110])
	by mail.backcountry.com (Postfix) with ESMTP id 42AD923E1AB5
	for <linux-lvm@redhat.com>; Thu, 25 Oct 2007 16:18:49 -0600 (MDT)
From: Shaun Kruger <skruger@backcountry.com>
Subject: Re: [linux-lvm] LVM snapshot limits
Date: Thu, 25 Oct 2007 16:18:44 -0600
References: <200710251447.43405.skruger@backcountry.com>
	<47210A6B.6090104@redhat.com>
In-Reply-To: <47210A6B.6090104@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6825821.mJV3jB75yC";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200710251618.47974.skruger@backcountry.com>
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

--nextPart6825821.mJV3jB75yC
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Thanks for the information.  I'll post that to my redhat support ticket and=
=20
see if they can help me with a more immediate fix.

> Anyway, multiple snapshots from the same origin can cause considerable
> performance decrease (there is no shared area for snapshots in current
> implementation, so write to origin will cause new writes to every snapshot
> copy-on-write area).

This copy on write issue had already occoured to us.  We were going to roll=
=20
out with the concept of a persistent or nonpersistent database instance.  T=
he=20
nonpersistent ones were going to be removed before refreshing the data on t=
he=20
main database source.  There is another script that recreates all the=20
developer instances after the update is complete.

Shaun

--nextPart6825821.mJV3jB75yC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHIRZH/zJrlJgPNdURAssbAJ4qPM92ZvxpToa3FEYLzw9vMRDhcQCgv+FC
xcfQbhQ17p9/swx/DCATjTc=
=Z8sS
-----END PGP SIGNATURE-----

--nextPart6825821.mJV3jB75yC--
