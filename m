Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3MGCo9h014024
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:12:50 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3MGCIuw009393
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:12:18 -0400
Received: from linux.interlinx.bc.ca (d193-45-68.home3.cgocable.net
	[67.193.45.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id 5E2232803
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:12:17 -0400 (EDT)
Received: from [10.75.22.1] (pc.ilinx [10.75.22.1])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 3C6178710
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:12:15 -0400 (EDT)
Subject: Re: [linux-lvm] Snapshot question...
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <chaz20080422104744.GI20413@artesyncp.com>
References: <480DBE54.1090406@Media-Brokers.com>
	<chaz20080422104744.GI20413@artesyncp.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-ArgBJkwCz2OczkfhfGyi"
Date: Tue, 22 Apr 2008 12:12:14 -0400
Message-Id: <1208880734.7871.86.camel@pc.ilinx>
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


--=-ArgBJkwCz2OczkfhfGyi
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-04-22 at 11:47 +0100, Stephane Chazelas wrote:
>=20
> but
> when you write to it, the system makes sure that unless it has
> been done already, the block you're modifying are being copied
> first from the "real" volume to COW volume before being modified
> in the "real" volume.

And to be clear, the COW volumes of _all_ snapshots[1].  This is where
the snapshot scaling problem arises.

Zumastor claim to have solved that with their snapshots.  I'd love to
have time to play with it, indeed.

If Zumastor are here listening, can you answer, are there any plans to
get your snapshots into the main kernel tree?

b.


--=-ArgBJkwCz2OczkfhfGyi
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIDg5el3EQlGLyuXARAmHWAKD1/HYrGA7med6faDQO4TiUJZUNywCgveaQ
qqIlXGPUL4Mgji4NqPpH+vc=
=Qekc
-----END PGP SIGNATURE-----

--=-ArgBJkwCz2OczkfhfGyi--
