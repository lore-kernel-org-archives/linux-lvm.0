Date: Mon, 26 Jul 1999 00:18:36 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Compile Problems
Message-ID: <19990726001835.B6315@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <379B82D9.6845F39@thephaedo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=oyUTqETQ0mS9luUI
In-Reply-To: <379B82D9.6845F39@thephaedo.com>; from S. Ryan Quick on Sun, Jul 25, 1999 at 09:34:17PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: "S. Ryan Quick" <ryan@thephaedo.com>
Cc: linux-lvm@msede.com


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii

ok try this,
it is the modified version of the patch i posted for 0.6

it is also available from http://www.comedia.it/bluca/lvm/lvm-0.7.glibc.patch 

Regards,
Luca

-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm-0.7.glibc.patch"

--- 0.7/tools/lib/liblvm.h.glibc.orig	Mon Jul 12 23:21:26 1999
+++ 0.7/tools/lib/liblvm.h	Sun Jul 25 21:15:11 1999
@@ -80,6 +80,25 @@
 #  include <time.h>
 int llseek ( unsigned int, unsigned long long, unsigned int);
 
+/* from genhd.h */
+#define DOS_EXTENDED_PARTITION 5
+#define LINUX_EXTENDED_PARTITION 0x85
+#define WIN98_EXTENDED_PARTITION 0x0f
+#define LINUX_SWAP_PARTITION	0x82
+
+struct partition {
+	unsigned char boot_ind;		/* 0x80 - active */
+	unsigned char head;		/* starting head */
+	unsigned char sector;		/* starting sector */
+	unsigned char cyl;		/* starting cylinder */
+	unsigned char sys_ind;		/* What partition type */
+	unsigned char end_head;		/* end head */
+	unsigned char end_sector;	/* end sector */
+	unsigned char end_cyl;		/* end cylinder */
+	unsigned int start_sect;	/* starting sector counting from 0 */
+	unsigned int nr_sects;		/* nr of sectors in partition */
+} __attribute__((packed));
+
 #else /* __GLIBC__ < 2 */
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION ( 2, 1, 0)
@@ -96,11 +115,11 @@
 #  include <linux/msdos_fs.h>
 #  include <malloc.h>
 #  include <stdio.h>
+#  include <linux/genhd.h>
 #endif /* __GLIBC__ > 1 */
 
 #include <linux/lvm.h>
 #include <sys/ioctl.h>
-#include <linux/genhd.h>
 #include <linux/major.h>
 
 #define	LVM_LIB_IOP_VERSION	4
--- 0.7/tools/lvm_user.h.glibc.orig	Mon Jul 12 23:21:27 1999
+++ 0.7/tools/lvm_user.h	Sun Jul 25 21:17:54 1999
@@ -42,7 +42,6 @@
 #include <features.h>
 #include <liblvm.h>
 
-#include <linux/genhd.h>
 #include <linux/major.h>
 
 #if ( __GLIBC__ > 1)
@@ -57,6 +56,7 @@
 
 #else
 
+#include <linux/genhd.h>
 #include <ctype.h>
 #include <fcntl.h>
 #include <malloc.h>

--oyUTqETQ0mS9luUI--
