Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2LC6eaM021531
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 21 Mar 2016 08:06:40 -0400
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mx1.redhat.com (Postfix) with ESMTPS id 48FCA1F562
	for <linux-lvm@redhat.com>; Mon, 21 Mar 2016 12:06:39 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id k1so211910648vkb.0
	for <linux-lvm@redhat.com>; Mon, 21 Mar 2016 05:06:39 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 21 Mar 2016 20:06:38 +0800
Message-ID: <CAAYit8QYf0yTHSumcpTdVBRN6uvwNj3v4NHyThKOZen92WZY-Q@mail.gmail.com>
From: Ming-Hung Tsai <mingnus@gmail.com>
Subject: [linux-lvm] Bugs in DM_DEVICE_STATUS ioctl no_flush flag settings
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

Hi,

Here are some patches related to DM_DEVICE_STATUS ioctl handling in dm-thin.

------------------------------------------------------------------
1. Fix incorrect no_flush flag settings when querying device utilization

The parameter lv is NULL when querying thin-pool metadata percent (and also the
dlid parameter), thus I use the target_type string instead.

diff --git a/lib/activate/dev_manager.c b/lib/activate/dev_manager.c
index 8e56b7a..4a96d1e 100644
--- a/lib/activate/dev_manager.c
+++ b/lib/activate/dev_manager.c
@@ -897,7 +897,8 @@ static int _percent_run(struct dev_manager *dm,
const char *name,
                return_0;

        /* No freeze on overfilled thin-pool, read existing slightly
outdated data */
-       if (lv && lv_is_thin_pool(lv) &&
+       if ((segtype = get_segtype_from_string(dm->cmd, target_type)) &&
+           segtype_is_thin_pool(segtype) &&
            !dm_task_no_flush(dmt))
                log_warn("Can't set no_flush flag."); /* Non fatal */

@@ -926,7 +927,7 @@ static int _percent_run(struct dev_manager *dm,
const char *name,
                if (!type || !params)
                        continue;

-               if (!(segtype = get_segtype_from_string(dm->cmd, target_type)))
+               if (!segtype)
                        continue;

                if (strcmp(type, target_type)) {

------------------------------------------------------------------
2. Set no_flush flag when querying device info to avoid freeze

Same as 872ea3b98, we should set the no_flush flag in _info_run() to avoid
freeze and performance impact. We might need to patch all other functions
running DM_DEVICE_STATUS, like device_is_usable(), lv_has_target_type(), etc.

diff --git a/lib/activate/dev_manager.c b/lib/activate/dev_manager.c
index 4a96d1e..67c476e 100644
--- a/lib/activate/dev_manager.c
+++ b/lib/activate/dev_manager.c
@@ -212,6 +212,12 @@ static int _info_run(info_type_t type, const char
*name, const char *dlid,
                                major, minor, with_open_count)))
                return_0;

+       /* No freeze on overfilled thin-pool, read existing slightly
outdated data */
+       if (type == STATUS &&
+           segtype_is_thin_pool(seg_status->seg->segtype) &&
+           !dm_task_no_flush(dmt))
+               log_warn("Can't set no_flush flag."); /* Non fatal */
+
        if (!dm_task_run(dmt))
                goto_out;

------------------------------------------------------------------
3. Fix _metadatapercent_disp to not to handle thin volumes

"lvs vg1/thin_lvol0 -o metadata_percent" should not send ioctls.

diff --git a/lib/report/report.c b/lib/report/report.c
index 7070092..8ae565e 100644
--- a/lib/report/report.c
+++ b/lib/report/report.c
@@ -2961,8 +2961,6 @@ static int _metadatapercent_disp(struct dm_report *rh,

        if (lv_is_thin_pool(lv))
                (void) lv_thin_pool_percent(lv, 1, &percent);
-       else if (lv_is_thin_volume(lv))
-               (void) lv_thin_percent(lv, 1, &percent);
        else if (lv_is_cache(lv) || lv_is_cache_pool(lv)) {
                if (lv_cache_status(lv, &status)) {
                        percent = status->metadata_usage;

------------------------------------------------------------------
4. Remove unused parameter from lv_thin_percent

diff --git a/lib/activate/activate.c b/lib/activate/activate.c
index 2eb24d4..0b8bebf 100644
--- a/lib/activate/activate.c
+++ b/lib/activate/activate.c
@@ -304,8 +304,7 @@ int lv_thin_pool_percent(const struct
logical_volume *lv, int metadata,
 {
  return 0;
 }
-int lv_thin_percent(const struct logical_volume *lv, int mapped,
-    dm_percent_t *percent)
+int lv_thin_percent(const struct logical_volume *lv, dm_percent_t *percent)
 {
  return 0;
 }
@@ -1124,8 +1123,7 @@ int lv_thin_pool_percent(const struct
logical_volume *lv, int metadata,
 /*
  * Returns 1 if percent set, else 0 on failure.
  */
-int lv_thin_percent(const struct logical_volume *lv,
-    int mapped, dm_percent_t *percent)
+int lv_thin_percent(const struct logical_volume *lv, dm_percent_t *percent)
 {
  int r;
  struct dev_manager *dm;
@@ -1139,7 +1137,7 @@ int lv_thin_percent(const struct logical_volume *lv,
  if (!(dm = dev_manager_create(lv->vg->cmd, lv->vg->name, 1)))
  return_0;

- if (!(r = dev_manager_thin_percent(dm, lv, mapped, percent)))
+ if (!(r = dev_manager_thin_percent(dm, lv, percent)))
  stack;

  dev_manager_destroy(dm);
diff --git a/lib/activate/activate.h b/lib/activate/activate.h
index 74afb95..c01fedd 100644
--- a/lib/activate/activate.h
+++ b/lib/activate/activate.h
@@ -175,8 +175,7 @@ int lv_cache_status(const struct logical_volume *lv,
     struct lv_status_cache **status);
 int lv_thin_pool_percent(const struct logical_volume *lv, int metadata,
  dm_percent_t *percent);
-int lv_thin_percent(const struct logical_volume *lv, int mapped,
-    dm_percent_t *percent);
+int lv_thin_percent(const struct logical_volume *lv, dm_percent_t *percent);
 int lv_thin_pool_transaction_id(const struct logical_volume *lv,
  uint64_t *transaction_id);
 int lv_thin_device_id(const struct logical_volume *lv, uint32_t *device_id);
diff --git a/lib/activate/dev_manager.c b/lib/activate/dev_manager.c
index 67c476e..753f188 100644
--- a/lib/activate/dev_manager.c
+++ b/lib/activate/dev_manager.c
@@ -1428,7 +1428,7 @@ int dev_manager_thin_pool_percent(struct dev_manager *dm,

 int dev_manager_thin_percent(struct dev_manager *dm,
      const struct logical_volume *lv,
-     int mapped, dm_percent_t *percent)
+     dm_percent_t *percent)
 {
  char *name;
  const char *dlid;
@@ -1443,7 +1443,7 @@ int dev_manager_thin_percent(struct dev_manager *dm,

  log_debug_activation("Getting device status percentage for %s", name);
  if (!(_percent(dm, name, dlid, "thin", 0,
-       (mapped) ? NULL : lv, percent, NULL, 1)))
+       lv, percent, NULL, 1)))
  return_0;

  return 1;
diff --git a/lib/activate/dev_manager.h b/lib/activate/dev_manager.h
index bcfb226..3cf8b90 100644
--- a/lib/activate/dev_manager.h
+++ b/lib/activate/dev_manager.h
@@ -74,7 +74,7 @@ int dev_manager_thin_pool_percent(struct dev_manager *dm,
   int metadata, dm_percent_t *percent);
 int dev_manager_thin_percent(struct dev_manager *dm,
      const struct logical_volume *lv,
-     int mapped, dm_percent_t *percent);
+     dm_percent_t *percent);
 int dev_manager_thin_device_id(struct dev_manager *dm,
        const struct logical_volume *lv,
        uint32_t *device_id);
diff --git a/lib/display/display.c b/lib/display/display.c
index a6387c6..27d09f0 100644
--- a/lib/display/display.c
+++ b/lib/display/display.c
@@ -468,7 +468,7 @@ int lvdisplay_full(struct cmd_context *cmd,
  log_print("LV merging to          %s",
   seg->merge_lv->name);
  if (inkernel)
- thin_active = lv_thin_percent(lv, 0, &thin_percent);
+ thin_active = lv_thin_percent(lv, &thin_percent);
  if (lv_is_merging_origin(lv))
  log_print("LV merged with         %s",
   find_snapshot(lv)->lv->name);
diff --git a/lib/report/properties.c b/lib/report/properties.c
index 62c81b9..69e8552 100644
--- a/lib/report/properties.c
+++ b/lib/report/properties.c
@@ -120,7 +120,7 @@ static dm_percent_t _data_percent(const struct
logical_volume *lv)
  }

  if (lv_is_thin_volume(lv))
- return lv_thin_percent(lv, 0, &percent) ? percent : DM_PERCENT_INVALID;
+ return lv_thin_percent(lv, &percent) ? percent : DM_PERCENT_INVALID;

  return lv_thin_pool_percent(lv, 0, &percent) ? percent : DM_PERCENT_INVALID;
 }
diff --git a/lib/report/report.c b/lib/report/report.c
index 8ae565e..9970f7c 100644
--- a/lib/report/report.c
+++ b/lib/report/report.c
@@ -2939,7 +2939,7 @@ static int _datapercent_disp(struct dm_report
*rh, struct dm_pool *mem,
  else if (lv_is_thin_pool(lv))
  (void) lv_thin_pool_percent(lv, 0, &percent);
  else if (lv_is_thin_volume(lv))
- (void) lv_thin_percent(lv, 0, &percent);
+ (void) lv_thin_percent(lv, &percent);
  else if (lv_is_cache(lv) || lv_is_cache_pool(lv)) {
  if (lv_cache_status(lv, &status)) {
  percent = status->data_usage;

------------------------------------------------------------------

Beside these patches, I think that the mechanism to obtain lv data utilization
should be revised. Given a thin pool vg1/tp1, I hope that the command

# lvs vg1/tp1 -o lv_attr,data_percent,metadata_percent

should run DM_DEVICE_STATUS ioctl only once.

To achieve this, we should calculate the percents in early phase,
then cache the calculated percents in struct lv_with_info_and_seg_status,
thus the column handlers _datapercent_disp() and _metadatapercent_disp()
could obtain the cached percents.

The follow is my proposed approach, inspired by lvm-cache's implementation:

(1) Declare a new structure for cache percents:

    struct lv_status_thin_pool {
        struct dm_pool *mem;
        struct dm_status_thin_pool *status;
        dm_percent_t data_usage;
        dm_percent_t metadata_usage;
    };

(2) int lv_thin_pool_status(const struct logical_volume *pool_lv,
                            lv_status_thin_pool **status):

      Allocates lv_status_thin_pool, obtains dm_status_thin_pool by using
      dev_manager_thin_pool_status(), then calculates data/metadata percents.

(3) int dev_manager_thin_pool_status(struct dev_manager *dm,
                                     const struct logical_volume *lv,
                                     struct dm_status_thin_pool **status,
                                     int noflush):

      Allocates dm_status_thin_pool, run ioctl,
      then transform the status string to dm_status_thin_pool
      by using dm_get_status_thin_pool().

(4) Stores lv_status_<segtype> in lv_seg_status:

    struct lv_seg_status {
        struct dm_pool *mem; /* input */
        const struct lv_segment *seg; /* input */
        lv_seg_status_type_t type; /* output */
        union {
            struct lv_status_cache *cache;
            struct lv_status_raid *raid;
            struct lv_status_mirror *mirror;  // is dm-mirror required?
            struct lv_status_snapshot *snapshot;
            struct lv_status_thin *thin;
            struct lv_status_thin_pool *thin_pool;
        };
    };

(5) Change the colume type of "data_percent" and "metadata_percent"
    to LVSSTATUS.

(6) Also apply this approach to lvdisplay: Now lvdisplay_full() sends
    DM_DEVICE_STATUS twice (lv_thin_pool_percent() twice)

Finally, we could remove segtype_handler::target_percent in all the segtypes.

It need some efforts to do the above patches. How do you think about it?


Thanks,
Ming-Hung Tsai
