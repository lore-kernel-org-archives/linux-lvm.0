Date: Tue, 23 May 2000 17:21:13 +0200
From: Jan Niehusmann <list039@gondor.com>
Subject: [linux-lvm] vgcfgbackup
Message-ID: <20000523172113.A3636@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@msede.com

vgcfgbackup macht bei mir immer nur ein Backup und beh�lt die �lteren
Versionen nicht. Folgender Patch scheint das zu beheben (relativ zu
0.8final)

--- 0.8final.orig/tools/lib/vg_cfgbackup.c	Tue Feb 22 03:09:32 2000
+++ 0.8final/tools/lib/vg_cfgbackup.c	Tue May 23 17:02:35 2000
@@ -366,7 +366,7 @@
       }
 
       /* VGDA backup history */
-      for ( i = vg_max_backups; i > 1; i--) {
+      for ( i = vg_max_backups; i >= 1; i--) {
          sprintf ( vg_backup_path_old2, "%s/%s.conf.%d.old%c",
                                         directory, vg_name, i, 0);
          if ( opt_v > 0) printf ( "%s -- checking for \"%s\"\n",
