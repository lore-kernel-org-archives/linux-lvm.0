Message-ID: <OFF0F6A876.96B3BE16-ON86256B13.005A4F63@TEXASMUTUAL.COM>
From: "Jonathan S. Polacheck" <JPolache@texasmutual.com>
MIME-Version: 1.0
Subject: [linux-lvm] ext2online fails
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
Date: Thu Nov 29 10:32:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I am trying to resize a filesystem after lvextend.  ext2online returns the
following;

[root@netman root]# ext2online /dev/vg1/vol_usr
ext2online v1.1.14 - 1999/10/14 for EXT2FS 0.5b

ext2online: resizing to 258048 blocks
ext2online: resize failed while in kernel
ext2online: Invalid argument

The ext2online man page states;

In  order  to  use ext2online, you need to have the Online ext2 resize
support (CONFIG_EXT2_RESIZE) compiled into the kernel  (this  is  an
optional patch for the 2.x series of kernels).

How do I tell if my kernel is properly compiled?  If it is not properly
compiled, I have a problem as I currently do not have the disk space to
install gcc, make or the kernel source.
