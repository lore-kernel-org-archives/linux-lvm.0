Date: Sun, 26 Aug 2001 19:36:15 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] lvm-1.0.1rc1 cvs snapshot and devfs
Message-ID: <20010826193615.A8841@sistina.com>
References: <87n14o82he.fsf@arm.t19.ds.pwr.wroc.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline
In-Reply-To: <87n14o82he.fsf@arm.t19.ds.pwr.wroc.pl>; from misiek@pld.ORG.PL on Sat, Aug 25, 2001 at 07:37:49PM +0200
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

--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 25, 2001 at 07:37:49PM +0200, Arkadiusz Miskiewicz wrote:
> I'm using 2.4.7/x86 kernel with xfs, devfs and LVM version
> 1.0.1-rc1(17/08/2001). Unfortunately devfs support isn't nice.
>=20
> Simple example (/dev/hdc5 is Linux-LVM partition (8e))
>=20
> [root@arm misiek]# pvcreate /dev/hdc5
> pvcreate -- physical volume "/dev/hdc5" successfully created
>=20
> [root@arm misiek]# vgextend storage /dev/hdc5
> vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
> vgextend -- ERROR: no physical volumes usable to extend volume group "sto=
rage"
>=20
> [root@arm misiek]# ls -l /dev/hdc5
> lr-xr-xr-x    1 root     root           33 sie 25  2001 /dev/hdc5 -> ide/=
host0/bus1/target0/lun0/part5
> [root@arm misiek]# vgextend storage /dev/ide/host0/bus1/target0/lun0/part5
> vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
> vgextend -- doing automatic backup of volume group "storage"
> vgextend -- volume group "storage" successfully extended
>=20
> [root@arm misiek]#=20
>=20
> So LVM tools are working fine with real devfs device names while some
> tools don't work with old non-devfs names (vgextend and other vg*).
>=20
> IMHO simplest solution is inside LVM use real devfs names - always (or
> only when devfs is in kernel and is used/mounted by user) call
> readlink(2) on device specified by user on command line.

First off, this is a known issue that has been discussed a bit on the list
and quite a bit internally between the LVM developers.

As far as using readlink on the device: that's what I thought too, until I
actually looked at the code involved.  It's actually much more complicated
than that due to the way the lvm_dir_cache.c code is being called and used.
Basically, fixing the symlink issue would either involve a complete rewrite
of the LVM library code involved, or a complete rewrite of the tools and the
library code involved, depending upon how you went about it.  This is not a
trivial task.

The experimental branch has the beginnings of the Device Manager which is a
rewrite/redesign of lvm_dir_cache.  This will be used in future versions of
LVM and will enable much more sane discovery and caching of devices than
the current method.

If anyone has patches they'd like to submit to fix this in all the LVM
tools, we'd definitely welcome it, but for the moment the answer is to fully
specify the true devfs paths when using the LVM tools.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
665.9238429876 - Number of the Pentium Beast
-----End Obligatory Humorous Quote------------------------------------------

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7iZX/pE6/iGtdjLERAhzVAJ9aBClznDPCcjUJqo0sEy0Kimwr7wCgme/E
iqTf1jPEdvO7nZkZ0mu+4nU=
=8p6S
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
