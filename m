Return-Path: <todd@staff.nm.org>
Date: 1 May 2001 16:36:16 -0600
Date: Tue, 1 May 2001 16:36:16 -0600 (MDT)
From: Todd Underwood <todd@osogrande.com>
Message-ID: <Pine.LNX.4.10.10105011628100.21405-100000@staff>
MIME-Version: 1.0
Subject: [linux-lvm] odd problem
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

folx,

i have 2.4.3 with beta-7 patches installed and beta-7 userland tools.  i'm
using lvm-initrd with a boot partition on /dev/hda2 and LVM root and other
filesystems on a few scsi disks.  all was working well but recently i
needed to reboot (i was unable to increase the size of my / with the
online ext2 tools and it was full--not sure what the error was there, or
whether that is relevant).

in any case, now i reboot and i get
lvm -- lvm_chr_ioctl:  unknown command 4004fe0a
vgchange -- volume group "rootvg" successfully activated

VGS: Mounted root (ext2 filesystem) readonly.
change_root: old root has d_count=3
Trying to unmount old root ... <7>uhci.c: suspect_hd
okay

a bunch of other stuff

then:

Activating swap partitions swapon: /dev/rootvg/swap: Invalid argument
Setting hostname zapata.staff.osogrande.net execvp: No such file or
directory

/etc/rc.d/rc.sysinit:  domainname: command not found

and so on.  looks like nothing's mounted.  the same kernel boots fine with
an older root fs on a 'real' partition.

any suggestions?

todd underwood
chief technology officer
oso grande technologies, inc.
todd@osogrande.com
