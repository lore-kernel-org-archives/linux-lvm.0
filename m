Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r6H9G9Wc023170
	for <linux-lvm@redhat.com>; Wed, 17 Jul 2013 05:16:09 -0400
Received: from SMTP.EU.CITRIX.COM (smtp.eu.citrix.com [46.33.159.39])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6H9G68e019239
	for <linux-lvm@redhat.com>; Wed, 17 Jul 2013 05:16:06 -0400
From: Thanos Makatos <thanos.makatos@citrix.com>
Date: Wed, 17 Jul 2013 09:16:04 +0000
Message-ID: <2368A3FCF9F7214298E53C823B0A48EC038179@LONPEX01CL02.citrite.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Potential concurrent metadata recovery issues
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

In XenServer, we need to share the disk images of guest VMs among multiple hosts. One of the ways we achieve this is by creating a LVM volume group on an iSCSI LUN, and by attaching the iSCSI LUN to all. We understand that we're not supposed to use LVM this way, but this how it's done for quite some time now and switching to the clustered LVM (or something similar) is not an option at this point.

One of the problems we believe there are by using LVM in such a way is metadata consistency: if two hosts are concurrently performing operations on the same VG they may corrupt the VG's metadata because if, say, host A is in the process of updating the metadata, host B may find partially-written metadata, assume they're corrupted, and attempt to perform metadata recovery.

This is what we THINK is the problem. Unfortunately the engineers that starting using LVM this way are no longer with the company and there's no documentation.

To avoid this problem we use a private LVM patch (bottom of the email) that disables metadata recovery on _all_ LVM operations, via a command-line switch, and only allow metadata recovery operations to be performed by a designated host.

We're going more open source now, and want to get rid of private patches. I started reading the LVM code to understand whether we do have a problem and whether we really need this patch, and if there any alternatives (e.g. some LVM configuration options). It's quite a complicated piece of code and we have to spend a lot of time familiarising with.

Could you point us to the right direction? Is there some easy way (e.g. some configuration option) to achieve this? Would you accept a patch (not this one of course!) that allows us to do this?

diff -urN a/lib/log/lvm-logging.h b/lib/log/lvm-logging.h
--- a/lib/log/lvm-logging.h	2010-05-05 18:37:53.000000000 -0400
+++ b/lib/log/lvm-logging.h	2011-11-25 07:24:46.000000000 -0500
@@ -53,6 +53,9 @@
 int stored_errno(void);
 const char *stored_errmsg(void);
 
+void init_master(int level);
+int master();
+
 /* Suppress messages to stdout/stderr (1) or everywhere (2) */
 /* Returns previous setting */
 int log_suppress(int suppress);
diff -urN a/lib/log/log.c b/lib/log/log.c
--- a/lib/log/log.c	2007-08-20 16:55:26.000000000 -0400
+++ b/lib/log/log.c	2008-08-29 10:15:52.000000000 -0400
@@ -35,6 +35,7 @@
 static char _msg_prefix[30] = "  ";
 static int _already_logging = 0;
 static int _abort_on_internal_errors = 0;
+static int _master = 0;
 
 static lvm2_log_fn_t _lvm2_log_fn = NULL;
 
@@ -80,6 +81,16 @@
 	_syslog = 1;
 }
 
