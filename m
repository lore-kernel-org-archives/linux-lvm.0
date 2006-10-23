From: Jonathan Brassow <jbrassow@redhat.com>
Date: Mon, 23 Oct 2006 16:01:34 -0500
Message-Id: <1161637294.20798.4.camel@hydrogen.msp.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] New --forceresync patch for LVM2 mirrors
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
To: linux-lvm@redhat.com, heinzm@redhat.com, agk@redhat.com

I've reworked the --forceresync patch according to suggestions made by
agk.

 brassow

This patch adds the --forcesync option to lvchange, allowing users
to force mirrors to resynchronize.

This operation is performed by clearing out the log device.  It
requires that the mirror be deactivated to do this.
If the mirror is in use, it can not be deactivated; and therefore,
can not be forcesynced.

Mirrors can have a persistent (disk) log or a non-persistent (core)
log.  When a core log is employed, it is enough to simply deactivate
and reactivate the mirror to start synchronization.  The full detail
is:
1) deactivate
2) clear any MIRROR_NOTSYNCED flag and commit meta data
3) activate
Items 1 & 3 are not necessary if the device was not active.

When a disk log is employed, we must detach the log device while
we are clearing it and then reattach it.  The full detail would
be:
1) deactivate
2) clear the MIRROR_NOTSYNCED flag
3) detach the log device and commit meta data (including #2)
4) activate log
5) clear log
6) deactivate log
7) reattach log
8) commit meta data
9) activate
Items 1 & 9 are not needed if device was not active.

Index: LVM2/man/lvchange.8
===================================================================
--- LVM2.orig/man/lvchange.8	2006-08-18 17:27:01.000000000 -0500
+++ LVM2/man/lvchange.8	2006-10-17 16:43:15.000000000 -0500
@@ -7,6 +7,7 @@ lvchange \- change attributes of a logic
 [\-A/\-\-autobackup y/n] [\-a/\-\-available y/n/ey/en/ly/ln]
 [\-\-alloc AllocationPolicy]
 [\-C/\-\-contiguous y/n] [\-d/\-\-debug] [\-\-deltag Tag]
+[\-\-forcesync]
 [\-h/\-?/\-\-help]
 [\-\-ignorelockingfailure]
 [\-\-monitor {y|n}]
@@ -40,6 +41,14 @@ logical volumes. It's only possible to c
 logical volume's allocation policy to contiguous, if all of the
 allocated physical extents are already contiguous.
 .TP
+.I \-\-forcesync
+This option only make sense if the logical volume being operated
+on is a mirrored logical volume.  This option is used to
+resynchronize the devices in a mirrored logical volume.  Since
+resynchronization can take considerable time and resources, you
+should consider using this option only if you have reason to
+believe that the devices in your mirror are no longer the same.
+.TP
 .I \-\-minor minor
 Set the minor number.
 .TP
Index: LVM2/tools/args.h
===================================================================
--- LVM2.orig/tools/args.h	2006-09-26 04:35:43.000000000 -0500
+++ LVM2/tools/args.h	2006-10-11 14:23:23.000000000 -0500
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
--- LVM2.orig/tools/commands.h	2006-10-07 18:04:36.000000000 -0500
+++ LVM2/tools/commands.h	2006-10-11 14:23:23.000000000 -0500
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
--- LVM2.orig/tools/lvchange.c	2006-10-11 14:23:23.000000000 -0500
+++ LVM2/tools/lvchange.c	2006-10-23 15:42:47.000000000 -0500
@@ -177,6 +177,120 @@ static int lvchange_refresh(struct cmd_c
 	return 1;
 }
 
