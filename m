Date: Mon, 2 Aug 1999 15:03:01 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] RAID and LVM?
Message-ID: <19990802150301.B20900@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <Pine.LNX.4.10.9907261949360.14960-100000@hibernia.spin.ie> <Pine.LNX.4.10.9908020953470.2161-100000@fuse.aethos.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=ew6BAiZeqk4r7MaW
In-Reply-To: <Pine.LNX.4.10.9908020953470.2161-100000@fuse.aethos.co.uk>; from James Pattinson on Mon, Aug 02, 1999 at 09:57:24AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: James Pattinson <jamesp@aethos.co.uk>
Cc: linux-lvm@msede.com


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii

On Mon, Aug 02, 1999 at 09:57:24AM +0100, James Pattinson wrote:
> Is anyone using alan's ac12 patch for RAID and LVM? My machine at home has
> 2.2.10 with raid0145 applied, and my root partition is striped across two
> hd/s controllers. I want to be able to use LVM though.
i did test it, it seems working, unluckyly ac12 breaks isdn, so i cannot use
it much on my main machine :(

> I downloaded alan's patch, but then couldn't get LVM tools to compile at
> all. Do I need to upgrade to a new glibc or something? I'm running more or
> less a basic RH6 system.

you need this patch to build raidtools:
http://www.comedia.it/bluca/lvm/lvm-0.7.glibc.patch
(also attached here)
if you need i can also provide a spec file
or source RPM


-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.

--ew6BAiZeqk4r7MaW
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

--ew6BAiZeqk4r7MaW--
