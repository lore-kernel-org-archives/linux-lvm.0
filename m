Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52Ao5Gl021010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 2 Jun 2016 06:50:05 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9459DC00359A
	for <linux-lvm@redhat.com>; Thu,  2 Jun 2016 10:50:02 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1b8QCO-00022B-QC
	for linux-lvm@redhat.com; Thu, 02 Jun 2016 12:50:00 +0200
Received: from d67-193-213-211.home3.cgocable.net ([67.193.213.211])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 02 Jun 2016 12:50:00 +0200
Received: from brian by d67-193-213-211.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 02 Jun 2016 12:50:00 +0200
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Thu, 02 Jun 2016 06:49:35 -0400
Message-ID: <1464864575.13773.29.camel@interlinx.bc.ca>
References: <1464692258.30702.376.camel@interlinx.bc.ca>
	<4f3ac280-86a3-a63d-803c-5719bca79d3e@redhat.com>
	<1464821577.13773.9.camel@interlinx.bc.ca>
	<c5664f25-6ee4-9a4f-f2d7-f6e45206de83@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-wBZnqYPpa+xe0fOUyg0L"
In-Reply-To: <c5664f25-6ee4-9a4f-f2d7-f6e45206de83@gmail.com>
Subject: Re: [linux-lvm] thin: 235:2 pool target (735616 blocks) too small:
 expected 809216
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


--=-wBZnqYPpa+xe0fOUyg0L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-06-02 at 11:11 +0200, Zdenek Kabelac wrote:
> Hi

Hi.

> So it seems your=C2=A0=C2=A0machine has crashed (you probably know better=
)
> during
> thin-pool resize operation.

So, this is actually a family member's machine and he was using it at
the time so I don't know, firsthand what happened.

He says he was just adding some plugin to some (Windows) program in
Wine. =C2=A0Doesn't seem like that should come anywhere near resizing so I
will ask him again.

> Unfortunately fc23 has lvm2 version 2.02.132 - and version 2.02.133
> has=C2=A0
> improvement patch to make the resize more resistent (but still not as
> good as=C2=A0
> I wish to be).

Incremental improvements are improvements all the same. =C2=A0:-)

> So what happened -=C2=A0=C2=A0lvm2 resized _tdata LV - tried to resumed i=
t -
> and
> it has failed along this path - however since the 'resize' is ATM a
> single=C2=A0
> transaction - the lvm2 rollback reverted to previous size - yet thin-
> pool
> already managed to remembered 'new' bigger size.

Ahhh.

> So please take a look at your logs (if you have some) if there
> is something suspicious to be mentioned (thought if you machined
> has freezed, hardly any log will be available).

I will take a look once I can get the system back up and running.

> To get access to your thin-pool - I'm attaching restored metadata
> content from=C2=A0
> your disk header with 'bigger' _tdata volume.

There was no attachment.

> To restore use:
>=20
> 'vgcfgrestore -f back=C2=A0=C2=A0--force brianr-laptop'

I can do that in Fedora's "rescue" environment? =C2=A0Probably "lvm
vgcfgrestore -f back=C2=A0=C2=A0--force brianr-laptop" instead.

> It would be really interesting to know the reason of failure - but I
> can=C2=A0
> understand you could hardly obtain.

I will see if there is anything in the logs and get back to you. =C2=A0It's
the least I can do in return for the help you have provided. =C2=A0Much
appreciated.

Cheers,
b.

--=-wBZnqYPpa+xe0fOUyg0L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJXUA9AAAoJENrB0DQWy8igAicH/iyxynUkx6gVT/3cECpGDzwX
5RDQ3RvZUG9liDxhXHtIYsSyz2uikqpwSzjL1c0VN4coBKh4wWJu7L5dCalfqAJV
ncnEmg+iI5xlvhQpsqkI+yFVxdIlMwGqeDbTU4KKequUgVJZfySCRFlBuYA00ol7
s4iIdB6EuQqSSWirrgYGhQ3kDTohy53IAKU49HX3/4hueaT095t4qKE1pSRyeKl8
NU1LgTj+BxdDfCjDf7Mr9xOLn87N0H+yU/8u9fkJxkaNvtfW/nU3EbKsFurt0Wzd
nmoWvOoMmNfFjYCPIKnCzUoWfqsor4sfI/jqRpijZDLMKX7CBHJZwcOLp0GozjM=
=ne2l
-----END PGP SIGNATURE-----

--=-wBZnqYPpa+xe0fOUyg0L--
