Date: Sat, 15 Apr 2000 20:35:15 +0200
From: bert hubert <ahu@ds9a.nl>
Subject: [linux-lvm] [Patch] lvchange better error reporting
Message-ID: <20000415203514.A21662@home.ds9a.nl>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mauelsha@ez-darmstadt.telekom.de, linux-lvm@msede.com

Heinz, people,

It annoyed me that lvchange sometimes reported that volume group "(null)"
was invalid. This patch fixes this behaviour. Please apply.

diff -u -r 0.8final.orig/tools/lvchange.c 0.8final/tools/lvchange.c
--- 0.8final.orig/tools/lvchange.c	Tue Feb 22 03:09:33 2000
+++ 0.8final/tools/lvchange.c	Sat Apr 15 20:32:34 2000
@@ -255,9 +255,15 @@
       /* does VG exist? */
       if ( opt_v > 0) printf ( "%s -- checking volume group existence\n", cmd);
       if ( lvm_tab_vg_check_exist ( vg_name, NULL) != TRUE) {
-         fprintf ( stderr, "%s -- can't change logical volume: volume group "
-                           "\"%s\" doesn't exist\n\n", cmd, vg_name);
-         return LVM_ELVCHANGE_VG_CHECK_EXIST;
+        
+         if(vg_name)
+            fprintf ( stderr, "%s -- can't change logical volume: volume group "
+                 "\"%s\" doesn't exist\n\n", cmd, vg_name);
+         else
+            fprintf ( stderr, "%s -- can't change logical volume: need to specify "
+                              "volume group\n\n", cmd);
+                              
+         return LVM_ELVCHANGE_VG_CHECK_EXIST;
       }
 
       if ( opt_v > 0) printf ( "%s -- checking for active volume "

-- 
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
