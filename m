From: Luca Berra <bluca@comedia.it>
Message-Id: <20020305082545.GC30667@colombina.comedia.it>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
Subject: [linux-lvm] Redhat patches to LVM-1.0.3 tools
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
Date: Tue Mar  5 02:25:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hello i took a peek to redhat rawhide lvm 1.0.3 patches
and i found something interesting:

there is a patch for a new version of the pvmove call, which is
probably accompained by a kernel patch, which i did not search
for.

i don't recall seeing anything like this on the list, but maybe
i just missed it.
anyone here has any details about this?

regards,
L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm-1.0.3-pvmove.patch"

--- LVM/1.0.3/kernel/lvm.h.~1~	Tue Feb 19 16:23:56 2002
+++ LVM/1.0.3/kernel/lvm.h	Wed Feb 20 17:52:51 2002
@@ -352,6 +352,7 @@
 
 /* physical extent */
 #define	PE_LOCK_UNLOCK          _IOW ( 0xfe, 0x50, 1)
+#define	PE_LOCKED_COPY          _IOW ( 0xfe, 0x51, 1)
 
 /* i/o protocol version */
 #define	LVM_GET_IOP_VERSION     _IOR ( 0xfe, 0x98, 1)
@@ -709,6 +710,16 @@
 } pe_lock_req_t;
 
 
