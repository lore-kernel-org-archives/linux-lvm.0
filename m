From: Jonathan Brassow <jbrassow@redhat.com>
Date: Wed, 11 Oct 2006 10:20:40 -0500
Message-Id: <1160580040.30654.18.camel@hydrogen.msp.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [LVM2 PATCH] mirror force resync option
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
To: linux-lvm@redhat.com, agk@redhat.com

Patch originally developed by Jun'ichi Nomura and altered to be cluster
capable.

 brassow

This patch adds the --forcesync option to lvchange, allowing users
to force mirrors to resynchronize.

This operation is performed by clearing out the log device.  It
requires that the mirror be deactivated to do this.  If the
mirror is not currently active, the log device is activated, cleared,
and deactivated.  If the mirror is currently active, the mirror
is deactivated, the log device is activated and cleared, and the
mirror is reactivated.

If the mirror is in use, it can not be deactivated; and therefore,
can not be forcesynced.  This creates a particular anomaly in the
cluster context.  If the mirror is active on some nodes in the cluster,
but not the node where the command is issued, the command "succeeds" -
even though the remote nodes maintain the same sync status.  I view
this as a bug in the 'deactivate_lv' code, since it should fail if
it is unable to deactivate the lv on all nodes.  Comments on this
are welcome.

Index: LVM2/man/lvchange.8
===================================================================
--- LVM2.orig/man/lvchange.8	2006-10-10 17:02:49.000000000 -0500
+++ LVM2/man/lvchange.8	2006-10-10 17:03:24.000000000 -0500
@@ -7,6 +7,7 @@ lvchange \- change attributes of a logic
 [\-A/\-\-autobackup y/n] [\-a/\-\-available y/n/ey/en/ly/ln]
 [\-\-alloc AllocationPolicy]
 [\-C/\-\-contiguous y/n] [\-d/\-\-debug] [\-\-deltag Tag]
+[\-\-forcesync]
 [\-h/\-?/\-\-help]
 [\-\-ignorelockingfailure]
 [\-\-monitor {y|n}]
@@ -40,6 +41,9 @@ logical volumes. It's only possible to c
 logical volume's allocation policy to contiguous, if all of the
 allocated physical extents are already contiguous.
 .TP
+.I \-\-forcesync
+Enforce resynching the mirrored logical volumes.
+.TP
 .I \-\-minor minor
 Set the minor number.
 .TP
Index: LVM2/tools/args.h
===================================================================
--- LVM2.orig/tools/args.h	2006-10-10 17:02:49.000000000 -0500
+++ LVM2/tools/args.h	2006-10-10 17:03:24.000000000 -0500
@@ -46,6 +46,7 @@ arg(alloc_ARG, '\0', "alloc", alloc_arg)
 arg(separator_ARG, '\0', "separator", string_arg)
 arg(mirrorsonly_ARG, '\0', "mirrorsonly", NULL)
 arg(nosync_ARG, '\0', "nosync", NULL)
+arg(forcesync_ARG, '\0', "forcesync", NULL)
 arg(corelog_ARG, '\0', "corelog", NULL)
 arg(monitor_ARG, '\0', "monitor", yes_no_arg)
 arg(config_ARG, '\0', "config", string_arg)
Index: LVM2/tools/commands.h
===================================================================
--- LVM2.orig/tools/commands.h	2006-10-10 17:02:49.000000000 -0500
+++ LVM2/tools/commands.h	2006-10-10 17:03:24.000000000 -0500
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
 
Index: LVM2/tools/lvchange.c
===================================================================
--- LVM2.orig/tools/lvchange.c	2006-10-10 17:02:49.000000000 -0500
+++ LVM2/tools/lvchange.c	2006-10-10 17:19:44.000000000 -0500
@@ -177,6 +177,102 @@ static int lvchange_refresh(struct cmd_c
 	return 1;
 }
 
+static int lvchange_syncstatus(struct cmd_context *cmd,
+			       struct logical_volume *lv)
+{
+	int active = 1;
+	struct lvinfo info;
+
+	if (!(lv->status & MIRRORED))
+		return 1;
+
+	if (lv->status & PVMOVE) {
+		log_error("Unable to change sync status of pvmove volume, %s",
+			  lv->name);
+		return 0;
+	}
+
+	if (!lv_info(cmd, lv, &info, 0) || !info.exists)
+		active = 0;
+
+	if (active) {
+		if (!deactivate_lv(cmd, lv)) {
+			log_error("Unable to deactivate, %s, for sync status change", lv->name);
+			log_error("Hint: %s may be in-use", lv->name);
+			return 0;
+		}
+
+		/* Must activate log, or we can't zero it */
+		if (!activate_lv(cmd, first_seg(lv)->log_lv)) {
+			log_error("Unable to activate, %s, for sync status change",
+				  first_seg(lv)->log_lv->name);
+			activate_lv(cmd, lv);
+			return 0;
+		}
+
+		/*
+		 * Note: there is no need to deactivate the log before
+		 * we activate the mirror
+		 */
+
+		if (!set_lv(cmd, first_seg(lv)->log_lv, 0)) {
+			log_error("Unable to reset sync status for %s", lv->name);
+			activate_lv(cmd, lv);
+			return 0;
+		}
+
+		if (!activate_lv(cmd, lv)) {
+			log_error("Failed to reactivate %s after sync status change", lv->name);
+			return 0;
+		}
+	} else {
+		/* Must activate log, or we can't zero it */
+		if (!activate_lv(cmd, first_seg(lv)->log_lv)) {
+			log_error("Unable to activate, %s, for sync status change",
+				  first_seg(lv)->log_lv->name);
+			return 0;
+		}
+
+		if (!set_lv(cmd, first_seg(lv)->log_lv, 0)) {
+			log_error("Unable to reset sync status for %s", lv->name);
+			deactivate_lv(cmd, first_seg(lv)->log_lv);
+			return 0;
+		}
+
+		if (!deactivate_lv(cmd, first_seg(lv)->log_lv)) {
+			log_error("Failed to deactivate %s after sync status change",
+				  first_seg(lv)->log_lv->name);
+			return 0;
+		}
+	}
+
+	if (!(lv->status & MIRROR_NOTSYNCED))
+		return 1;
+
+	/*
+	 * We need to drop MIRROR_NOTSYNCED flag in metadata.
+	 * We can do it only after the logical volume has been
+	 * activated with force sync to ensure disk log is updated.
+	 */
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
+	if (!vg_commit(lv->vg)) {
+		resume_lv(cmd, lv);
+		return 0;
+	}
+
+	return 1;
+}
+
 static int lvchange_alloc(struct cmd_context *cmd, struct logical_volume *lv)
 {
 	int want_contiguous = 0;
@@ -498,6 +594,10 @@ static int lvchange_single(struct cmd_co
 	if (doit)
 		log_print("Logical volume \"%s\" changed", lv->name);
 
+	if (arg_count(cmd, forcesync_ARG))
+		if (!lvchange_syncstatus(cmd, lv))
+			return ECMD_FAILED;
+
 	/* availability change */
 	if (arg_count(cmd, available_ARG)) {
 		if (!lvchange_availability(cmd, lv))
@@ -525,9 +625,10 @@ int lvchange(struct cmd_context *cmd, in
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
