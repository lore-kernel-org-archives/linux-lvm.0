Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GLeXEp002571
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 17:40:34 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8GLeMtU026365
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 17:40:22 -0400
Received: from linux.interlinx.bc.ca (d67-193-217-194.home3.cgocable.net
	[67.193.217.194])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id B08582806
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 17:40:21 -0400 (EDT)
Received: from [IPv6:2001:4978:161:0:218:f3ff:fee1:65cc] (pc.interlinx.bc.ca
	[IPv6:2001:4978:161:0:218:f3ff:fee1:65cc])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 74B4D8762
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 17:40:20 -0400 (EDT)
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <1253128546.3243.13.camel@delo.gdit>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916170533.62999698@fixlaptop.gillibert.homelinux.net>
	<1253119669.5326.32.camel@delo.gdit>
	<1253120322.16343.71.camel@pc.interlinx.bc.ca>
	<1253128546.3243.13.camel@delo.gdit>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-n85tY8HRV3yv6SsRhf+n"
Date: Wed, 16 Sep 2009 15:49:41 -0400
Message-Id: <1253130581.16343.258.camel@pc.interlinx.bc.ca>
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


--=-n85tY8HRV3yv6SsRhf+n
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2009-09-16 at 21:15 +0200, Ambrogio De Lorenzo wrote:
>=20
> Imagine that upgrade change something in LVM configuration or in lvm
> software.

Well, that is most certainly a corner case.  LVM/device-mapper is very
stable and never caused me a problem of this nature.

> Snapshots are good only if you have the original data and all the
> modified data.

Of course.  You have to have LVM in order for snapshots to work.

> I know very well how snapshot works. And it's for this reason that I
> don't think it's a good choise for my scope

So why not take this opportunity to learn something new?  I love
opportunities like that.

> Yes, but LVM is already configured for this reason.
> Mdadm isn't. I tried to test it but I'm not able to obtain a mirror of
> an already partitioned and used disk.

So (to beat a dead horse) use a snapshot then.

b.


--=-n85tY8HRV3yv6SsRhf+n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkqxQVUACgkQl3EQlGLyuXCFVQCfZjWFosSKxSKIxkS2MzTTvcyG
IzQAoL6b8S1Tzv7uyT2aVJG2Q4q5FJ7w
=2kEq
-----END PGP SIGNATURE-----

--=-n85tY8HRV3yv6SsRhf+n--