+/* Request structure PE_COPY */
+typedef struct {
+	char lv_name[NAME_LEN];
+	kdev_t old_dev;
+	kdev_t new_dev;
+	uint32_t old_pe;
+	uint32_t new_pe;
+} pe_copy_req_t;
+
+
 /* Request structure LV_STATUS_BYNAME */
 typedef struct {
 	char lv_name[NAME_LEN];
--- LVM/1.0.3/tools/lib/liblvm.h.~1~	Wed Feb 20 17:52:21 2002
+++ LVM/1.0.3/tools/lib/liblvm.h	Wed Feb 20 17:53:53 2002
@@ -329,6 +329,7 @@
 int    pv_write_pe ( char*, pv_t *);
 int    pv_write_with_pe ( char*, pv_t *);
 int    pv_check_partitioned_whole(char *pv_name);
+int    pv_locked_copy_pe( vg_t *, char *, kdev_t, kdev_t, uint, uint);
 
 /* LV functions */
 char   *lv_change_vgname ( char *, char *);
@@ -816,7 +817,8 @@
 #define LVM_EVG_WRITE_WRITE                                                 404
 #define LVM_ELV_PV_CREATE_NAME_FROM_KDEV_T                                  405
 #define LVM_EPV_FLUSH_STAT                                                  406
-#define LVM_MAX_ERROR							    407
+#define LVM_EPV_LOCKED_COPY_EINVAL					    407
+#define LVM_MAX_ERROR							    408
 
 
 /*
--- LVM/1.0.3/tools/lib/pv_move.c.~1~	Mon Feb 18 16:37:18 2002
+++ LVM/1.0.3/tools/lib/pv_move.c	Wed Feb 20 18:03:33 2002
@@ -347,11 +347,16 @@
 
 
 /* perform the move of a physical extent */
+/* Dynamically choose between the old and new version of the pvmove
+   mechanism.  The old-style code performs the buffer copy, locking and
+   remap in separate operations, and copies the chunks in user space.
+   The new version uses a single kernel ioctl to do it all, but that
+   (obviously) relies on having an updated kernel. */
 int pv_move_pe ( vg_t *vg, char *buffer, size_t buffer_size,
-                 long src_pv_index, long dst_pv_index,
-                 long pe_source,    long pe_dest,
-                 int opt_v, int opt_t,
-                 int act_pe, int off_pe) {
+		 long src_pv_index, long dst_pv_index,
+		 long pe_source,    long pe_dest,
+		 int opt_v, int opt_t,
+		 int act_pe, int off_pe) {
    int in = -1;
    int out = -1;
    int l = 0;
@@ -362,7 +367,10 @@
    char *lv_name_this = NULL;
    size_t size = 0;
    le_remap_req_t le_remap_req;
-
+   /* Record whether we are definitely using old- or new-style pvmove, or
+      whether we don't know which yet. */
+   static int old_style = 0, new_style = 0;
+   
    debug_enter ( "pv_move_pe -- CALLED\n");
 
    if ( src_pv_index < 0 || src_pv_index >= vg->pv_cur ||
@@ -375,11 +383,13 @@
       goto pv_move_pe_end;
    }
 
-   if ( ( in = open ( vg->pv[src_pv_index]->pv_name, O_RDONLY)) == -1) {
-      fprintf ( stderr, "%s -- couldn't open input physical volume %s\n",
-                cmd, vg->pv[src_pv_index]->pv_name);
-      ret = -LVM_EPV_MOVE_PE_OPEN_IN;
-      goto pv_move_pe_end;
+   if ( !new_style ) {
+      if ( ( in = open ( vg->pv[src_pv_index]->pv_name, O_RDONLY)) == -1) {
+	 fprintf ( stderr, "%s -- couldn't open input physical volume %s\n",
+		   cmd, vg->pv[src_pv_index]->pv_name);
+	 ret = -LVM_EPV_MOVE_PE_OPEN_IN;
+	 goto pv_move_pe_end;
+      }
    }
    
    /* is this LV not allready on destination PV?
@@ -447,43 +457,45 @@
                le_remap_req.new_pe);
    }
 
-   if ( opt_v > 1) printf ( "%s -- opening output physical volume \"%s\"\n",
-                            cmd, vg->pv[dst_pv_index]->pv_name);
-   if ( ( out = open ( vg->pv[dst_pv_index]->pv_name,
-                       O_WRONLY)) == -1) {
-      fprintf ( stderr, "%s -- couldn't open output "
-                        "physical volume \"%s\"\n",
-                cmd, vg->pv[dst_pv_index]->pv_name);
-      ret = -LVM_EPV_MOVE_PE_OPEN;
-      goto pv_move_pe_end;
-   }
-
-   if ( opt_v > 1) printf ( "%s -- llseeking input physical volume \"%s\"\n",
-                            cmd, vg->pv[src_pv_index]->pv_name);
-   offset = ( loff_t) le_remap_req.old_pe * SECTOR_SIZE;
-   if ( ( result = _llseek ( in, offset, SEEK_SET)) == -1) {
-      fprintf ( stderr, "%s -- couldn't llseek to sector %u on input "
-                        "physical volume \"%s\"\n",
-                cmd,
-                le_remap_req.old_pe,
-                vg->pv[src_pv_index]->pv_name);
-      ret = -LVM_EPV_MOVE_PE_LLSEEK_IN;
-      goto pv_move_pe_end;
-   }
-
-   if ( opt_v > 1) printf ( "%s -- llseeking output physical volume \"%s\"\n",
-                            cmd, vg->pv[dst_pv_index]->pv_name);
-   offset = ( loff_t) le_remap_req.new_pe * SECTOR_SIZE;
-   if ( ( result = llseek ( out, offset, SEEK_SET)) == -1) {
-      fprintf ( stderr, "%s -- couldn't llseek to sector %u on output "
-                        "physical volume \"%s\"\n",
-                cmd,
-                le_remap_req.new_pe,
-                vg->pv[dst_pv_index]->pv_name);
-      ret = -LVM_EPV_MOVE_PE_LLSEEK_OUT;
-      goto pv_move_pe_end;
+   if ( !new_style ) {
+      if ( opt_v > 1) printf ( "%s -- opening output physical volume \"%s\"\n",
+			       cmd, vg->pv[dst_pv_index]->pv_name);
+      if ( ( out = open ( vg->pv[dst_pv_index]->pv_name,
+			  O_WRONLY)) == -1) {
+	 fprintf ( stderr, "%s -- couldn't open output "
+			   "physical volume \"%s\"\n",
+		   cmd, vg->pv[dst_pv_index]->pv_name);
+	 ret = -LVM_EPV_MOVE_PE_OPEN;
+	 goto pv_move_pe_end;
+      }
+
+      if ( opt_v > 1) printf ( "%s -- llseeking input physical volume \"%s\"\n",
+			       cmd, vg->pv[src_pv_index]->pv_name);
+      offset = ( loff_t) le_remap_req.old_pe * SECTOR_SIZE;
+      if ( ( result = llseek ( in, offset, SEEK_SET)) == -1) {
+	 fprintf ( stderr, "%s -- couldn't llseek to sector %u on input "
+			   "physical volume \"%s\"\n",
+		   cmd,
+		   le_remap_req.old_pe,
+		   vg->pv[src_pv_index]->pv_name);
+	 ret = -LVM_EPV_MOVE_PE_LLSEEK_IN;
+	 goto pv_move_pe_end;
+      }
+
+      if ( opt_v > 1) printf ( "%s -- llseeking output physical volume \"%s\"\n",
+			       cmd, vg->pv[dst_pv_index]->pv_name);
+      offset = ( loff_t) le_remap_req.new_pe * SECTOR_SIZE;
+      if ( ( result = llseek ( out, offset, SEEK_SET)) == -1) {
+	 fprintf ( stderr, "%s -- couldn't llseek to sector %u on output "
+			   "physical volume \"%s\"\n",
+		   cmd,
+		   le_remap_req.new_pe,
+		   vg->pv[dst_pv_index]->pv_name);
+	 ret = -LVM_EPV_MOVE_PE_LLSEEK_OUT;
+	 goto pv_move_pe_end;
+      }
    }
-
+   
    if ( opt_v > 0)
        printf ( "%s -- %s [PE %lu [%s [LE %d]] -> %s [PE %lu] [%d/%d]\n",
                 cmd,
@@ -498,6 +510,55 @@
                 act_pe,
                 off_pe);
 
+   /* Setup done, now comes crunch time.  Will the new-style
+    * PV_LOCKED_COPY ioctl work? */
+
+   if ( !old_style ) {
+      if ( opt_v > 1) printf ( "%s -- copying extent from %s::%s(0x%04x):%d "
+			       "to %s(0x%04x):%d on disk\n", 
+			       cmd, vg->pv[src_pv_index]->pv_name,
+			       lv_name_this,
+			       le_remap_req.old_dev, le_remap_req.old_pe,
+			       vg->pv[dst_pv_index]->pv_name, 
+			       le_remap_req.new_dev, le_remap_req.new_pe);
+      if ( opt_t != 0 )
+         /* Special case --- if we end up in this path, we skip the 
+	  * new-style copy but we also want to bypass the fallback 
+	  * into the old-style copy, too. */
+	 goto done_new_pv_move;
+      if ( ( ret = pv_locked_copy_pe(vg, lv_name_this,
+				     le_remap_req.old_dev, 
+				     le_remap_req.new_dev,
+				     le_remap_req.old_pe, 
+				     le_remap_req.new_pe) ) == 0 ) {
+	 /* New style works --- next time we enter this function, we can
+	  * skip all the setup for old-style copy. */
+	 new_style = 1;
+	 goto done_new_pv_move;
+      }
+      
+      fprintf ( stderr, "%s -- ERROR \"%s\" copying extent "
+		"from \"%s\"\n\n",
+		cmd, lvm_error ( ret),
+		vg->pv[src_pv_index]->pv_name);
+
+      /* If this is the first time we've tried new-style, and we
+       * got an EINVAL back from the kernel, assume the ioctl
+       * doesn't exist and try old-style pvmove instead. */
+      if ( ret == -LVM_EPV_LOCKED_COPY_EINVAL && !old_style ) {
+	  if ( opt_v > 1)
+		printf ( "%s -- -EINVAL using PE_LOCKED_COPY, "
+			 "falling back to old style pv_move "
+			 "on \"%s\"\n",
+			 cmd, vg->vg_name);
+	  old_style = 1;
+      } else
+	  goto pv_move_pe_end;
+   }
+
+   /* We failed.  <sniff>  OK, time to fall back to the old, buggy,
+    * data-corrupting, deadlock-prone pvmove version. */
+
    /* lock extent in kernel */
    if ( opt_v > 1) printf ( "%s -- locking physical extent %lu "
                             "of \"%s\" in kernel\n",
@@ -592,6 +653,8 @@
       }
    }
 
+done_new_pv_move:
+
    if ( opt_v > 1) printf ( "%s -- changing source \"%s\" in VGDA "
                             "of kernel\n",
                             cmd, vg->pv[src_pv_index]->pv_name);
@@ -654,7 +717,7 @@
 
    debug_leave ( "pv_move_pe -- LEAVING with ret: %d\n", ret);
    return ret;
-} /* pv_move_pe() */
+} /* pv_move_pe_old() */
 
 
 void pv_move_interrupt ( int sig) {
@@ -761,3 +824,46 @@
    else
       return 0;
 }
