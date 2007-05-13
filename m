Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4D1NDQo030179
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:23:14 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4D1NAhm009274
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:23:10 -0400
Received: from linux.interlinx.bc.ca (d38-139-100.home1.cgocable.net
	[72.38.139.100])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id B74352803
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:23:09 -0400 (EDT)
Received: from [10.75.22.1] (pc.ilinx [10.75.22.1])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id E75BD104FDB
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:23:07 -0400 (EDT)
Subject: Re: [linux-lvm] LVM on SATA/PATA disks
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <Pine.LNX.4.44.0705122102150.27083-100000@bmsred.bmsi.com>
References: <Pine.LNX.4.44.0705122102150.27083-100000@bmsred.bmsi.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-0zZIAMd/N63Qlt4RU91C"
Date: Sat, 12 May 2007 21:23:06 -0400
Message-Id: <1179019386.15162.53.camel@pc.ilinx>
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
To: linux-lvm@redhat.com


--=-0zZIAMd/N63Qlt4RU91C
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2007-05-12 at 21:12 -0400, Stuart D. Gathman wrote:
>=20
> The interrupt rate has nothing to do with the type of disk, and a lot to
> do with the controller.  There is a CPU difference between $50=20
> consumer IDE/SATA adapters, and $300 server grade IDE/SATA adapters.
> You'll want the controller to support fast DMA at minimum.

I thought the biggest thing that SCSI had that IDE didn't was SCSI's
ability to shovel an ass-barn-load of data to a disk and the disk would
go deal with it, giving up the SCSI bus so that another disk could be
shovelled another ass-barn-load of data to go and deal with, and so on.

Of course one has to remember it takes much much more time for the disk
to actually write (or read as the case may be) the data to media than it
takes to shovel the data to the disk (which it would cache locally
before writing to actual media) on the bus.

The contrast with IDE (or PATA as I guess the trendy name is), again as
I always thought was that the IDE bus was not available for use while a
disk was still pending a media I/O operation, so that with multiple
devices, you could not leverage the I/O of the IDE bus using multiple
devices, essentially in parallel.  I guess this is where having system
with multiple IDE buses and only putting a single device per bus grew
from.

Of course on a SCSI bus you can put many many disks -- to the capacity
of the bus -- or more, but that would be silly.

How does SATA fit in with all of this?  Is it basically the same
limitations on the bus as IDE/PATA, so that you'd really not want to put
more than 1 device per bus?

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-0zZIAMd/N63Qlt4RU91C
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGRmh5l3EQlGLyuXARAr7SAKCPwxZcFRY2J94HGHIKUurMpYb8hQCfdDx4
IAGTSMbgCqqeLQnXpXgFd5E=
=qNdh
-----END PGP SIGNATURE-----

--=-0zZIAMd/N63Qlt4RU91C--
