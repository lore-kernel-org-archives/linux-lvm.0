Return-Path: <bcorsello@usa.net>
Date: Sat, 06 Jan 2001 23:08:03 -0500
From: Brad Corsello <bcorsello@usa.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-Path: bcorsello@usa.net
Message-ID: <04b311608040711NYCSMTP1@nyc.rr.com>
Subject: [linux-lvm] LVM 0.9 vgscan problem
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
To: linux-lvm@sistina.com

OK, Jan's patch fixed the vgextend problem on my machine, at least.  I
manually made the changes to the lvm.c that ships with 2.4.0 and recompiled
the module, and I succesfully did a few vgextend operations.  We're just
commenting out one line and adding two lines in a different place.  Jan's
patch does not appear to be against the version of lvm.c that ships with
2.4.0, so I didn't try to apply it.  A patch against the version of lvm.c that
ships with 2.4.0 follows (sorry if the format is wrong, I don't usually do
this sort of thing):

---------------

--- lvmbackup/lvm.c     Fri Jan  5 19:10:25 2001
+++ /usr/src/linux/drivers/md/lvm.c     Sat Jan  6 22:41:22 2001
@@ -2021,9 +2021,10 @@ static int lvm_do_vg_extend(vg_t *vg_ptr
                for (p = 0; p < vg_ptr->pv_max; p++) {
                        if ( ( pv_ptr = vg_ptr->pv[p]) == NULL) {
                                ret = lvm_do_pv_create(arg, vg_ptr, p);
-                               lvm_do_create_proc_entry_of_pv ( vg_ptr,
pv_ptr);
+/*                             lvm_do_create_proc_entry_of_pv ( vg_ptr,
pv_ptr); */
                                if ( ret != 0) return ret;
-       
+                               pv_ptr = vg_ptr->pv[p];
+                               lvm_do_create_proc_entry_of_pv ( vg_ptr,
pv_ptr);
                                /* We don't need the PE list
                                   in kernel space like LVs pe_t list */
                                pv_ptr->pe = NULL;
