Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j57EGjO15877
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2005 10:16:45 -0400
Received: from clown.omnifarious.org (dsl254-016-017.sea1.dsl.speakeasy.net
	[216.254.16.17])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j57EGX59020269
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2005 10:16:36 -0400
Received: from bats.omnifarious.org (unknown
	[IPv6:2002:d8fe:1010:1:2e0:81ff:fe2c:b6e2])
	by clown.omnifarious.org (Postfix) with ESMTP id 08E404BDDE
	for <linux-lvm@redhat.com>; Tue,  7 Jun 2005 07:16:26 -0700 (PDT)
Subject: Re: [linux-lvm] grub and lvm
From: "Eric M. Hopper" <hopper@omnifarious.org>
In-Reply-To: <1118076618.4482.7.camel@rich>
References: <1118074394.4482.2.camel@rich>  <42A47B70.4060000@berbee.com>
	<1118076618.4482.7.camel@rich>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-ctYYyXac0zLDQw1MCjvz"
Date: Tue, 07 Jun 2005 07:16:05 -0700
Message-Id: <1118153765.15335.13.camel@bats.omnifarious.org>
Mime-Version: 1.0
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


--=-ctYYyXac0zLDQw1MCjvz
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2005-06-06 at 09:50 -0700, rich turner wrote:
> using a partition works fine. but i am trying to understand why i can't
> write my grub bootloader to a disk that is being used as a physical
> volume. is grub and lvm using the same part of the disk for its own use?

Yes.  Grub uses the same sectors as are used by the partition table.
So, even if this 'limitation' were removed, you wouldn't get even one
sector of extra space.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--=-ctYYyXac0zLDQw1MCjvz
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP MESSAGE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCpawljtsvlOwvazYRAg0oAJ9jdGYTSI3IXLSy9qdaGSJZhRrr6QCgjDuJ
6PXmQarHNeD7MChQ9akP6KE=
=k84e
-----END PGP MESSAGE-----

--=-ctYYyXac0zLDQw1MCjvz--
