Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Tue, 28 Nov 2000 01:23:56 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Message-ID: <20001128012356.H20735@srv.t-online.de>
References: <20001127171113.B9485@thelma.ing.umu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <20001127171113.B9485@thelma.ing.umu.se>; from stric@ing.umu.se on Mon, Nov 27, 2000 at 05:11:13PM +0100
Subject: [linux-lvm] Re: Some brokenness in LVM 0.9 (on 2.2.18pre23) [long mail w/ oopses and patch]
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Tomas Ogren <stric@ing.umu.se>
Cc: mge@sistina.com, linux-lvm@sistina.com

Hi Tomas.

On Mon, Nov 27, 2000 at 05:11:13PM +0100, Tomas Ogren wrote:
> Hi.
> 
> First of all, I tried subscribing to the mailing list, but it seems like
> the -request thingie doesn't work very well.. I also tried subscribing
> through the web interface, got a confirmation mail which I replied to..
> then nothing happened again... So cc:s until I've managed to get on the
> list would be nice.

Sorry for that Tomas.
Handed it forward to my collegues to fix this.

> 
> Over to LVM...
> 
> I have found some various bugs in LVM 0.9 applied to a 2.2.18pre23
> kernel (2.2.17 + pre23 + ide patches + rawio + lvm 0.9).
> We know that 2.2.18pre might not be supported, but the code we've looked
> at is visually broken (the code snip below) even in CVS.
> 
> Here is a code snip from vg_extend (the line with the + is my added
> line)... The if statement is triggered when vg_ptr->pv[p] is NULL, which
> pv_ptr is set to.. lvm_do_pv_create() allocs some memory etc for
> vg_ptr->pv[p] but then this code continues using the NULL pointer pv_ptr
> without "rereading" the vg_ptr->pv[p] pointer.
> 
> Oops. (And that's what I get too 8)
> 
> [..]
>     for (p = 0; p < vg_ptr->pv_max; p++) {
> 	    if ( ( pv_ptr = vg_ptr->pv[p]) == NULL) {
> 		    ret = lvm_do_pv_create(arg, vg_ptr, p);
> +		    pv_ptr = vg_ptr->pv[p];
> 		    lvm_do_create_proc_entry_of_pv ( vg_ptr, pv_ptr);
> 		    if ( ret != 0) return ret;
> 
> 		    /* We don't need the PE list
> 		       in kernel space like LVs pe_t list */
> 		    pv_ptr->pe = NULL;
> [..]
> 
> With that fixed, I can add a pv into an existing vg.. but other things
> breaks too which I have been unable to find (but I have Oops +
> ksymoops).
> 
> After adding a 41G and 8G disk into one vg I tried creating an lv at 40G
> (lvcreate -L40G -n leklv homevg) which resulted in the following oops:
> 
<SNIP>

This looks like a BUG in lvm_do_create_proc_entry_of_pv tampering with
the pv_name within the pv.

Could you try the following patch and tell me if it fixes the problem.
Thanks!


Index: lvm.c
===================================================================
RCS file: /home/cvs/LVM/kernel/lvm.c,v
retrieving revision 1.7
diff -u -b -B -r1.7 lvm.c
--- lvm.c	2000/11/20 03:35:44	1.7
+++ lvm.c	2000/11/28 00:23:27
@@ -138,6 +138,11 @@
  *    01/11/2000 - added memory information on hash tables to
  *                 lvm_proc_get_global_info()
  *    02/11/2000 - implemented /proc/lvm/ hierarchy
+ *    22/11/2000 - changed lvm_do_create_proc_entry_of_pv () to work
+ *                 with devfs
+ *    26/11/2000 - corrected #ifdef locations for PROC_FS
+ *    28/11/2000 - fixed lvm_do_vg_extend() NULL pointer BUG
+ *               - fixed lvm_do_create_proc_entry_of_pv() buffer tampering BUG
  *
  */
 
@@ -242,6 +247,9 @@
 int lvm_proc_read_lv_info(char *, char **, off_t, int, int *, void *);
 int lvm_proc_read_pv_info(char *, char **, off_t, int, int *, void *);
 static int lvm_proc_get_global_info(char *, char **, off_t, int, int *, void *);
+
+inline void lvm_do_create_devfs_entry_of_vg ( vg_t *);
+
 void lvm_do_create_proc_entry_of_vg ( vg_t *);
 inline void lvm_do_remove_proc_entry_of_vg ( vg_t *);
 inline void lvm_do_create_proc_entry_of_lv ( vg_t *, lv_t *);
@@ -2031,6 +2039,10 @@
 		}
 	}
 
+#ifdef	CONFIG_DEVFS_FS
+	lvm_do_create_devfs_entry_of_vg ( vg_ptr);
+#endif
+
 	/* Second path to correct snapshot logical volumes which are not
 	   in place during first path above */
 	for (l = 0; l < ls; l++) {
@@ -2045,15 +2057,6 @@
 		}
 	}
 
-#ifdef	CONFIG_DEVFS_FS
-	vg_devfs_handle[vg_ptr->vg_number] = devfs_mk_dir(0, vg_ptr->vg_name, NULL);
-	ch_devfs_handle[vg_ptr->vg_number] = devfs_register(
-		vg_devfs_handle[vg_ptr->vg_number] , "group",
-		DEVFS_FL_DEFAULT, LVM_CHAR_MAJOR, vg_ptr->vg_number,
-		S_IFCHR | S_IRUSR | S_IWUSR | S_IRGRP,
-		&lvm_chr_fops, NULL);
-#endif
-
 #if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS
 	lvm_do_create_proc_entry_of_vg ( vg_ptr);
 #endif
