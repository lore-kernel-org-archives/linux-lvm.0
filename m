Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4VMXK026176
	for <linux-lvm@redhat.com>; Mon, 31 May 2004 18:33:20 -0400
Date: Tue, 1 Jun 2004 00:33:09 +0200
From: Michel Wilson <michel@crondor.net>
Message-ID: <20040531223309.GA7657@aeon.hgd.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
Subject: [linux-lvm] LVM2 + pvmove + no warning
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I just tried to move some volume group of mine from one harddisk to
another, using pvmove, just like I did before when using LVM1, only to
discover that pvmove is actually not supported.
The very big problem I have with this is that pvmove did not tell me
*ANYTHING* at all about it not being supported. It happily started
creating a snapshot on the first lv in the vg (being my /home partition
of all things), spewed a boatload of errors about ioctl cmd 9 not being
supported and b0rked out leaving the complete volume group inaccessible.
After a hard reset the volume group did not even mount, and the vg
appeared to be somewhat borked as well. Luckily, I was able to recover
all the data on the volume group.
But, what bugs me very much after this episode: I discovered posts on a
mailing list dated as far back as 11/02 stating that pvmove was 'not yet
implemented' in LVM2. But, why is there not a *SINGLE* warning included
in the pvmove tool about this?? Especially as I do not seem to be the
first one who got caught with this! It seems to me that, at the very
least, a warning should be included. An even better solution would be to
just not enable and/or install pvmove by default, because it isn't even
supported.

Kind regards,

Michel Wilson.

(please cc any replies directly to me, as I'm not subscribed to the
list)
--=20
Michel Wilson     michel@crondor.net
PGP key ID        0xD2CB4B7E

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAu7KlL2ru+9LLS34RAt9WAJ4xpyhYb25paxo1qgNQFD504slr/ACgmAhK
csv5RtErOyKWGMUTiZkmbos=
=S5ZN
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
