From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008042228.QAA00728@lynx.turbolabs.com>
Subject: [linux-lvm] Additions to LVM-BUGS-0.8final
Date: Fri, 4 Aug 2000 16:28:48 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Here is a list of additional bug fixes that appeared on the linux-lvm
mailing list, but are not currently in the BUGS file on the LVM site.

Cheers, Andreas
------------------------------------------------------------------------------

Michael Marxmeier <mike@msede.com> writes:

<22> vg_check_name -- LEAVING with ret: 0
<22> lvm_remove_recursive -- CALLED with dir: /dev/Main_VG

This looks like a bug in lvm_remove_recursive() (tools/lib/...)
A short look reveales the following suspicious code
sequence around line 71:

               if ( ( file_name = malloc ( strlen (dir) +
                                           strlen (dir_ent->d_name) +
                                           2)) == NULL) {
                  ret = -LVM_EREMOVE_RECURSIVE_MALLOC;
                  goto lvm_remove_recursive_end;
               }
               sprintf ( file_name, "%s/%s%c", dir, dir_ent->d_name,
0);

AFAICS this could write a byte beyound file_name, depending
on file name length (due to malloc alignment).

Try to replace the sprintf() with:

sprintf ( file_name, "%s/%s", dir, dir_ent->d_name);

or make the +2 a +3 in the malloc call.
-----------------------------------------------------------------------
Jan Niehusmann writes:

vgcfgbackup does not make the last backup copy:

--- 0.8final.orig/tools/lib/vg_cfgbackup.c	Tue Feb 22 04:09:32 2000
--- 0.8final/tools/lib/vg_cfgbackup.c	Tue May 23 17:02:35 2000
@@ -366,7 +366,7 @@
	}

	/* VGDA backup history */
-	for (i = vg_max_backups; i > 1; i--) {
+	for (i = vg_max_backups; i >= 1; i--) {
	   sprintf ( vg_backup_path_old2, "%s/%s.conf.%d.old%c",
	   				  directory. vg_name, i, 0);
	   if ( opt_v > 0) printf ( "%s -- checking for \"%s\"\n",
-----------------------------------------------------------------------
please change vgchange.c line 346 to line 354 that they looks like:

            if ( ( ret = vg_check_online_all_pv ( vg, &pv_offl, &pv_incons)) < 0
		 &&  ret != -LVM_EPV_READ_MD_DEVICE) {
		if ( ret == -LVM_EPV_READ_PV_CREATE_NAME_FROM_KDEV_T) {
			fprintf ( stderr, "%s -- ERROR: can't get name(s) of "
                                      "physical volumes\n"
                                       "%s -- Please check, if /proc "
                                       "is mounted\n",
                                       cmd, cmd);
               } else {

and test again.
-----------------------------------------------------------------------
The SGI xfs-2.4test1 tree has also an addition which adds some extra fields
to /proc/partitions.

--- 0.8final/tools/lib/lvm_dir_cache.c  Tue Feb 22 03:09:32 2000
+++ 0.8final-xfs/tools/lib/lvm_dir_cache.c      Sat Jun 17 01:27:28 2000
@@ -60,6 +60,7 @@
    char minor[20] = { 0, };
    char blocks[20] = { 0, };
    char devname[30] = { 0, };
+   char procline[127] ;
    static char *devdir[] = {
       "/dev/ida",
       "/dev/ide/hd",
@@ -85,7 +86,8 @@
    if ( dir_cache == NULL) {
       if ( ( proc = fopen ( "/proc/partitions", "r")) != NULL) {
          while ( !feof ( proc)) {
-             fscanf ( proc, " %s %s %s %s\n", major, minor, blocks, devname);
+            fgets ( procline, 127, proc) ;
+             sscanf ( procline, " %s %s %s %s\n", major, minor, blocks,
devname);
              if ( atoi ( major) > 0 && atoi ( major) != LVM_BLK_MAJOR) {
                 lvm_add_dir_cache ( "/dev", devname);
              }

-----------------------------------------------------------------------
HIBINO Kei reports access to an unused variable:

diff -ru 0.8final/tools/vgremove.c 0.8final-3/tools/vgremove.c
--- 0.8final/tools/vgremove.c   Mon Feb 21 19:09:33 2000
+++ 0.8final-3/tools/vgremove.c Tue Jun 27 13:03:37 2000
@@ -70,7 +70,6 @@
    };
    char *vg_name = NULL;
    vg_t *vg = NULL;
-   pv_t **pv = NULL;
 
    cmd = basename ( argv[0]);
 
@@ -195,7 +194,7 @@
                                cmd, vg_name);
       for ( p = 0; vg->pv[p] != NULL; p++) {
          if ( opt_v > 0) printf ( "%s -- initializing physical volume \"%s\"\n",
-                                  cmd, pv[p]->pv_name);
+                                  cmd, vg->pv[p]->pv_name);
          if ( ( ret = pv_setup_for_create ( vg->pv[p]->pv_name, vg->pv[p],
                                             vg->pv[p]->pv_size)) < 0) {
             fprintf ( stderr, "%s -- ERROR \"%s\" initializing physical "
