Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103122319.f2CNJKP00753@webber.adilger.int>
Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore
In-Reply-To: <GIEGKMCLIJBKBNBCCHEAKEIGCAAA.heimdall@mail.org> from Daniel Whicker
 at "Mar 12, 2001 12:40:50 pm"
Date: Mon, 12 Mar 2001 16:19:20 -0700 (MST)
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

Daniel Whicker writes:
[Attachment, skipping...]

Anyways,
vgscan doesn't appear to be finding any of your PVs because they are missing
the "HM" magic for the PV, or so err -268 tells me.  The only PV that appears
intact is /dev/hdc, which ends up being discarded because it isn't in the dir
cache.  You can see that nothing is found from pv_read_all_pv() - it reports
"np: 0" at the end.

Are you running devfs, or even have it compiled into the kernel by any chance?
It also appears you are not running the current CVS code (pretty much a must
when tracking down problems) because you are going into lvm_add_dir_cache()
multiple times.

Here is a patch which fixes up lvm_dir_cache() to report about devices
it is probing, to help track down these problems.  I've been using this
for a while on my system, so it should be OK to add to CVS.  It also
cleans up a bit of the good old LVM_DIR_PREFIX stuff at the same time.

Cheers, Andreas
==========================================================================
diff -u -u -r1.4.2.6 lvm_dir_cache.c
--- tools/lib/lvm_dir_cache.c	2001/02/20 15:00:08	1.4.2.6
+++ tools/lib/lvm_dir_cache.c	2001/03/12 23:00:28
@@ -45,9 +45,8 @@
 
 #include <liblvm.h>
 
-char *dirname = NULL;
 int  lvm_dir_cache_hit ( dir_cache_t*, int, dev_t);
-void lvm_add_dir_cache ( char*, char*);
+int  lvm_add_dir_cache ( char *, char *);
 
 static dir_cache_t *dir_cache = NULL;
 static int cache_size = 0;
@@ -64,15 +64,15 @@
    char minor[20] = { 0, };
    char blocks[20] = { 0, };
    char devname[30] = { 0, };
