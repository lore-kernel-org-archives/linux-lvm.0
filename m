Return-Path: <allanwind@mediaone.net>
Date: Wed, 18 Jul 2001 23:17:29 -0400
Message-ID: <20010718231729.A791@digit-safe.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
From: Allan M. Wind <allanwind@mediaone.net>
Subject: [linux-lvm] I/O error: dev 08:11, sector 0
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

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Installed linux 2.4.6 + lvm 0.9.1beta7 with the kernel piece build
as a module (patched lvm and the kernel, got the user tools from
the .deb package of the right version).

# pvcreate /dev/sdb
# vgcreate -s16 vg1 /dev/scsi/host0/bus0/target9/lun0/disc
  (apparently, devfsd confuses lvcreate)
# lvcreate -L5g -nusr vg1
# mkfs -m0 /dev/vg1/usr
# lvcreate -L5g -nvar vg1
# mkfs -m0 /dev/vg1/var
# lvcreate -L24.03g -nhome vg1
# mkfs -m0 /dev/vg1/home

Updated /etc/fstab and:

# mount -a

Migrate data over, rebooted the box which does a:

# vgchange -a n

grub failed on me as the staging files were on lvm lv's
(that is probably a bug as one should be able to boot without
/usr), so booted off floppy.

Found that I had overlooked the check in /etc/init.d/lvm which
fails unless lvm was compiled in (yes, it was docmented but it
should probably be a tad smarter ;-) ).

# modprobe lvm-mod

(I might have had to do a vgscan & vgchange -a y)

# mount -a

so here is where I was looking for help... I get an I/O error
but things come up:

# vgck -v
vgck -- locking logical volume manager
vgck -- finding all volume group(s)
vgck -- checking volume group name "vg1"
vgck -- checking existence of volume group "vg1"
vgck -- reading volume group data for "vg1" from lvmtab
vgck -- checking volume group consistency  of "vg1" in lvmtab
vgck -- VGDA of "vg1" in lvmtab is consistent
vgck -- reading volume group data for "vg1" from physical volume(s)
 I/O error: dev 08:11, sector 0
vgck -- checking volume group consistency  of "vg1" on physical volume
vgck -- VGDA of "vg1" on physical volume is consistent
vgck -- unlocking logical volume manager

Is this a problem and how do I fix it?  This problem did not exist
before I rebooted.

Thanks in advance,


/Allan
--=20
Allan M. Wind			email: allanwind@mediaone.net
P.O. Box 2022			finger: awind@digit-safe.dyndns.org (GPG/PGP)
Woburn, MA 01888-0022
USA

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7VlFDerJrYp1ydncRAmfIAJwI0Rlh0Xmu9HCgf7T64alNOWEIWQCdE1wV
J98/vZdV+3gdFJ7aqi6eB+s=
=uziY
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
