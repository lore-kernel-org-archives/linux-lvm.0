Message-ID: <450716C9.1000505@ce.jp.nec.com>
Date: Tue, 12 Sep 2006 16:21:29 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090407030308030004000901"
Subject: [linux-lvm] [PATCH LVM2] Add mirror force resync option to lvchange
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
To: Alasdair Kergon <agk@redhat.com>, Jonathan Brassow <jbrassow@redhat.com>, linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------090407030308030004000901
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hi,

Attached is a patch implementing "--forcesync" option of lvchange
to start resync regardless of current log status.
If the LV is created with "--nosync" option, the volume type flag
of lvs changes from "M" to "m".

This is useful to ensure mirrors are resynced after failure in corner case.

Comments are welcome.

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America

--------------090407030308030004000901
Content-Type: text/x-patch;
 name="lvchange-forcesync-1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lvchange-forcesync-1.patch"

Add --forcesync option to lvchange to force resync mirror LV.
It also turns 'M' (without initial sync) flag into 'm' (normal mirror)
if the LV is created with --nosync.

Applicable to LVM2 2.02.09.

diff -X dontdiff -urp LVM2/include/log.h LVM2.forcesync-global/include/log.h
--- LVM2/include/log.h	2006-08-17 23:42:36.000000000 -0400
+++ LVM2.forcesync-global/include/log.h	2006-09-11 22:17:01.000000000 -0400
@@ -75,6 +75,7 @@ void init_ignorelockingfailure(int level
 void init_lockingfailed(int level);
 void init_security_level(int level);
 void init_mirror_in_sync(int in_sync);
+void init_mirror_force_sync(int force_sync);
 void init_dmeventd_register(int reg);
 
 void set_cmd_name(const char *cmd_name);
@@ -90,6 +91,7 @@ int ignorelockingfailure(void);
 int lockingfailed(void);
 int security_level(void);
 int mirror_in_sync(void);
+int mirror_force_sync(void);
 int dmeventd_register_mode(void);
 
 /* Suppress messages to stdout/stderr (1) or everywhere (2) */
diff -X dontdiff -urp LVM2/lib/log/log.c LVM2.forcesync-global/lib/log/log.c
--- LVM2/lib/log/log.c	2006-08-23 04:18:58.000000000 -0400
+++ LVM2.forcesync-global/lib/log/log.c	2006-09-11 21:22:23.000000000 -0400
@@ -48,6 +48,7 @@ static char _cmd_name[30] = "";
 static char _msg_prefix[30] = "  ";
 static int _already_logging = 0;
 static int _mirror_in_sync = 0;
+static int _mirror_force_sync = 0;
 static int _dmeventd_register = DEFAULT_DMEVENTD_MONITOR;
 
 static lvm2_log_fn_t _lvm2_log_fn = NULL;
@@ -189,6 +190,11 @@ void init_mirror_in_sync(int in_sync)
 	_mirror_in_sync = in_sync;
 }
 
+void init_mirror_force_sync(int force_sync)
+{
+	_mirror_force_sync = force_sync;
+}
+
 void init_dmeventd_register(int reg)
 {
 	_dmeventd_register = reg;
@@ -268,6 +274,11 @@ int mirror_in_sync(void)
 	return _mirror_in_sync;
 }
 
