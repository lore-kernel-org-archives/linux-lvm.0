Message-ID: <371DC3C7.4289340F@rbgkew.org.uk>
Date: Wed, 21 Apr 1999 13:25:43 +0100
From: Matthew Taylor <m.taylor@rbgkew.org.uk>
MIME-Version: 1.0
Subject: [linux-lvm] LVM on DAC960(Mylex) Raid
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Here is a patch to get LVM-0.6 to work on DAC960(see
http://www.dandelion.com/Linux/DAC960.html )


diff -u -r LVM/0.6/tools/lib/lvm_check_dev.c
LVM.DAC960/0.6/tools/lib/lvm_check_dev.c
--- LVM/0.6/tools/lib/lvm_check_dev.c Fri Feb 26 00:46:28 1999
+++ LVM.DAC960/0.6/tools/lib/lvm_check_dev.c Thu Apr 15 14:23:56 1999
@@ -62,6 +62,9 @@
       IDE4_MAJOR,
       IDE5_MAJOR,
 #endif
+#ifdef DAC960_MAJOR
+      DAC960_MAJOR,
+#endif
 #ifdef MD_MAJOR
       MD_MAJOR,
 #endif
diff -u -r LVM/0.6/tools/lib/lvm_dir_cache.c
LVM.DAC960/0.6/tools/lib/lvm_dir_cache.c
--- LVM/0.6/tools/lib/lvm_dir_cache.c Fri Feb 26 00:46:28 1999
+++ LVM.DAC960/0.6/tools/lib/lvm_dir_cache.c Thu Apr 15 16:33:41 1999
@@ -48,6 +48,7 @@
       "/dev/ide/hd",
       "/dev/sd",
       "/dev/md",
+      "/dev/rd",
       "/dev",
       NULL
    };
@@ -147,7 +148,15 @@
           dirent->d_name[0] == 'm') &&   /* old /dev/md[a-z]* special
*/
           dirent->d_name[1] == 'd')      /* the 'd' of the 3 above */
       return 1;
-
+   /*Check for DAC960 devices*/
+   if ( strcmp ( dirname, "/dev/rd") == 0 &&
+ (dirent->d_name[0] == 'c' &&    /* /dev/rd/c[0-1]d[0-7]p[0-7]  */
+  dirent->d_name[2] == 'd' &&
+  dirent->d_name[4] == 'p') )
+     return 1;
+
+
+
    return 0;
 }

diff -u -r LVM/0.6/tools/lib/pv_check_name.c
LVM.DAC960/0.6/tools/lib/pv_check_name.c
--- LVM/0.6/tools/lib/pv_check_name.c Fri Feb 26 00:46:28 1999
+++ LVM.DAC960/0.6/tools/lib/pv_check_name.c Wed Apr 21 12:56:56 1999
@@ -49,6 +49,7 @@
       { "/dev/",         5},
       { "/dev/sd/",      8},
       { "/dev/ide/hd/", 12},
+      { "/dev/rd/",      8},
       { "/dev/md/",      8},
       { NULL,            0}
    };
@@ -66,13 +67,13 @@
       }
       if ( dir[i].directory == NULL) ret = -LVM_EPV_CHECK_NAME;
    }
-
+
    if ( ret == 0) {
       if ( stat ( pv_name, &stat_b) == -1) ret =
-LVM_EPV_CHECK_NAME_STAT;
       else if ( lvm_check_dev ( &stat_b, TRUE) == FALSE)
          ret = -LVM_EPV_CHECK_NAME;
    }
-
+
 #ifdef DEBUG
    if ( ret == 0) {
       debug ( "pv_check_name -- CALLED  pv_name: \"%s\"\n", pv_name);


--
*Matthew Taylor:Computer section  email: M.Taylor@rbgkew.org.uk *
* The Royal Botanic Gardens, Kew, Tel : +44 (0)181 332 5714      *
* Richmond, Surrey, TW9 3AB, UK   Fax : +44 (0)181 332 5736      *
