Date: Wed, 19 Apr 2000 19:51:41 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: [linux-lvm] lvm-tools patches
Message-ID: <20000419195141.K21935@vestdata.no>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=vkogqOf2sHV7VnPd
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: LVM Mailing List <linux-lvm@msede.com>


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

I've attached a few small patches for lvm-tools (0.8final).

* lvm-compile.patch changes gnu/types.h to sys/types.h - it would not
  compile without this change. (On RH 6.2)
* lvm-lvdisplay fixes a bug that made it impossible to use "-v -v".
* lvm-pvmove removes the source-PV equals dest-PV test. I can't see any
  reason for this - I want to be able to move my PEs around on the same=20
  disk....



--=20
Ragnar Kj=EF=BF=BDrstad

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm-compile.patch"

--- LVM/0.8final.orig/tools/lib/liblvm.h	Tue Feb 22 03:09:32 2000
+++ LVM/0.8final/tools/lib/liblvm.h	Wed Apr 19 19:12:11 2000
@@ -47,7 +47,7 @@
 #  include <linux/version.h>
 #endif
 
-#include <gnu/types.h>
+#include <sys/types.h>
 
 #include <sys/stat.h>
 

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm-lvdisplay.patch"

--- LVM/0.8final.orig/tools/lvdisplay.c	Tue Feb 22 03:09:33 2000
+++ LVM/0.8final/tools/lvdisplay.c	Wed Apr 19 19:14:33 2000
@@ -149,7 +149,7 @@
       return LVM_ELVDISPLAY_LV_MISSING;
    }
 
-   if ( opt_c + opt_v > 1) {
+   if ( opt_c && opt_v ) {
       fprintf ( stderr, "%s -- option v not allowed with option c\n\n", cmd);
       return LVM_ELVDISPLAY_LV_MISSING;
    }

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm-pvmove.patch"

--- LVM/0.8final.orig/tools/pvmove.c	Tue Feb 22 03:09:33 2000
+++ LVM/0.8final/tools/pvmove.c	Wed Apr 19 19:33:12 2000
@@ -292,13 +292,6 @@
       return LVM_EPVMOVE_VG_CHECK_CONSISTENCY;
    }
 
-   if ( vg->pv_cur == 1) {
-      fprintf ( stderr, "%s -- volume group \"%s\" only has 1 "
-                        "physical volume\n\n",
-                        cmd, vg_name);
-      return LVM_EPVMOVE_PV_CUR;
-   }
-
    /* get index of source physical volume */
    if ( opt_v > 0) printf ( "%s -- searching for source physical volume \"%s\" "
                             "in volume group \"%s\"\n",

--vkogqOf2sHV7VnPd--
