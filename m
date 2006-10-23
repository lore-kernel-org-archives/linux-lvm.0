Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9NDfHBo017738
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2006 09:41:17 -0400
Received: from mx2.suse.de (cantor2.suse.de [195.135.220.15])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9NDfGvT029944
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2006 09:41:16 -0400
Received: from Relay2.suse.de (mail2.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 40F3B20A6E
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2006 15:41:01 +0200 (CEST)
Date: Mon, 23 Oct 2006 15:41:00 +0200
From: Jan Blunck <jblunck@suse.de>
Message-ID: <20061023134100.GB4729@hasse.suse.de>
References: <20061011173421.GC4636@hasse.suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061011173421.GC4636@hasse.suse.de>
Subject: [linux-lvm] [RFC, 2nd try] Let udev play with snapshots
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Oct 11, Jan Blunck wrote:

> - creating "vg-snapshot"
> - clearing the start of "vg-snapshot"
> - removing "vg-snapshot"                                                  (1)

Actually this must be deactivation of vg-snapshot. This is where the
deactivation code complains about the usage count of the LV.

> - creating "vg-origin-real"
> - creating "vg-snapshot-cow"
> - creating "vg-snapshot"
> - suspending "vg-origin" and "vg-origin-real"
> - reload tables
> - resuming "vg-origin-real", "vg-snapshot-cow", "vg-snapshot" and         (2)
>   "vg-origin"

I looked into the lvcreate code and realised that the deactivation code is
only complaining about the usage count because "vg-snapshot" is marked
VISIBLE_LV. Since the LV is at that moment used for clearing I think it should
be marked internal.

I know that this isn't a perfect solution yet. In the long term we need to give
udev a change to determine if an LV is internal or not (e.g. by reading the
VISIBLE_LV status).

BTW: Why do we actually create links even if the LV is marked invisible? Does
that make any sense at all?

RFC,
	Jan
---
Index: LVM2/tools/lvcreate.c
===================================================================
--- LVM2.orig/tools/lvcreate.c
+++ LVM2/tools/lvcreate.c
@@ -694,6 +694,10 @@ static int _lvcreate(struct cmd_context 
 		}
 	}
 
+	/* We are cleaning the exception table first, so let it be internal */
+	if (lp->snapshot)
+		status &= ~VISIBLE_LV;
+
 	if (!(lv = lv_create_empty(vg->fid, lv_name ? lv_name : "lvol%d", NULL,
 				   status, lp->alloc, 0, vg))) {
 		stack;
@@ -792,6 +796,9 @@ static int _lvcreate(struct cmd_context 
 			return 0;
 		}
 
+		/* we are no longer an internal LV */
+		lv->status |= VISIBLE_LV;
+
 		if (!vg_add_snapshot(vg->fid, NULL, org, lv, NULL,
 				     org->le_count, lp->chunk_size)) {
 			log_err("Couldn't create snapshot.");
