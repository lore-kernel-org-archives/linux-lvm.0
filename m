Message-Id: <2D0AFEFEE711D611923E009027D39F2B02F140@cdserv.meridian-data.com>
From: "Stephenson, Dale" <dstephenson@snapserver.com>
MIME-Version: 1.0
Subject: [linux-lvm] Patch for vg_status_with_pv_and_lv.c
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
Date: Wed May  1 14:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

I'm not sure if I sent this patch out when I generated it (I'm guessing not,
since it doesn't seem to be different in CVS), so I'm sending it out now.

This patch solves a segfault in lvscan.  When there was a problem reading
the lv_list (lv_status_all_lv_of_vg() returned an error) in
vg_status_with_pv_and_lv.c, the routine would still call
vg_setup_pointers_for_snapshots.  Since the error had prevented setting up
the vg->lv[] array, this didn't work.  I just moved
vg_setup_pointers_for_snapshot inside the no error case.  No one uses the vg
if an error is returned, so it doesn't matter that it isn't setup for
snapshots :->.

Dale J. Stephenson
steph@snapserver.com

--- 1.0.3/tools/lib/vg_status_with_pv_and_lv.c.orig	Thu Apr 11 10:45:18
2002
+++ 1.0.3/tools/lib/vg_status_with_pv_and_lv.c	Thu Apr 11 10:45:41 2002
@@ -57,10 +57,10 @@
       for ( p = 0; pv[p] != NULL; p++) (*vg)->pv[p] = pv[p];
       for ( ; p < (*vg)->pv_max; p++) (*vg)->pv[p] = NULL;
       for ( l = 0; l < (*vg)->lv_max; l++) (*vg)->lv[l] = lv[l];
-   }
 
-   /* Set up core pointers for snapshots */
-   vg_setup_pointers_for_snapshots ( *vg);
+      /* Set up core pointers for snapshots */
+      vg_setup_pointers_for_snapshots ( *vg);
+   }
 
    debug_leave ( "vg_status_with_pv_and_lv -- LEAVING with ret: %d\n",
ret);
    return ret;
