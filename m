From: Wiktor Wodecki <wodecki@gmx.de>
Message-ID: <20030626201310.GA1042@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
Subject: [linux-lvm] ioctl interface mismatch
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Jun 27 08:34:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I am running 2.5.72 and use device-mapper to manage two vg's with
several lv's. However at boot-time I see the following message:

device-mapper: ioctl interface mismatch: kernel(1.0.6), user(3.0.0),
cmd(0)

1.0.6 could be an lvm release, however, I have lvm2 metadata and not
lvm1. My system runs debian testing with the lvm2 utilities installed
(1.95.15-1). I run x86.

Any help would be appreciated.

--=20
Regards,

Wiktor Wodecki

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE++1PW6SNaNRgsl4MRAi6GAJ0YRhGcoERuVJuRERh26RkLUntw0QCfdS/s
NyBOMm17lc63AVxK6K3n6oI=
=uNib
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
