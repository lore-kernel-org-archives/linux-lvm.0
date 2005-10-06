Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j963jdV09503
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2005 23:45:39 -0400
Received: from cvo1.cvo.roguewave.com (cvo-ext.roguewave.com [12.22.36.198])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j963jc0d024777
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2005 23:45:39 -0400
Message-ID: <D486606E7AD20947BDB7E56862E04C390185A068@cvo1.cvo.roguewave.com>
From: Poul Petersen <petersp@roguewave.com>
Date: Wed, 5 Oct 2005 20:45:32 -0700 
MIME-Version: 1.0
Subject: [linux-lvm] PATCH: LVM-1.0.8 + AoE + kernel-2.4.x
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

	I'm playing with some AoE (ATA over Ethernet) hardware and wanted to
get it working with LVM1 (1.0.6 specifically, but this patch is for 1.0.8).
I am trying to avoid upgrading the kernel on our production machine in the
short term. Anyways, while the AoE driver is in the 2.6.11+ kernels it has
to be added to 2.4 as an independent module
(http://www.coraid.com/support/linux/). A couple of things to note about
this:

1) The AoE module on the 2.4 kernel does not support partitioning, so I
didn't bother to support it in this LVM patch.

2) AOE_MAJOR is not defined in include/linux/major.h on the 2.4 series
kernel. It is defined in the 2.6 kernel as major=152, and it is also
likewise defined in the AoE 2.4 module source (all.h), but of course when
compiling LVM it isn't going to know where the AoE module source is located.
I wasn't really certain how to handle this, so I just stuck it in
kernel/lvm.h. I'm sure that's wrong. Probably it could be added into the
PATCHES stuff, but I havn't sorted out how that all works. One could always
add the #define to the kernel source I suppose, but I wanted my patch to
just work :)

3) It looked like all I needed to do was tell LVM about the specifics of AoE
block devices. It seems to be working, but I'll be the first to admit that
I'm hacking here :)

4) Without this patch, simple LVM commands fail with an error like:

# pvcreate /dev/etherd/e0.7
pvcreate -- invalid physical volume "/dev/etherd/e0.7"

-poul

-----
PATCH
-----

diff -urN 1.0.8.orig/kernel/lvm.h 1.0.8/kernel/lvm.h
--- 1.0.8.orig/kernel/lvm.h	2003-11-17 07:58:55.000000000 -0800
+++ 1.0.8/kernel/lvm.h	2005-10-05 20:11:47.000000000 -0700
@@ -153,6 +153,10 @@
 #error Bad include/linux/major.h - LVM MAJOR undefined
 #endif
 
+#if !defined AOE_MAJOR
+#define AOE_MAJOR 152
+#endif
+
 #ifdef	BLOCK_SIZE
 #undef	BLOCK_SIZE
 #endif
diff -urN 1.0.8.orig/tools/lib/liblvm.h 1.0.8/tools/lib/liblvm.h
--- 1.0.8.orig/tools/lib/liblvm.h	2003-02-28 06:51:35.000000000 -0800
+++ 1.0.8/tools/lib/liblvm.h	2005-10-05 20:13:49.000000000 -0700
@@ -191,6 +191,7 @@
   LVM_DEVICE_TYPE_UBD,		/* User-mode virtual block device	*/
   LVM_DEVICE_TYPE_ATARAID,	/* ATA Raid				*/
   LVM_DEVICE_TYPE_I2O,		/* i2o block device */
+  LVM_DEVICE_TYPE_AOE,          /* ATA over Ethernet                    */
 } lvm_device_type_t;
 
 /* for lvm_show_size () */
diff -urN 1.0.8.orig/tools/lib/lvm_check_dev.c
1.0.8/tools/lib/lvm_check_dev.c
--- 1.0.8.orig/tools/lib/lvm_check_dev.c	2003-02-06
07:05:33.000000000 -0800
+++ 1.0.8/tools/lib/lvm_check_dev.c	2005-10-05 20:07:10.000000000 -0700
@@ -64,6 +64,9 @@
 #ifdef I2O_MAJOR
       I2O_MAJOR,
 #endif
+#ifdef AOE_MAJOR
+      AOE_MAJOR,
+#endif
       -1
    };
 
diff -urN 1.0.8.orig/tools/lib/lvm_check_partitioned_dev.c
1.0.8/tools/lib/lvm_check_partitioned_dev.c
--- 1.0.8.orig/tools/lib/lvm_check_partitioned_dev.c	2003-02-06
07:05:33.000000000 -0800
+++ 1.0.8/tools/lib/lvm_check_partitioned_dev.c	2005-10-05
20:08:31.000000000 -0700
@@ -64,6 +64,7 @@
 	case LVM_DEVICE_TYPE_LOOP:
 	case LVM_DEVICE_TYPE_MD:
 	case LVM_DEVICE_TYPE_ATARAID:
+	case LVM_DEVICE_TYPE_AOE:
 	    break;
 	default:
 	    ret = TRUE;
@@ -161,6 +162,7 @@
 	{ "ubd", LVM_DEVICE_TYPE_UBD },	  /* User-mode virtual block device
*/
 	{ "ataraid", LVM_DEVICE_TYPE_ATARAID }, /* ATA Raid
*/
 	{ "i2o_block", LVM_DEVICE_TYPE_I2O }, /* i2o disk */
+        { "aoe", LVM_DEVICE_TYPE_AOE }, /* ATA over Ethernet
*/
 	{ NULL, LVM_DEVICE_TYPE_INVALID } /* Device not recognized
*/
     };
     FILE *procdevices = NULL;
diff -urN 1.0.8.orig/tools/lib/lvm_dir_cache.c
1.0.8/tools/lib/lvm_dir_cache.c
--- 1.0.8.orig/tools/lib/lvm_dir_cache.c	2003-02-06
07:05:34.000000000 -0800
+++ 1.0.8/tools/lib/lvm_dir_cache.c	2005-10-05 20:09:36.000000000 -0700
@@ -69,6 +69,7 @@
 static char *_noprocdir[] = {
 	LVM_DIR_PREFIX "loop",
 	LVM_DIR_PREFIX "nb",
+	LVM_DIR_PREFIX "etherd",
 	NULL
 };
 
@@ -85,6 +86,7 @@
 	LVM_DIR_PREFIX "ubd",
 	LVM_DIR_PREFIX "ataraid",
 	LVM_DIR_PREFIX "i2o_block",
+	LVM_DIR_PREFIX "etherd",
 	NULL
 };
 
