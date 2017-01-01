Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v01GkGkN008707
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 1 Jan 2017 11:46:16 -0500
Received: from mail.reox.at (mail.reox.at [88.198.22.87])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0A088123E
	for <linux-lvm@redhat.com>; Sun,  1 Jan 2017 16:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.reox.at (Postfix) with ESMTP id DE9C958CDEA
	for <linux-lvm@redhat.com>; Sun,  1 Jan 2017 17:46:10 +0100 (CET)
Received: from mail.reox.at ([127.0.0.1])
	by localhost (mail.reox.at [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6L76y0AZaVka for <linux-lvm@redhat.com>;
	Sun,  1 Jan 2017 17:46:10 +0100 (CET)
Received: from [172.16.23.77] (194-166-97-186.adsl.highway.telekom.at
	[194.166.97.186])
	by mail.reox.at (Postfix) with ESMTPSA id D269E58CD25
	for <linux-lvm@redhat.com>; Sun,  1 Jan 2017 17:46:09 +0100 (CET)
References: <20170101141514.jnazw5dd4kfpcip4@cebalrai>
From: Sebastian Bachmann <me@free-minds.net>
Message-ID: <db547e6d-c328-561c-b4d0-de848dc2e1fa@free-minds.net>
Date: Sun, 1 Jan 2017 17:45:54 +0100
MIME-Version: 1.0
In-Reply-To: <20170101141514.jnazw5dd4kfpcip4@cebalrai>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="O5PmcCDkx5VRXf1EGDbTSWldnBDQsjVCu"
Subject: Re: [linux-lvm] Change stripe cache for lvm raid5
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--O5PmcCDkx5VRXf1EGDbTSWldnBDQsjVCu
Content-Type: multipart/mixed; boundary="gVNC0d52RQoNs6Ec8bQb9XdBHFmLSvbpU";
	protected-headers="v1"
From: Sebastian Bachmann <me@free-minds.net>
To: linux-lvm@redhat.com
Message-ID: <db547e6d-c328-561c-b4d0-de848dc2e1fa@free-minds.net>
Subject: Re: [linux-lvm] Change stripe cache for lvm raid5
References: <20170101141514.jnazw5dd4kfpcip4@cebalrai>
In-Reply-To: <20170101141514.jnazw5dd4kfpcip4@cebalrai>

--gVNC0d52RQoNs6Ec8bQb9XdBHFmLSvbpU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi!

Just a sidenote: I tried to set the stripe_cache option via dmsetup
reload in a debian jessie VM. With the 3.16 kernel, it crashed with a
null pointer dereference error in raid5_set_cache_size function.
I upgraded to a newer kernel version (4.8.11) and tried it again,
the cache size can be set there using reload:

Jan  1 15:44:56 jessie kernel: [   33.913336] device-mapper: raid: 16384
stripe cache entries


I then upgraded the kernel on my machine with the RAID5 and found out,
that even without any cache settings, the RAID is now two to four times
faster in writing than before. I now get around 80-100MB/s.
It seems that there were a lot of changes between 3.16 and 4.8 regarding
speed, not only fixing this crash.

I tried now setting the stripe cache size on the RAID5 but the speed
does not get higher though...
According to the numerous reports on the internet, the impact on write
performance should be great - so it would still be interesting if the
stripe_cache is actually set correctly when using dmsetup reload (if I
run dmsetup table again, i still see the old line) and if it somehow can
be set persistently with LVM.

regards
sebastian

On 01/01/2017 03:15 PM, Sebastian Bachmann wrote:
> Hi!
> I'm using a LVM RAID5 on a machine but the write performance is pretty =
poor
> (about 20-30MB/s),
> where the read performance is quite good (about 280MB/s).
> I read about the stripe_cache_size for md raid and as far as I understa=
nd LVM
> raid, it uses md as well.
> In the design document for lvm2-raid
> (https://git.fedorahosted.org/cgit/lvm2.git/tree/doc/lvm2-raid.txt) I c=
an find
> that a option --stripecache is specified there, but as it seems those o=
ptions
> were never implemented.
>=20
> Is it possible to set the stripe cache size somewhere else? It seems to=
 me that
> lvm2 uses dmsetup to create the raid, where a stripe cache can be set w=
hile
> creation. But it seems to me there is no interface to change such value=
s
> later on?
>=20
> Thanks in advance!
>=20
> regards
> Sebastian
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20


--gVNC0d52RQoNs6Ec8bQb9XdBHFmLSvbpU--

--O5PmcCDkx5VRXf1EGDbTSWldnBDQsjVCu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJGBAEBCAAwFiEEZFa7XEAmJF3nZlHUb9vYxvk7X4sFAlhpMlESHG1lQGZyZWUt
bWluZHMubmV0AAoJEG/b2Mb5O1+LJfcP/jJ8qJ5J2GIzFMq3tN40HoBbFtII3jHe
/QuiFah2N3uKPc6Q68qZ2G4zrOdwr+SpY+ct9y0sUkdkn8NJUDoB1gU4MfBGFSvJ
hvgah91lbigmwSxnoLD+P83wLkDOtBEwrR/pltWqYVkljpLvg/yHM0UVCejVIXqp
MOhCJruF2u8Dp2PpVMm4mUCEkLvpZzslNOCBPCaZ3udnd36+Y6D0AXNrctPEQQBf
cvGGQh+Am6CJtUJL5i0wRtFt10vUaV04Tzewa1TwOEptOFIyrMp79NIwgEwBUGQe
8YyUuuk7atidTzNPrPCwau/SkmPAIDNdoiF1RWZ5TFyjAxbYwO58z9hYe+ppbCcp
0mAOQ5vq/4jKaM842Z1mEx0eDync7VdBGX+iMx37u9zc/9srlZXonwIh8OjmjT9a
miSdRtY0frc6bAgCXo/Q6Ee6HCTpa3/sMZkbU2n6R+QGYTiE/zXrvfioJULyA4XO
aIdCM9BtWqWBIsuNwopzGQaOMQUSOGtYfUkQ1Q/LE2aXu34/sBFL0RSpBTkYt6tA
F6TCj54gDRu138i5aH+ftCqp42GvnOIjHF7Hwjpbb6m1I3VKRltZwjg+5xJvE5JZ
12F+TIvBUN5Hh1Sk+KrVBQKJHwZSTqlzPWNe8BbXE1+4uuACz4GQlBSDMiVbG5Ep
J/m48XqHxnHq
=p2yN
-----END PGP SIGNATURE-----

--O5PmcCDkx5VRXf1EGDbTSWldnBDQsjVCu--