+
+
+int pv_locked_copy_pe( vg_t *vg, char *lv_name, 
+		       kdev_t old_dev, kdev_t new_dev,
+		       uint old_pe, uint new_pe) 
+{
+	pe_copy_req_t pe_copy_req;
+	int group = -1;
+	int ret;
+	char group_file[NAME_LEN];
+	
+	debug_enter ( "pv_locked_copy_pe -- CALLED\n");
+
+	sprintf ( group_file, LVM_DIR_PREFIX "%s/group%c", vg->vg_name, 0);
+	
+	if ( ( group = open ( group_file, O_RDONLY)) == -1) {
+		ret = -LVM_EPE_LOCK; /* FIX THIS ERR CODE */
+		goto out;
+	}
+
+	strcpy (pe_copy_req.lv_name, lv_name);
+	pe_copy_req.old_dev = old_dev;
+	pe_copy_req.new_dev = new_dev;
+	pe_copy_req.old_pe = old_pe;
+	pe_copy_req.new_pe = new_pe;
+	
+	printf("%s::%s: %04x %d, %04x %d\n", 
+	       group_file, pe_copy_req.lv_name,
+	       pe_copy_req.old_dev, pe_copy_req.old_pe,
+	       pe_copy_req.new_dev, pe_copy_req.new_pe);
+
+	ret = ioctl(group, PE_LOCKED_COPY, &pe_copy_req);
+	if (ret < 0)
+		ret = -errno;
+	if (ret == -EINVAL)
+		ret = -LVM_EPV_LOCKED_COPY_EINVAL;
+	
+	close(group);
+out:
+	debug_leave ( "pv_locked_copy_pe -- LEAVING with ret: %d\n", ret);
+	return ret;
+}
+
--- LVM/1.0.3/tools/lib/pv_write.c.~1~	Wed Feb  6 14:17:47 2002
+++ LVM/1.0.3/tools/lib/pv_write.c	Wed Feb 20 17:52:51 2002
@@ -60,7 +60,7 @@
 
       /* convert core to disk data */
       pv_disk = pv_copy_to_disk ( pv);
