From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] More information on my LV with bad read performance..
Message-ID: <20011026112946.L23590@turbolinux.com>
References: <Pine.LNX.4.33.0110260825240.26478-100000@ping.us.dell.com> <Pine.LNX.4.33.0110260834210.26478-100000@ping.us.dell.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0110260834210.26478-100000@ping.us.dell.com>
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
Date: Fri Oct 26 12:28:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Oct 26, 2001  08:39 -0500, Robert Macaulay wrote:
> Where is the patch you referred to to increase the read ahead? Part of our 
> Oracle testing(with volumes separated by use) involves sequential table 
> scans, which sound like they could benefit greatly from this patch. Thx

I'm not sure of the exact time when the changes went in, but when I
updated to 2.4.13 and wanted to update the LVM code also, I see (note
patch whitespace may be broken because of cut-n-paste):

There was also a small discussion about read ahead on the kernel mailing
list, so this may be a result of that.  Something along the lines of "all
readahead is broken because ..."

Cheers, Andreas
=============================================================================
--- kernel/lvm.c	2001/10/15 09:23:27
+++ kernel/lvm.c	2001/10/26 17:21:47
@@ -270,9 +270,13 @@
 
 #include "lvm-internal.h"
 
-#define	LVM_CORRECT_READ_AHEAD( a) \
-   if      ( a < LVM_MIN_READ_AHEAD || \
-             a > LVM_MAX_READ_AHEAD) a = LVM_MAX_READ_AHEAD;
+#define	LVM_CORRECT_READ_AHEAD(a)               \
+do {                                           \
+	if ((a) < LVM_MIN_READ_AHEAD ||         \
+	    (a) > LVM_MAX_READ_AHEAD)           \
+		(a) = LVM_DEFAULT_READ_AHEAD;   \
+	read_ahead[MAJOR_NR] = (a);             \
+} while(0)
 
 #ifndef WRITEA
 #  define WRITEA WRITE
@@ -1040,6 +1045,7 @@
 		    (long) arg > LVM_MAX_READ_AHEAD)
 			return -EINVAL;
 		lv_ptr->lv_read_ahead = (long) arg;
+		read_ahead[MAJOR_NR] = lv_ptr->lv_read_ahead;
 		break;
 
--- kernel/lvm.h        2001/10/03 14:46:47     1.34
+++ kernel/lvm.h        2001/10/26 17:24:16
@@ -274,8 +274,9 @@
 #define	LVM_MAX_STRIPES		128	/* max # of stripes */
 #define	LVM_MAX_SIZE		( 1024LU * 1024 / SECTOR_SIZE * 1024 *
1024)	/* 1TB[sectors] */
 #define	LVM_MAX_MIRRORS		2	/* future use */
-#define	LVM_MIN_READ_AHEAD	2	/* minimum read ahead sectors */
-#define	LVM_MAX_READ_AHEAD	120	/* maximum read ahead sectors */
+#define	LVM_MIN_READ_AHEAD	0	/* minimum read ahead sectors */
+#define	LVM_DEFAULT_READ_AHEAD	1024	/* sectors for 512k scsi segments */
+#define	LVM_MAX_READ_AHEAD	10000	/* maximum read ahead sectors */
 #define	LVM_MAX_LV_IO_TIMEOUT	60	/* seconds I/O timeout (future use) */
 #define	LVM_PARTITION		0xfe	/* LVM partition id */
 #define	LVM_NEW_PARTITION	0x8e	/* new LVM partition id (10/09/1999) */

 


Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
