Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103201925.f2KJPVm02621@webber.adilger.int>
Subject: Re: [linux-lvm] vgscan won't recognize my VG
In-Reply-To: <3AB7A6F4.4EFA644D@in.tum.de> from David Vidal Rodriguez at "Mar
 20, 2001 07:52:37 pm"
Date: Tue, 20 Mar 2001 12:25:30 -0700 (MST)
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

David Vidal R. (vidalrod@in.tum.de) writes:
> OK, I have compiled the beta6 tools.
> 
> 1) How do I know if the clean linus-2.4.0 kernel has a beta2 lvm module?

cat /proc/lvm/global will tell you.

> 2) And how do I repair the UUIDs of my PVs?

You should be able to do "vgcfgrestore" and it will write the UUIDs to
disk correctly (creating new ones if needed).

> 3) Could you tell me where can I download the patch you mentioned?

Patch below.  Only needed if you have < beta6 kernel code.  It probably
should be put into the standard tools, however, because a lot of people
are still using beta2 kernel code.

Cheers, Andreas
=========================================================================
diff -u -u -r1.2.2.8 vg_create_remove.c
--- tools/lib/vg_create_remove.c	2001/02/20 11:52:44	1.2.2.8
+++ tools/lib/vg_create_remove.c	2001/03/16 16:54:54
@@ -36,57 +36,63 @@
 
 #include <liblvm.h>
 
-/* internal function */
-int vg_create_remove ( char *, vg_t *, int);
+static int vg_create_remove ( const char *lvm_dev_name, vg_t *vg, int ioc)
+{
+   int lvm_dev;
+   int ret = 0;
 
+   if ( ( lvm_dev = open ( lvm_dev_name, O_RDWR)) == -1)
+      ret = -LVM_EVG_CREATE_REMOVE_OPEN;
+   else {
+      debug ( "vg_create_remove -- IOCTL %x on %s with VG ptr %p\n",
+	      ioc, lvm_dev_name, vg);
+      if ( ( ret = ioctl ( lvm_dev, ioc, vg)) == -1)
+         ret = -errno;
+      debug ( "vg_create_remove -- IOCTL returned: %d\n", ret);
+      close ( lvm_dev);
+   }
 
-int vg_create ( char *vg_name, vg_t *vg) {
-   return vg_create_remove ( vg_name, vg, VG_CREATE);
+   return ret;
 }
 
 
-int vg_remove ( char *vg_name) {
-   return vg_create_remove ( vg_name, NULL, VG_REMOVE);
-}
+int vg_create ( vg_t *vg)
+{
+   int ret;
+
+   debug_enter ( "vg_create -- CALLED with VG %s\n", vg ? vg->vg_name: "NULL");
+
+   ret = vg_check_consistency ( vg);
+   if (ret == 0) {
+      ret = vg_create_remove ( LVM_DEV, (void *)vg, VG_CREATE);
+#ifdef VG_CREATE_OLD
+      if (ret == -EINVAL) {
+         char lvm_dev_name[NAME_LEN];
 
-
-int vg_create_remove ( char *vg_name, vg_t *vg, int cr) {
-   int lvm_dev = -1;
-   int ret = 0;
-	char lvm_dev_name[NAME_LEN];
-
-   debug_enter ( "vg_create_remove -- CALLED\n");
+         sprintf ( lvm_dev_name, LVM_DIR_PREFIX "%s/group", vg->vg_name);
+         ret = vg_create_remove ( lvm_dev_name, (void *)vg, VG_CREATE_OLD);
+      }
+#endif
+   }
 
-   switch ( cr) {
-      case VG_CREATE:
-	 strcpy(lvm_dev_name, LVM_DEV);
-	 if ( vg_name == NULL ||
-              vg == NULL ||
-              vg_check_name ( vg_name) < 0 ||
-              vg_check_consistency ( vg) < 0) ret = -LVM_EPARAM;
-         break;
-
-      case VG_REMOVE:
-         sprintf(lvm_dev_name, LVM_DIR_PREFIX "%s/group", vg_name);
-         if ( vg_name == NULL ||
-              vg_check_name ( vg_name) < 0) ret = -LVM_EPARAM;
-         break;
+   debug_leave ( "vg_create -- LEAVING with ret: %d\n", ret);
+   return ret;
+}
 
-      default:
-         ret = -LVM_EPARAM;
-   }
+int vg_remove ( char *vg_name)
+{
+   int ret;
+
+   debug_enter ( "vg_remove -- CALLED with VG %s\n", vg_name);
+
+   ret = vg_check_name ( vg_name);
+   if (ret == 0) {
+      char lvm_dev_name[NAME_LEN];
 
-   if ( ret == 0) {
-      if ( ( lvm_dev = open ( lvm_dev_name, O_RDWR)) == -1)
-         ret = -LVM_EVG_CREATE_REMOVE_OPEN;
-      else {
-         debug ( "vg_create_remove -- IOCTL\n");
-         if ( ( ret = ioctl ( lvm_dev, cr, vg)) == -1) ret = -errno;
-         debug ( "vg_create_remove -- IOCTL returned: %d\n", ret);
-      }
-      if ( lvm_dev != -1) close ( lvm_dev);
+      sprintf ( lvm_dev_name, LVM_DIR_PREFIX "%s/group", vg_name);
+      ret = vg_create_remove ( lvm_dev_name, NULL, VG_REMOVE);
    }
 
-   debug_leave ( "vg_create_remove -- LEAVING with ret: %d\n", ret);
+   debug_leave ( "vg_remove -- LEAVING with ret: %d\n", ret);
    return ret;
 }

-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
