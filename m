Message-ID: <389975EF.69B9CCE2@msede.com>
Date: Thu, 03 Feb 2000 13:34:55 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: me@jimcain.net
MIME-Version: 1.0
Subject: [linux-lvm] Problems with 0.8pre tools (fwd)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message ...

-------- Original Message --------
Date: Wed, 2 Feb 2000 23:39:30 -0500 (EST)
From: Jim Cain <me@jimcain.net>
Subject: Problems with 0.8pre tools

All,

I had some problems getting the tools to build. First, in
tools/lib/liblvm.h, the included file <linux/lvm.h> did not compile
because the reference to spinlock_t on line 573 was unknown. I added
an
#include <linux/spinlock.h> to liblvm.h, and everything in the lib
directory built fine.

Next, in tools/lvmchange.c on line 160, the identifier LVM_RESET was
unknown. This is defined in <linux/lvm.h>, but only if LVM_TOTAL_RESET
is
defined. I removed the #ifdef around it so that LVM_RESET is always
defined. After that change, the tools built okay.

Well, not completely okay. Because when I do the following:

pvcreate /dev/hd[bc]1
vgcreate vg01 /dev/hd[bc]1

the vgcreate command dumps core on a segmentation fault. I'm wondering
if
any of the fixes I made were incomplete or the wrong way to fix it.

This is being built on kernel 2.3.40 with the 0.8i patch.

Thanks for the help,
Jim
