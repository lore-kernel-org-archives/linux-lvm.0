Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7SK54eA016644
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2006 16:05:04 -0400
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7SK52AO010482
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2006 16:05:03 -0400
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1GHnLs-0002WN-PB
	for linux-lvm@redhat.com; Mon, 28 Aug 2006 20:04:57 +0000
Date: Mon, 28 Aug 2006 20:04:56 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20060828200456.GT1011@strugglers.net>
References: <20060827044208.GL1011@strugglers.net>
	<7.0.1.0.2.20060827131640.00fdf818@myrealbox.com>
	<20060827061642.GN1011@strugglers.net>
	<44F1872D.9030408@mattgillen.net>
	<20060828194843.GS1011@strugglers.net>
	<20060828195146.GD16612@dragonhold.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GtVpEJTTDgYGi2Si"
Content-Disposition: inline
In-Reply-To: <20060828195146.GD16612@dragonhold.org>
Subject: Re: [linux-lvm] Best way to image devices in an LVM environment
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


--GtVpEJTTDgYGi2Si
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2006 at 08:51:46PM +0100, Graham Wood wrote:
> On Mon, Aug 28, 2006 at 07:48:43PM +0000, Andy Smith wrote:
> > that lvm2 has had pvresize since 2.02.00 so if I upgrade userland
> > tools (my kernel is 2.6.16.19) then would I just need to do a
> > pvresize after expanding the block device that my single pv/vg is
> > on?
> Would it not be easier to just replace with a larger disk - mirror to the=
 same size, and=20
> have another partition afterwards.
>=20
> You end up with 2pvs (both mirrored, I would expect), rather than the "ni=
cer" answer of a=20
> single pv, but as long as the whole thing is then controlled through LVM =
is there really any=20
> loss as a result?

Hmm yes as you say I think I could just make another partition in
the empty space, RAID-1 that, put a PV on the new MD device and then
vgextend onto it I suppose.  It just seems a litlle messy though to
needlessly have the extra partitions and if I can fix it before the
machine is put in production then I feel like I probably should.

Cheers,
Andy

--GtVpEJTTDgYGi2Si
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFE80xoIJm2TL8VSQsRAq02AJ9+TbUqKpevv02VS8g5cn/xeXO51wCeKqkj
ucbSG02OL7p2XsBKVmPzVqE=
=yW+d
-----END PGP SIGNATURE-----

--GtVpEJTTDgYGi2Si--
