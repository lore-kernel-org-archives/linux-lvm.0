Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB73Gdr19869
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 22:16:39 -0500
Received: from monster.omnifarious.org (dsl231-056-101.sea1.dsl.speakeasy.net
	[216.231.56.101])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iB73GXU6002968
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 22:16:38 -0500
Subject: Re: [linux-lvm] pvmove on the same PV
From: "Eric M. Hopper" <hopper@omnifarious.org>
In-Reply-To: <1102387034.5390.13.camel@cain>
References: <1102387034.5390.13.camel@cain>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-nHzpk2HWzJrfDUmyTZS1"
Date: Mon, 06 Dec 2004 19:16:27 -0800
Message-Id: <1102389387.4075.19.camel@monster.omnifarious.org>
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


--=-nHzpk2HWzJrfDUmyTZS1
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-12-06 at 20:37 -0600, Aran Cox wrote:
> In any case, I was updating it for LVM2 today and it seems that pvmove
> refuses to move an extent from one position on a PV to another position
> on the same PV.  I guess I can work around this but it means lots of
> wasted moves.  Also, I'd be happy to share this tool if anyone's
> remotely interested, once I've updated it for LVM2.

I've been thinking of writing something similar for awhile.  It would be
a nice thing to have.

--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--=-nHzpk2HWzJrfDUmyTZS1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP MESSAGE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBtSCLjtsvlOwvazYRAuXLAJkBYUm7Yafanmr7CTh1t+dUcUGQvACgofhZ
RRybKE1LxpQlxEUvHP36yo8=
=iw/H
-----END PGP MESSAGE-----

--=-nHzpk2HWzJrfDUmyTZS1--
