Return-Path: <mike@marxmeier.com>
Date: Thu, 7 Dec 2000 18:21:50 +0100
From: Luca Berra <bluca@comedia.it>
Message-ID: <20001207182150.C16469@colombina.comedia.it>
References: <3A2E0A5B.2EB3CCEB@elinux.com.sg> <20001206194935.A14728@colombina.comedia.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <20001206194935.A14728@colombina.comedia.it>; from bluca@comedia.it on Wed, Dec 06, 2000 at 07:49:35PM +0100
Subject: [linux-lvm] lvm 0.9 + raid (Was: WebMin LVM module development)
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
To: Michael Boman <michael@elinux.com.sg>, linux-lvm <linux-lvm@msede.com>, linux-raid <linux-raid@vger.kernel.org>, lvm-devel@sistina.com

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 06, 2000 at 07:49:35PM +0100, Luca Berra wrote:
> On Wed, Dec 06, 2000 at 05:43:55PM +0800, Michael Boman wrote:
> > 
> > - I have problem using MD as a PV of my VG, any hints what it can be?
...
> Tomorrow is holiday in Milan, so i will try to give it a look

here it is, or so i hope...
i dinna give it thorough testing, but it seems to work for me

comments on the patch:
Makefile.in: just put a version number in the library,
             so i can have different versions installed
pv_get_size.c: squashed an old bug that reappeared
vg_read_from_pv.c: it would have failed if pv_read said it was an MD, i also
              catch LVM_EPV_READ_PV_EXPORTED, since this is done in other
              places also
pv_read_uuidlist.c: same as above, this seems the right thing to me, but now
              lvm 0.8 tools dont' work anymore on this vg, 0.8.1 seems to
              work ok (?!?)
liblvm.h and vg_remove_dir_and_group_and_nodes.c: this is to work around a probable
              kernel bug with lvm and devfs, if the dev/vgXX directory was removed
			  it was the impossible to fill it again with devices.
			  I also believe that the kernel should create the lvm devices with devfs
			  but it doesn't.

Regards
L.
-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm_0.9.bluca.diff"

--- LVM/0.9/tools/lib/pv_get_size.c.bluca.orig	Mon Nov 13 01:20:11 2000
+++ LVM/0.9/tools/lib/pv_get_size.c	Sun Nov 26 10:53:09 2000
@@ -87,6 +87,7 @@
       goto pv_get_size_end;
    }
 
+   memset ( disk_dev_name, 0, sizeof ( disk_dev_name));
    if ( ( cache_entry = lvm_dir_cache_find ( dev_name)) != NULL) {
       if ( lvm_check_partitioned_dev ( cache_entry->st_rdev) == TRUE) {
          st_rdev = cache_entry->st_rdev -
@@ -96,14 +97,14 @@
             if ( dir_cache[i].st_rdev == st_rdev)
                break;
          }
-      }
+         strncpy ( disk_dev_name, dir_cache[i].dev_name, sizeof ( disk_dev_name) - 1);
+      } else {
+         strncpy ( disk_dev_name, dev_name, sizeof ( disk_dev_name) - 1);
+	  }
    } else {
       ret = -LVM_EPV_GET_SIZE_LVM_DIR_CACHE;
       goto pv_get_size_end;
    }
-
-   memset ( disk_dev_name, 0, sizeof ( disk_dev_name));
-   strncpy ( disk_dev_name, dir_cache[i].dev_name, sizeof ( disk_dev_name) - 1);
 
    first = 1;
    if ( ( pv_handle = open ( disk_dev_name, O_RDONLY)) == -1) {
--- LVM/0.9/tools/lib/Makefile.in.bluca.orig	Sun Nov 12 19:52:12 2000
+++ LVM/0.9/tools/lib/Makefile.in	Sun Nov 26 19:49:22 2000
@@ -32,9 +32,11 @@
 include ../tools_and_lib.make.tmpl
 
 ARCHIVE = liblvm.a
+SOV = liblvm.so.0.9.0
+SOM = liblvm.so.0.9
 SO = liblvm.so
 
-ALL_RM = $(ALL_OBJECTS) $(ARCHIVE) $(SO)
+ALL_RM = $(ALL_OBJECTS) $(ARCHIVE) $(SO) $(SOM) $(SOV)
 
 all_this: $(ARCHIVE) $(SO) Makefile
 	@echo ""
@@ -43,15 +45,17 @@
 
 install_this:
 	@echo "*** Installing $(ARCHIVE) and $(SO) in ${prefix}/lib ***"
-	@rm -f ${libdir}/${SO} ${libdir}/$(ARCHIVE);
+	@rm -f ${libdir}/${SO} ${libdir}/${SOV} ${libdir}/${SOM} ${libdir}/$(ARCHIVE);
 	@INSTALL@ -d ${libdir}
-	@INSTALL@ $(ARCHIVE) $(SO) ${libdir}
+	@INSTALL@ $(ARCHIVE) $(SOV) ${libdir}
 	chmod 444 ${libdir}/$(ARCHIVE)
-	chmod 555 ${libdir}/$(SO)
+	chmod 555 ${libdir}/$(SOV)
+	ln -s $(SOV) ${libdir}/${SO}
+	ln -s $(SOV) ${libdir}/${SOM}
 
 remove_this:
 	@echo "*** Removing $(ARCHIVE) and $(SO) in ${prefix}/lib ***"
-	@rm -f ${libdir}/${SO} ${libdir}/$(ARCHIVE);
+	@rm -f ${libdir}/${SO} ${libdir}/${SOV} ${libdir}/${SOM} ${libdir}/$(ARCHIVE);
 
 $(ALL_SOURCES):	liblvm.h $(OTHER_DEP)
 
@@ -64,7 +68,9 @@
 	ranlib $@
 
 $(SO):	$(ALL_OBJECTS)
-	ld -shared -o $(SO) $(ALL_OBJECTS)
+	gcc -shared -Wl,-soname,$(SOM) -o $(SOV) $(ALL_OBJECTS)
+	ln -sf $(SOV) $(SOM)
+	ln -sf $(SOV) $(SO)
 
 clean_this:
 	rm -f $(ALL_RM)
--- LVM/0.9/tools/lib/vg_read_from_pv.c.bluca.orig	Mon Nov 13 01:26:33 2000
+++ LVM/0.9/tools/lib/vg_read_from_pv.c	Thu Dec  7 11:38:54 2000
@@ -45,7 +45,9 @@
       goto vg_read_from_pv_end;
    }
 
