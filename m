Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Fri, 19 Jan 2001 17:20:37 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] LVM with loopback
Message-ID: <20010119172037.A2093@66bassett.freeserve.co.uk>
References: <000e01c08235$bc65a730$3b027eaa@leistnermnt>
Mime-Version: 1.0
In-Reply-To: <000e01c08235$bc65a730$3b027eaa@leistnermnt>; from mark@theleistners.org on Fri, Jan 19, 2001 at 11:34:46AM -0500
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Mark,

This is the patch I use to get LVM working with the loopback like
device in user mode linux.  It's possible you just need the last hunk.
Please don't use this on a production system.

- Joe



diff -ur LVM/tools/lib/lvm_check_dev.c LVM_um/tools/lib/lvm_check_dev.c
--- LVM/tools/lib/lvm_check_dev.c	Mon Nov 13 00:20:11 2000
+++ LVM_um/tools/lib/lvm_check_dev.c	Wed Jan 10 10:55:06 2001
@@ -121,6 +121,7 @@
 #ifdef	DASD_MAJOR
       DASD_MAJOR,
 #endif
+      98,			/* UBD device for user mode linux */
       -1
    };
 
diff -ur LVM/tools/lib/lvm_dir_cache.c LVM_um/tools/lib/lvm_dir_cache.c
--- LVM/tools/lib/lvm_dir_cache.c	Fri Jan  5 11:46:14 2001
+++ LVM_um/tools/lib/lvm_dir_cache.c	Wed Jan 10 10:56:26 2001
@@ -63,6 +63,7 @@
    char blocks[20] = { 0, };
    char devname[30] = { 0, };
    static char *devdir[] = {
+	   "/dev/ubd",
       "/dev/ida",
       "/dev/ide/hd",
       "/dev/loop",
@@ -83,7 +84,7 @@
       ret = -LVM_EPARAM;
       goto lvm_dir_cache_end;
    }
-
+#if 0
    if ( ( proc = fopen ( "/proc/partitions", "r")) != NULL) {
       while ( !feof ( proc)) {
           fgets ( line, 511, proc);
@@ -96,7 +97,8 @@
       }   
       fclose ( proc);
    }
-   if ( cache_size == 0 && lvm_check_devfs() == FALSE) {
+#endif
+   if ( cache_size == 0) { /* && lvm_check_devfs() == FALSE) {*/
       for ( d = 0; devdir[d] != NULL; d++) {
          dirname = devdir[d];
 #ifdef DEBUG
diff -ur LVM/tools/lib/pv_get_size.c LVM_um/tools/lib/pv_get_size.c
--- LVM/tools/lib/pv_get_size.c	Thu Dec 21 13:58:36 2000
+++ LVM_um/tools/lib/pv_get_size.c	Wed Jan 10 10:56:59 2001
@@ -48,7 +48,7 @@
 #include <liblvm.h>
 
 
-#ifndef __alpha__
+#if 0
 int pv_get_size ( char *dev_name, struct partition *part_ptr) {
    int i = 0;
    int dir_cache_count = 0;




On Fri, Jan 19, 2001 at 11:34:46AM -0500, Mark D. Leistner wrote:
> Can someone please give me, or point me to some help using LVM with loopback filesystems.  I would like to test it out some before I use it on my systems, and I haven't been able to get it to work right.  Thanks!
> 
> Mark