+static int lvchange_syncstatus(struct cmd_context *cmd,
+			       struct logical_volume *lv)
+{
+	int active = 1;
+	struct lvinfo info;
+	struct logical_volume *log_lv;
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
+	/* We must assume that an lv is active if it is a cluster volume */
+	if (!(lv->status & CLUSTERED))
+		active = -1;
+
+	if ((!lv_info(cmd, lv, &info, 0) || !info.exists))
+		active = 0;
+
+	log_lv = first_seg(lv)->log_lv;
+
+	log_very_verbose("Attempting to start resync of %s, %s mirror, \"%s\"",
+			 (active == 1) ? "active" :
+			 (!active) ? "inactive" : "clustered",
+			 (log_lv) ? "disk-logged" : "core-logged",
+			 lv->name);
+
+	if (active && !deactivate_lv(cmd, lv)) {
+		log_error("Unable to deactivate, %s, for sync status change", lv->name);
+		return 0;
+	}
+
+	/*
+	 * If this mirror has a core log (i.e. !log_lv),
+	 * then simply deactivating/activating will cause
+	 * it to reset the sync status.  We only need to
+	 * worry about persistent logs.
+	 */
+	if (!log_lv && !(lv->status & MIRROR_NOTSYNCED)) {
+		if (active && !activate_lv(cmd, lv)) {
+			log_error("Failed to reactivate %s to resynchronize mirror", lv->name);
+			return 0;
+		}
+		return 1;
+	}
+
+	lv->status &= ~MIRROR_NOTSYNCED;
+
+	if (log_lv) {
+		/* Separate mirror log so we can clear it */
+		first_seg(lv)->log_lv = NULL;
+		log_lv->status &= ~MIRROR_LOG;
+		log_lv->status |= VISIBLE_LV;
+
+		if (!vg_write(lv->vg)) {
+			log_error("intermediate VG write failed.");
+			active && activate_lv(cmd, lv);
+			return 0;
+		}
+
+		backup(lv->vg);
+
+		if (!vg_commit(lv->vg)) {
+			log_error("intermediate VG commit failed.");
+			active && activate_lv(cmd, lv);
+			return 0;
+		}
+
+		if (!activate_lv(cmd, log_lv)) {
+			log_error("Unable to activate, %s, for sync status change",
+				  log_lv->name);
+			active && activate_lv(cmd, lv);
+			return 0;
+		}
+
+		log_very_verbose("Clearing log device, \"%s\"", log_lv->name);
+		if (!set_lv(cmd, log_lv, 0)) {
+			log_error("Unable to reset sync status for %s", lv->name);
+			deactivate_lv(cmd, log_lv);
+			active && activate_lv(cmd, lv);
+			return 0;
+		}
+
+		if (!deactivate_lv(cmd, log_lv)) {
+			log_error("Unable to deactivate, %s, for sync status change",
+				  log_lv->name);
+			active && activate_lv(cmd, lv);
+			return 0;
+		}
+
+		/* Put mirror log back in place */
+		first_seg(lv)->log_lv = log_lv;
+		log_lv->status |= MIRROR_LOG;
+		log_lv->status &= ~VISIBLE_LV;
+	}
+
+	log_very_verbose("Updating logical volume \"%s\" on disk(s)", lv->name);
+	if (!vg_write(lv->vg) || !vg_commit(lv->vg)) {
+		log_error("Failed to update meta-data on disk.");
+		return 0;
+	}
+
+	if (active && !activate_lv(cmd, lv)) {
+		log_error("Failed to reactivate %s after sync status change", lv->name);
+		return 0;
+	}
+
+	return 1;
+}
+
 static int lvchange_alloc(struct cmd_context *cmd, struct logical_volume *lv)
 {
 	int want_contiguous = 0;
@@ -498,6 +612,10 @@ static int lvchange_single(struct cmd_co
 	if (doit)
 		log_print("Logical volume \"%s\" changed", lv->name);
 
+	if (arg_count(cmd, forcesync_ARG))
+		if (!lvchange_syncstatus(cmd, lv))
+			return ECMD_FAILED;
+
 	/* availability change */
 	if (arg_count(cmd, available_ARG)) {
 		if (!lvchange_availability(cmd, lv))
@@ -525,9 +643,10 @@ int lvchange(struct cmd_context *cmd, in
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
