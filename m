Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104102137.f3ALb1MS032178@webber.adilger.int>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
In-Reply-To: <m2n19owo1q.fsf@isnogud.escape.de> "from Urs Thuermann at Apr 10,
 2001 09:30:09 pm"
Date: Tue, 10 Apr 2001 15:37:00 -0600 (MDT)
MIME-Version: 1.0
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

Urs, you write:
> Today, I've found some time to make some further performance tests on
> my system.
>     
> The elapsed times of the 4 runs of each test are averaged, where for
> each test the variations among the 4 times were less than 1% of the
> average time (times in seconds):
> 
> 		  64k	  32k	  16k	  8k	  4k	  2k	  1k	  512
> ------------------------------------------------------------------------------
> /dev/sda5	 389.4	 389.4	 388.9	 388.7	 388.5	 388.6	 389.1	 388.9
> /dev/vg0/test	 389.3	 389.6	 390.9	 393.1	 607.5	1147.2	2194.9	2195.8
> 
> > There could be drives used which suffer from that placement with
> > regard to drive internal caching, latency or other model specific
> > issues.
> 
> I think you mean that when I read a number of blocks from /dev/sda5 I
> read them from the beginning of /dev/sda5 while when reading the same
> number of blocks from /dev/vg0/test I read from the end of the PV
> /dev/sda5 since the PE are allocated from the end, right.

No, PEs are allocated from the start, but are only aligned with the end
of the disk/partition (to give maximum room to LVM for metadata).  If you
have contiguous LE allocation (which you appear to have), the read order
for LVM should basically be exactly the same as for a raw disk.  Effectively
all that LVM is doing is adding a small offset to the disk blocks to leave
room for the VGDA, nothing more.

> But in my test, I read the whole /dev/sda5 and the whole LV which
> has allocated all PEs of /dev/sda5 to it.  So about the same sectors
> are read, just the order is different.  Do you think that can reduce
> the performance from 2.45GB/390s = 6.43MB/s to 2.45GB/2195s = 1.14MB/s?
> I find this very unlikely.

No, shouldn't be a problem with placement, because you are reading 4MB
contiguous chunks (with default PE size).  This should be enough to
minimize seek impact.

Do you notice the sound of frantic head seeking when you are running with
small block sizes?

> Is there any other explanation for this performance degradation?

Other than some strange seek pattern, I can't think of anything.  If you
look at the (non-snapshot and non-blocking because of pv_move) path of
lvm_map, it boils down to:

pe_num = lvm_block / pe_size;
new_dev = pe[pe_num].dev;
new_block = (old_block % pe_size) + pe[pe_num].start;

So basically a few memory accesses and a few math operations.  Nothing
_should_ affect disk performance at all.  With < 2k I/O you are forcing
read-modify-write on pages, but this shouldn't be an issue, because you
are also doing the same for the raw disk.

One thing that now comes to mind is if the LVM I/O is not aligned, because
LVM PEs are aligned with the end of the PV and not the start, this _may_
cause performance problems because of misaligned read-modify-write causing
extra seeking (purely speculation).

Try the following patch, which will align the PE structs to 64kB boundaries
from the start of the disk, as well as making the other large VGDA structs
start on 4k boundaries.  I have tested the new alignment, and it works
fine with existing LVM code.  However, the patch is extracted from 8000+
lines of diff (yuk), so there may be a few cases where it doesn't apply
cleanly or I missed something in a non-critical file.  Basically, if it
compiles it will work OK.

Cheers, Andreas
======================= lvm-0.9.1b7-align.diff ===========================
diff -u -u -r1.5.2.38 lvm.h
--- kernel/lvm.h	2001/04/10 17:04:18	1.5.2.38
+++ kernel/lvm.h	2001/04/10 20:44:36
@@ -246,39 +246,34 @@
  */
 
 /* DONT TOUCH THESE !!! */
