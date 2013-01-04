Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r045cm4Z012895
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2013 00:38:49 -0500
Received: from h01.hoster-ok.com (h01.hoster-ok.com [88.86.111.110])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r045cjjV014651
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2013 00:38:46 -0500
Received: from bubble-sam.sam-solutions.net (r01-ge0-SH.prague.vds-ok.com
	[88.86.98.3] (may be forged)) (authenticated as <bubble>)
	by h01.hoster-ok.com (8.14.3/8.14.3/HOSTER-OK) with ESMTP id
	r045cgTW012912
	(using TLSv1/SSLv3 with cipher DHE-RSA-AES256-SHA (256 bits) verified
	NO) for <linux-lvm@redhat.com>; Fri, 4 Jan 2013 06:38:44 +0100
Message-ID: <50E66AE1.6070503@hoster-ok.com>
Date: Fri, 04 Jan 2013 08:38:41 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
MIME-Version: 1.0
References: <50E644EF.6060209@rarforge.com>
In-Reply-To: <50E644EF.6060209@rarforge.com>
Content-Type: multipart/mixed; boundary="------------080102050204000505020006"
Subject: Re: [linux-lvm] LVM snapshot with Clustered VG
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------080102050204000505020006
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

04.01.2013 05:56, Rob wrote:
> Is there a way to convert an active LV on a clustered VG to an exclusive
> lock without deactivating it first? Or some way of taking a snapshot of
> a clustered LVM? I know I have read snapshots are not possible on CLVM,
> but the information seems outdated.
> 
> ha node1: /dev/vg_clus/logvol_clus
> ha node2: /dev/vg_clus/logvol_clus
> 
> 1) I can deactivate the the entire vg on node1 and node2 with 'vgchange
> -an vg_clus' and activate with -ay. Just stating cluster vg is working.
> 
> 2) I can deactivate locally on node2 with 'vgchange -aln vg_clus' , it
> shows inactive on node2 and active still on node1
>     - After deactivating, I cannot get exclusive lock on node1 with
> 'vgchange -aey vg_clus'
>       I get an error locking on node1
> 
> 3) I can get exclusive an lock if I deactivate the VG on both nodes and
> then run 'vgchange -aey vg_clus' on either node. The lvcreate snapshop
> works, but again, it requires deactivating the vg, which isn't an option
> in production.

You may try (experimental, not-complete) patch attached.

> 
> 
> Setup:
>  Centos 6.3 (current)
>  cman+pacemaker dual primary drbd for HA KVM w/ live migration
>  disk: lvm -> drbd -> clvm -> kvm virt
> 
> Currently I am taking a lvm snapshot of the drbd lvm backing device, but
> it's not ideal ( as there are other issues )
> 
> Thanks for the time!
> 
> -Rob
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------080102050204000505020006
Content-Type: text/x-patch;
 name="LVM2.2.02.98-lock-convert.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="LVM2.2.02.98-lock-convert.patch"

