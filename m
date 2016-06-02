Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52LQh2M029114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 2 Jun 2016 17:26:43 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23FD9C00EB3A
	for <linux-lvm@redhat.com>; Thu,  2 Jun 2016 21:26:42 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1b8a6I-0004Sc-Lw
	for linux-lvm@redhat.com; Thu, 02 Jun 2016 23:24:22 +0200
Received: from d67-193-213-211.home3.cgocable.net ([67.193.213.211])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 02 Jun 2016 23:24:22 +0200
Received: from brian by d67-193-213-211.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 02 Jun 2016 23:24:22 +0200
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Thu, 02 Jun 2016 17:18:27 -0400
Message-ID: <1464902307.13773.60.camel@interlinx.bc.ca>
References: <1464692258.30702.376.camel@interlinx.bc.ca>
	<4f3ac280-86a3-a63d-803c-5719bca79d3e@redhat.com>
	<1464821577.13773.9.camel@interlinx.bc.ca>
	<c5664f25-6ee4-9a4f-f2d7-f6e45206de83@gmail.com>
	<1464864575.13773.29.camel@interlinx.bc.ca>
	<6504f4cb-8f17-390a-ec9f-0cc6826b23ec@gmail.com>
	<1464895638.13773.54.camel@interlinx.bc.ca>
	<d9f7a51d-01c1-9761-9963-6dac9152138d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-tBEq8NczH962ghaHUwVz"
In-Reply-To: <d9f7a51d-01c1-9761-9963-6dac9152138d@gmail.com>
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


--=-tBEq8NczH962ghaHUwVz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-06-02 at 21:32 +0200, Zdenek Kabelac wrote:
>=C2=A0
> When lvm.conf=C2=A0=C2=A0has defined thin_pool_autoextend_threshold <100%=
 the
> pool is=C2=A0
> automatically monitored and resized when threshold is crossed.

Indeed.

> If you spot any 'device-mapper' errors on May 25 in kernel log....

Nothing.=C2=A0=C2=A0Not a single device-mapper message since May 19 and tha=
t was
only:

May 19 17:00:23 laptop kernel: device-mapper: thin: Data device (dm-1) disc=
ard unsupported: Disabling discard passdown.

during a normal boot.

For what it's worth, I have the machine up and running so your help and
advise were spot on.=C2=A0=C2=A0Thanks again so much.

Cheers,
b.
--=-tBEq8NczH962ghaHUwVz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJXUKKkAAoJENrB0DQWy8igDIMIAJN7463FV1gCe6XOuhIoKoKQ
xCKNnF4n47WgT4/u13XmV8xvVo7qgIkngNkJqiQHN4I7DeorpOS5qa15j+8NLL/u
9ug652g0WY2sO1+CdD5zGDYOBqZxP9YlnOSjufPDz7R6wMQWo592a5g+EH9CiWdJ
uiPjR+G9Y09+CPSS0N/JzWz6o2xjUILLLStfEE+tEXA5wY8AKfc4QDBrSZ/tnTlS
vFKVz0NKy6NVOrlocPagbuy+ZJh/EdVFf0/Skxav02GcmxUN6kQoAQqzK6+FytL/
GkE4EhXptuvVrdo02Bc+TBhZJF/aS/WSEHW9q/DHH2H71kHwdyZRvUGs/VCq1wk=
=oK1I
-----END PGP SIGNATURE-----

--=-tBEq8NczH962ghaHUwVz--
