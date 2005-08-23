Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7NEISV14367
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 10:18:30 -0400
Received: from clown.omnifarious.org (dsl254-016-017.sea1.dsl.speakeasy.net
	[216.254.16.17])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7NEIRMD019481
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 10:18:27 -0400
Received: from bats.omnifarious.org (unknown
	[IPv6:2002:d8fe:1010:1:2e0:81ff:fe2c:b6e2])
	by clown.omnifarious.org (Postfix) with ESMTP id 1994284CCD
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 07:18:16 -0700 (PDT)
Subject: Re: [linux-lvm] Saving files from full failing volume
From: "Eric M. Hopper" <hopper@omnifarious.org>
In-Reply-To: <fa61edfd0508200022235af787@mail.gmail.com>
References: <fa61edfd0508200022235af787@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-ea+pkv60u4neDJvITDl8"
Date: Tue, 23 Aug 2005 07:18:15 -0700
Message-Id: <1124806695.17889.22.camel@bats.omnifarious.org>
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


--=-ea+pkv60u4neDJvITDl8
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2005-08-20 at 17:22 +1000, Chris Jensen wrote:
> (I've read up about LVM and understand I can replace failed
> blocks/disks with /dev/zero, so the shrinking and moving part doesn't
> worry me to much, it's just the identifying of where files live that
> I'm curious about.)

The only way to really identify where files live in LVM is to identify
which filesystem they're on.  Then they might end up being on any random
block of that filesystem.  You can identify which physical extents a
particular filesystem is using easily, but not which physical extents a
particular file is using.

Perhaps someone else can correct me if I'm wrong about this, but as I
understand things this is how it works.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--=-ea+pkv60u4neDJvITDl8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP MESSAGE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBDCzAnjtsvlOwvazYRAps3AJ0dRC+BLl7n8FcyycZKVvfzeFkzGgCeKjBx
v5sEe6c33p3/msPDV+UtnJw=
=U6ql
-----END PGP MESSAGE-----

--=-ea+pkv60u4neDJvITDl8--
