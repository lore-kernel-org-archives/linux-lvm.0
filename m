From: "Chad C. Walstrom" <chewie@wookimus.net>
Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
Message-Id: <20020207220832.GA4116@wookimus.net>
References: <wxx3d0d2czp.fsf@nommo.uio.no>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
In-Reply-To: <wxx3d0d2czp.fsf@nommo.uio.no>
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
Date: Thu Feb  7 16:10:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2002 at 10:33:46PM +0100, Terje Kvernes wrote:
>   fdisk is only able to address 128GiB, that's rather obvious.  if I
>   make one partition,=20

Why make a partition at all?  Why not just make a physical volume out of
the whole disk?

NAME
       pvcreate - initialize a disk or partition for use by LVM

SYNOPSIS
       pvcreate  [-d|--debug] [-f[f]|--force [--force]] [-y|--yes] [-h|--he=
lp]
       [-v|--verbose] [-V|--version] PhysicalVolume [PhysicalVolume...]

DESCRIPTION
       pvcreate initializes PhysicalVolume for later use by the Logical Vol=
ume
       Manager  (LVM).   Each  PhysicalVolume  can  be a disk partition, wh=
ole
       disk, meta device, or loopback file.  For DOS disk partitions, the p=
ar=AD
       tition  id  must be set to 0x8e using fdisk(8), cfdisk(8), or a equi=
va=AD
       lent.  For whole disk devices only the partition table must be  eras=
ed,
       which will effectively destroy all data on that disk.  This can be d=
one
       by zeroing the first sector with:

       dd if=3D/dev/zero of=3DPhysicalVolume bs=3D512 count=3D1

       Continue with vgcreate(8) to create a new volume group on  PhysicalV=
ol=AD
       ume,  or vgextend(8) to add PhysicalVolume to an existing volume gro=
up.

--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Get my public key, ICQ#, etc. $(mailx -s 'get info' chewie@wookimus.net)

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8YvrgDMcLGCBsWv0RAncZAJ9fPwWiARodVV1zXxTT0DkaAFBaBgCfZnOq
E0Cce/2D6Dpk+QpPbKUh/Zw=
=/9v7
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