-   if ( pv_read ( pv_name, &pv_this_ptr, NULL) == 0) {
+   if ( ( ret = pv_read ( pv_name, &pv_this_ptr, NULL)) == 0 ||
+	   ret == -LVM_EPV_READ_MD_DEVICE ||
+	   ret == -LVM_EPV_READ_PV_EXPORTED) {
       /* read the VG info */
       if ( ( pv_handle = open ( pv_name, O_RDONLY)) == -1)
          ret = -LVM_EVG_READ_OPEN;
@@ -53,6 +55,7 @@
                 pv_this_ptr->vg_on_disk.base) ret = -LVM_EVG_READ_LSEEK;
       else if ( read ( pv_handle, &vg_this, sizeof ( vg_this)) != \
                 sizeof ( vg_this)) ret = -LVM_EVG_READ_READ;
+      else ret = 0;
       if ( pv_handle != -1) close ( pv_handle);
    
       if ( ret == 0) {
--- LVM/0.9/tools/lib/liblvm.h.bluca.orig	Tue Nov 14 23:20:24 2000
+++ LVM/0.9/tools/lib/liblvm.h	Thu Dec  7 13:06:39 2000
@@ -108,6 +108,7 @@
 #define	LVMTAB_DIR              "/etc/lvmtab.d"	/* storage dir VG data */
 #define	LVMTAB_MINSIZE   ( sizeof ( vg_t) + sizeof ( lv_t) + sizeof ( pv_t))
 #define	LVM_DEV                 "/dev/lvm"
+#define	DEVFS_DEV               ".devfsd"
 #define	VG_BACKUP_DIR           "/etc/lvmconf"
 #define	DISK_NAME_LEN		8
 #define	LV_MIN_NAME_LEN		5
--- LVM/0.9/tools/lib/pv_read_uuidlist.c.bluca.orig	Mon Nov 20 03:14:51 2000
+++ LVM/0.9/tools/lib/pv_read_uuidlist.c	Thu Dec  7 11:44:16 2000
@@ -61,7 +61,9 @@
         pv_uuidlist == NULL) {
       ret = -LVM_EPARAM;
    } else {
-      if ( ( ret = pv_read ( pv_name, &pv_this_ptr, NULL)) == 0) {
+      if ( ( ret = pv_read ( pv_name, &pv_this_ptr, NULL)) == 0 ||
+              ret == -LVM_EPV_READ_MD_DEVICE ||
+              ret == -LVM_EPV_READ_PV_EXPORTED) {
          if ( ( pv_handle = open ( pv_name, O_RDONLY)) == -1)
             ret = -LVM_EPV_READ_UUIDLIST_OPEN;
          else if ( lseek ( pv_handle,
@@ -89,6 +91,7 @@
                         memset ( ptr, 0, NAME_LEN);
                      }
                   }
+		  ret = 0;
                }
                for ( i = 0; i < ABS_MAX_PV - 1; i++) {
                   ptr = this_pv_uuidlist + i * NAME_LEN;
--- LVM/0.9/tools/lib/vg_remove_dir_and_group_and_nodes.c.bluca.orig	Mon Nov 13 01:20:11 2000
+++ LVM/0.9/tools/lib/vg_remove_dir_and_group_and_nodes.c	Thu Dec  7 13:24:58 2000
@@ -43,11 +43,14 @@
    debug_enter ( "vg_remove_dir_and_group_and_nodes -- CALLED\n");
 #endif
 
-   if ( vg_name != NULL && vg_check_name ( vg_name) == 0) {
+   if ( vg_name == NULL || vg_check_name ( vg_name) < 0) ret = -LVM_EPARAM;
+   /* should be a warning, but i would have to catch it */
+   else if ( access ( LVM_DIR_PREFIX "/" DEVFS_DEV, F_OK) == 0 ) ret = 0;
+   else {
       /* remove the volume group directory */
       sprintf ( buffer, LVM_DIR_PREFIX "%s%c", vg_name, 0);
       ret = lvm_remove_recursive ( buffer);
-   } else ret = -LVM_EPARAM;
+   }
 
 #ifdef DEBUG
    debug_leave ( "vg_remove_dir_and_group_and_nodes -- LEAVING with ret: %d\n",

--UlVJffcvxoiEqYs2--
