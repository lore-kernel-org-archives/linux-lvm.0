Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Mon, 12 Feb 2001 16:12:12 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lv nodes in /dev ??
Message-ID: <20010212161212.J522@tykepenguin.com>
References: <200102071815.f17IFtN14302@webber.adilger.net> <20010212114109.14372.qmail@web10909.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010212114109.14372.qmail@web10909.mail.yahoo.com>; from penguin_master_2000@yahoo.com on Mon, Feb 12, 2001 at 03:41:09AM -0800
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

On Mon, Feb 12, 2001 at 03:41:09AM -0800, Mr. Penguin wrote:
> Hi people
> 
> Just noticed that all my LVs have nodes not only in
> /dev/vg00/ but also /dev !

try this patch - it seems to work for me.

patrick

Index: kernel/lvm.c
===================================================================
RCS file: /home/cvs/LVM/kernel/lvm.c,v
retrieving revision 1.7.2.41
diff -u -r1.7.2.41 lvm.c
--- kernel/lvm.c        2001/02/09 13:09:31     1.7.2.41
+++ kernel/lvm.c        2001/02/12 16:11:14
@@ -1984,6 +1984,10 @@
        }
        memset(snap_lv_ptr, 0, size);
 
+#if LINUX_VERSION_CODE > KERNEL_VERSION ( 2, 3, 46)
+       lvm_do_create_devfs_entry_of_vg ( vg_ptr);
+#endif
+
        /* get the logical volume structures */
        vg_ptr->lv_cur = 0;
        for (l = 0; l < vg_ptr->lv_max; l++) {
@@ -2007,10 +2011,6 @@
                        }
                }
        }
-
-#if LINUX_VERSION_CODE > KERNEL_VERSION ( 2, 3, 46)
-       lvm_do_create_devfs_entry_of_vg ( vg_ptr);
-#endif
 
        /* Second path to correct snapshot logical volumes which are not
           in place during first path above */
