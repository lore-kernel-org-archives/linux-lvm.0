From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] [Q] LVM snapshot volume extendable?
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030113214928.NXIW20432.imf21bis.bellsouth.net@marsha>
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
Date: Mon Jan 13 15:47:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>
Cc: xfs mailing list <linux-xfs@oss.sgi.com>

I agree, their seems to be a bug in LVM.

I am running XFS Version 1.2pre3 based on the 2.4.19 kernel and I cannot extend =
a LV with XFS fs on top.

In particular this works:

>>>
xfs_freeze -f /data                                                  (I don't =
have the patch installed)
lvcreate --snapshot -L 100M --name data_snap /dev/VG/data=20
xfs_freeze -u /data                                                 (I don't =
have the patch installed)
mount -t xfs -o ro,nouuid /dev/VG/data_snap /data_snap
<<<

And this does not.

>>>
xfs_freeze -f /data                                                  (I don't =
have the patch installed)
lvcreate --snapshot -L 100M --name data_snap /dev/VG/data=20
xfs_freeze -u /data                                                 (I don't =
have the patch installed)

lvdisplay /dev/VG/data_snap                                   (verified 0% =
used)
dd if=3D/dev/zero of=3D/data/dummy bs=3D1M count=3D75     (create a 75 Meg =
dummy file)
lvdisplay /dev/VG/data_snap                                   (verified approx =
75% used)
lvextend -L +100M /dev/VG/data_snap         =20
lvdisplay /dev/VG/data_snap                                   (verified approx =
37% used)

#  Everything looks fine, so I try to mount it

mount -t xfs -o ro,nouuid /dev/VG/data_snap /data_snap
mount: wrong fs type, bad option, bad superblock on =
/dev/TruStore-Data/data_snap,
       or too many mounted file systems
<<<


Greg Freemyer
The Norcross Group
