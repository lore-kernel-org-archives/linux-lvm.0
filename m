Date: Sun, 22 Oct 2000 16:22:53 +0200
From: Luca Berra <bluca@comedia.it>
Subject: [linux-lvm] more LVM 0.8 patches
Message-ID: <20001022162253.C24630@colombina.comedia.it>
Reply-To: bluca@comedia.it
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hello here are more lvm patches.
they apply over patches in lvm-0.8final-3.3.src.rpm
1st chunk is needed to compile on my system (mine only?? K6-2, kernel 2.4.0-test8, glibc 2.1.3, pgcc-2.95.3)
2nd chunk is nice for devfs
3rd chunk is NEEDED for lvm over raid

I am still missing something on the vgchange front, the binary version i saved
before trashing my whole system this summer works, the one built from
these sources doesn't.

Regards
L.
-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.

--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="LVM.DIFF"

--- 0.8final/tools/lib/liblvm.h.bluca	Fri Oct 20 00:22:27 2000
+++ 0.8final/tools/lib/liblvm.h	Fri Oct 20 00:22:08 2000
@@ -70,7 +70,10 @@
 #include <linux/major.h>
 #include <linux/genhd.h>
 
+#include <stdint.h>
+#define __KERNEL__
 #include <linux/lvm.h>
+#undef __KERNEL__
 
 #ifndef uint8_t
 #  define uint8_t	u_int8_t
--- 0.8final/tools/lib/lvm_dir_cache.c.bluca	Fri Oct 20 00:22:27 2000
+++ 0.8final/tools/lib/lvm_dir_cache.c	Fri Oct 20 00:22:08 2000
@@ -59,8 +59,8 @@
    char major[20] = { 0, };
    char minor[20] = { 0, };
    char blocks[20] = { 0, };
-   char devname[30] = { 0, };
-   char procline[127] ;
+   char devname[127] = { 0, };
+   char procline[256] ;
    static char *devdir[] = {
       "/dev/ida",
       "/dev/ide/hd",
--- 0.8final/tools/lib/pv_get_size.c.bluca	Fri Oct 20 00:22:27 2000
+++ 0.8final/tools/lib/pv_get_size.c	Fri Oct 20 00:22:08 2000
@@ -96,14 +96,18 @@
             if ( dir_cache[i].st_rdev == st_rdev)
                break;
          }
+         memset ( disk_dev_name, 0, sizeof ( disk_dev_name));
+         strncpy ( disk_dev_name, dir_cache[i].dev_name, sizeof ( disk_dev_name) - 1);
+      } else {
+         memset ( disk_dev_name, 0, sizeof ( disk_dev_name));
+         strncpy ( disk_dev_name, dev_name, sizeof ( disk_dev_name) - 1);
+
       }
    } else {
       ret = -LVM_EPV_GET_SIZE_LVM_DIR_CACHE;
       goto pv_get_size_end;
    }
 
-   memset ( disk_dev_name, 0, sizeof ( disk_dev_name));
-   strncpy ( disk_dev_name, dir_cache[i].dev_name, sizeof ( disk_dev_name) - 1);
 
    first = 1;
    if ( ( pv_handle = open ( disk_dev_name, O_RDONLY)) == -1) {

--y0ulUmNC+osPPQO6--