diff -urNp LVM2.2.02.98.orig/lib/locking/cluster_locking.c LVM2.2.02.98/lib/locking/cluster_locking.c
--- LVM2.2.02.98.orig/lib/locking/cluster_locking.c	2012-12-28 13:20:07.218355620 +0000
+++ LVM2.2.02.98/lib/locking/cluster_locking.c	2012-12-15 12:40:02.934170948 +0000
@@ -330,6 +330,9 @@ static int _lock_for_cluster(struct cmd_
 	if (flags & LCK_REVERT)
 		args[1] |= LCK_REVERT_MODE;
 
+	if (flags & LCK_TRY_CONVERT)
+		args[1] |= LCK_CONVERT;
+
 	if (mirror_in_sync())
 		args[1] |= LCK_MIRROR_NOSYNC_MODE;
 
@@ -491,7 +494,7 @@ int lock_resource(struct cmd_context *cm
 		return 0;
 	}
 
-	log_very_verbose("Locking %s %s %s (%s%s%s%s%s%s%s%s%s) (0x%x)", lock_scope, lockname,
+	log_very_verbose("Locking %s %s %s (%s%s%s%s%s%s%s%s%s%s) (0x%x)", lock_scope, lockname,
 			 lock_type, lock_scope,
 			 flags & LCK_NONBLOCK ? "|NONBLOCK" : "",
 			 flags & LCK_HOLD ? "|HOLD" : "",
@@ -501,6 +504,7 @@ int lock_resource(struct cmd_context *cm
 			 flags & LCK_CACHE ? "|CACHE" : "",
 			 flags & LCK_ORIGIN_ONLY ? "|ORIGIN_ONLY" : "",
 			 flags & LCK_REVERT ? "|REVERT" : "",
+			 flags & LCK_TRY_CONVERT ? "|CONVERT" : "",
 			 flags);
 
 	/* Send a message to the cluster manager */
diff -urNp LVM2.2.02.98.orig/lib/locking/locking.c LVM2.2.02.98/lib/locking/locking.c
--- LVM2.2.02.98.orig/lib/locking/locking.c	2012-12-28 13:20:07.219355605 +0000
+++ LVM2.2.02.98/lib/locking/locking.c	2012-12-28 13:25:10.218097986 +0000
@@ -540,6 +540,16 @@ int suspend_lvs(struct cmd_context *cmd,
 	return 1;
 }
 
+int deactivate_lv(struct cmd_context *cmd, struct logical_volume *lv)
+{
+	if (vg_is_clustered(lv->vg)) {
+		if (lv_is_active_exclusive(lv) && ! lv_is_active_exclusive_locally(lv)) {
+			return_0;
+		}
+	}
+	lock_lv_vol(cmd, lv, LCK_LV_DEACTIVATE);
+}
+
 /*
  * First try to activate exclusively locally.
  * Then if the VG is clustered and the LV is not yet active (e.g. due to 
@@ -567,6 +577,28 @@ int activate_lv_excl(struct cmd_context 
 	return lv_is_active_exclusive(lv);
 }
 
+int activate_lv_excl_force(struct cmd_context *cmd, struct logical_volume *lv) 
+{
+	/* Non-clustered VGs are only activated locally. */
+	if (!vg_is_clustered(lv->vg))
+		return activate_lv_excl_local(cmd, lv);
+
+	if (lv_is_active_exclusive_locally(lv))
+		return 1;
+
+	if (!activate_lv_excl_local_force(cmd, lv))
+		return_0;
+
+	if (lv_is_active_exclusive(lv))
+		return 1;
+
+	/* FIXME Deal with error return codes. */
+	if (activate_lv_excl_remote_force(cmd, lv))
+		stack;
+
+	return lv_is_active_exclusive(lv);
+}
+
 /* Lock a list of LVs */
 int activate_lvs(struct cmd_context *cmd, struct dm_list *lvs, unsigned exclusive)
 {
diff -urNp LVM2.2.02.98.orig/lib/locking/locking.h LVM2.2.02.98/lib/locking/locking.h
--- LVM2.2.02.98.orig/lib/locking/locking.h	2012-12-28 13:20:07.225307455 +0000
+++ LVM2.2.02.98/lib/locking/locking.h	2012-12-28 13:25:41.166100204 +0000
@@ -101,6 +101,7 @@ int check_lvm1_vg_inactive(struct cmd_co
 #define LCK_CACHE	0x00000100U	/* Operation on cache only using P_ lock */
 #define LCK_ORIGIN_ONLY	0x00000200U	/* Operation should bypass any snapshots */
 #define LCK_REVERT	0x00000400U	/* Revert any incomplete change */
+#define LCK_TRY_CONVERT			0x00004000U	/* Convert existing lock */
 
 /*
  * Additional lock bits for cluster communication via args[1]
@@ -176,19 +177,26 @@ int check_lvm1_vg_inactive(struct cmd_co
 #define revert_lv(cmd, lv)	lock_lv_vol(cmd, lv, LCK_LV_RESUME | LCK_REVERT)
 #define suspend_lv(cmd, lv)	lock_lv_vol(cmd, lv, LCK_LV_SUSPEND | LCK_HOLD)
 #define suspend_lv_origin(cmd, lv)	lock_lv_vol(cmd, lv, LCK_LV_SUSPEND | LCK_HOLD | LCK_ORIGIN_ONLY)
-#define deactivate_lv(cmd, lv)	lock_lv_vol(cmd, lv, LCK_LV_DEACTIVATE)
 
 #define activate_lv(cmd, lv)	lock_lv_vol(cmd, lv, LCK_LV_ACTIVATE | LCK_HOLD)
 #define activate_lv_excl_local(cmd, lv)	\
 				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_LOCAL)
 #define activate_lv_excl_remote(cmd, lv)	\
 				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_REMOTE)
+#define activate_lv_excl_local_force(cmd, lv)	\
+				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_LOCAL | (lv_is_active(lv) && ! lv_is_active_exclusive(lv) ? LCK_TRY_CONVERT : 0))
+#define activate_lv_excl_remote_force(cmd, lv)	\
+				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_REMOTE | (lv_is_active(lv) && ! lv_is_active_exclusive(lv) ? LCK_TRY_CONVERT : 0))
 
 struct logical_volume;
 int activate_lv_excl(struct cmd_context *cmd, struct logical_volume *lv);
+int activate_lv_excl_force(struct cmd_context *cmd, struct logical_volume *lv);
+int deactivate_lv(struct cmd_context *cmd, struct logical_volume *lv);
 
 #define activate_lv_local(cmd, lv)	\
 	lock_lv_vol(cmd, lv, LCK_LV_ACTIVATE | LCK_HOLD | LCK_LOCAL)
+#define activate_lv_local_force(cmd, lv)	\
+	lock_lv_vol(cmd, lv, LCK_LV_ACTIVATE | LCK_HOLD | LCK_LOCAL | (lv_is_active_exclusive_locally(lv) ? LCK_TRY_CONVERT : 0))
 #define deactivate_lv_local(cmd, lv)	\
 	lock_lv_vol(cmd, lv, LCK_LV_DEACTIVATE | LCK_LOCAL)
 #define drop_cached_metadata(vg)	\
diff -urNp LVM2.2.02.98.orig/tools/lvchange.c LVM2.2.02.98/tools/lvchange.c
--- LVM2.2.02.98.orig/tools/lvchange.c	2012-12-28 13:20:07.226156912 +0000
+++ LVM2.2.02.98/tools/lvchange.c	2012-12-15 12:40:02.937164567 +0000
@@ -238,15 +238,29 @@ static int _lvchange_activate(struct cmd
 		if ((activate == CHANGE_AE) ||
 		    lv_is_origin(lv) ||
 		    lv_is_thin_type(lv)) {
-			log_verbose("Activating logical volume \"%s\" "
-				    "exclusively", lv->name);
-			if (!activate_lv_excl(cmd, lv))
-				return_0;
+			if (arg_count(cmd, force_ARG)) {
+				log_verbose("Activating logical volume \"%s\" "
+					    "exclusively (forced)", lv->name);
+				if (!activate_lv_excl_force(cmd, lv))
+					return_0;
+			} else {
+				log_verbose("Activating logical volume \"%s\" "
+					    "exclusively", lv->name);
+				if (!activate_lv_excl(cmd, lv))
+					return_0;
+			}
 		} else if (activate == CHANGE_ALY) {
-			log_verbose("Activating logical volume \"%s\" locally",
-				    lv->name);
-			if (!activate_lv_local(cmd, lv))
-				return_0;
+			if (arg_count(cmd, force_ARG)) {
+				log_verbose("Activating logical volume \"%s\" locally (forced)",
+					    lv->name);
+				if (!activate_lv_local_force(cmd, lv))
+					return_0;
+			} else {
+				log_verbose("Activating logical volume \"%s\" locally",
+					    lv->name);
+				if (!activate_lv_local(cmd, lv))
+					return_0;
+			}
 		} else {
 			log_verbose("Activating logical volume \"%s\"",
 				    lv->name);

--------------080102050204000505020006--
