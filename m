Return-Path: <dice@mfa.kfki.hu>
Date: Sat, 28 Apr 2001 11:26:01 +0200 (CEST)
From: Gergely Tamas <dice@mfa.kfki.hu>
Message-ID: <Pine.LNX.4.32.0104281123560.21920-100000@falka.mfa.kfki.hu>
MIME-Version: 1.0
Subject: [linux-lvm] get_hardblocksize and kernel 2.4.4
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
To: linux-lvm@sistina.com

Hi!

Kernel 2.4.4 changed the get_hardblocksize function into
get_hardsect_size. LVM 0.9.1b7(lvm.c) uses get_hardblocksize so the kernel
can't be compiled.

The following patch solves this problem ...

Gergely

--- lvm.c.orig	Sat Apr 28 10:48:37 2001
+++ lvm.c	Sat Apr 28 11:07:07 2001
@@ -1791,7 +1791,7 @@
 	int max_hardblocksize = 0, hardblocksize;

 	for (le = 0; le < lv->lv_allocated_le; le++) {
-		hardblocksize = get_hardblocksize(lv->lv_current_pe[le].dev);
+		hardblocksize = get_hardsect_size(lv->lv_current_pe[le].dev);
 		if (hardblocksize == 0)
 			hardblocksize = 512;
 		if (hardblocksize > max_hardblocksize)
@@ -1801,7 +1801,7 @@
 	if (lv->lv_access & LV_SNAPSHOT) {
 		for (e = 0; e < lv->lv_remap_end; e++) {
 			hardblocksize =
-				get_hardblocksize(
+				get_hardsect_size(
 					lv->lv_block_exception[e].rdev_new);
 			if (hardblocksize == 0)
 				hardblocksize = 512;
