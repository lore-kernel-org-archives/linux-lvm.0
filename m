Return-Path: <chewie@wookimus.net>
Date: Wed, 31 Jan 2001 22:25:37 -0600
From: ^chewie <chewie@wookimus.net>
Subject: Re: [linux-lvm] Maximum # of PEs Per PV
Message-ID: <20010131222537.B24922@wookimus.net>
References: <Pine.LNX.4.21.0101311816020.13129-100000@miami.datech2.er.heitec.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0101311816020.13129-100000@miami.datech2.er.heitec.net>; from Holger.Rauch@heitec.de on Wed, Jan 31, 2001 at 06:30:37PM +0100
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

--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2001 at 06:30:37PM +0100, Holger Rauch wrote:
> Hi!
>=20
> A friend of mine installed three 80G disks in order to create a 240G LV
> for his file server. The machine had a 2.4.1 kernel and LVM 0.9.1beta3
> installed.
>=20
> In order to create the LV, I first created primary partition of type 8e,=
=20
> then the PVs using pvcreate:=20

Why didn't you just use the whole disk partitionless?  Zero out the
first 512b and do a pvcreate on /dev/hdf, /dev/hdg, /dev/hdh.

    bash# for i in f g h; do \
    > dd if=3D/dev/zero of=3D/dev/hd$i bs=3D512 count=3D1\
    > done
    bash# pvcreate -v -y /dev/hdf /dev/hdg /dev/hdh
    bash# vgcreate -v -Ay vg01 /dev/hdf /dev/hdg /dev/hdh


--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Key fingerprint =3D B4AB D627 9CBD 687E 7A31  1950 0CC7 0B18 206C 5AFD


--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6eOVBDMcLGCBsWv0RAl46AKChAk3ymzGVQwH149t0bjMKDq5zmQCgtOWt
6k6XGW6dH4x7eSIWKt+raA8=
=vatq
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
