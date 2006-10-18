In-Reply-To: <20061011223933.GU17654@agk.surrey.redhat.com>
References: <1160580040.30654.18.camel@hydrogen.msp.redhat.com>
	<20061011223933.GU17654@agk.surrey.redhat.com>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: multipart/mixed; boundary=Apple-Mail-3-353057281
Message-Id: <f5afdbef4f4b5ae35732b53034c11061@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Date: Wed, 18 Oct 2006 13:32:47 -0500
Subject: [linux-lvm] Re: [LVM2 PATCH] mirror force resync option
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
To: Kergon Alasdair <agk@redhat.com>, Jun'ichi Nomura <j-nomura@ce.jp.nec.com>
Cc: linux-lvm@redhat.com


--Apple-Mail-3-353057281
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed


On Oct 11, 2006, at 5:39 PM, Alasdair G Kergon wrote:

> On Wed, Oct 11, 2006 at 10:20:40AM -0500, Jon Brassow wrote:
>> I view
>> this as a bug in the 'deactivate_lv' code, since it should fail if
>> it is unable to deactivate the lv on all nodes.
>
> Correct, if that's true.  But the code doesn't show any deactivation
> attempt!  (see below)

Good spot.  I was incorrectly understanding the lv_info... line to 
identify active lv's on other machines.

>> +Enforce resynching the mirrored logical volumes.
>
> Needs explaining better here for someone who doesn't know
> what that means/involves:-)

Explanation expanded.

>
>> +	if (!(lv->status & MIRRORED))
>> +		return 1;
>
> Are you sure this shouldn't be an error?

I haven't changed this.  So, if tried on a linear volume, there would 
be no error (but nothing would be done).  This is easily changed if you 
like.

>
>> +	if (!lv_info(cmd, lv, &info, 0) || !info.exists)
>> +		active = 0;
>
> This is currently defined as telling you if the device is active on
> the local node.  (Patrick's looking at extending it to the cluster.)

right.

>
>> +	if (active) {
>> +		if (!deactivate_lv(cmd, lv)) {
>> +			log_error("Unable to deactivate, %s, for sync status change", 
>> lv->name);
>> +			log_error("Hint: %s may be in-use", lv->name);
>> +			return 0;
>> +		}
>
> On a cluster, you need to call deactivate_lv *even if* it's not active 
> on the
> local node.  So test for the VG clustered flag and use that to decide
> whether to do the lv_info/active test or not.  (That's only a local 
> optimisation
> normally to assist with the error messages.)

right

>
>> +		/* Must activate log, or we can't zero it */
>> +		if (!activate_lv(cmd, first_seg(lv)->log_lv)) {
>> +			log_error("Unable to activate, %s, for sync status change",
>> +				  first_seg(lv)->log_lv->name);
>> +			activate_lv(cmd, lv);
>> +			return 0;
>> +		}
>
> Interesting.   That extension to the interface needs more comment: you 
> need to
> demonstrate that the operation is either atomic (which it doesn't 
> appear to be
> at first sight), or else if it's not atomic, there must be no failure 
> modes
> that lead to corruption, or people thinking a complete resync got 
> forced when
> it actually didn't.
>
> Normally you're not allowed to activate only part of a device tree - 
> you can't
> activate a mirror log except as part of the mirror.   Notice how 
> lvcreate
> and lvconvert manipulate the log independently before attaching it to 
> the
> mirror.  However the recent changes to prepare for stacked devices 
> should be
> sufficient for that particular activation to work, so that's probably 
> acceptable
> now.
>
> A breakdown into atomic operations might be:
> Detach the log (leaving the [inactive] mirror with a core log), wipe 
> the log,
> then reattach it.
> Or you could introduce an additional metadata state to indicate the log
> needs to be wiped, wipe it, then revert to the previous metadata state.
> Or have a combination of both (so that a future lvchange -ay can 
> complete
> the process if interrupted).
>
>> +		/*
>> +		 * Note: there is no need to deactivate the log before
>> +		 * we activate the mirror
>> +		 */
>
> Because of the stacking preparation now, yes, so long as set_lv() 
> syncs the
> block device correctly.
>

Basically, I only added more to the man page and a check for CLUSTERED 
in tools/lvchange.c.  I've also added some comments in the patch as to 
why I believe the operation is atomic - posing no inconsistencies 
should the operation/machine fail while part way through.

  brassow


--Apple-Mail-3-353057281
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream; x-unix-mode=0664;
	name="forcesync_mirror_option.patch"
Content-Disposition: attachment;
	filename=forcesync_mirror_option.patch

This patch adds the --forcesync option to lvchange, allowing users
to force mirrors to resynchronize.

This operation is performed by clearing out the log device.  It
requires that the mirror be deactivated to do this.  If the
mirror is not currently active, the log device is activated, cleared,
and deactivated.  If the mirror is currently active, the mirror
is deactivated, the log device is activated and cleared, and the
mirror is reactivated.

If the mirror is in use, it can not be deactivated; and therefore,
can not be forcesynced.

A note about atomicity...  When clearing the log device, the first
sector that gets overwritten is the one containing the log magic
number.  Once overwritten, the mirror will resynchronize by default.
So, the machine can die before or after the first sector is written.
This results in the desired action being taken or not taken, but
not partially taken.  As far as the activation/deactivation process
that is happening, every case is accounted for by an error message
and backout efforts.

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
+++ LVM2/tools/lvchange.c	2006-10-18 13:14:37.000000000 -0500
@@ -177,6 +177,104 @@ static int lvchange_refresh(struct cmd_c
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
+	/* We must assume that an lv is active if it is a cluster volume */
+	if (!(lv->status & CLUSTERED) &&
+	    (!lv_info(cmd, lv, &info, 0) || !info.exists))
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
@@ -498,6 +596,10 @@ static int lvchange_single(struct cmd_co
 	if (doit)
 		log_print("Logical volume \"%s\" changed", lv->name);
 
+	if (arg_count(cmd, forcesync_ARG))
+		if (!lvchange_syncstatus(cmd, lv))
+			return ECMD_FAILED;
+
 	/* availability change */
 	if (arg_count(cmd, available_ARG)) {
 		if (!lvchange_availability(cmd, lv))
@@ -525,9 +627,10 @@ int lvchange(struct cmd_context *cmd, in
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

--Apple-Mail-3-353057281
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed



--Apple-Mail-3-353057281--
