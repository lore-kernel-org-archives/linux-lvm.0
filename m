Date: Thu, 20 Jul 2000 02:49:21 +0900
Message-ID: <874s5mau3i.wl@strawberry.hibi-local.net>
From: HIBINO Kei <ex8k-hbn@asahi-net.or.jp>
Subject: [linux-lvm] vgremove stops with Segmentation fault
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


Hi.

The 'vgremove' executable in LVM 0.8final refers to unused pointer variable.

--- lvm-0.8j.final.orig/tools/vgremove.c
+++ lvm-0.8j.final/tools/vgremove.c
@@ -70,7 +70,6 @@
    };
    char *vg_name = NULL;
    vg_t *vg = NULL;
-   pv_t **pv = NULL;
 
    cmd = basename ( argv[0]);
 
@@ -195,7 +194,7 @@
                                cmd, vg_name);
       for ( p = 0; vg->pv[p] != NULL; p++) {
          if ( opt_v > 0) printf ( "%s -- initializing physical volume \"%s\"\n",
-                                  cmd, pv[p]->pv_name);
+                                  cmd, vg->pv[p]->pv_name);
          if ( ( ret = pv_setup_for_create ( vg->pv[p]->pv_name, vg->pv[p],
                                             vg->pv[p]->pv_size)) < 0) {
             fprintf ( stderr, "%s -- ERROR \"%s\" initializing physical "

-- 
//  HIBINO Kei
//  ex8k-hbn@asahi-net.or.jp
