Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m542vaw7005920
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 22:57:36 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m542vNA7009902
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 22:57:23 -0400
Received: from linux.interlinx.bc.ca (unknown [67.193.220.102])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id E2E432803
	for <linux-lvm@redhat.com>; Tue,  3 Jun 2008 22:57:22 -0400 (EDT)
Received: from [10.75.22.1] (pc.ilinx [10.75.22.1])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id EB3118710
	for <linux-lvm@redhat.com>; Tue,  3 Jun 2008 22:57:20 -0400 (EDT)
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of
	snapshot merging
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <87f94c370806031720ybdc557ax303c03fb8f4e56ff@mail.gmail.com>
References: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
	<1212525819.19122.16.camel@behemoth.csg.stercomm.com>
	<1212536286.29076.202.camel@pc.ilinx>
	<1212537926.2724.16.camel@behemoth.csg.stercomm.com>
	<87f94c370806031720ybdc557ax303c03fb8f4e56ff@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-1G7MFeoKXiYltkPkWtXU"
Date: Tue, 03 Jun 2008 22:57:20 -0400
Message-Id: <1212548240.29076.215.camel@pc.ilinx>
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


--=-1G7MFeoKXiYltkPkWtXU
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-06-03 at 20:20 -0400, Greg Freemyer wrote:
> Your making it too complicated.
>=20
> Effectively the snapshot immediately becomes the primary volume

How can that be done?  I thought the snapshot was simply a device which
upon creation (i.e. before any writes to the origin) is just a series of
block-by-block pointers to the origin.  As blocks in the origin are
changed, those blocks are copied down to the snapshot are replace the
pointer to itself.

So in the case where the origin has had 50% of it's blocks updated, in
order for the snapshot to become the origin, that 50% which has been
written down in to the snapshot need to be written back up into the
origin (along with any blocks which were changed in the snapshot
directly).  How can the snapshot "immediately" become the primary volume
if that data migration has to happen?

b.


--=-1G7MFeoKXiYltkPkWtXU
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIRgSQl3EQlGLyuXARAnvkAJ9GQE/POeczLAIUlb6ugX99x+q5NQCeLss7
+lqeT5hYhE4JWi0iWvySNUA=
=Rj6n
-----END PGP SIGNATURE-----

--=-1G7MFeoKXiYltkPkWtXU--
