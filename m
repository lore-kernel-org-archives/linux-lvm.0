Return-Path: <jeffchua@silk.corp.fedex.com>
Date: Mon, 23 Apr 2001 21:16:45 +0800 (SGT)
From: Jeff Chua <jeffchua@silk.corp.fedex.com>
In-Reply-To: <3AE3ED20.FD685CE@evision-ventures.com>
Message-ID: <Pine.LNX.4.33.0104232109570.326-100000@boston.corp.fedex.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: [BUG] lvm beta7 and ac11 problems
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
To: Martin Dalecki <dalecki@evision-ventures.com>
Cc: Jens Axboe <axboe@suse.de>, Ed Tomlinson <tomlins@cam.org>, linux-kernel@vger.kernel.org, linux-openlvm@nl.linux.org, linux-lvm@sistina.com, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Mon, 23 Apr 2001, Martin Dalecki wrote:

> > > depmod: *** Unresolved symbols in /lib/modules/2.4.3-ac11/kernel/drivers/md/lvm-mod.o


try this (after you have applied the patch for lvm 0.9.1_beta7) ...

Jeff
[jchua@fedex.com]

--- /u2/src/linux/drivers/md/lvm.c.org  Mon Apr 23 21:11:32 2001
+++ /u2/src/linux/drivers/md/lvm.c      Mon Apr 23 21:12:27 2001
@@ -1791,7 +1791,7 @@
        int max_hardblocksize = 0, hardblocksize;

        for (le = 0; le < lv->lv_allocated_le; le++) {
-               hardblocksize =
get_hardblocksize(lv->lv_current_pe[le].dev);
+               hardblocksize =
get_hardsect_size(lv->lv_current_pe[le].dev);
                if (hardblocksize == 0)
                        hardblocksize = 512;
                if (hardblocksize > max_hardblocksize)
@@ -1801,7 +1801,7 @@
        if (lv->lv_access & LV_SNAPSHOT) {
                for (e = 0; e < lv->lv_remap_end; e++) {
                        hardblocksize =
-                               get_hardblocksize(
+                               get_hardsect_size(

lv->lv_block_exception[e].rdev_new);
                        if (hardblocksize == 0)
                                hardblocksize = 512;