@@ -2086,8 +2089,9 @@
 		for (p = 0; p < vg_ptr->pv_max; p++) {
 			if ( ( pv_ptr = vg_ptr->pv[p]) == NULL) {
 				ret = lvm_do_pv_create(arg, vg_ptr, p);
-				lvm_do_create_proc_entry_of_pv ( vg_ptr, pv_ptr);
 				if ( ret != 0) return ret;
+				pv_ptr = vg_ptr->pv[p];
+				lvm_do_create_proc_entry_of_pv ( vg_ptr, pv_ptr);
 	
 				/* We don't need the PE list
 				   in kernel space like LVs pe_t list */
@@ -3067,7 +3071,23 @@
 
 
 
+#ifdef	CONFIG_DEVFS_FS
 /*
+ * create a devfs entry for a volume group
+ */
+inline void lvm_do_create_devfs_entry_of_vg ( vg_t *vg_ptr) {
+	vg_devfs_handle[vg_ptr->vg_number] = devfs_mk_dir(0, vg_ptr->vg_name, NULL);
+	ch_devfs_handle[vg_ptr->vg_number] = devfs_register(
+		vg_devfs_handle[vg_ptr->vg_number] , "group",
+		DEVFS_FL_DEFAULT, LVM_CHAR_MAJOR, vg_ptr->vg_number,
+		S_IFCHR | S_IRUSR | S_IWUSR | S_IRGRP,
+		&lvm_chr_fops, NULL);
+}
+#endif
+
+
+#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS
+/*
  * create a /proc entry for a logical volume
  */
 inline void lvm_do_create_proc_entry_of_lv ( vg_t *vg_ptr, lv_t *lv_ptr) {
@@ -3106,12 +3126,16 @@
  * create a /proc entry for a physical volume
  */
 inline void lvm_do_create_proc_entry_of_pv ( vg_t *vg_ptr, pv_t *pv_ptr) {
+	int offset = 0;
 	char *basename;
+	char buffer[NAME_LEN];
 
-	basename = strrchr(pv_ptr->pv_name, '/');
-	if (basename == NULL) basename = pv_ptr->pv_name;
-	else		      basename++;
-	pde = create_proc_entry(basename, S_IFREG, vg_ptr->pv_subdir_pde);
+	basename = pv_ptr->pv_name;
+	if (strncmp(basename, "/dev/", 5) == 0) offset = 5;
+	strncpy(buffer, basename + offset, sizeof(buffer));
+	basename = buffer;
+	while ( ( basename = strchr ( basename, '/')) != NULL) *basename = '_';
+	pde = create_proc_entry(buffer, S_IFREG, vg_ptr->pv_subdir_pde);
 	if ( pde != NULL) {
 		pde->read_proc = lvm_proc_read_pv_info;
 		pde->data = pv_ptr;
@@ -3138,7 +3162,6 @@
 /*
  * create a /proc entry for a volume group
  */
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS
 void lvm_do_create_proc_entry_of_vg ( vg_t *vg_ptr) {
 	int l, p;
 	pv_t *pv_ptr;
@@ -3154,22 +3177,18 @@
 			pde->read_proc = lvm_proc_read_vg_info;
 			pde->data = vg_ptr;
 		}
-		vg_ptr->lv_subdir_pde =
-			create_proc_entry(LVM_LV_SUBDIR, S_IFDIR,
-					  vg_ptr->vg_dir_pde);
-		vg_ptr->pv_subdir_pde =
-			create_proc_entry(LVM_PV_SUBDIR, S_IFDIR,
+                pde = create_proc_entry(LVM_LV_SUBDIR, S_IFDIR,
 					  vg_ptr->vg_dir_pde);
+                if ( pde != NULL) {
+                        vg_ptr->lv_subdir_pde = pde;
+                        for ( l = 0; l < vg_ptr->lv_max; l++) {                                                 if ( ( lv_ptr = vg_ptr->lv[l]) == NULL) continue;                                                                                                               lvm_do_create_proc_entry_of_lv ( vg_ptr, lv_ptr);
 	}
-
-	if ( vg_ptr->pv_subdir_pde != NULL) {
-		for ( l = 0; l < vg_ptr->lv_max; l++) {
-			if ( ( lv_ptr = vg_ptr->lv[l]) == NULL) continue;
-			lvm_do_create_proc_entry_of_lv ( vg_ptr, lv_ptr);
 		}
-		for ( p = 0; p < vg_ptr->pv_max; p++) {
-			if ( ( pv_ptr = vg_ptr->pv[p]) == NULL) continue;
-			lvm_do_create_proc_entry_of_pv ( vg_ptr, pv_ptr);
+                pde = create_proc_entry(LVM_PV_SUBDIR, S_IFDIR,
+                                        vg_ptr->vg_dir_pde);
+                if ( pde != NULL) {
+                        vg_ptr->pv_subdir_pde = pde;                                                    for ( p = 0; p < vg_ptr->pv_max; p++) {                                                 if ( ( pv_ptr = vg_ptr->pv[p]) == NULL) continue;                                                                                                               lvm_do_create_proc_entry_of_pv ( vg_ptr, pv_ptr);
+                        }
 		}
 	}
 }


> 
> 
> /Tomas
> -- 
> Tomas �gren, stric@ing.umu.se, http://www.ing.umu.se/~stric/
> |- Student at Computing Science, University of Ume�
> `- Sysadmin at {cs,ing,acc}.umu.se

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
