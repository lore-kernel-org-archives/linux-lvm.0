From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010311627.JAA02534@lynx.turbolabs.com>
Subject: [linux-lvm] New 2.2 patches/sources released
Date: Tue, 31 Oct 2000 09:27:13 -0700 (MST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Hello all,
I've updated my 2.2 patch set.  It is now available as an i386 binary, SRPM,
patched .tgz, and standalone patch.  I have also made a 2.4 kernel patch
available to allow include/linux/lvm.h be used from user and kernel sources.

Changes include
- fix for lvmcreate_initrd to allow passing modules/kernel version
- add unpartitioned devices to the disk cache (from SuSE LVM)
- unlink /etc/lvmtab before re-creating it (from SuSE LVM)

Attached is the patch for the 2.4 kernel lvm.h, which also fixes a long
known bug with using lv_t instead of lv_disk_t.  It is also required
for compiling my LVM user tools, since I include <linux/lvm.h> and not
<lib/lvm.h> in order to ensure the kernel and tools have same structs.

Cheers, Andreas
