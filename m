Date: Thu, 31 Aug 2000 15:15:16 -0300 (BRT)
From: Marcelo Tosatti <marcelo@conectiva.com.br>
Subject: Re: [linux-lvm] Dazed & Confused
In-Reply-To: <200008291622.KAA02929@lynx.turbolabs.com>
Message-ID: <Pine.LNX.4.21.0008311508270.898-100000@freak.distro.conectiva>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com


On Tue, 29 Aug 2000, Andreas Dilger wrote:

> Ulf Bartelt writes:
> > /dev/vgkira/ftp on /home/ftp type ext2 (ro,errors=remount-ro)
> > /dev/vgkira/ftp2 on /home/ftp2 type ext2 (rw,errors=remount-ro)
> > 
> > (root@kira:/0)~# e2fsadm -L+1G /dev/vgkira/ftp
> > e2fsadm -- ERROR: "/dev/vgkira/ftp" is mounted on "/home/ftp2"
> > e2fsadm -- please umount it to resize
> 
> This is a bug in how e2fsadm checks to see if a filesystem is mounted.
> I have fixed this in my version of e2fsadm, as well as adding support
> for ext2resize and ext2online, so you don't even need to unmount the
> filesystem to resize it (if you have the ext2online kernel patch).
> 
> See ftp.lustre.org:/pub/adilger for an SRPM which has a patch to fix
> all known LVM user-tools bugs, as well as a kernel patch for 0.8final
> on 2.2.16.  I was told by Les Hazelton that my LVM kernel patch will
> apply cleanly to kernel-source-2.2.17-0.16mdk.i586.rpm, from the
> mandrake cooker section on rpmfind.net.

While looking at your patch I found something which seems to be wrong. 

The function lvm_snapshot_COW returns 1 on success. lvm_map() returns  
lvm_snapshot_COW() return code. ll_rw_block calls lvm_map_ptr() (which is
lvm_map()) and expects 0 on success: 

+                       if ((lvm_map_ptr) (bh[i], rw) != 0) {
+                               printk(KERN_ERR
+                                      "Bad lvm_map in ll_rw_block\n");
+                               goto sorry;
+                       }
