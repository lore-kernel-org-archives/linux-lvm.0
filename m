Return-Path: <SRS0=Fuv7=L2=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E586C07E95
	for <linux-lvm@archiver.kernel.org>; Fri,  2 Jul 2021 21:17:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 184A7613F5
	for <linux-lvm@archiver.kernel.org>; Fri,  2 Jul 2021 21:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 184A7613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625260658;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ambJrEuOeO5aFz0xGopSoZYh2MkUrVgn8ki2nrW8QRk=;
	b=EwPZhWGwpyyQ/nybtDwUTKBJaEXSLjRt1aN1NDiZXbPTFERdYK5mANb4oz+aWIQ984tqdh
	YqsJBeR0t1QCefTEloKpcJ/bo083kEMMnjt46rDmVWknyFMEgdCFrnCWXspOVx+fJJGJ9X
	Z6JA8jIzSrtb3L6P8jcjTgt28lq8Hvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-W6-n09rxN1GyjNAwaLkUIA-1; Fri, 02 Jul 2021 17:17:36 -0400
X-MC-Unique: W6-n09rxN1GyjNAwaLkUIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 070F95074B;
	Fri,  2 Jul 2021 21:17:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA1D95C230;
	Fri,  2 Jul 2021 21:17:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E62CF1809C99;
	Fri,  2 Jul 2021 21:17:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 162L9DNa004727 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 2 Jul 2021 17:09:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6778A60C4A; Fri,  2 Jul 2021 21:09:13 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80D7560C04;
	Fri,  2 Jul 2021 21:09:05 +0000 (UTC)
Date: Fri, 2 Jul 2021 16:09:03 -0500
From: David Teigland <teigland@redhat.com>
To: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <20210702210903.GA15057@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
MIME-Version: 1.0
In-Reply-To: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-lvm@redhat.com
Cc: Martin Wilck <martin.wilck@suse.com>,
	LVM general discussion and development <linux-lvm@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [linux-lvm] Discussion: performance issue on event activation
	mode
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 06, 2021 at 02:15:23PM +0800, heming.zhao@suse.com wrote:
> dev_cache_scan //order: O(n^2)
>  + _insert_dirs //O(n)
>  | if obtain_device_list_from_udev() true
>  |   _insert_udev_dir //O(n)
>  |
>  + dev_cache_index_devs //O(n)

I've been running some experiments and trying some patches to improve
this.  By setting obtain_device_list_from_udev=0, and using the attached
patch to disable dev_cache_index_devs, the pvscan is much better.

systemctl status lvm2-pvscan appears to show that the pvscan command
itself runs for only 2-4 seconds, while the service as a whole takes
around 15 seconds.  See the 16 sec gap below from the end of pvscan
to the systemd Started message.  If that's accurate, the remaining delay
would lie outside lvm.

Jul 02 15:27:57 localhost.localdomain systemd[1]: Starting LVM event activation on device 253:1710...
Jul 02 15:28:00 localhost.localdomain lvm[65620]:   pvscan[65620] PV /dev/mapper/mpathalz online, VG 1ed02c7d-0019-43c4-91b5-f220f3521ba9 is complete.
Jul 02 15:28:00 localhost.localdomain lvm[65620]:   pvscan[65620] VG 1ed02c7d-0019-43c4-91b5-f220f3521ba9 run autoactivation.
Jul 02 15:28:00 localhost.localdomain lvm[65620]:   1 logical volume(s) in volume group "1ed02c7d-0019-43c4-91b5-f220f3521ba9" now active
Jul 02 15:28:16 localhost.localdomain systemd[1]: Started LVM event activation on device 253:1710.


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-pvscan-skip-indexing-devices-used-by-LVs.patch"

>From f862af22f499e2828cf14ae52b9f3382816b66c5 Mon Sep 17 00:00:00 2001
From: David Teigland <teigland@redhat.com>
Date: Thu, 1 Jul 2021 17:25:43 -0500
Subject: [PATCH] pvscan: skip indexing devices used by LVs

dev_cache_index_devs() is taking a large amount of time
when there are many PVs.  The index keeps track of
devices that are currently in use by active LVs.  This
info is used to print warnings for users in some limited
cases.

The checks/warnings that are enabled by the index are not
needed by pvscan --cache, so disable it in this case.

This may be expanded to other cases in future commits.
dev_cache_index_devs should also be improved in another
commit to avoid the extreme delays with many devices.
---
 lib/commands/toolcontext.c | 1 +
 lib/commands/toolcontext.h | 1 +
 lib/device/dev-cache.c     | 9 +++++----
 lib/device/dev-cache.h     | 2 +-
 lib/metadata/metadata.c    | 3 ++-
 tools/lvmdevices.c         | 2 +-
 tools/pvscan.c             | 2 ++
 7 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/lib/commands/toolcontext.c b/lib/commands/toolcontext.c
