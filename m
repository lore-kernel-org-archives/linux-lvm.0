Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102070944.f179iw508184@webber.adilger.net>
Subject: Re: [linux-lvm] 0.9.1 vgscan doesn't detect upgraded vg's
In-Reply-To: <3A7F6413.A80D1803@twisted.net> from Michael McLinn at "Feb 5, 2001
 09:40:19 pm"
Date: Wed, 7 Feb 2001 02:44:58 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Michael McLinn writes:
> I look at the output of pvdata -U on a physical volume. 
> I see 3 UUID slots, which matches the number of pv's in the vg.
> However, on the first pv in the vg, only the first one is filled.
> On the second pv in the vg, the first two are filled.  On the 
> third pv of the vg, all three are filled. 

I've found the source of this bug.  It is as follows, assuming an
old VG with no UUID information:

vg_write_with_pv_and_lv() is called to write VGDA to disk
for each PVs in the VG do
   vg_write() - writes out VG data
   pv_write_with_pe() - writes out PV data, creates new UUID if needed
   pv_write_uuidlist() - writes out current UUID list
   lv_write_all_lv() - writes out LV data
done

The problem is that UUIDs are being created as we go, so the UUID list
on the first PV only has the first PV UUID in it.  Exactly the problem
you are having.  I would think this problem would also show up with the
PV namelist as well, but maybe things were done slightly differently then.
It is probably that if you make more than one change which writes out the
VGDA, the problem is gone because the UUIDs now exist on all PVs.

The fix is to verify/fix the UUID list before we start writing PV info.
It appears that vg_write_with_pv_and_lv() is the only place that the UUID
list is written, via pv_write_uuidlist().

Unfortunately, this doesn't help anyone that currently has a problem, but
it will prevent such problems for anyone else upgrading their system.

Cheers, Andreas
========================================================================
diff -u -u -r1.1 pv_write_uuidlist.c
--- tools/lib/pv_write_uuidlist.c	2000/11/13 00:26:33	1.1
+++ tools/lib/pv_write_uuidlist.c	2001/02/07 09:00:08
@@ -30,6 +30,8 @@
  *
  *    08/02/2000 - use debug_enter()/debug_leave()
  *    17/03/2000 - changed namelist to uuidlist
+ *    02/07/2001 - ensure we have valid UUIDs for all PVs before writing [AED]
+ *               - use memcpy instead of strncpy for UUIDs
  *
  */
   
@@ -37,7 +39,7 @@
 
 
 int pv_write_uuidlist ( char *pv_name, vg_t *vg) {
-   int p = 0, pp = 0;
+   int p = 0;
    int pv_handle = -1;
    int ret = 0;
    int size = 0;
@@ -61,14 +63,23 @@
                            __FILE__, __LINE__);
          ret = LVM_EPV_WRITE_UUIDLIST_MALLOC;
       } else {
-         memset ( pv_uuid_list, 0, size);
-         for ( p = 0; p < vg->pv_max; p++) {
-            if ( vg->pv[p] != NULL) {
-               strncpy ( &pv_uuid_list[pp*NAME_LEN],
-                         vg->pv[p]->pv_uuid,
-                         UUID_LEN);
-               pp++;
-            }
+         char *u = memset(pv_uuid_list, 0, size);
+         for (p = 0; p < vg->pv_max; p++) {
+            pv_t *pv = vg->pv[p];
+            if (pv == NULL)
+               continue;
+
+            /* Create/fix UUIDs for any PVs that need it */
+            if (lvm_check_uuid(pv->pv_uuid) < 0) {
+#ifdef DEBUG
+               debug(__FUNCTION__ " -- creating new UUID for PV %s\n",
+                     pv->pv_name);
+#endif
+               memset(pv->pv_uuid, 0, sizeof(pv->pv_uuid));
+               memcpy(pv->pv_uuid, lvm_create_uuid(UUID_LEN), UUID_LEN);
+            }
+            memcpy(u, pv->pv_uuid, UUID_LEN);
+            u += NAME_LEN;
          }
          if ( write ( pv_handle, pv_uuid_list, size) != size)
             ret = -LVM_EPV_WRITE_UUIDLIST_WRITE;
diff -u -u -r1.2 vg_write_with_pv_and_lv.c
--- tools/lib/vg_write_with_pv_and_lv.c	2000/11/13 00:20:11	1.2
+++ tools/lib/vg_write_with_pv_and_lv.c	2001/02/07 09:00:21
@@ -55,9 +55,9 @@
                   vg->pv[p]->pv_name);
 #endif
          if ( ( ret = vg_write ( vg->pv[p]->pv_name, vg->pv[p], vg)) < 0) break;
+         if ( ( ret = pv_write_uuidlist ( vg->pv[p]->pv_name, vg)) < 0) break;
          if ( ( ret = pv_write_with_pe ( vg->pv[p]->pv_name,
                                          vg->pv[p])) < 0) break;
-         if ( ( ret = pv_write_uuidlist ( vg->pv[p]->pv_name, vg)) < 0) break;
          if ( ( ret = lv_write_all_lv ( vg->pv[p]->pv_name, vg)) < 0)
             break;
       }
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