+#define LVM_VGDA_ALIGN		(4096UL - 1)
+#define LVM_VGDA_ROUND(size)	(((size) + LVM_VGDA_ALIGN) & ~LVM_VGDA_ALIGN)
+
 /* base of PV structure in disk partition */
-#define	LVM_PV_DISK_BASE  	0L
+#define	LVM_PV_DISK_BASE	0L
 
 /* size reserved for PV structure on disk */
-#define	LVM_PV_DISK_SIZE  	1024L
+#define	LVM_PV_DISK_SIZE	1024L
 
 /* base of VG structure in disk partition */
-#define	LVM_VG_DISK_BASE  	LVM_PV_DISK_SIZE
+#define	LVM_VG_DISK_BASE	LVM_VGDA_ROUND ( LVM_PV_DISK_BASE + \
+						 LVM_PV_DISK_SIZE)
 
 /* size reserved for VG structure */
-#define	LVM_VG_DISK_SIZE  	( 9 * 512L)
-
-/* size reserved for timekeeping */
-#define	LVM_TIMESTAMP_DISK_BASE	( LVM_VG_DISK_BASE +  LVM_VG_DISK_SIZE)
-#define	LVM_TIMESTAMP_DISK_SIZE	512L	/* reserved for timekeeping */
+#define	LVM_VG_DISK_SIZE	sizeof ( vg_disk_t)
 
 /* name list of physical volumes on disk */
-#define	LVM_PV_UUIDLIST_DISK_BASE ( LVM_TIMESTAMP_DISK_BASE + \
-                                    LVM_TIMESTAMP_DISK_SIZE)
+#define	LVM_PV_UUIDLIST_DISK_BASE LVM_VGDA_ROUND ( LVM_VG_DISK_BASE + \
+						   LVM_VG_DISK_SIZE)
 
 /* now for the dynamically calculated parts of the VGDA */
 #define	LVM_LV_DISK_OFFSET(a, b) ( (a)->lv_on_disk.base + \
                                    sizeof ( lv_disk_t) * b)
-#define	LVM_DISK_SIZE(pv) 	 ( (pv)->pe_on_disk.base + \
+#define	LVM_VGDA_SIZE(pv)	 ( (pv)->pe_on_disk.base + \
                                    (pv)->pe_on_disk.size)
 #define	LVM_PE_DISK_OFFSET(pe, pv)	( pe * pv->pe_size + \
-					  ( LVM_DISK_SIZE ( pv) / SECTOR_SIZE))
-#define	LVM_PE_ON_DISK_BASE(pv) \
-   { int rest; \
-     pv->pe_on_disk.base = pv->lv_on_disk.base + pv->lv_on_disk.size; \
-     if ( ( rest = pv->pe_on_disk.base % SECTOR_SIZE) != 0) \
-        pv->pe_on_disk.base += ( SECTOR_SIZE - rest); \
-   }
+					  ( LVM_VGDA_SIZE ( pv) / SECTOR_SIZE))
+#define LVM_PE_ALIGN		(65536UL / SECTOR_SIZE - 1)
 /* END default disk spaces and offsets for PVs */
 
 
diff -u -u -r1.2.2.8 vgcreate.c
--- tools/vgcreate.c	2001/04/09 12:53:40	1.2.2.8
+++ tools/vgcreate.c	2001/04/10 20:44:43
@@ -101,8 +101,8 @@
    int opt_v = 0;
    int p = 0;
    int p1 = 0;
-   int max_lv = MAX_LV;
-   int max_pv = MAX_PV;
+   int max_lv = MAX_LV - 1;
+   int max_pv = MAX_PV - 1;
    int min_pv_index = 0;
    ulong max_pv_size = 0;
    ulong min_pv_size = -1;
diff -u -u -r1.5.2.17 liblvm.h
--- tools/lib/liblvm.h	2001/04/09 14:18:25	1.5.2.17
+++ tools/lib/liblvm.h	2001/04/10 20:44:46
@@ -99,13 +99,9 @@
 
 extern struct config_file *config_file;
 
