Date: Fri, 8 Dec 2006 15:07:34 +0100
From: Bastian Blank <waldi@debian.org>
Message-ID: <20061208140734.GA20472@wavehammer.waldi.eu.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [iwj@ubuntu.com: Bug#402132: lvm2 racey symlink
	creation]
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: Alasdair G Kergon <agk@redhat.com>

----- Forwarded message from Ian Jackson <iwj@ubuntu.com> -----

Date: Fri, 8 Dec 2006 12:20:05 +0000
From: Ian Jackson <iwj@ubuntu.com>
To: submit@bugs.debian.org
Subject: Bug#402132: lvm2 racey symlink creation

Package: lvm2
Version: 2.02.06-2
Tags: patch

When the lvm2 utilities vgchange, vgmknodes, et al, create the
/dev/<vg>/<lv> symlinks, they do it like this
    lstat
    unlink
    symlink

This means that even if the vg is and remains active throughout, there
is a moment when the symlink is missing.  Any other program on the
system which is referring to that lv may see this glitch and
misbehave.

The patch below fixes this.  It now does this instead:
    stat
    symlink to /dev/<vg>/<lv>..tmp
    rename the ..tmp symlink to /dev/<vg>/<lv>

FYI, we will be deploying this change in the forthcoming Ubuntu
release.

Thanks for your attention,
Ian.

diff -ruN --exclude='*~' orig/lvm2-2.02.06/lib/activate/fs.c lvm2-2.02.06/lib/activate/fs.c
--- orig/lvm2-2.02.06/lib/activate/fs.c	2005-11-15 17:45:32.000000000 +0000
+++ lvm2-2.02.06/lib/activate/fs.c	2006-12-08 12:16:32.000000000 +0000
@@ -106,7 +106,7 @@
 		    const char *lv_name, const char *dev)
 {
 	char lv_path[PATH_MAX], link_path[PATH_MAX], lvm1_group_path[PATH_MAX];
-	char vg_path[PATH_MAX];
+	char vg_path[PATH_MAX], lv_path_tmp[PATH_MAX];
 	struct stat buf;
 
 	if (lvm_snprintf(vg_path, sizeof(vg_path), "%s%s",
@@ -123,6 +123,13 @@
 		return 0;
 	}
 
+	if (lvm_snprintf(lv_path_tmp, sizeof(lv_path_tmp), "%s..tmp",
+			 lv_path) == -1) {
+		log_error("Couldn't create temporary pathname for "
+			  "logical volume link %s", lv_path);
+		return 0;
+	}
+
 	if (lvm_snprintf(link_path, sizeof(link_path), "%s/%s",
 			 dm_dir(), dev) == -1) {
 		log_error("Couldn't create destination pathname for "
@@ -160,17 +167,11 @@
 				  link_path);
 			return 0;
 		}
-
-		log_very_verbose("Removing %s", lv_path);
-		if (unlink(lv_path) < 0) {
-			log_sys_error("unlink", lv_path);
-			return 0;
-		}
 	}
 
-	log_very_verbose("Linking %s -> %s", lv_path, link_path);
-	if (symlink(link_path, lv_path) < 0) {
-		log_sys_error("symlink", lv_path);
+	log_very_verbose("Linking %s -> %s", lv_path_tmp, link_path);
+	if (symlink(link_path, lv_path_tmp) < 0) {
+		log_sys_error("symlink", lv_path_tmp);
 		return 0;
 	}
 
@@ -181,6 +182,12 @@
         }
 #endif
 
+	log_very_verbose("Installing symlink %s as %s", lv_path_tmp, lv_path);
+	if (rename(lv_path_tmp, lv_path) < 0) {
+		log_sys_error("rename", lv_path_tmp);
+		return 0;
+	}
+
 	return 1;
 }

----- End forwarded message -----

-- 
Violence in reality is quite different from theory.
		-- Spock, "The Cloud Minders", stardate 5818.4
