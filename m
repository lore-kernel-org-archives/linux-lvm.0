Date: Thu, 24 Jun 1999 19:22:41 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Compiling LVM 0.6 on Redhat 6.0
Message-ID: <19990624192241.B18126@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <ENJGHHKIMLNCBAAA@my-deja.com> <199906231110.AA22585@mailgate1b.telekom.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="FsscpQKzF/jJk6ya"
In-Reply-To: <199906231110.AA22585@mailgate1b.telekom.de>; from Heinz Mauelshagen on Wed, Jun 23, 1999 at 01:09:00PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>, gnicolao@my-deja.com
Cc: linux-lvm@msede.com


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii

On Wed, Jun 23, 1999 at 01:09:00PM +0000, Heinz Mauelshagen wrote:
> 
> Hi there!
> 
> Looks like you had a compile problem in the LVM lib which caused
> the library _not_ to be build.
> 
i had to use this patche to compile with glibc2.0/2.1 and a recent
(2.2.10-ac3) kernel

should not break other cases

Regards,
Luca

-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.

--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm-0.6.glibc.patch"

--- 0.6/tools/lib/liblvm.h.make.orig	Fri Feb 26 01:46:28 1999
+++ 0.6/tools/lib/liblvm.h	Thu Jun 24 08:08:26 1999
@@ -78,6 +78,25 @@
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
@@ -94,10 +113,10 @@
 #  include <linux/msdos_fs.h>
 #  include <malloc.h>
 #  include <stdio.h>
+#  include <linux/genhd.h>
 #endif /* __GLIBC__ > 1 */
 
 #include <sys/ioctl.h>
-#include <linux/genhd.h>
 #include <linux/major.h>
 
 #include <lvm.h>
--- 0.6/tools/lib/pv_get_size.c.make.orig	Fri Feb 26 01:46:28 1999
+++ 0.6/tools/lib/pv_get_size.c	Thu Jun 24 08:05:16 1999
@@ -112,9 +112,10 @@
 #endif
          /* is it a welcome extended partition? */
          if ( part[i].sys_ind == DOS_EXTENDED_PARTITION ||
-              part[i].sys_ind == LINUX_EXTENDED_PARTITION) {
+              part[i].sys_ind == LINUX_EXTENDED_PARTITION ||
+              part[i].sys_ind == WIN98_EXTENDED_PARTITION) {
 #ifdef DEBUG
-            debug ( "pv_get_size -- DOS/LINUX_EXTENDED_PARTITION\n");
+            debug ( "pv_get_size -- DOS/LINUX/W98_EXTENDED_PARTITION\n");
 #endif
             extended_flag = 1;
             offset = extended_offset + part[i].start_sect;
--- 0.6/tools/lvm_user.h.make.orig	Thu Jun 24 08:09:49 1999
+++ 0.6/tools/lvm_user.h	Thu Jun 24 08:09:57 1999
@@ -42,7 +42,7 @@
 #include <features.h>
 #include <liblvm.h>
 
-#include <linux/genhd.h>
+/* #include <linux/genhd.h> */
 #include <linux/major.h>
 
 #if ( __GLIBC__ > 1)

--FsscpQKzF/jJk6ya--
