Return-Path: <bg@blacknet.de>
Date: Wed, 2 May 2001 17:21:02 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Root LVM + ReiserFS
Message-ID: <20010502172102.A9707@dragon.blacknet.de>
References: <000501c0d319$453cceb0$01a8a8c0@jeckel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <000501c0d319$453cceb0$01a8a8c0@jeckel>; from cottin@free.fr on Wed, May 02, 2001 at 05:05:05PM +0200
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Wed, May 02 '01 at 17:05, Lionel Cottin wrote:
> But when i try to boot on a LVM root device with a reiserFS filesystem, i
> have an error like:
> VFS unable to mount device xx:xx
>=20
> And the system hangs up...
>=20
> Here is my lilo.conf:
>=20
> boot=3D/dev/sda
> map=3D/boot/map
> install=3D/boot/boot.b
> prompt
> timeout=3D50
> message=3D/boot/message
> default=3Dcustom
          ^^^^^^
> image=3D/boot/vmlinuz-2.4.2-2
>         label=3Dlinux
>         initrd=3D/boot/initrd-2.4.2-2.img
>         read-only
>         root=3D/dev/sda6
>=20
> image=3D/boot/custom
>         label=3Dcustom
                ^^^^^^
>         read-only
>         root=3D/dev/sda6
>=20
> image=3D/boot/custom
>         label=3Dcustom2
                ^^^^^^^
>         append =3D "ramdisk_size=3D8192"
>         initrd=3D/boot/initrd-lvm-2.4.4.gz
>         read-only
>         root=3D/dev/rootVG/rootVOL
It should work (it works for me)
but my be you wanted to have custom2 as default (you need the initrd to
activate the LVM)

Cu,
    Goetz.

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE68CXdf5srOMkjkQoRAnuyAKCa9CIyySD5Igo5jslNoKVaU5J+SwCg3K/j
EaMsBvLqXgLfU34mecYOV54=
=fKpZ
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
