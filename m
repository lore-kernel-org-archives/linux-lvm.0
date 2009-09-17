Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8HNmL10022373
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 19:48:21 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8HNmAeu012729
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 19:48:10 -0400
Received: from linux.interlinx.bc.ca (d67-193-217-194.home3.cgocable.net
	[67.193.217.194])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id 4D8FF2806
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 19:48:09 -0400 (EDT)
Received: from [IPv6:2001:4978:161:0:218:f3ff:fee1:65cc] (pc.interlinx.bc.ca
	[IPv6:2001:4978:161:0:218:f3ff:fee1:65cc])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 1A7968721
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 19:48:08 -0400 (EDT)
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <Pine.LNX.4.64.0909171844470.9058@bmsred.bmsi.com>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916181947.GB15438@us.ibm.com> <1253127828.3243.1.camel@delo.gdit>
	<1253181956.30299.25.camel@breeves.fab.redhat.com>
	<Pine.LNX.4.64.0909171044250.6368@bmsred.bmsi.com>
	<1253201655.2339.178.camel@pc.interlinx.bc.ca>
	<Pine.LNX.4.64.0909171844470.9058@bmsred.bmsi.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-dRuiLHAKp1qWZj/RQKqP"
Date: Thu, 17 Sep 2009 19:48:07 -0400
Message-Id: <1253231287.2339.754.camel@pc.interlinx.bc.ca>
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


--=-dRuiLHAKp1qWZj/RQKqP
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2009-09-17 at 18:49 -0400, Stuart D. Gathman wrote:
>=20
> 1) Eventually you still need to copy the snapshot to a normal LV to get=20
> your performance back

Will you?  When you are using the snapshot instead of the origin, you
are writing to the COW already, not writing to the origin which requires
a COW copy-out.

> 2) (minor, but important) Another FAQ is "exactly how big do I need to ma=
ke my
> snapshot so that it is guaranteed never to overflow".

Heh.  Yeah.

b.


--=-dRuiLHAKp1qWZj/RQKqP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkqyyrcACgkQl3EQlGLyuXAKBwCeMhVpPoGqsUybqP8glmYH13EV
i8oAn2xd37u+p16cAiaXKNaG7d0NVSPA
=OHVY
-----END PGP SIGNATURE-----

--=-dRuiLHAKp1qWZj/RQKqP--
