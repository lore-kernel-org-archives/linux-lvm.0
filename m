Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0MJsi104617
	for <linux-lvm@redhat.com>; Sun, 22 Jan 2006 14:54:44 -0500
Received: from relay16-159.bu.edu (relay16-159.bu.edu [128.197.159.83])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0MJsTSQ012010
	for <linux-lvm@redhat.com>; Sun, 22 Jan 2006 14:54:31 -0500
Received: from comm700-c0601-dhcp173.bu.edu (comm700-c0601-dhcp173.bu.edu
	[168.122.234.173])
	by relay16-159.bu.edu (8.12.8/8.12.8) with ESMTP id k0MJsC4j015299
	for <linux-lvm@redhat.com>; Sun, 22 Jan 2006 14:54:12 -0500
From: Geoff Mishkin <gmishkin@acs.bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4164349.Q19ZjHZG5U";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200601221454.10959.gmishkin@acs.bu.edu>
Subject: [linux-lvm] missing device nodes for vg, but vg appears in scan
Reply-To: gmishkin@bu.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Date: Sun, 22 Jan 2006 19:54:47 -0000
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--nextPart4164349.Q19ZjHZG5U
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I am using lvm2 2.01.09 on Gentoo Linux.  My kernel version is 2.6.15 and I=
'm=20
using udev 079.  I hope the @redhat.com suffix doesn't mean this is a Red=20
Hat-only list, but if it does I'll gladly take my question elsewhere (I hav=
e=20
not received an answer on the Gentoo forums).

I am trying to set up an LVM2 VG using a loop device.  My problem is that=20
device nodes are never created for my VG.  However, my VG shows up in scans=
=20
(vgscan) and displays (vgdisplay).  Even vgscan --mknodes does not make the=
=20
nodes.  Because I never get a node for my VG, I can't figure out how I am=20
supposed to create LV's in it.

I have the modules loop, dm-mod and dm-snapshot loaded.  Therefore, I do=20
have /dev/mapper/control.  Here is what I have done so far:

 o Create file and set up to use with loop device
# dd if=3D/dev/zero of=3D/local/snapshot bs=3D1M count=3D512
# losetup /dev/loop0 /local/snapshot
 o Set up the PV
# pvcreate /dev/loop0
 o Create the VG
# vgcreate snapshot /dev/loop0

At this point commands like this fail:
# lvcreate -L512 -s -n backup snapshot
  Path required for Logical Volume "snapshot"
  The origin name should include the volume group.
# lvcreate -L512 -s -n backup /dev/snapshot
  "/dev/snapshot": Invalid path for Logical Volume
  The origin name should include the volume group.

I have read in the docs that "vgscan" is run automatically now and that I=20
should expect to see my VG in /dev.  This does not happen so I do the=20
following:

 o Try to activate the VG
# vgchange -a y snapshot
  0 logical volume(s) in volume group "snapshot" now active
 o Try running vgscan manually
# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "snapshot" using metadata type lvm2
# vgscan --mknodes
  Reading all physical volumes.  This may take a while...
  Found volume group "snapshot" using metadata type lvm2
 o No results in /dev, try vgdisplay
# vgdisplay
  --- Volume group ---
  VG Name               snapshot
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               508.00 MB
  PE Size               4.00 MB
  Total PE              127
  Alloc PE / Size       0 / 0
  Free  PE / Size       127 / 508.00 MB
  VG UUID               RG5GM3-WrEZ-PmCM-Fl0A-wjAy-Udqo-xLASVj

It looks like my VG is there, but it still isn't showing up in /dev.  I rea=
d=20
something about how if udev isn't configured properly, you will get devices=
=20
like /dev/dm-# where # is 0-9, instead of named VG nodes.  I don't have tho=
se=20
either, but I follow the instructions which are to uncomment a line in my=20
udev rules:

KERNEL=3D=3D"dm-[0-9]*",    PROGRAM=3D"/sbin/devmap_name %M %m", NAME=3D"%k=
",=20
SYMLINK+=3D"%c"

I learn that devmap_name is included with multipath-tools, so I install tho=
se,=20
version 0.4.6.  I reload my udev rules and repeat the steps above, but ther=
e=20
is no change.  Then I wonder if this has anything to do with the multipath=
=20
target in the kernel configuration for the device mapper.  I enable it,=20
reboot for good measure, and load the multipath module.  I repeat the steps=
=20
above, but there is still no change.

At this point I wonder if udev has some problem outside the scope of my=20
imagination, so I try to see if I can use vgscan to create nodes outside=20
of /dev by editing lvm.conf.  When I run vgscan --mknodes, however, it stil=
l=20
only creates mapper/control.  I guess I shouldn't have really expected that=
=20
to work, but it's still weird.

Please CC me on replies as I am not subscribed to the list.

			--Geoff Mishkin <gmishkin@bu.edu>

--nextPart4164349.Q19ZjHZG5U
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBD0+LiCByDbUAKi3URAmE/AJ9/Tzgic9LnhIz+5DIqaZahd6WW8gCeIXy3
fkD4L4V8WgAz79KNhV7sYc8=
=q1A+
-----END PGP SIGNATURE-----

--nextPart4164349.Q19ZjHZG5U--
