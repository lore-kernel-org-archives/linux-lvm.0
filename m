Message-ID: <002701c2bdb8$6cf51b70$c600a8c0@COMPAQ>
From: "Sean Oh" <oh@storageone.co.kr>
References: <20030113214928.NXIW20432.imf21bis.bellsouth.net@marsha>
Subject: Re: re[2]: [linux-lvm] [Q] LVM snapshot volume extendable?
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Jan 16 17:36:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

What I found out testing with a few FS available for Linux is that only the
snapshot for ext2 is extendable. I and extend ext2 snapshots with 'lvextend'
command and it keep staying mountable.

Snapshots for LV on Reiserfs, XFS and even ext3 are not
extendable(mountable).

Very strange, since LVM snapshot does not hold FS. Am I right?


----- Original Message -----
From: "Greg Freemyer" <freemyer@NorcrossGroup.com>
To: "LVM Mailing list" <linux-lvm@sistina.com>
Cc: "xfs mailing list" <linux-xfs@oss.sgi.com>
Sent: Tuesday, January 14, 2003 6:47 AM
Subject: re[2]: [linux-lvm] [Q] LVM snapshot volume extendable?



I agree, their seems to be a bug in LVM.

I am running XFS Version 1.2pre3 based on the 2.4.19 kernel and I cannot
extend a LV with XFS fs on top.

In particular this works:

>>>
xfs_freeze -f /data                                                  (I
don't have the patch installed)
lvcreate --snapshot -L 100M --name data_snap /dev/VG/data
xfs_freeze -u /data                                                 (I don't
have the patch installed)
mount -t xfs -o ro,nouuid /dev/VG/data_snap /data_snap
<<<

And this does not.

>>>
xfs_freeze -f /data                                                  (I
don't have the patch installed)
lvcreate --snapshot -L 100M --name data_snap /dev/VG/data
xfs_freeze -u /data                                                 (I don't
have the patch installed)

lvdisplay /dev/VG/data_snap                                   (verified 0%
used)
dd if=/dev/zero of=/data/dummy bs=1M count=75     (create a 75 Meg dummy
file)
lvdisplay /dev/VG/data_snap                                   (verified
approx 75% used)
lvextend -L +100M /dev/VG/data_snap
lvdisplay /dev/VG/data_snap                                   (verified
approx 37% used)

#  Everything looks fine, so I try to mount it

mount -t xfs -o ro,nouuid /dev/VG/data_snap /data_snap
mount: wrong fs type, bad option, bad superblock on
/dev/TruStore-Data/data_snap,
       or too many mounted file systems
<<<


Greg Freemyer
The Norcross Group


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO@http://tldp.org/HOWTO/LVM-HOWTO/
