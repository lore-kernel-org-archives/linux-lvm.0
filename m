Return-Path: <knuffie@xs4all.nl>
Message-Id: <4.3.2.7.2.20010606202731.0346bad0@pop.xs4all.nl>
Date: Wed, 06 Jun 2001 20:30:01 +0200
From: Seth Mos <knuffie@xs4all.nl>
In-Reply-To: <00ca01c0eea4$500ab4a0$0f01a8c0@ws1>
References: <Pine.BSF.4.33.0106041350560.1884-100000@rogue.tripp.org>
 <01060413285600.09944@garfield.linux.localdomain>
 <011501c0ed31$58a54360$0f01a8c0@ws1>
 <20010605102551.Z97441@boing.melbourne.sgi.com>
 <3B1CE383.DCFED687@niehs.nih.gov>
Mime-Version: 1.0
Subject: [linux-lvm] Re: 2.4.5 & Adaptec 7890 U2W Controller solved, LVM 0.9.1 b7
 FAILS.
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Bas <list@showme.wox.org>, linux-xfs@oss.sgi.com
Cc: linux-lvm@sistina.com

At 18:18 6-6-2001 +0200, Bas wrote:
>You're right. Today I downloaded the default kernel coming from
>ftp.kernel.org. Patched it using 06042001-xfs-patch. It compiled and it
>runs. But when I patch this kernel to 0.9.1 beta 7, (CVS or standard patch
>makes no difference) it fails to compile.
>
>Now this:
>
>drivers/md/mddev.o: In function `__update_hardblocksize':
>drivers/md/mddev.o(.text+0x22d6): undefined reference to `get_hardblocksize'
>drivers/md/mddev.o(.text+0x2312): undefined reference to `get_hardblocksize'
>make[1]: *** [kallsyms] Error 1
>make: *** [vmlinux] Error 2
>
>How can I fix this.
>
>Thanks again,
>Bas.

Patch was posted on the list a few days ago

Here you go

--- linux-2.4.4/drivers/md/lvm.c.orig   Sun May  6 14:54:39 2001
+++ linux-2.4.4/drivers/md/lvm.c        Sun May  6 14:55:06 2001
@@ -1791,7 +1791,7 @@
         int max_hardblocksize = 0, hardblocksize;

         for (le = 0; le < lv->lv_allocated_le; le++) {
-               hardblocksize = get_hardblocksize(lv->lv_current_pe[le].dev);
+               hardblocksize = get_hardsect_size(lv->lv_current_pe[le].dev);
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

Hope it's complete and ok
Otherwise you can find it the archives under "2.4.5 compiles almost"

Good Luck

--
Seth
Every program has two purposes one for which
it was written and another for which it wasn't
I use the last kind.
