From: "William Blunn" <bill@tao-group.com>
Subject: Re: [linux-lvm] Partition resizing and whatnot
Message-Id: <000d01c1bab5$b27789f0$216410ac@tao.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CBEHLLOPCKAOIAOINGKAMEHOCAAA.jmoser@erc.wisc.edu>
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
Date: Thu Feb 21 02:57:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: John Moser <jmoser@erc.wisc.edu>

John Moser <jmoser@erc.wisc.edu> wrote:
> So, after installation the ATA update patches that people recommended,
> I now have a linux system that recognizes the full 160 gigabytes of
> disk space on my disks.  However, I'm not entirely sure as to how I
> should go about resizing my filesystem.  I'm already well aquanted
> with adding disks to existing filesystems and growing them.

??? You can't add a disk to a filesystem.

You can put a PV on a disk and add that to a VG.

(Or, possibly, you could add a disk to the end of a linear MD group,
although this would be pointless with LVM.)

> However, what are the recommended steps for taking existing disk
> partitions, resizing them to fill the disks they reside on,

I wouldn't recommend trying to go down this path:
  Resizing the partitions would be no problem, just use fdisk to delete
  the existing partition and create a new one with the same start point,
  but with a higher end point. The problem would be resizing the PVs,
  which I don't think is supported. So I don't think it would be a good
  idea to go down this path.

Surely the obvious way to do it is:

(a) Using fdisk, create new partition(s) in the newly-usable tail end(s)
    of your disk(s)

(b) *** Re-boot. The kernel cannot re-interpret a partition table if any
    of the partitions are in use. In all probability you will have
    partitions in use on that/those disk(s) so you will need to re-boot
    to make the kernel re-interpret the partition table(s).

(b) create PVs in the new partitions (pvcreate)

(c) add the PVs to your VG(s) (vgextend)

Your VG will then be larger by the amount of PEs which could be fitted
into the new PVs in the new partitions. You can then extend your LVs at
your leisure.

You will probably lose a tiny bit at the end of the existing partitions,
and you may be able to fit one less PE in your new partition(s), because
the size of your existing partitions will probably not be exact
multiples of the PE size, but it's not worth worrying about.

> and then resizing the LVM/e2fs filesystems that use those disks?

??? Unrelated ? This is all basic stuff to do with LV side. Just follow
the documentation: umount ... / e2fsadm ... / mount ... . (Just make
sure you have a suitably up-to-date version of ext2resize; I use version
1.1.17.)

Regards,

Bill
--=20
William H. Blunn - bill+linuxlvm@tao-group.com
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/