-   static char *devdir[] = {
-      "/dev/ida",
-      "/dev/ide/hd",
-      "/dev/loop",
-      "/dev/md",
-      "/dev/rd",
-      "/dev/sd",
-      "/dev/cciss",
-      "/dev",
+   char *devsub[] = {
+      "cciss/",
+      "ida/",
+      "ide/hd/",
+      "loop/",
+      "md/",
+      "rd/",
+      "sd/",
+      "",
       NULL
    };
    struct dirent **dirent = NULL;
@@ -94,24 +94,24 @@
                    " %s %s %s %s\n",
                    major, minor, blocks, devname);
           if ( atoi ( major) > 0 && atoi ( major) != LVM_BLK_MAJOR) {
-             lvm_add_dir_cache ( "/dev", devname);
+             lvm_add_dir_cache(LVM_DIR_PREFIX, devname);
           }
       }   
       fclose ( proc);
    }
    if ( cache_size == 0 && lvm_check_devfs() == FALSE) {
-      for ( d = 0; devdir[d] != NULL; d++) {
-         dirname = devdir[d];
-         debug ( "lvm_dir_cache -- calling scandir() with %s\n",
-                 dirname);
+      for ( d = 0; devsub[d] != NULL; d++) {
+         char dirname[NAME_LEN];
+         sprintf(dirname, LVM_DIR_PREFIX "%s", devsub[d]);
+         debug ( "lvm_dir_cache -- calling scandir() with %s\n", dirname);
          if ( ( dirent_count = scandir ( dirname, &dirent,
                                          NULL,
                                          alphasort)) > 0) {
             for ( n = 0; n < dirent_count; n++) {
                lvm_add_dir_cache ( dirname, dirent[n]->d_name);
+               free ( dirent[n]);
             }
 
-            for ( n = 0; n < dirent_count; n++) free ( dirent[n]);
             free ( dirent);
          }
          debug ( "lvm_dir_cache -- AFTER calling scandir() "
@@ -130,21 +132,23 @@
 }
 
 
-void lvm_add_dir_cache ( char *directory, char *devname) {
+int lvm_add_dir_cache ( char *directory, char *devname)
+{
    char devpath[NAME_LEN] = { 0, };
    dir_cache_t *dir_cache_sav = NULL;
    struct stat stat_b;
+   int ret = FALSE;
 
-   debug_enter ( "lvm_add_dir_cache -- CALLED\n");
+   debug_enter ( "lvm_add_dir_cache -- CALLED with %s%s\n", directory, devname);
 
    if ( directory != NULL && devname != NULL) {
-      sprintf ( devpath, "%s/%s%c", directory, devname, 0);
+      sprintf ( devpath, "%s%s", directory, devname);
       if ( stat ( devpath, &stat_b) == -1 ||
            lvm_check_dev ( &stat_b, TRUE) == FALSE)
          goto lvm_add_dir_cache_end;
    
-      if ( lvm_dir_cache_hit ( dir_cache, cache_size,
-                               stat_b.st_rdev) == FALSE) {
+      if ((ret = lvm_dir_cache_hit(dir_cache, cache_size,
+                                   stat_b.st_rdev) == FALSE)) {
          dir_cache_sav = dir_cache;
          if ( ( dir_cache =
                    realloc ( dir_cache,
@@ -170,13 +176,13 @@
          dir_cache[cache_size].st_rdev = stat_b.st_rdev;
          dir_cache[cache_size].st_mode = stat_b.st_mode;
          cache_size++;
+         ret = TRUE;
       }
    }
 
 lvm_add_dir_cache_end:
-
-   debug_leave ( "lvm_add_dir_cache -- LEAVING\n");
-   return;
+   debug_leave ( "lvm_add_dir_cache -- LEAVING with ret: %d\n", ret);
+   return ret;
 }
 
 
@@ -185,9 +191,9 @@
    int d = 0;
    dir_cache_t *dir_cache = NULL, *ret = NULL;
 
-   debug_enter ( "lvm_dir_cache_find -- CALLED\n");
+   debug_enter ( "lvm_dir_cache_find -- CALLED with %s\n", dev_name);
 
-   if ( dev_name != NULL && pv_check_name ( dev_name) == 0) {
+   if ( dev_name != NULL) {
       d = lvm_dir_cache ( &dir_cache);
       for ( d--; d >= 0; d--) {
          if ( strcmp ( dev_name, dir_cache[d].dev_name) == 0) {
@@ -197,7 +203,7 @@
       }
    }
 
-   debug_leave ( "lvm_dir_cache_find -- LEAVING\n");
+   debug_leave ( "lvm_dir_cache_find -- LEAVING with entry: %d\n", ret ? d:-1);
    return ret;
 }
 
@@ -223,7 +230,7 @@
 
 int lvm_check_devfs ( void) {
    int ret = FALSE;
-   char dummy[NAME_LEN];
+   char dir[NAME_LEN];
    char type[32];
    FILE *mounts = NULL;
 
@@ -232,10 +239,9 @@
    if ( ( mounts = fopen ( "/proc/mounts", "r")) != NULL) {
       while ( !feof ( mounts)) {
           fgets ( line, 127, mounts);
-          sscanf ( line,
-                   "%s %s %s %s\n",
-                   dummy, dummy, type, dummy);
-          if ( strcmp ( type, "devfs") == 0) {
+          sscanf ( line, "%*s %s %s %*s", dir, type);
+          if ( strcmp ( type, "devfs") == 0 &&
+	       strncmp ( dir, LVM_DIR_PREFIX, sizeof(LVM_DIR_PREFIX) - 1)) {
              ret = TRUE;
              break;
           }
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
