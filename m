From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] [patch] lvm2 and md component devices
Message-ID: <20040128080607.GC28793@percy.comedia.it>
References: <20040125015538.GB17569@percy.comedia.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <20040125015538.GB17569@percy.comedia.it>
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
Date: Wed Jan 28 10:45:12 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: lvm-devel@sistina.com

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sun, Jan 25, 2004 at 02:55:39AM +0100, Luca Berra wrote:
>At the moment lvm2 scans devices according to filters in lvm.conf
>There is also provisioning to ignore md component device if an md device
>is found with the same uuid.
I had someone test this patch and report success,
Is there any plan on integrating this, or any reason not to?

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm2-skipmd.patch"

--- LVM2.2.00.08/lib/device/dev-io.c.skipmd	2004-01-24 19:11:29.000000000 +0100
+++ LVM2.2.00.08/lib/device/dev-io.c	2004-01-25 02:24:50.056433529 +0100
@@ -41,11 +41,9 @@
 #  endif
 #endif
 
-
-/* FIXME Use _llseek for 64-bit
-_syscall5(int,  _llseek,  uint,  fd, ulong, hi, ulong, lo, loff_t *, res, uint, wh);
- if (_llseek((unsigned) fd, (ulong) (offset >> 32), (ulong) (offset & 0xFFFFFFFF), &pos, SEEK_SET) < 0) { 
-*/
+#ifndef __dietlibc__
+extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
+#endif
 
 static LIST_INIT(_open_devices);
 
@@ -76,7 +74,7 @@
 		return 0;
 	}
 
-	if (lseek(fd, (off_t) where->start, SEEK_SET) < 0) {
+	if (lseek64(fd, where->start, SEEK_SET) < 0LL) {
 		log_sys_error("lseek", dev_name(where->dev));
 		return 0;
 	}
@@ -318,7 +316,7 @@
 #endif
 
 	if ((flags & O_CREAT) && !(flags & O_TRUNC)) {
-		dev->end = lseek(dev->fd, (off_t) 0, SEEK_END);
+		dev->end = lseek64(dev->fd, 0, SEEK_END);
 	}
 
 	list_add(&_open_devices, &dev->open_list);
--- LVM2.2.00.08/lib/label/label.c.skipmd	2003-08-26 23:12:05.000000000 +0200
+++ LVM2.2.00.08/lib/label/label.c	2004-01-25 02:22:05.309194536 +0100
@@ -98,6 +98,11 @@
 	return NULL;
 }
 
+#define MD_SB_MAGIC     0xa92b4efc
+#define MD_RESERVED_BYTES       (64 * 1024)
+#define MD_RESERVED_SECTORS     (MD_RESERVED_BYTES / SECTOR_SIZE)
+#define MD_NEW_SIZE_SECTORS(x)      ((x & ~(MD_RESERVED_SECTORS - 1)) - MD_RESERVED_SECTORS)
+
 static struct labeller *_find_labeller(struct device *dev, char *buf,
 				       uint64_t *label_sector)
 {
@@ -108,12 +113,26 @@
 	uint64_t sector;
 	int found = 0;
 	char readbuf[LABEL_SCAN_SIZE];
+	uint32_t md_magic;
 
 	if (!dev_open(dev)) {
 		stack;
 		return NULL;
 	}
 
+	/* check if it is an md component device */
+	dev_get_size(dev, &sector);
+	if (sector > MD_RESERVED_SECTORS*2) {
+		sector = MD_NEW_SIZE_SECTORS(sector);
+		sector *= SECTOR_SIZE; 
+		if (dev_read(dev, sector, sizeof(uint32_t), &md_magic)) {
+			if (md_magic == MD_SB_MAGIC) {
+				log_very_verbose("%s: Skipping md component device", dev_name(dev));
+				goto out;
+			}
+		}
+	}
+
 	if (!dev_read(dev, UINT64_C(0), LABEL_SCAN_SIZE, readbuf)) {
 		log_debug("%s: Failed to read label area", dev_name(dev));
 		goto out;

--azLHFNyN32YCQGCU--
