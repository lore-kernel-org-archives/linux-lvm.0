From: Adrian Bunk <bunk@fs.tum.de>
Message-ID: <20030728025811.GI22218@fs.tum.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [2.6 patch] remove #include blk.h in dm-ioctl-v{1,4}.c
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
Date: Sun Jul 27 21:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dm@uk.sistina.com
Cc: linux-lvm@sistina.com, linux-kernel@vger.kernel.org, trivial@rustcorp.com.au

The patch below removed two #include's of the obsolete blk.h.

I've tested the compilation with 2.6.0-test2.

Please apply
Adrian

--- linux-2.6.0-test2-full-no-smp/drivers/md/dm-ioctl-v1.c.tmp	2003-07-28 04:50:45.000000000 +0200
+++ linux-2.6.0-test2-full-no-smp/drivers/md/dm-ioctl-v1.c	2003-07-28 04:51:13.000000000 +0200
@@ -12,7 +12,6 @@
 #include <linux/dm-ioctl.h>
 #include <linux/init.h>
 #include <linux/wait.h>
-#include <linux/blk.h>
 #include <linux/slab.h>
 #include <linux/devfs_fs_kernel.h>
 
--- linux-2.6.0-test2-full-no-smp/drivers/md/dm-ioctl-v4.c.tmp	2003-07-28 04:51:20.000000000 +0200
+++ linux-2.6.0-test2-full-no-smp/drivers/md/dm-ioctl-v4.c	2003-07-28 04:51:30.000000000 +0200
@@ -11,7 +11,6 @@
 #include <linux/miscdevice.h>
 #include <linux/init.h>
 #include <linux/wait.h>
-#include <linux/blk.h>
 #include <linux/slab.h>
 #include <linux/devfs_fs_kernel.h>
 
