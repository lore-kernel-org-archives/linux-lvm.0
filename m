Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v23IsV5A016912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 3 Mar 2017 13:54:31 -0500
Received: from server.interlinx.bc.ca (mail.interlinx.bc.ca [69.165.217.196])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0808980475
	for <linux-lvm@redhat.com>; Fri,  3 Mar 2017 18:54:30 +0000 (UTC)
Received: from pc.interlinx.bc.ca (pc.interlinx.bc.ca
	[IPv6:fd31:aeb1:48df:0:feaa:14ff:fe6c:51ab])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by server.interlinx.bc.ca (Postfix) with ESMTPSA id 2303A21698
	for <linux-lvm@redhat.com>; Fri,  3 Mar 2017 13:46:33 -0500 (EST)
Message-ID: <1488566792.17469.84.camel@interlinx.bc.ca>
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Fri, 03 Mar 2017 13:46:32 -0500
In-Reply-To: <d6e53b4c-25df-28e1-b7c4-f22fec3b2da3@ankh.org>
References: <CAJWdRQgunTFRS7fmHYTDw1MA7bPCQk+1TAD_q1dq4L2qog_rTA@mail.gmail.com>
	<d6e53b4c-25df-28e1-b7c4-f22fec3b2da3@ankh.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5b5QDBnRdaKQq91oloGI"
Mime-Version: 1.0
Subject: Re: [linux-lvm] Changing from standard partition to LVM partition
 without reinstalling
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-5b5QDBnRdaKQq91oloGI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-03-03 at 17:49 +0000, James Hawtin wrote:
> On 03/03/17 09:51, Amjad Syed wrote:
> > Hello,
> >=20
> > We are using=C2=A0=C2=A0RHEL=C2=A0=C2=A07.2 servers to create two node=
=C2=A0=C2=A0Active/Passive=C2=A0
> > =C2=A0High available system with shared storage (SAN). We are using
> > pacemaker.
> >=20
> > The existing=C2=A0=C2=A0Partition on HDD of=C2=A0=C2=A0Server is of sta=
ndard type
> > and=C2=A0=C2=A0we=C2=A0
> > would like to move it to LVM type as we have just two nodes and we
> > are=C2=A0
> > not going to use clvm.
> >=20
> > The current partition on HDD is as follows
> > /=C2=A0=C2=A0=C2=A0->=C2=A0=C2=A050 GB
> > swap -> 25 GB
> > /u01 -> 200GB
> >=20
> > What is the best way to change the partition type to LVM without=C2=A0
> > reinstallation?
> >=20
>=20
> Its possible but its quite difficult

It's not really that difficult, if he understands the mechanics of
partitioning and resizing filesystems.  He does need to have 200GB of
free, unpartitioned space on his HDD to create a new partition to be
his new PV.

Or rather he needs as least as much free space in /u01 as he has
consumed space in which case he can shrink the /u01 filesystem and
partition and create a new partition to be his PV.

> to do as you don't have a seperate=C2=A0
> /boot partion.

The / partition can become his /boot once he has evacuated it and
shrunk it.

As long as there is some usable amount of free space on the disk (in
existing partitions or otherwise) this is all just a shell game of
partitions and data, creating new partitions, resizing or deleting old,
moving data around, etc.

It all has to be done from some kind of live boot media though as you
don't really want to be moving live data around.

And really, I will refrain from describing the exact steps in this
partition partition shell game as (a) I don't want to miss any and mess
up his system and (b) if he cannot really come up with the procedure
himself, he really shouldn't be carrying it out.


> If I=C2=A0
> was doing it I would use tar or dump to copy the information off the=C2=
=A0
> disk.

And yes, if he can't really come up with the recipe to do the partition
shell-game, this is what he should do.

Cheers,
b.

--=-5b5QDBnRdaKQq91oloGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJYuboIAAoJENrB0DQWy8igJ+UH/jru7HHeMVn49ibWwarxyn3O
zt89Lksb1vlC/lm1pkYNpqzzrE3oFin1KwR3EVFzrdI8c1PadIpZ5YiPUuGoM550
FNi5HLpS4ZDLtwRyWvCcZC7FqMOfN0Hb7o1G0jnqUmtu4vvbzRSEDdb9KK74nDlk
dEC6S1HHB+VNkYJtxpIxZ7PJLCiN/PGzSqZSTY4Jxc0MqHqPq4QwOFALneR1a0OR
i6uzXXGSzSiL/PrlRvRJeTWbDquu2vJEFWwqsUN/JpCBORWVS5kPyHYwLjUkwKJy
d1eqW1RkvzQ3CQ2YdLKY7iDHBDWh0CEi3Q9ChDQwkBdgdK0HvJddfhHwTEbzS34=
=3QMc
-----END PGP SIGNATURE-----

--=-5b5QDBnRdaKQq91oloGI--
