Message-ID: <38B98326.1D291C28@msede.com>
Date: Sun, 27 Feb 2000 21:03:50 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: [linux-lvm] proposed change in lvm_dir_cache.c
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Heinz Mauelshagen <mge@ez-darmstadt.telekom.de>, linux-lvm@msede.com

The patch below will work around a problem with the LVM scan code.
If no valid block devices could be found using /proc/partitions 
the LVM scan code will fallback to scan /dev.

This happened to me when compiling devfs in the kernel without
mounting it in /dev (by using the devfs=nomount option).
In this case /proc/partitions returns block device names
relative to the devfs mount point.

Michael

--- 0.8final/tools/lib/lvm_dir_cache.c.orig     Sun Feb 27 20:46:41
2000
+++ 0.8final/tools/lib/lvm_dir_cache.c  Sun Feb 27 20:47:23 2000
@@ -91,7 +91,8 @@
              }
          }   
          fclose ( proc);
-      } else {
+      }
+      if(!cache_size) {
          for ( d = 0; devdir[d] != NULL; d++) {
             dirname = devdir[d];
 #ifdef DEBUG

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