+void init_master(int level)
+{
+	_master = level;
+}
+
+int master()
+{
+	return _master;
+}
+
 int log_suppress(int suppress)
 {
 	int old_suppress = _log_suppress;
diff -urN a/lib/metadata/metadata.c b/lib/metadata/metadata.c
--- a/lib/metadata/metadata.c	2008-01-22 11:02:26.000000000 -0500
+++ b/lib/metadata/metadata.c	2008-08-29 11:28:24.000000000 -0400
@@ -3373,6 +3373,9 @@
 	if (misc_flags & READ_ALLOW_INCONSISTENT || !(lock_flags & LCK_WRITE))
 		consistent = 0;
 
+	if (!master())
+ 		consistent = 0;
+
 	if (!validate_name(vg_name) && !is_orphan_vg(vg_name)) {
 		log_error("Volume group name %s has invalid characters",
 			  vg_name);
@@ -3416,7 +3419,13 @@
 	/* consistent == 0 when VG is not found, but failed == FAILED_NOTFOUND */
 	if (!consistent && !failure) {
 		free_vg(vg);
-		if (!(vg = _recover_vg(cmd, vg_name, vgid))) {
+		if (!master()) {
+			/* Do not try to fix up inconsistent metadata if not on master */
+			log_error("Volume group \"%s\" inconsistent, run as master to correct", vg_name);
+			failure |= FAILED_INCONSISTENT;
+			goto_bad;
+			
+		} else if (!(vg = _recover_vg(cmd, vg_name, vgid))) {
 			log_error("Recovery of volume group \"%s\" failed.",
 				  vg_name);
 			failure |= FAILED_INCONSISTENT;
diff -urN a/tools/args.h b/tools/args.h
--- a/tools/args.h	2007-11-09 11:51:54.000000000 -0500
+++ b/tools/args.h	2008-08-29 11:36:07.000000000 -0400
@@ -21,6 +21,7 @@
 arg(version_ARG, '\0', "version", NULL, 0)
 arg(quiet_ARG, '\0', "quiet", NULL, 0)
 arg(physicalvolumesize_ARG, '\0', "setphysicalvolumesize", size_mb_arg, 0)
+arg(master_ARG, '\0', "master", NULL, 0)
 arg(ignorelockingfailure_ARG, '\0', "ignorelockingfailure", NULL, 0)
 arg(nolocking_ARG, '\0', "nolocking", NULL, 0)
 arg(metadatacopies_ARG, '\0', "metadatacopies", int_arg, 0)
diff -urN a/tools/commands.h b/tools/commands.h
--- a/tools/commands.h.master-mode	2010-10-25 07:20:56.000000000 -0400
+++ a/tools/commands.h	2011-11-23 10:30:56.000000000 -0500
@@ -69,6 +69,7 @@
    "\t[--deltag Tag]\n"
    "\t[-f|--force]\n"
    "\t[-h|--help]\n"
+   "\t[--master]\n"
    "\t[--ignorelockingfailure]\n"
    "\t[--ignoremonitoring]\n"
    "\t[--monitor {y|n}]\n"
@@ -91,7 +92,7 @@
    ignorelockingfailure_ARG, ignoremonitoring_ARG, major_ARG, minor_ARG,
    monitor_ARG, noudevsync_ARG, partial_ARG, permission_ARG, persistent_ARG,
    poll_ARG, readahead_ARG, resync_ARG, refresh_ARG, addtag_ARG, deltag_ARG,
-   sysinit_ARG, test_ARG, yes_ARG)
+   sysinit_ARG, test_ARG, yes_ARG, master_ARG)
 
 xx(lvconvert,
    "Change logical volume layout",
@@ -105,6 +106,7 @@
    "\t[-d|--debug]\n"
    "\t[-f|--force]\n"
    "\t[-h|-?|--help]\n"
+   "\t[--master]\n"
    "\t[-i|--interval seconds]\n"
    "\t[--stripes Stripes [-I|--stripesize StripeSize]]\n"
    "\t[--noudevsync]\n"
@@ -141,7 +143,7 @@
    merge_ARG, mirrorlog_ARG, mirrors_ARG, name_ARG, noudevsync_ARG,
    regionsize_ARG, repair_ARG, snapshot_ARG, splitmirrors_ARG,
    stripes_long_ARG, stripesize_ARG, test_ARG,
-   use_policies_ARG, yes_ARG, force_ARG, zero_ARG)
+   use_policies_ARG, yes_ARG, force_ARG, zero_ARG, master_ARG)
 
 xx(lvcreate,
    "Create a logical volume",
@@ -153,6 +155,8 @@
    "\t[-C|--contiguous {y|n}]\n"
    "\t[-d|--debug]\n"
    "\t[-h|-?|--help]\n"
+   "\t[--master]\n"
+   "\t[-h|-?|--master]\n"
    "\t[--ignoremonitoring]\n"
    "\t[--monitor {y|n}]\n"
    "\t[-i|--stripes Stripes [-I|--stripesize StripeSize]]\n"
@@ -203,7 +207,7 @@
    mirrorlog_ARG, mirrors_ARG, monitor_ARG, name_ARG, nosync_ARG, noudevsync_ARG,
    permission_ARG, persistent_ARG, readahead_ARG, regionsize_ARG, size_ARG,
    snapshot_ARG, stripes_ARG, stripesize_ARG, test_ARG, type_ARG,
-   virtualoriginsize_ARG, virtualsize_ARG, zero_ARG)
+   virtualoriginsize_ARG, virtualsize_ARG, zero_ARG, master_ARG)
 
 xx(lvdisplay,
    "Display information about a logical volume",
@@ -213,6 +217,7 @@
    "\t[-c|--colon]\n"
    "\t[-d|--debug]\n"
    "\t[-h|--help]\n"
+   "\t[--master]\n"
    "\t[--ignorelockingfailure]\n"
    "\t[-m|--maps]\n"
    "\t[--nosuffix]\n"
@@ -244,7 +249,7 @@
     aligned_ARG, all_ARG, colon_ARG, columns_ARG,
     ignorelockingfailure_ARG, maps_ARG, noheadings_ARG, nosuffix_ARG,
     options_ARG, sort_ARG, partial_ARG, segments_ARG, separator_ARG,
-    unbuffered_ARG, units_ARG)
+    unbuffered_ARG, units_ARG, master_ARG)
 
 xx(lvextend,
    "Add space to a logical volume",
@@ -255,6 +260,7 @@
    "\t[-d|--debug]\n"
    "\t[-f|--force]\n"
    "\t[-h|--help]\n"
+   "\t[--master]\n"
    "\t[-i|--stripes Stripes [-I|--stripesize StripeSize]]\n"
    "\t{-l|--extents [+]LogicalExtentsNumber[%{VG|LV|PVS|FREE|ORIGIN}] |\n"
    "\t -L|--size [+]LogicalVolumeSize[bBsSkKmMgGtTpPeE]}\n"
@@ -271,7 +277,7 @@
 
    alloc_ARG, autobackup_ARG, extents_ARG, force_ARG, mirrors_ARG,
    nofsck_ARG, noudevsync_ARG, resizefs_ARG, size_ARG, stripes_ARG,
-   stripesize_ARG, test_ARG, type_ARG, use_policies_ARG)
+   stripesize_ARG, test_ARG, type_ARG, use_policies_ARG, master_ARG)
 
 xx(lvmchange,
    "With the device mapper, this is obsolete and does nothing.",
@@ -350,13 +356,14 @@
    "\t[-d|--debug]\n"
    "\t[-f|--force]\n"
    "\t[-h|--help]\n"
+   "\t[--master]\n"
    "\t[--noudevsync]\n"
    "\t[-t|--test]\n"
    "\t[-v|--verbose]\n"
    "\t[--version]" "\n"
    "\tLogicalVolume[Path] [LogicalVolume[Path]...]\n",
 
-   autobackup_ARG, force_ARG, noudevsync_ARG, test_ARG)
+   autobackup_ARG, force_ARG, noudevsync_ARG, test_ARG, master_ARG)
 
 xx(lvrename,
    "Rename a logical volume",
@@ -365,6 +372,7 @@
    "\t[-A|--autobackup {y|n}] " "\n"
    "\t[-d|--debug] " "\n"
    "\t[-h|-?|--help] " "\n"
+   "\t[--master]\n"
    "\t[--noudevsync]\n"
    "\t[-t|--test] " "\n"
    "\t[-v|--verbose]" "\n"
@@ -372,7 +380,7 @@
    "\t{ OldLogicalVolumePath NewLogicalVolumePath |" "\n"
    "\t  VolumeGroupName OldLogicalVolumeName NewLogicalVolumeName }\n",
 
-   autobackup_ARG, noudevsync_ARG, test_ARG)
+   autobackup_ARG, noudevsync_ARG, test_ARG, master_ARG)
 
 xx(lvresize,
    "Resize a logical volume",
@@ -383,6 +391,7 @@
    "\t[-d|--debug]\n"
    "\t[-f|--force]\n"
    "\t[-h|--help]\n"
+   "\t[--master] " "\n"
    "\t[-i|--stripes Stripes [-I|--stripesize StripeSize]]\n"
    "\t{-l|--extents [+|-]LogicalExtentsNumber[%{VG|LV|PVS|FREE|ORIGIN}] |\n"
    "\t -L|--size [+|-]LogicalVolumeSize[bBsSkKmMgGtTpPeE]}\n"
@@ -397,7 +406,7 @@
 
    alloc_ARG, autobackup_ARG, extents_ARG, force_ARG, nofsck_ARG,
    noudevsync_ARG, resizefs_ARG, size_ARG, stripes_ARG, stripesize_ARG,
-   test_ARG, type_ARG)
+   test_ARG, type_ARG, master_ARG)
 
 xx(lvs,
    "Display information about logical volumes",
@@ -407,6 +416,7 @@
    "\t[--aligned]\n"
    "\t[-d|--debug]\n"
    "\t[-h|--help]\n"
+   "\t[-h|--master]\n"
    "\t[--ignorelockingfailure]\n"
    "\t[--nameprefixes]\n"
    "\t[--noheadings]\n"
@@ -428,7 +438,7 @@
    aligned_ARG, all_ARG, ignorelockingfailure_ARG, nameprefixes_ARG,
    noheadings_ARG, nolocking_ARG, nosuffix_ARG, options_ARG, partial_ARG, 
    rows_ARG, segments_ARG, separator_ARG, sort_ARG, trustcache_ARG,
-   unbuffered_ARG, units_ARG, unquoted_ARG)
+   unbuffered_ARG, units_ARG, unquoted_ARG, master_ARG)
 
 xx(lvscan,
    "List all logical volumes in all volume groups",
@@ -438,12 +448,13 @@
    "\t[-b|--blockdevice] " "\n"
    "\t[-d|--debug] " "\n"
    "\t[-h|-?|--help] " "\n"
+   "\t[--master]\n"
    "\t[--ignorelockingfailure]\n"
    "\t[-P|--partial] " "\n"
    "\t[-v|--verbose] " "\n"
    "\t[--version]\n",
 
-   all_ARG, blockdevice_ARG, ignorelockingfailure_ARG, partial_ARG)
+   all_ARG, blockdevice_ARG, ignorelockingfailure_ARG, partial_ARG, master_ARG)
 
 xx(pvchange,
    "Change attributes of physical volume(s)",
@@ -454,6 +465,7 @@
    "\t[-d|--debug]\n"
    "\t[-f|--force]\n"
    "\t[-h|--help]\n"
+   "\t[--master] " "\n"
    "\t[-t|--test]\n"
    "\t[-u|--uuid]\n"
    "\t[-x|--allocatable y|n]\n"
@@ -465,7 +477,7 @@
    "\t[PhysicalVolumePath...]\n",
 
    all_ARG, allocatable_ARG, allocation_ARG, autobackup_ARG, deltag_ARG,
-   addtag_ARG, force_ARG, metadataignore_ARG, test_ARG, uuid_ARG)
+   addtag_ARG, force_ARG, metadataignore_ARG, test_ARG, uuid_ARG, master_ARG)
 
 xx(pvresize,
    "Resize physical volume(s)",
@@ -473,13 +485,14 @@
    "pvresize " "\n"
    "\t[-d|--debug]" "\n"
    "\t[-h|-?|--help] " "\n"
+   "\t[--master]\n"
    "\t[--setphysicalvolumesize PhysicalVolumeSize[bBsSkKmMgGtTpPeE]" "\n"
    "\t[-t|--test] " "\n"
    "\t[-v|--verbose] " "\n"
    "\t[--version] " "\n"
    "\tPhysicalVolume [PhysicalVolume...]\n",
 
-   physicalvolumesize_ARG, test_ARG)
+   physicalvolumesize_ARG, test_ARG, master_ARG)
 
 xx(pvck,
    "Check the consistency of physical volume(s)",
@@ -550,6 +563,7 @@
    "\t[-c|--colon]\n"
    "\t[-d|--debug]\n"
    "\t[-h|--help]\n"
+   "\t[--master]\n"
    "\t[--ignorelockingfailure]\n"
    "\t[-m|--maps]\n"
    "\t[--nosuffix]\n"
@@ -564,6 +578,7 @@
    "\t[-a|--all]\n"
    "\t[-d|--debug]\n"
    "\t[-h|--help]\n"
+   "\t[--master]\n"
    "\t[--ignorelockingfailure]\n"
    "\t[--noheadings]\n"
    "\t[--nosuffix]\n"
@@ -578,7 +593,7 @@
 
    aligned_ARG, all_ARG, colon_ARG, columns_ARG, ignorelockingfailure_ARG,
    maps_ARG, noheadings_ARG, nosuffix_ARG, options_ARG, separator_ARG,
-   short_ARG, sort_ARG, unbuffered_ARG, units_ARG)
+   short_ARG, sort_ARG, unbuffered_ARG, units_ARG, master_ARG)
 
 xx(pvmove,
    "Move extents from one physical volume to another",
@@ -590,6 +605,7 @@
    "\t[-b|--background]\n"
    "\t[-d|--debug]\n "
    "\t[-h|-?|--help]\n"
+   "\t[--master] " "\n"
    "\t[-i|--interval seconds]\n"
    "\t[--noudevsync]\n"
    "\t[-t|--test]\n "
@@ -601,7 +617,7 @@
    "\t[DestinationPhysicalVolume[:PhysicalExtent[-PhysicalExtent]...]...]\n",
 
    abort_ARG, alloc_ARG, autobackup_ARG, background_ARG,
-   interval_ARG, name_ARG, noudevsync_ARG, test_ARG)
+   interval_ARG, name_ARG, noudevsync_ARG, test_ARG, master_ARG)
 
 xx(pvremove,
    "Remove LVM label(s) from physical volume(s)",
@@ -711,6 +727,7 @@
    "\t[-P|--partial] " "\n"
    "\t[-d|--debug] " "\n"
    "\t[-h|--help] " "\n"
+   "\t[--master] " "\n"
    "\t[--ignorelockingfailure]\n"
    "\t[--ignoremonitoring]\n"
    "\t[--monitor {y|n}]\n"
@@ -738,7 +755,7 @@
    logicalvolume_ARG, maxphysicalvolumes_ARG, monitor_ARG, noudevsync_ARG,
    metadatacopies_ARG, vgmetadatacopies_ARG, partial_ARG,
    physicalextentsize_ARG, poll_ARG, refresh_ARG, resizeable_ARG,
-   resizable_ARG, sysinit_ARG, test_ARG, uuid_ARG)
+   resizable_ARG, sysinit_ARG, test_ARG, uuid_ARG, master_ARG)
 
 xx(vgck,
    "Check the consistency of volume group(s)",
@@ -803,6 +820,7 @@
    "\t[-c|--colon | -s|--short | -v|--verbose]" "\n"
    "\t[-d|--debug] " "\n"
    "\t[-h|--help] " "\n"
+   "\t[--master] " "\n"
    "\t[--ignorelockingfailure]" "\n"
    "\t[--nosuffix]\n"
    "\t[-P|--partial] " "\n"
@@ -829,7 +847,7 @@
 
    activevolumegroups_ARG, aligned_ARG, colon_ARG, columns_ARG,
    ignorelockingfailure_ARG, noheadings_ARG, nosuffix_ARG, options_ARG,
-   partial_ARG, short_ARG, separator_ARG, sort_ARG, unbuffered_ARG, units_ARG)
+   partial_ARG, short_ARG, separator_ARG, sort_ARG, unbuffered_ARG, units_ARG, master_ARG)
 
 xx(vgexport,
    "Unregister volume group(s) from the system",
@@ -853,6 +871,7 @@
    "\t[-d|--debug]\n"
    "\t[-f|--force]\n"
    "\t[-h|--help]\n"
+   "\t[--master]\n"
    "\t[-t|--test]\n"
    "\t[-v|--verbose]\n"
    "\t[--version]" "\n"
@@ -863,7 +882,7 @@
    force_ARG, yes_ARG, zero_ARG, labelsector_ARG, metadatatype_ARG,
    metadatasize_ARG, pvmetadatacopies_ARG, metadatacopies_ARG,
    metadataignore_ARG, dataalignment_ARG, dataalignmentoffset_ARG,
-   restoremissing_ARG)
+   restoremissing_ARG, master_ARG)
 
 xx(vgimport,
    "Register exported volume group with system",
@@ -887,13 +906,14 @@
    "\t[-A|--autobackup y|n]\n"
    "\t[-d|--debug]\n"
    "\t[-h|--help]\n"
+   "\t[--master] " "\n"
    "\t[-l|--list]\n"
    "\t[-t|--test]\n"
    "\t[-v|--verbose]\n"
    "\t[--version]" "\n"
    "\tDestinationVolumeGroupName SourceVolumeGroupName\n",
 
-   autobackup_ARG, list_ARG, test_ARG)
+   autobackup_ARG, list_ARG, test_ARG, master_ARG)
 
 xx(vgmknodes,
    "Create the special files for volume group devices in /dev",
@@ -901,13 +921,14 @@
    "vgmknodes\n"
    "\t[-d|--debug]\n"
    "\t[-h|--help]\n"
+   "\t[--master]\n"
    "\t[--ignorelockingfailure]\n"
    "\t[--refresh]\n"
    "\t[-v|--verbose]\n"
    "\t[--version]" "\n"
    "\t[VolumeGroupName...]\n",
 
-   ignorelockingfailure_ARG, refresh_ARG)
+   ignorelockingfailure_ARG, refresh_ARG, master_ARG)
 
 xx(vgreduce,
    "Remove physical volume(s) from a volume group",
@@ -917,6 +938,7 @@
    "\t[-A|--autobackup y|n]\n"
    "\t[-d|--debug]\n"
    "\t[-h|--help]\n"
+   "\t[--master]\n"
    "\t[--mirrorsonly]\n"
    "\t[--removemissing]\n"
    "\t[-f|--force]\n"
@@ -927,7 +949,7 @@
    "\t[PhysicalVolumePath...]\n",
 
    all_ARG, autobackup_ARG, force_ARG, mirrorsonly_ARG, removemissing_ARG,
-   test_ARG)
+   test_ARG, master_ARG)
 
 xx(vgremove,
    "Remove volume group(s)",
@@ -951,13 +973,14 @@
    "\t[-A|--autobackup y|n]\n"
    "\t[-d|--debug]\n"
    "\t[-h|--help]\n"
+   "\t[--master]\n"
    "\t[-t|--test]\n"
    "\t[-v|--verbose]\n"
    "\t[--version]" "\n"
    "\tOldVolumeGroupPath NewVolumeGroupPath |\n"
    "\tOldVolumeGroupName NewVolumeGroupName\n",
 
-   autobackup_ARG, force_ARG, test_ARG)
+   autobackup_ARG, force_ARG, test_ARG, master_ARG)
 
 xx(vgs,
    "Display information about volume groups",
@@ -967,6 +990,7 @@
    "\t[-a|--all]\n"
    "\t[-d|--debug]\n"
    "\t[-h|--help]\n"
+   "\t[--master] " "\n"
    "\t[--ignorelockingfailure]\n"
    "\t[--nameprefixes]\n"
    "\t[--noheadings]\n"
@@ -987,7 +1011,7 @@
    aligned_ARG, all_ARG, ignorelockingfailure_ARG, nameprefixes_ARG,
    noheadings_ARG, nolocking_ARG, nosuffix_ARG, options_ARG, partial_ARG, 
    rows_ARG, separator_ARG, sort_ARG, trustcache_ARG, unbuffered_ARG, units_ARG,
-   unquoted_ARG)
+   unquoted_ARG, master_ARG)
 
 xx(vgscan,
    "Search for all volume groups",
@@ -995,13 +1019,14 @@
    "vgscan "
    "\t[-d|--debug]\n"
    "\t[-h|--help]\n"
+   "\t[--master] " "\n"
    "\t[--ignorelockingfailure]\n"
    "\t[--mknodes]\n"
    "\t[-P|--partial] " "\n"
    "\t[-v|--verbose]\n"
    "\t[--version]" "\n",
 
-   ignorelockingfailure_ARG, mknodes_ARG, partial_ARG)
+   ignorelockingfailure_ARG, mknodes_ARG, partial_ARG, master_ARG)
 
 xx(vgsplit,
    "Move physical volumes into a new or existing volume group",
@@ -1012,6 +1037,7 @@
    "\t[-c|--clustered {y|n}] " "\n"
    "\t[-d|--debug] " "\n"
    "\t[-h|--help] " "\n"
+   "\t[--master]\n"
    "\t[-l|--maxlogicalvolumes MaxLogicalVolumes]" "\n"
    "\t[-M|--metadatatype 1|2] " "\n"
    "\t[--[vg]metadatacopies #copies] " "\n"
@@ -1025,7 +1051,7 @@
 
    alloc_ARG, autobackup_ARG, clustered_ARG,
    maxlogicalvolumes_ARG, maxphysicalvolumes_ARG,
-   metadatatype_ARG, vgmetadatacopies_ARG, name_ARG, test_ARG)
+   metadatatype_ARG, vgmetadatacopies_ARG, name_ARG, test_ARG, master_ARG)
 
 xx(version,
    "Display software and driver version information",
diff -urN a/tools/lvmcmdline.c b/tools/lvmcmdline.c
--- a/tools/lvmcmdline.c	2008-01-16 13:15:26.000000000 -0500
+++ b/tools/lvmcmdline.c	2008-08-29 10:15:52.000000000 -0400
@@ -715,6 +715,11 @@
 		log_print("Partial mode. Incomplete logical volumes will be processed.");
 	}
 
+	if (arg_count(cmd, master_ARG))
+		init_master(1);
+	else
+		init_master(0);
+
 	if (arg_count(cmd, ignorelockingfailure_ARG) || arg_count(cmd, sysinit_ARG))
 		init_ignorelockingfailure(1);
 	else


--
Thanos Makatos
Software Engineer (XenServer Storage)
Citrix Systems Ltd.
Cambridge, UK
