Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0RBB5kT014498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Jan 2016 06:11:05 -0500
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mx1.redhat.com (Postfix) with ESMTPS id 72080C0B66C9
	for <linux-lvm@redhat.com>; Wed, 27 Jan 2016 11:11:04 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id b35so3493230qge.0
	for <linux-lvm@redhat.com>; Wed, 27 Jan 2016 03:11:04 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 27 Jan 2016 19:11:03 +0800
Message-ID: <CAAYit8RWs=Sq262Pyg6T5Ceqjmg-mwA2Ntw5kCeFZNyisHX9Pg@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Subject: [linux-lvm] Minor bugs in LVM
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi ALL,

I found several bugs in the current LVM, listed as following, which
might need to be fixed:


1. Wrong thin-pool feature flag ordering in dm table: It will lead to
unnecessary table reload

diff --git a/libdm/libdm-deptree.c b/libdm/libdm-deptree.c
index 1b9d6d3..f8b6d89 100644
--- a/libdm/libdm-deptree.c
+++ b/libdm/libdm-deptree.c
@@ -2477,11 +2477,11 @@ static int _thin_pool_emit_segment_line(struct
dm_task *dmt,

  EMIT_PARAMS(pos, "%s %s %d %" PRIu64 " %d%s%s%s%s%s", metadata, pool,
     seg->data_block_size, seg->low_water_mark, features,
-    seg->error_if_no_space ? " error_if_no_space" : "",
-    seg->read_only ? " read_only" : "",
     seg->skip_block_zeroing ? " skip_block_zeroing" : "",
     seg->ignore_discard ? " ignore_discard" : "",
-    seg->no_discard_passdown ? " no_discard_passdown" : ""
+    seg->no_discard_passdown ? " no_discard_passdown" : "",
+    seg->error_if_no_space ? " error_if_no_space" : "",
+    seg->read_only ? " read_only" : ""
    );

  return 1;

---

2. The log_verbose_CFG should be int type. Otherwise, we cannot see
messages beyond level-(VERBOSE_BASE_LEVEL+1) by setting lvm.conf.

diff --git a/lib/commands/toolcontext.c b/lib/commands/toolcontext.c
index a2f21b8..8e71e08 100644
--- a/lib/commands/toolcontext.c
+++ b/lib/commands/toolcontext.c
@@ -315,7 +315,7 @@ static void _init_logging(struct cmd_context *cmd)
  init_silent(cmd->default_settings.silent);

  /* Verbose level for tty output */
- cmd->default_settings.verbose = find_config_tree_bool(cmd,
log_verbose_CFG, NULL);
+ cmd->default_settings.verbose = find_config_tree_int(cmd,
log_verbose_CFG, NULL);
  init_verbose(cmd->default_settings.verbose + VERBOSE_BASE_LEVEL);

  /* Log message formatting */
diff --git a/lib/config/config_settings.h b/lib/config/config_settings.h
index 52954d5..8972d40 100644
--- a/lib/config/config_settings.h
+++ b/lib/config/config_settings.h
@@ -535,7 +535,7 @@ cfg_runtime(allocation_thin_pool_chunk_size_CFG,
"thin_pool_chunk_size", allocat
 cfg(allocation_physical_extent_size_CFG, "physical_extent_size",
allocation_CFG_SECTION, CFG_DEFAULT_COMMENTED, CFG_TYPE_INT,
DEFAULT_EXTENT_SIZE, vsn(2, 2, 112), NULL, 0, NULL,
  "Default physical extent size in KiB to use for new VGs.\n")

-cfg(log_verbose_CFG, "verbose", log_CFG_SECTION, 0, CFG_TYPE_BOOL,
DEFAULT_VERBOSE, vsn(1, 0, 0), NULL, 0, NULL,
+cfg(log_verbose_CFG, "verbose", log_CFG_SECTION, 0, CFG_TYPE_INT,
DEFAULT_VERBOSE, vsn(1, 0, 0), NULL, 0, NULL,
  "Controls the messages sent to stdout or stderr.\n")

 cfg(log_silent_CFG, "silent", log_CFG_SECTION, 0, CFG_TYPE_BOOL,
DEFAULT_SILENT, vsn(2, 2, 98), NULL, 0, NULL,


---

3. Allow user to not to create pool metadata spare after repair,
because the VG might not have enough free space. (Or we can use
DEFAULT_POOL_METADATA_SPARE as the parameter)

diff --git a/tools/lvconvert.c b/tools/lvconvert.c
index fbec9b0..9bb10c3 100644
--- a/tools/lvconvert.c
+++ b/tools/lvconvert.c
@@ -2481,7 +2481,7 @@ deactivate_pmslv:
  }

  /* Try to allocate new pool metadata spare LV */
- if (!handle_pool_metadata_spare(pool_lv->vg, 0, lp->pvh, 1))
+ if (!handle_pool_metadata_spare(pool_lv->vg, 0, lp->pvh,
lp->poolmetadataspare))
  stack;

  if (dm_snprintf(meta_path, sizeof(meta_path), "%s_meta%%d",
pool_lv->name) < 0) {

---

4. Typo in debug message

diff --git a/lib/activate/activate.c b/lib/activate/activate.c
index 8f5b72b..d7c8e4e 100644
--- a/lib/activate/activate.c
+++ b/lib/activate/activate.c
@@ -1156,7 +1156,7 @@ int lv_thin_pool_transaction_id(const struct
logical_volume *lv,
  if (!lv_info(lv->vg->cmd, lv, 1, NULL, 0, 0))
  return 0;

- log_debug_activation("Checking thin percent for LV %s.",
+ log_debug_activation("Checking thin-pool transaction id for LV %s.",
      display_lvname(lv));

  if (!(dm = dev_manager_create(lv->vg->cmd, lv->vg->name, 1)))


Thanks,
Ming-Hung Tsai
