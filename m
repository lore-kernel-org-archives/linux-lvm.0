Return-Path: <smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] Converting my Root file system to LVM
Date: Wed, 23 May 2001 01:03:02 -0400
Message-ID: <000001c0e345$a6088a40$7d80a8c0@dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJGEMNIOAA.steve.wray@the.net.nz>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

=20
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

With pvmove-ing an lv, it's actually quite easy... and I've done it
several times with the VG active... here's how:

pvcreate <new-pv>
vgextend <vg> <new-pv>
[make sure <new-pv> has at least as many pe's as <old-pv>]
pvmove <old-pv> <new-pv> (may require a -f or something if the lv's
are open)
vgreduce <vg> <old-pv> (unless you want to keep the old pv for
expansion or something)

viola!  all lv's that were on <old-pv> are now on <new-pv> :)  This
is also how I "defragment" the lv's if it gets too crazy with the
allocation... although you really don't need to do this (i just like
to keep the vgdisplay -v's easier to parse with scripts, etc :) )

- -----Original Message-----
From: linux-lvm-admin@sistina.com
[mailto:linux-lvm-admin@sistina.com]On
Behalf Of Steve Wray
Sent: Wednesday, 23 May 2001 00:02
To: linux-lvm@sistina.com
Subject: RE: [linux-lvm] Converting my Root file system to LVM


> From: linux-lvm-admin@sistina.com
> [mailto:linux-lvm-admin@sistina.com]On Behalf Of Rupert Heesom

> Tnx, Steve for the easy howto of your's below.
> BTW, what on earth is that "mount -o loop" command?

Glad to have helped!
the "-o loop" tells mount to mount the file on the loopback device.
This allows ordinary files (not just block devices) to carry a
filesystem.
Its quite cool!
:)

=20
> Since my LVol is on my 2nd disk, next, I think I'll try extending
> my Lvol back to cover my 1st disk as well.

Just watch out for your /boot parition.
You might want to copy lilo.conf over to the /boot partition
and make /etc/lilo.conf a symlink to it there.

=20
> One more bit of help, if you can? -
>=20
> I want to pvmove the file contents of my 2nd disk (/dev/sdb) to my
> 1st disk (/dev/sda).  My 1st disk is nice & quiet!  Now the
> lvm-howto
> specifies my next step (adding the "old partition" into the Lvol)
> as -- =20

phew... I have no idea about moving things from PV to PV,
however, you may want to look at setting up a miniroot-in-a-ramdisk
for this sort of thing. I suspect you need to have the VGs
deactivated,
and you can't do *that* when its in use as the root LV.

Check out;
http://innominate.org/~graichen/projects/miniroot

miniroot is fantastic, but it needs some work to make it useful
for LVM.
Mainly, just unzip and mount it (like you did for the initrd file
before)
and copy over the lvm programs and libraries.

You'll need to set up a lilo entry too, of course.
I think its well documented.

BTW; I'd *seriously* recommend this for anyone with LVM root.
It can get you out of trouble!


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm


-----BEGIN PGP SIGNATURE-----
Version: PGP 7.0.1

iQA/AwUBOwtEhnC+DNfF0nVpEQLMOwCfazYeopl/VrVdNYDEn7rAnWlYqJEAn0Mj
cZX/Oh9MBo5nxV6GBJlC08pT
=3DLSkE
-----END PGP SIGNATURE-----
