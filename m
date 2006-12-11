Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBBI9ADG005681
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 13:09:11 -0500
Received: from malcolm.theunixman.com (malcolm.theunixman.com [72.37.173.55])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBBI9ANi002394
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 13:09:10 -0500
Date: Mon, 11 Dec 2006 18:09:00 +0000
From: Evan Cofsky <evan@theunixman.com>
Subject: Re: [linux-lvm] EXT3-fs: unable to read superblock
Message-ID: <20061211180859.GN31405@valinor.arda.theunixman.com>
References: <457D8863.1020801@virtua.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline
In-Reply-To: <457D8863.1020801@virtua.ch>
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
To: Jean Chiappini <Jean.Chiappini@virtua.ch>
Cc: linux-lvm@redhat.com


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12/11 17:33, Jean Chiappini wrote:
> Hello all,
>=20
> I have a server production with centos 4 with kernel 2.6.9-42 and=20
> lvm2-2.02.06 installed. All was working find, but today the server=20
> crashed. When I would reboot my server, I saw in the log that the lvm=20
> partiton wouldn't mount. This is the error -> kernel: EXT3-fs: unable to=
=20
> read superblock.

I had this problem recently with a few systems.  Try booting to
single-user mode, and then do the following command:

tune2fs -j DEVICE-FILE-WITH-PROBLEM

This will create a new journal on the filesystem.  I haven't tracked
down why the journal disappears yet, but it seems to, and then the
system (of course) won't mount it as ext3.

--=20
Evan Cofsky, The Architect <evan@theunixman.com>
http://www.theunixman.com/

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQFFfZ67iAc6lyz1ltMRAo6DAKCxDZYmdj3zVtRvRr7NvTtiqXeK1ACeJ0JK
yaki2UnPFXqqd7nkMW+q10k=
=Qy5V
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
