Date: Fri, 8 Sep 2000 15:57:17 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: [linux-lvm] [PATCH] LVM support for GRUB
Message-ID: <20000908155717.A26391@ns.lst.de>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


Hi,
I've done some work on implementing LVM support
in GRUB (a bootloader). This patch does not touch
the LVM kernel code or utils but adds support for
the LVM on disk format to grub, so you can boot your
linux (or *BSD or gnu mach) kernel from a logical
volume.

Because I didn't want to implement the full
block-mapping algorithm in a bootloader, this patch
only supports contiguous lvs (with a #define it
can read contiguous that don't have this flag, but ...).

Besides that it has some other limitations:
 o the pv on witch the boot lv is has to have no more than
   4096 pes (this can be changed with a #define)
 o there must not be any free space between the lvs of the boot pv
   (this will be changed in the future).

The code can be found on ftp.openlinux.org/pub/people/hch/lvm,
the filename is grub-current-lvm.diff


	Christoph

-- 
Always remember that you are unique.  Just like everyone else.