-      if ( ( pv_handle = open ( pv_name, O_WRONLY)) == -1)
+      if ( ( pv_handle = open ( pv_name, O_WRONLY, O_SYNC)) == -1)
          ret = -LVM_EPV_WRITE_OPEN;
       else if ( lseek ( pv_handle, pv->pv_on_disk.base, SEEK_SET) !=
                 pv->pv_on_disk.base) ret = -LVM_EPV_WRITE_LSEEK;
@@ -91,7 +91,6 @@
       free ( pv_disk);
    
       if ( pv_handle != -1) {
-         fsync ( pv_handle);
          close ( pv_handle);
       }
    }
--- LVM/1.0.3/tools/lib/pv_write_pe.c.~1~	Fri Jun 22 10:09:12 2001
+++ LVM/1.0.3/tools/lib/pv_write_pe.c	Wed Feb 20 17:52:51 2002
@@ -54,7 +54,7 @@
       size = pv->pe_total * sizeof ( pe_disk_t);
       if ( size + pv->pe_on_disk.base > LVM_VGDA_SIZE ( pv))
          ret = -LVM_EPV_WRITE_PE_SIZE;;
-      if ( ( pv_handle = open ( pv_name, O_WRONLY)) == -1)
+      if ( ( pv_handle = open ( pv_name, O_WRONLY | O_SYNC)) == -1)
          ret = -LVM_EPV_WRITE_PE_OPEN;
       else if ( lseek ( pv_handle,  pv->pe_on_disk.base, SEEK_SET) !=
                  pv->pe_on_disk.base)
@@ -67,7 +67,6 @@
       }
    
       if ( pv_handle != -1) {
-         fsync ( pv_handle);
          close ( pv_handle);
       }
    }

--pf9I7BMVVzbSWLtt--
