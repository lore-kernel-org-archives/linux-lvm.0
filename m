From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009071825.MAA08578@lynx.turbolabs.com>
Subject: [linux-lvm] LVM support for LILO
Date: Thu, 7 Sep 2000 12:25:07 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>
Cc: idsfa@visi.com

Heinz,
Michael Kellen and I have been working to add LILO support for booting
from a LV (i.e. have /boot be an LV, and then not have ANY DOS partitions).

However, the main problem that we are having is that you cannot use
an LV device major/minor to do anything with liblvm.  All of the liblvm
functions use an LV name, it would be good to add an ioctl which takes
a dev_t (e.g. 0x3a01) and returns an LV name, or maybe an lv_t which
we can use with liblvm.  Along the same lines, it may be good to have
an ioctl which takes a dev_t and returns a vg_t of the VG which this LV
is a part of.  Finally, it would be good to take the code out of lvm_map()
which only does block/dev remapping (which lvm_map() will call), but
which also be called by an ioctl like FIBMAP.

How this all fits together is:

1) LILO gets the name of a kernel image (e.g. /boot/vmlinuz) and does stat()
   on it to get the dev_t.

2) LILO does FIBMAP ioctl for each block in the kernel image to find the
   absolute block on the dev_t, and stores this into boot.map.

We need to take the LV dev_t and map it to an lv_t.  Then after LILO does
the FIMBAP on a file block (which returns an LV relative block number),
we need to call a function (ioctl) with (lv_t, lv_block) to return the PV
(dev_t, block), which will then be stored in the boot.map.  LILO needs
the underlying dev_t, because this is translated into a BIOS drive number.

All of these things are relatively easy to do, but it is useless if it
is not in the standard LVM code.  Mapping from a LV dev_t to an lv_t is
simply checking MAJOR(dev) == LVM_MAJOR, return lv[MINOR(dev) + 1] or so.
Doing the block remapping is already in lvm_map(), and just needs to be
moved into a separate function that can be called via ioctl.

Cheers, Andreas
