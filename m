From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] FW: ataraid problem
Message-ID: <20011105132719.B815@dragon.blacknet.de>
References: <20011105124433.A25542@sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline
In-Reply-To: <20011105124433.A25542@sistina.com>; from mauelshagen@sistina.com on Mon, Nov 05, 2001 at 12:44:33PM +0100
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
Date: Mon Nov  5 06:26:03 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Email: k.hall@servicepower.com
>=20
>  Trying to get the /dev/ataraid devices to work but not having much luck.
> Have tried adding LVM_DIR_PREFIX "ataraid" to lvm_dir_cache but no luck -
> pvcreate /dev/ataraid/d0p7 just returns with invalid physical volume name.
Just a poke in the dark, but should'nt you add it to

device_names[] in LVM/tools/lib/lvm_check_partitioned_device.c

--=20
Goetz Bock                                              IT Consultant
Dipl.-Inf. Univ.

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE75oWnf5srOMkjkQoRAkcAAKDpIP02c/t1TDJxW+Wi1dHV349lgwCfdh7D
R+WGURftMedmFiJ+ATir8zA=
=IzyR
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
