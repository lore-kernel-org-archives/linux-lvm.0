Message-ID: <1332243623.11468.19.camel@sauron.fi.intel.com>
From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Tue, 20 Mar 2012 13:40:23 +0200
In-Reply-To: <1332008213-3940-1-git-send-email-maximlevitsky@gmail.com>
References: <20120317175827.GB12111@agk-dp.fab.redhat.com>
	<1332008213-3940-1-git-send-email-maximlevitsky@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-6pA44/MnfWm3zzwvUcNT"
Mime-Version: 1.0
Subject: Re: [linux-lvm] [PATCH] mtd: sm_ftl: fix typo in major number.
Reply-To: dedekind1@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, linux-mtd@lists.infradead.org, John Mesmon <jmesmon@gmail.com>, G Kergon <agk@redhat.com>, Alasdair


--=-6pA44/MnfWm3zzwvUcNT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-03-17 at 20:16 +0200, Maxim Levitsky wrote:
> major =3D=3D 0 allocates dynamic major, not major =3D=3D -1
>=20
> Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-6pA44/MnfWm3zzwvUcNT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPaGynAAoJECmIfjd9wqK00FAP/juIp4P3D/5IvGfwfIyfBKT1
8zAmEcsrPRnwsy7F2gKFEC5ijGlZOvo37RUOD0yuIsFgBg62QzPKT1lZu7XoiYre
Kaeeyj0HN7kMYxrM4FSleSG67HkIKYKLKkJMYeZYJnS3kSZPaOP16kNJz6qmfcwp
cRbDYmqxj0Qj6JppV/p0bnjYt8XpqUZE8jmKjy9SU8uoDX3CSzktxMQeIwFUJVrQ
LAjtWwNGIKnZbK9qaLe7Dxs07+O1fRBkUuj+h/n/0tPSRT3Y/n6JsIqJEaSMixtL
VO6lGsigVfbdfj8EpmAeO6eloRpq6n1/c1j1wjJ14y5ILUSULQdTmC/Lrf2F4sie
u0UAhXtwa9EGyAOt5pM6bHOE3XAaWW9tbXY+0157QVx0RVXOgSPRKHAPUiI/MlGJ
nbg6vOPrAzzf7ZKzbtV7a20gEKglz+c6Kg7qgAYFL/QAVLagmiVzxD+N8AfOCS/Y
8Hk0urWh/zhmMfLwUCoLNdoxOL49V2xA+MMIz+baK5SY3FoaDKhkwzqlNhVjF127
zul2hYUwUXZpx0poMKyUDV7qwUKDNDq8mDlHO8mNtpJz9VzXWi3aeqvBZP+Vkas9
CekO6i4MBpornDVMHDQikSLmxzeVH3syRDommEa2LTJp0viURJFojaXrkYbG9ka5
D9bF1zOYnNEWEUFAdB3G
=PvXW
-----END PGP SIGNATURE-----

--=-6pA44/MnfWm3zzwvUcNT--