-#define	SECTOR_SIZE	512
 #define	BLKGETSIZE	_IO(0x12,96)	/* return device size */ 
 #define	BLKRASET	_IO(0x12,98)	/* Set read ahead */
 #define	EXT2_SUPER_MAGIC	0xEF53
-#ifndef BLOCK_SIZE
-#define	BLOCK_SIZE	1024
-#endif
 
 #define	LVM_ID		"HM"      /* Identifier PV (id in pv_t) */
 #define	EXPORTED	"PV_EXP"  /* Identifier exported PV (system_id in pv_t) */
diff -u -u -r1.2.2.2 pv_read_pe.c
--- tools/lib/pv_read_pe.c	2001/04/09 07:49:07	1.2.2.2
+++ tools/lib/pv_read_pe.c	2001/04/10 20:44:52
@@ -58,8 +57,7 @@
    *pe = NULL;
 
    size = pv->pe_total * sizeof ( pe_disk_t);
-   if ( size + pv->pe_on_disk.base > 
-        LVM_DISK_SIZE ( pv)) {
+   if ( size + pv->pe_on_disk.base > LVM_VGDA_SIZE ( pv)) {
       ret = -LVM_EPV_READ_PE_SIZE;
       goto pv_read_pe_end;
    }
diff -u -u -r1.1.2.1 pv_release_pe.c
--- tools/lib/pv_release_pe.c	2001/02/19 10:04:34	1.1.2.1
+++ tools/lib/pv_release_pe.c	2001/04/10 20:44:52
@@ -82,8 +82,7 @@
             goto pv_release_pe_end;
          }
          pe_index = ( vg->lv[l]->lv_current_pe[p].pe - 
-                      LVM_DISK_SIZE ( vg->pv[pv_num]) /
-                      SECTOR_SIZE) /
+                      LVM_VGDA_SIZE ( vg->pv[pv_num]) / SECTOR_SIZE) /
                       vg->pe_size;
          debug ( "pv_release_pe -- pv_name: %s  pe: %lu  sector: %lu\n",
                   vg->pv[pv_num]->pv_name,
diff -u -u -r1.2.2.1 pv_write_pe.c
--- tools/lib/pv_write_pe.c	2001/02/19 10:04:34	1.2.2.1
+++ tools/lib/pv_write_pe.c	2001/04/10 20:44:52
@@ -50,7 +50,7 @@
         pv == NULL) ret = -LVM_EPARAM;
    else {
       size = pv->pe_total * sizeof ( pe_disk_t);
-      if ( size + pv->pe_on_disk.base > LVM_DISK_SIZE ( pv))
+      if ( size + pv->pe_on_disk.base > LVM_VGDA_SIZE ( pv))
          ret = -LVM_EPV_WRITE_PE_SIZE;;
       if ( ( pv_handle = open ( pv_name, O_WRONLY)) == -1)
          ret = -LVM_EPV_WRITE_PE_OPEN;
diff -u -u -r1.4.2.1 vg_setup_for_create.c
--- tools/lib/vg_setup_for_create.c	2001/02/19 10:04:34	1.4.2.1
+++ tools/lib/vg_setup_for_create.c	2001/04/10 20:44:54
@@ -41,12 +41,9 @@
 
 int vg_setup_for_create ( char *vg_name, vg_t *vg, pv_t **pv,
                           int pe_size, ulong max_pv, ulong max_lv) {
-   int l = 0;
    int p = 0;
    int ret = 0;
    uint pe_total = 0;
-   ulong rest = 0;
-   ulong size = 0;
 
    debug_enter ( "vg_setup_for_create -- CALLED\n");
 
@@ -76,67 +73,66 @@
    vg->pvg_total = 0;
    vg->proc = NULL;
    memset ( vg->vg_uuid, 0, sizeof ( vg->vg_uuid));
-   memcpy ( vg->vg_uuid, lvm_create_uuid ( UUID_LEN), sizeof ( vg->vg_uuid)-1);
+   memcpy ( vg->vg_uuid, lvm_create_uuid ( UUID_LEN), sizeof ( vg->vg_uuid));
+   memset ( vg->pv, 0, sizeof ( pv_t *) * vg->pv_max);
+   memset ( vg->lv, 0, sizeof ( lv_t *) * vg->lv_max);
 
    /* Walk through physical volumes */
    pe_total = 0;
    for ( p = 0; pv[p] != NULL; p++) {
-      if ( pv_get_size ( pv[p]->pv_name, NULL) /
-           pe_size < LVM_PE_SIZE_PV_SIZE_REL) {
+      pv_t *pp = pv[p];
+      if ( ( pp->pv_size = pv_get_size ( pp->pv_name, NULL)) / pe_size <
+           LVM_PE_SIZE_PV_SIZE_REL) {
          ret = -LVM_EVG_SETUP_FOR_CREATE_PV_SIZE;
          goto vg_setup_for_create_end;
       }
-      vg->pv[p] = pv[p];
-      vg->pv[p]->pv_on_disk.base = LVM_PV_DISK_BASE;
-      vg->pv[p]->pv_on_disk.size = LVM_PV_DISK_SIZE;
-      vg->pv[p]->vg_on_disk.base = LVM_VG_DISK_BASE;
-      vg->pv[p]->vg_on_disk.size = LVM_VG_DISK_SIZE;
-      vg->pv[p]->pv_uuidlist_on_disk.base = LVM_PV_UUIDLIST_DISK_BASE;
-      vg->pv[p]->pv_uuidlist_on_disk.size = ( max_pv + 1) * NAME_LEN;
-
-      size = vg->pv[p]->pv_uuidlist_on_disk.base +
-             vg->pv[p]->pv_uuidlist_on_disk.size;
-      vg->pv[p]->lv_on_disk.base = (size / SECTOR_SIZE) * SECTOR_SIZE;
-      if (size % SECTOR_SIZE)
-         vg->pv[p]->lv_on_disk.base += SECTOR_SIZE; 
-      vg->pv[p]->lv_on_disk.size = ( max_lv + 1) * sizeof ( lv_disk_t);
-      LVM_PE_ON_DISK_BASE ( vg->pv[p]);
-      strcpy ( vg->pv[p]->vg_name, vg->vg_name);
-      vg->pv[p]->pv_number = p + 1;
-      vg->pv[p]->pv_status = 0; /* bitfield */
-      vg->pv[p]->pv_allocatable = PV_ALLOCATABLE; /* bitfield */
-      vg->pv[p]->pe_size = vg->pe_size;
-
-      rest = vg->pv[p]->pv_size - vg->pv[p]->pe_on_disk.base / SECTOR_SIZE;
-      vg->pv[p]->pe_total = rest / vg->pe_size;
-      rest -= ( vg->pv[p]->pe_total * vg->pe_size);
-      while ( rest * SECTOR_SIZE / sizeof ( pe_disk_t) < vg->pv[p]->pe_total) {
-         rest += vg->pe_size;
-         vg->pv[p]->pe_total--;
+
+      vg->pv[p] = pp;
+      strcpy ( pp->vg_name, vg->vg_name);
+      pp->pv_number = p + 1;
+      pp->pv_status = 0; /* bitfield */
+      pp->pv_allocatable = PV_ALLOCATABLE; /* bitfield */
+      pp->pe_size = vg->pe_size;
+
+      pp->pv_on_disk.base = LVM_PV_DISK_BASE;
+      pp->pv_on_disk.size = LVM_PV_DISK_SIZE;
+      pp->vg_on_disk.base = LVM_VG_DISK_BASE;
+      pp->vg_on_disk.size = LVM_VG_DISK_SIZE;
+      pp->pv_uuidlist_on_disk.base = LVM_PV_UUIDLIST_DISK_BASE;
+      pp->pv_uuidlist_on_disk.size = ( max_pv + 1) * NAME_LEN;
+
+      pp->lv_on_disk.base = LVM_VGDA_ROUND ( pp->pv_uuidlist_on_disk.base +
+                                             pp->pv_uuidlist_on_disk.size);
+      pp->lv_on_disk.size = (max_lv + 1) * sizeof ( lv_disk_t);
+      pp->pe_on_disk.base = LVM_VGDA_ROUND ( pp->lv_on_disk.base +
+                                             pp->lv_on_disk.size);
+
+      /* This may be one too many PEs if we don't have enough space for VGDA */
+      pp->pe_total = (pp->pv_size & ~LVM_PE_ALIGN) / pp->pe_size;
+      pp->pe_on_disk.size = ((pp->pv_size & ~LVM_PE_ALIGN) -
+                             pp->pe_total * vg->pe_size) * SECTOR_SIZE -
+                            pp->pe_on_disk.base;
+      if (pp->pe_on_disk.size < pp->pe_total * sizeof ( pe_disk_t)) {
+          --pp->pe_total;
+          pp->pe_on_disk.size += vg->pe_size * SECTOR_SIZE;
       }
-      vg->pv[p]->pe_on_disk.size = ( vg->pv[p]->pv_size -
-                                     vg->pv[p]->pe_total * vg->pe_size -
-                                     vg->pv[p]->pe_on_disk.base / SECTOR_SIZE)
-                                   * SECTOR_SIZE;
-      if ( LVM_DISK_SIZE ( vg->pv[p]) % BLOCK_SIZE > 0)
-         vg->pv[p]->pe_on_disk.size -= SECTOR_SIZE;
-      if ( ( vg->pv[p]->pe = malloc ( vg->pv[p]->pe_total *
-                                      sizeof ( pe_disk_t))) == NULL) {
+      if ( pp->pe_total > LVM_PE_T_MAX) {
+         ret = -LVM_EVG_SETUP_FOR_CREATE_PV_SIZE;
+         goto vg_setup_for_create_end;
+      }
+      if ( ( pp->pe = malloc ( pp->pe_total * sizeof ( pe_disk_t))) == NULL) {
          fprintf ( stderr, "malloc error in %s [line %d]\n",
                            __FILE__, __LINE__);
          ret = -LVM_EVG_SETUP_FOR_CREATE_MALLOC;
          goto vg_setup_for_create_end;
       }
-      memset ( vg->pv[p]->pe, 0, vg->pv[p]->pe_total * sizeof ( pe_disk_t));
-      vg->pv[p]->pe_allocated = 0;
-      vg->pv[p]->pe_stale = 0;
-      pe_total += vg->pv[p]->pe_total;
+      memset ( pp->pe, 0, pp->pe_total * sizeof ( pe_disk_t));
+      pp->pe_allocated = 0;
+      pp->pe_stale = 0;
+      pe_total += pp->pe_total;
    }
    vg->pv_cur = vg->pv_act = p;
    vg->pe_total = pe_total;
-
-   for ( ; p < vg->pv_max; p++) vg->pv[p] = NULL;      /* Rest should be NULL */
-   for ( l = 0; l < vg->lv_max; l++) vg->lv[l] = NULL; /* No LVs in NEW VG */
 
 vg_setup_for_create_end:
 
diff -u -u -r1.2.2.1 vg_setup_for_extend.c
--- tools/lib/vg_setup_for_extend.c	2001/02/19 10:04:34	1.2.2.1
+++ tools/lib/vg_setup_for_extend.c	2001/04/10 20:44:54
@@ -44,7 +44,6 @@
    int p1 = 0;
    int ret = 0;
    uint size = 0;
-   ulong rest = 0;
 
    debug_enter ( "vg_setup_for_extend -- CALLED\n");
 
@@ -66,7 +65,8 @@
       }
 
       for ( p = 0; all_pv[p] != NULL; p++) {
-         if ( strcmp ( extend_pv[ep], all_pv[p]->pv_name) == 0) {
+         pv_t *pp = all_pv[p];
+         if ( strcmp ( extend_pv[ep], pp->pv_name) == 0) {
             debug ( "%s -- checking for maximum physical "
                     "volume count of %s\n", cmd, vg->vg_name);
             if ( np >= vg->pv_max) {
@@ -74,9 +74,9 @@
                goto vg_setup_for_extend_end;
             }
             debug ( "%s -- getting size of physical "
-                    "volume %s\n", cmd, all_pv[p]->pv_name);
-            if ( ( size = pv_get_size ( all_pv[p]->pv_name, NULL)) <= 0) {
-               *error_pv_name = all_pv[p]->pv_name;
+                    "volume %s\n", cmd, pp->pv_name);
+            if ( ( size = pv_get_size ( pp->pv_name, NULL)) <= 0) {
+               *error_pv_name = pp->pv_name;
                ret = -LVM_EVG_SETUP_FOR_EXTEND_PV_GET_SIZE;
                goto vg_setup_for_extend_end;
             }
@@ -91,72 +92,61 @@
                   goto vg_setup_for_extend_end;
                }
             }
-            debug ( "%s -- checking for new physical "
-                    "volume %s\n", cmd, all_pv[p]->pv_name);
-            if ( pv_check_new ( all_pv[p]) == FALSE) {
-               *error_pv_name = all_pv[p]->pv_name;
+            debug ( "%s -- checking for new physical volume %s\n",
+                    cmd, pp->pv_name);
+            if ( pv_check_new ( pp) == FALSE) {
+               *error_pv_name = pp->pv_name;
                ret = -LVM_EVG_SETUP_FOR_EXTEND_PV_CHECK_NEW;
                goto vg_setup_for_extend_end;
             }
 
-            if ( pv_get_size ( all_pv[p]->pv_name, NULL) /
-                 vg->pv[0]->pe_size < LVM_PE_SIZE_PV_SIZE_REL) {
-               *error_pv_name = all_pv[p]->pv_name;
+            if ( size / vg->pv[0]->pe_size < LVM_PE_SIZE_PV_SIZE_REL) {
+               *error_pv_name = pp->pv_name;
                ret = -LVM_EVG_SETUP_FOR_EXTEND_PV_SIZE_REL;
                goto vg_setup_for_extend_end;
             }
 
             /* setup PV and correct VG */
-            all_pv[p]->vg_on_disk.base = vg->pv[0]->vg_on_disk.base;
-            all_pv[p]->vg_on_disk.size = vg->pv[0]->vg_on_disk.size;
-            all_pv[p]->pv_uuidlist_on_disk.base =
-               vg->pv[0]->pv_uuidlist_on_disk.base;
-            all_pv[p]->pv_uuidlist_on_disk.size =
-               vg->pv[0]->pv_uuidlist_on_disk.size;
-            all_pv[p]->lv_on_disk.base = vg->pv[0]->lv_on_disk.base;
-            all_pv[p]->lv_on_disk.size = vg->pv[0]->lv_on_disk.size;
-            all_pv[p]->pe_on_disk.base = vg->pv[0]->pe_on_disk.base;
-            rest = all_pv[p]->pv_size - all_pv[p]->pe_on_disk.base /
-                                        SECTOR_SIZE;
-            all_pv[p]->pe_total = rest / vg->pe_size;
-            rest -= ( all_pv[p]->pe_total * vg->pe_size);
-            while ( rest * SECTOR_SIZE / sizeof ( pe_disk_t) <
-                    all_pv[p]->pe_total) {
-               rest += vg->pe_size;
-               all_pv[p]->pe_total--;
-            }
-            all_pv[p]->pe_on_disk.size =
-               ( all_pv[p]->pv_size - all_pv[p]->pe_total * vg->pe_size -
-                 all_pv[p]->pe_on_disk.base / SECTOR_SIZE) * SECTOR_SIZE;
-            if ( LVM_DISK_SIZE ( all_pv[p]) % BLOCK_SIZE > 0)
-               all_pv[p]->pe_on_disk.size -= SECTOR_SIZE;
-            strcpy ( all_pv[p]->vg_name, vg->vg_name);
-            all_pv[p]->pv_dev = pv_create_kdev_t ( all_pv[p]->pv_name);
-            all_pv[p]->pv_status = 0; /* bitfield */
-            all_pv[p]->pv_allocatable = PV_ALLOCATABLE;
-            all_pv[p]->pv_size = size;
-            all_pv[p]->lv_cur = 0;
-            all_pv[p]->pe_size = vg->pe_size;
-            all_pv[p]->pe_total = ( all_pv[p]->pv_size -
-                                ( all_pv[p]->pe_on_disk.base +
-                                  all_pv[p]->pe_on_disk.size) / SECTOR_SIZE ) /
-                                vg->pe_size;
-            all_pv[p]->pe_allocated = 0;
-            all_pv[p]->pe_stale = 0;
-            if ( ( all_pv[p]->pe = malloc ( all_pv[p]->pe_total *
+            strcpy ( pp->vg_name, vg->vg_name);
+            pp->pv_number = np + 1;
+            pp->pv_dev = pv_create_kdev_t ( pp->pv_name);
+            pp->pv_status = 0; /* bitfield */
+            pp->pv_allocatable = PV_ALLOCATABLE;
+            pp->pv_size = size;
+            pp->lv_cur = 0;
+            pp->pe_size = vg->pe_size;
+
+            pp->vg_on_disk.base = vg->pv[0]->vg_on_disk.base;
+            pp->vg_on_disk.size = vg->pv[0]->vg_on_disk.size;
+            pp->pv_uuidlist_on_disk.base = vg->pv[0]->pv_uuidlist_on_disk.base;
+            pp->pv_uuidlist_on_disk.size = vg->pv[0]->pv_uuidlist_on_disk.size;
+            pp->lv_on_disk.base = vg->pv[0]->lv_on_disk.base;
+            pp->lv_on_disk.size = vg->pv[0]->lv_on_disk.size;
+            pp->pe_on_disk.base = vg->pv[0]->pe_on_disk.base;
+            /* This may be one too many PEs if not enough space for VGDA */
+            pp->pe_total = (pp->pv_size & ~LVM_PE_ALIGN) / pp->pe_size;
+            pp->pe_on_disk.size = ((pp->pv_size & ~LVM_PE_ALIGN) -
+                                   pp->pe_total * vg->pe_size) * SECTOR_SIZE -
+                                  pp->pe_on_disk.base;
+            if (pp->pe_on_disk.size < pp->pe_total * sizeof ( pe_disk_t)) {
+               --pp->pe_total;
+               pp->pe_on_disk.size += vg->pe_size * SECTOR_SIZE;
+            }
+            if ( ( pp->pe = malloc ( pp->pe_total *
                                         sizeof ( pe_disk_t))) == NULL) {
                fprintf ( stderr, "%s -- malloc error in %s at line %d\n\n",
                                  cmd, __FILE__, __LINE__);
                ret = -LVM_EVG_SETUP_FOR_EXTEND_MALLOC;
                goto vg_setup_for_extend_end;
             }
-            memset ( all_pv[p]->pe,
-                     0,
-                     all_pv[p]->pe_total * sizeof ( pe_disk_t));
-            vg->pv[np] = all_pv[p];
+            memset ( pp->pe, 0, pp->pe_total * sizeof ( pe_disk_t));
+            pp->pe_allocated = 0;
+            pp->pe_stale = 0;
+
+            vg->pv[np] = pp;
             vg->pv_act++;
             vg->pv_cur++;
-            vg->pe_total += vg->pv[np]->pe_total;
+            vg->pe_total += pp->pe_total;
 
             np++;
             new_pv++;
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
