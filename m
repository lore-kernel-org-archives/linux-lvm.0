Return-Path: <dice@mfa.kfki.hu>
Date: Sat, 5 May 2001 23:24:43 +0200 (CEST)
From: Gergely Tamas <dice@mfa.kfki.hu>
Message-ID: <Pine.LNX.4.32.0105052321020.24489-100000@falka.mfa.kfki.hu>
MIME-Version: 1.0
Subject: [linux-lvm] typo in CVS: LVM/kernel/lvm.c
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

There is a typo in CVS:LVM/kernel/lvm.c

Gergely

--- LVM/kernel/lvm.c.orig	Thu May  3 15:37:19 2001
+++ LVM/kernel/lvm.c	Sat May  5 23:01:22 2001
@@ -1879,7 +1879,7 @@
 	int max_hardsectsize = 0, hardsectsize;

 	for (le = 0; le < lv->lv_allocated_le; le++) {
-#if LINUX_VERSION_CODE <= KERNEL_VERSION ( 2, 4, 4)
+#if LINUX_VERSION_CODE <= KERNEL_VERSION ( 2, 4, 3)
 		hardsectsize = get_hardblocksize(lv->lv_current_pe[le].dev);
 #else
 		hardsectsize = get_hardsect_size(lv->lv_current_pe[le].dev);
@@ -1892,7 +1892,7 @@

 	if (lv->lv_access & LV_SNAPSHOT) {
 		for (e = 0; e < lv->lv_remap_end; e++) {
-#if LINUX_VERSION_CODE <= KERNEL_VERSION ( 2, 4, 4)
+#if LINUX_VERSION_CODE <= KERNEL_VERSION ( 2, 4, 3)
 			hardsectsize = get_hardblocksize( lv->lv_block_exception[e].rdev_new);
 #else
 			hardsectsize = get_hardsect_size( lv->lv_block_exception[e].rdev_new);
