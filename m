Return-Path: <dmeyer@dmeyer.net>
Date: Thu, 18 Jan 2001 19:53:39 -0500
From: dmeyer@dmeyer.net
Message-ID: <20010118195339.A20806@jhereg.dmeyer.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] is this patch still needed?
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've been running with the following patch, which doesn't seem to have
made it into 0.9.1-beta[12].  Is it still needed?  With 0.9, it fixed
what seemed to be a fairly serious problem.

Index: pv_read_all_pv_of_vg.c
===================================================================
RCS file: /data/cvs/LVM/tools/lib/pv_read_all_pv_of_vg.c,v
retrieving revision 1.3.2.3
diff -u -r1.3.2.3 pv_read_all_pv_of_vg.c
--- pv_read_all_pv_of_vg.c	2001/01/17 14:45:28	1.3.2.3
+++ pv_read_all_pv_of_vg.c	2001/01/19 00:48:34
@@ -101,17 +101,17 @@
       for ( p = 0; pv_tmp[p] != NULL; p++) {
          if ( strncmp ( pv_tmp[p]->vg_name, vg_name, NAME_LEN) == 0) {
             pv_this_sav = pv_this;
+	    if ( np < pv_tmp[p]->pv_number) np = pv_tmp[p]->pv_number;
             if ( ( pv_this = realloc ( pv_this,
-                                       ( np + 2) * sizeof ( pv_t*))) == NULL) {
+                                       ( np + 1) * sizeof ( pv_t*))) == NULL) {
                fprintf ( stderr, "realloc error in %s [line %d]\n",
                                  __FILE__, __LINE__);
                ret = -LVM_EPV_READ_ALL_PV_OF_VG_MALLOC;
                if ( pv_this_sav != NULL) free ( pv_this_sav);
                goto pv_read_all_pv_of_vg_end;
             }
-            pv_this[np] = pv_tmp[p];
-            pv_this[np+1] = NULL;
-            np++;
+	    pv_this[pv_tmp[p]->pv_number-1] = pv_tmp[p];
+            pv_this[np] = NULL;
          }
       }
 


-- 
David M. Meyer
dmeyer@dmeyer.net