index e2be89d0f480..b295a20efe52 100644
--- a/lib/commands/toolcontext.c
+++ b/lib/commands/toolcontext.c
@@ -1608,6 +1608,7 @@ struct cmd_context *create_toolcontext(unsigned is_clvmd,
 	cmd->handles_missing_pvs = 0;
 	cmd->handles_unknown_segments = 0;
 	cmd->hosttags = 0;
+	cmd->check_devs_used = 1;
 	dm_list_init(&cmd->arg_value_groups);
 	dm_list_init(&cmd->formats);
 	dm_list_init(&cmd->segtypes);
diff --git a/lib/commands/toolcontext.h b/lib/commands/toolcontext.h
index a47b7d760317..34808ce46b41 100644
--- a/lib/commands/toolcontext.h
+++ b/lib/commands/toolcontext.h
@@ -192,6 +192,7 @@ struct cmd_context {
 	unsigned filter_nodata_only:1;          /* only use filters that do not require data from the dev */
 	unsigned run_by_dmeventd:1;		/* command is being run by dmeventd */
 	unsigned sysinit:1;			/* --sysinit is used */
+	unsigned check_devs_used:1;		/* check devs used by LVs */
 
 	/*
 	 * Devices and filtering.
diff --git a/lib/device/dev-cache.c b/lib/device/dev-cache.c
index d7fa93fd6fdb..bb0d0f211d36 100644
--- a/lib/device/dev-cache.c
+++ b/lib/device/dev-cache.c
@@ -1139,7 +1139,7 @@ static int _insert(const char *path, const struct stat *info,
 	return 1;
 }
 
-void dev_cache_scan(void)
+void dev_cache_scan(struct cmd_context *cmd)
 {
 	log_debug_devs("Creating list of system devices.");
 
@@ -1147,7 +1147,8 @@ void dev_cache_scan(void)
 
 	_insert_dirs(&_cache.dirs);
 
-	(void) dev_cache_index_devs();
+	if (cmd->check_devs_used)
+		(void) dev_cache_index_devs();
 }
 
 int dev_cache_has_scanned(void)
@@ -1583,7 +1584,7 @@ struct device *dev_cache_get_by_devt(struct cmd_context *cmd, dev_t dev, struct
 
 		log_debug_devs("Device num not found in dev_cache repeat dev_cache_scan for %d:%d",
 				(int)MAJOR(dev), (int)MINOR(dev));
-		dev_cache_scan();
+		dev_cache_scan(cmd);
 		d = (struct device *) btree_lookup(_cache.devices, (uint32_t) dev);
 
 		if (!d)
@@ -1953,7 +1954,7 @@ int setup_devices(struct cmd_context *cmd)
 	 * This will not open or read any devices, but may look at sysfs properties.
 	 * This list of devs comes from looking /dev entries, or from asking libudev.
 	 */
-	dev_cache_scan();
+	dev_cache_scan(cmd);
 
 	/*
 	 * Match entries from cmd->use_devices with device structs in dev-cache.
diff --git a/lib/device/dev-cache.h b/lib/device/dev-cache.h
index 9b7e39d33cf1..c3f5eddda802 100644
--- a/lib/device/dev-cache.h
+++ b/lib/device/dev-cache.h
@@ -48,7 +48,7 @@ int dev_cache_exit(void);
  */
 int dev_cache_check_for_open_devices(void);
 
-void dev_cache_scan(void);
+void dev_cache_scan(struct cmd_context *cmd);
 int dev_cache_has_scanned(void);
 
 int dev_cache_add_dir(const char *path);
diff --git a/lib/metadata/metadata.c b/lib/metadata/metadata.c
index d5b28a58f200..0cbf678690b7 100644
--- a/lib/metadata/metadata.c
+++ b/lib/metadata/metadata.c
@@ -5132,7 +5132,8 @@ struct volume_group *vg_read(struct cmd_context *cmd, const char *vg_name, const
 	if (!check_pv_dev_sizes(vg))
 		log_warn("WARNING: One or more devices used as PVs in VG %s have changed sizes.", vg->name);
 
-	_check_devs_used_correspond_with_vg(vg);
+	if (cmd->check_devs_used)
+		_check_devs_used_correspond_with_vg(vg);
 
 	if (!_access_vg_lock_type(cmd, vg, lockd_state, &failure)) {
 		/* Either FAILED_LOCK_TYPE or FAILED_LOCK_MODE were set. */
diff --git a/tools/lvmdevices.c b/tools/lvmdevices.c
index 3448bdd14722..5117277a091d 100644
--- a/tools/lvmdevices.c
+++ b/tools/lvmdevices.c
@@ -171,7 +171,7 @@ int lvmdevices(struct cmd_context *cmd, int argc, char **argv)
 		log_error("Failed to read the devices file.");
 		return ECMD_FAILED;
 	}
-	dev_cache_scan();
+	dev_cache_scan(cmd);
 	device_ids_match(cmd);
 
 	if (arg_is_set(cmd, check_ARG) || arg_is_set(cmd, update_ARG)) {
diff --git a/tools/pvscan.c b/tools/pvscan.c
index f8d27372b4ae..464501ad54c4 100644
--- a/tools/pvscan.c
+++ b/tools/pvscan.c
@@ -1627,6 +1627,8 @@ int pvscan_cache_cmd(struct cmd_context *cmd, int argc, char **argv)
 
 	dm_list_init(&complete_vgnames);
 
+	cmd->check_devs_used = 0;
+
 	if (do_activate &&
 	    !find_config_tree_bool(cmd, global_event_activation_CFG, NULL)) {
 		log_verbose("Ignoring pvscan --cache -aay because event_activation is disabled.");
-- 
2.10.1


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--C7zPtVaVf+AK4Oqc--