+int mirror_force_sync(void)
+{
+	return _mirror_force_sync;
+}
+
 int dmeventd_register_mode(void)
 {
 	return _dmeventd_register;
diff -X dontdiff -urp LVM2/lib/log/log.h LVM2.forcesync-global/lib/log/log.h
--- LVM2/lib/log/log.h	2006-08-17 23:42:36.000000000 -0400
+++ LVM2.forcesync-global/lib/log/log.h	2006-09-11 22:17:01.000000000 -0400
@@ -75,6 +75,7 @@ void init_ignorelockingfailure(int level
 void init_lockingfailed(int level);
 void init_security_level(int level);
 void init_mirror_in_sync(int in_sync);
+void init_mirror_force_sync(int force_sync);
 void init_dmeventd_register(int reg);
 
 void set_cmd_name(const char *cmd_name);
@@ -90,6 +91,7 @@ int ignorelockingfailure(void);
 int lockingfailed(void);
 int security_level(void);
 int mirror_in_sync(void);
+int mirror_force_sync(void);
 int dmeventd_register_mode(void);
 
 /* Suppress messages to stdout/stderr (1) or everywhere (2) */
diff -X dontdiff -urp LVM2/lib/mirror/mirrored.c LVM2.forcesync-global/lib/mirror/mirrored.c
--- LVM2/lib/mirror/mirrored.c	2006-07-29 00:46:10.000000000 -0400
+++ LVM2.forcesync-global/lib/mirror/mirrored.c	2006-09-11 21:28:16.000000000 -0400
@@ -255,7 +255,9 @@ static int _add_log(struct dev_manager *
 		log_flags |= DM_CORELOG;
 	}
 
-	if (mirror_in_sync() && !(seg->status & PVMOVE))
+	if (mirror_force_sync())
+		log_flags |= DM_FORCESYNC;
+	else if (mirror_in_sync() && !(seg->status & PVMOVE))
 		log_flags |= DM_NOSYNC;
 
 	if (_block_on_error_available && !(seg->status & PVMOVE))
diff -X dontdiff -urp LVM2/tools/args.h LVM2.forcesync-global/tools/args.h
--- LVM2/tools/args.h	2006-08-17 23:42:36.000000000 -0400
+++ LVM2.forcesync-global/tools/args.h	2006-09-11 21:23:28.000000000 -0400
@@ -46,6 +46,7 @@ arg(alloc_ARG, '\0', "alloc", alloc_arg)
 arg(separator_ARG, '\0', "separator", string_arg)
 arg(mirrorsonly_ARG, '\0', "mirrorsonly", NULL)
 arg(nosync_ARG, '\0', "nosync", NULL)
+arg(forcesync_ARG, '\0', "forcesync", NULL)
 arg(corelog_ARG, '\0', "corelog", NULL)
 arg(monitor_ARG, '\0', "monitor", yes_no_arg)
 arg(config_ARG, '\0', "config", string_arg)
diff -X dontdiff -urp LVM2/tools/commands.h LVM2.forcesync-global/tools/commands.h
--- LVM2/tools/commands.h	2006-08-17 23:42:36.000000000 -0400
+++ LVM2.forcesync-global/tools/commands.h	2006-09-11 21:23:04.000000000 -0400
@@ -61,6 +61,7 @@ xx(lvchange,
    "\t[-d|--debug]\n"
    "\t[--deltag Tag]\n"
    "\t[-f|--force]\n"
+   "\t[--forcesync]\n"
    "\t[-h|--help]\n"
    "\t[--ignorelockingfailure]\n"
    "\t[--monitor {y|n}]\n"
@@ -75,7 +76,7 @@ xx(lvchange,
    "\tLogicalVolume[Path] [LogicalVolume[Path]...]\n",
 
    alloc_ARG, autobackup_ARG, available_ARG, contiguous_ARG, force_ARG,
-   ignorelockingfailure_ARG, major_ARG, minor_ARG, monitor_ARG,
+   forcesync_ARG, ignorelockingfailure_ARG, major_ARG, minor_ARG, monitor_ARG,
    partial_ARG, permission_ARG, persistent_ARG, readahead_ARG,
    refresh_ARG, addtag_ARG, deltag_ARG, test_ARG)
 
diff -X dontdiff -urp LVM2/tools/lvchange.c LVM2.forcesync-global/tools/lvchange.c
--- LVM2/tools/lvchange.c	2006-07-29 02:20:07.000000000 -0400
+++ LVM2.forcesync-global/tools/lvchange.c	2006-09-13 01:19:02.000000000 -0400
@@ -175,6 +175,63 @@ static int lvchange_refresh(struct cmd_c
 	return 1;
 }
 
+static int lvchange_syncstatus(struct cmd_context *cmd,
+			       struct logical_volume *lv)
+{
+	struct lvinfo info;
+
+	if (!(lv->status & MIRRORED))
+		return 1;
+
+	if (!lv_info(cmd, lv, &info, 0) || !info.exists) {
+		log_error("Logical volume, %s, is not active", lv->name);
+		return 0;
+	}
+
+	init_mirror_force_sync(1);
+
+	if (!(lv->status & MIRROR_NOTSYNCED))
+		return lvchange_refresh(cmd, lv);
+
+	/*
+	 * We need to drop MIRROR_NOTSYNCED flag in metadata.
+	 * We can do it only after the logical volume once has been
+	 * activated with force sync to ensure disk log is updated by kernel.
+	 */
+	if (!lvchange_refresh(cmd, lv)) {
+		log_error("Failed to unmark %s not-synced", lv->name);
+		return 0;
+	}
+
+	lv->status &= ~MIRROR_NOTSYNCED;
+
+	log_very_verbose("Updating logical volume \"%s\" on disk(s)", lv->name);
+	if (!vg_write(lv->vg)) {
+		stack;
+		return 0;
+	}
+
+	backup(lv->vg);
+
+	if (!suspend_lv(cmd, lv)) {
+		log_error("Failed to lock %s", lv->name);
+		vg_revert(lv->vg);
+		return 0;
+	}
+
+	if (!vg_commit(lv->vg)) {
+		resume_lv(cmd, lv);
+		return 0;
+	}
+
+	if (!resume_lv(cmd, lv)) {
+		log_error("Problem reactivating %s", lv->name);
+		return 0;
+	}
+
+	return 1;
+}
+
 static int lvchange_alloc(struct cmd_context *cmd, struct logical_volume *lv)
 {
 	int want_contiguous = 0;
@@ -502,6 +559,10 @@ static int lvchange_single(struct cmd_co
 			return ECMD_FAILED;
 	}
 
+	if (arg_count(cmd, forcesync_ARG))
+		if (!lvchange_syncstatus(cmd, lv))
+			return ECMD_FAILED;
+
 	if (arg_count(cmd, refresh_ARG))
 		if (!lvchange_refresh(cmd, lv))
 			return ECMD_FAILED;
@@ -523,9 +584,10 @@ int lvchange(struct cmd_context *cmd, in
 	    && !arg_count(cmd, minor_ARG) && !arg_count(cmd, major_ARG)
 	    && !arg_count(cmd, persistent_ARG) && !arg_count(cmd, addtag_ARG)
 	    && !arg_count(cmd, deltag_ARG) && !arg_count(cmd, refresh_ARG)
-	    && !arg_count(cmd, alloc_ARG) && !arg_count(cmd, monitor_ARG)) {
+	    && !arg_count(cmd, alloc_ARG) && !arg_count(cmd, monitor_ARG)
+	    && !arg_count(cmd, forcesync_ARG)) {
 		log_error("Need 1 or more of -a, -C, -j, -m, -M, -p, -r, "
-			  "--refresh, --alloc, --addtag, --deltag "
+			  "--forcesync, --refresh, --alloc, --addtag, --deltag "
 			  "or --monitor");
 		return EINVALID_CMD_LINE;
 	}

--------------090407030308030004000901--
