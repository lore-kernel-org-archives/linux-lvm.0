Return-Path: <urs@isnogud.escape.de>
Subject: Re: [linux-lvm] Bugs in LVM and ext2: patch for LVM
References: <200102272007.f1RK7aM27545@webber.adilger.net> <m21ysi3m0z.fsf@isnogud.escape.de>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 28 Feb 2001 18:53:33 +0100
In-Reply-To: <m21ysi3m0z.fsf@isnogud.escape.de>; from Urs Thuermann on 28 Feb 2001 15:44:12 +0100
Message-ID: <m21ysik82q.fsf_-_@isnogud.escape.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: linux-kernel@vger.kernel.org

Urs Thuermann <urs@isnogud.escape.de> writes:

> I've read lots of EXT2 and LVM src code and I think it turns out that
> there is a bug in both.  Andreas has already given the fix for the
> ext2, a suggestion for LVM is below (sorry, no patch, I really know to
> little about all the block sizes and buffers of block devices).

Despite my limited knowledge of the src code for buffering and block
devices I have made an patch which fixes the LVM problem for me.  I'm
not 100% sure it is correct and if it is the clean solution.  Some
kernel god should therefore take a look on it.  At least I have
running it here in my kernel.


--- linux-2.4.2/drivers/md/lvm.c.orig	Wed Feb 28 18:27:40 2001
+++ linux-2.4.2/drivers/md/lvm.c	Wed Feb 28 17:00:25 2001
@@ -376,6 +376,8 @@
 static struct hd_struct lvm_hd_struct[MAX_LV];
 static int lvm_blocksizes[MAX_LV] =
 {0,};
+static int lvm_hardsizes[MAX_LV] =
+{0,};
 static int lvm_size[MAX_LV] =
 {0,};
 static struct gendisk lvm_gendisk =
@@ -3035,11 +3037,12 @@
 		lvm_gendisk.part[i].start_sect = -1;	/* avoid partition check */
 		lvm_size[i] = lvm_gendisk.part[i].nr_sects = 0;
 		lvm_blocksizes[i] = BLOCK_SIZE;
+		lvm_hardsizes[i] = BLOCK_SIZE;
 	}
 
 	blk_size[MAJOR_NR] = lvm_size;
 	blksize_size[MAJOR_NR] = lvm_blocksizes;
-	hardsect_size[MAJOR_NR] = lvm_blocksizes;
+	hardsect_size[MAJOR_NR] = lvm_hardsizes;
 
 	return;
 } /* lvm_gen_init() */
