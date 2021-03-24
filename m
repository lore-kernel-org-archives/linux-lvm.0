Return-Path: <SRS0=mJoT=IW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CDEC433C1
	for <linux-lvm@archiver.kernel.org>; Wed, 24 Mar 2021 05:10:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 001E6619B8
	for <linux-lvm@archiver.kernel.org>; Wed, 24 Mar 2021 05:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 001E6619B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-XBpnSUMTM6qxw4Q9IbOHGA-1; Wed, 24 Mar 2021 01:10:53 -0400
X-MC-Unique: XBpnSUMTM6qxw4Q9IbOHGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8607B801817;
	Wed, 24 Mar 2021 05:10:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3658D6A04A;
	Wed, 24 Mar 2021 05:10:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DBB24BB7C;
	Wed, 24 Mar 2021 05:09:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12O59ibI029708 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 24 Mar 2021 01:09:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEA1F10F8E2E; Wed, 24 Mar 2021 05:09:44 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B957D10F8E2D
	for <linux-lvm@redhat.com>; Wed, 24 Mar 2021 05:09:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82C7F101A531
	for <linux-lvm@redhat.com>; Wed, 24 Mar 2021 05:09:39 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-167-5wq9rp5KOpCblp2srfrhPQ-1;
	Wed, 24 Mar 2021 01:09:34 -0400
X-MC-Unique: 5wq9rp5KOpCblp2srfrhPQ-1
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-16-zrNNIY62N-q6fRDyvot_AA-1; Wed, 24 Mar 2021 06:09:32 +0100
X-MC-Unique: zrNNIY62N-q6fRDyvot_AA-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DBBPR04MB6089.eurprd04.prod.outlook.com (2603:10a6:10:c9::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3977.25; Wed, 24 Mar 2021 05:09:30 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::c5e3:4b14:8fc0:b393]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::c5e3:4b14:8fc0:b393%4]) with mapi id 15.20.3955.027;
	Wed, 24 Mar 2021 05:09:30 +0000
From: Zhao Heming <heming.zhao@suse.com>
To: linux-lvm@redhat.com, zkabelac@redhat.com, teigland@redhat.com
Date: Wed, 24 Mar 2021 13:09:09 +0800
Message-Id: <1616562549-25903-1-git-send-email-heming.zhao@suse.com>
X-Originating-IP: [123.123.132.137]
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
	(2603:1096:202:16::14) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.132.137) by
	HK2PR02CA0130.apcprd02.prod.outlook.com (2603:1096:202:16::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25
	via Frontend Transport; Wed, 24 Mar 2021 05:09:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d2af5db-fb02-442e-28bd-08d8ee8300ea
X-MS-TrafficTypeDiagnostic: DBBPR04MB6089:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB60890222CE075607AEFB816E97639@DBBPR04MB6089.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:374
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 1lktUFw89YPVRScmfhkRyZoSHVYo21WjJrFAtmlFwhPLEi0V+cJL18DDuug0TE10u1d/sfNh/lBhdoewfQXB6ZVsnAjXq9N7vU0dA69B3Kr12ewnJKTFmfrsS5+ZVZKXawHKs8gKyZJPvTHIUCNIY0JzNDaT0i4VxBX3zr3hXFukgpLLnM5g4s2mm0YXeLgfcC/aafX51XC6hR++0wtFKdsrr26OawAbuunr63H+zz/x3vQQyZ5U9FwFhwl89WpTJiTCxqTAlaJY6UDLVc7ELnFq7CyBGm7tRrlxyv/URZUMstYOYIA/NnOvd2Y5Ujukd2wC1vx0rcknraU7k3b3JIW2sWAAphF8msXtheLFx3T1eJO/AXsJobs7XNcTD7ZrDI60RwOQTVl6kyteuWStR20hWubLQ0TiWJsYN+/KReyNVlzqYYribBOPY1AGrAY4tsvGtoq2ffgAdqmMaEftKS+Jmr1NPHrZySAl/LAuOiqYiqXl8oOwS/eonDZEWwdV5TSLu0G0x+WcAPMFqZICtjkZOQtB/8kJfNg5jaJ79EtWPtHgP+VvL/qAtgpAsyNZHPlgjApzOvmkpkrzZKD5cIbFayvZnElh66+A0lp3iukZWLlt0IV589VTLIEt03KaQ3sflnVGJJ0AtNnQxsILsZShO83/DDvmiLzvUQ4vQCs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(39860400002)(376002)(396003)(346002)(136003)(4326008)(83380400001)(36756003)(6512007)(478600001)(8676002)(450100002)(316002)(8936002)(5660300002)(2616005)(66476007)(956004)(6666004)(8886007)(6506007)(52116002)(2906002)(66556008)(38100700001)(6486002)(26005)(107886003)(16526019)(186003)(66946007)(86362001)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xHkhcEUILN+5JOLqDanR2F5PqnkopruVROxU9iAuXSOd11gxErQMgUAGAHc3?=
	=?us-ascii?Q?Lpm3g716joyd6JNgpmHdtVzD4NpBFruhYooaqK97w/J+L34BQ+Hxz91uNJ2m?=
	=?us-ascii?Q?7SetpGawab4A/6bSwSmu/p3K+iF2svmFRtlidp0o/mvtap1oAL+zkS68YrqE?=
	=?us-ascii?Q?xSEx2VPv1plUNoif1DXvxQnGRcqJTZz7e92uxMNeBj23Ycc1fKRthEgnwiD2?=
	=?us-ascii?Q?8ZyjMnSNbgBbxkzxJ4phM4RH3R/BAZyDgJG7GagoX5fCWzCYSefjLmBCUBbi?=
	=?us-ascii?Q?dwiJOtAL2uIXr0GfvgptEFtl26RT5ROaRSFPlM7cajCRAhE6YAQ5o45UkPM2?=
	=?us-ascii?Q?6kxUQ4167F13So+xPGZWyRRXl5myJaerT5Ubi0sMMVXTTx66dD2dF1kighsr?=
	=?us-ascii?Q?h2GBe4WWDC6qgbNVhDqARJ4WDGWOlYWNGfdM0r/zLijens3Hc28313DTteo7?=
	=?us-ascii?Q?xykDRK2x4tbtdDFQ7xIm2wfeHqD5Zu4H+B6gKJru63LnIOUWgtrqT0R/cMJz?=
	=?us-ascii?Q?q/AABVzffhPk/s2yvhLjqv29kE+Cf2vdSUqFZ4Pfj+Nrpm3KEirmxIQfVhb8?=
	=?us-ascii?Q?59FN0curcYOFIU8QpVkWN+4prQQZRjmSzna7/DEB8sPRXV6anJPYWNBdXMCN?=
	=?us-ascii?Q?k5hNWnJ3jXDocpACRcOV1tX/Gy6EzDME7ufoiJfiyDn6/0/yOidiD4CXJgk/?=
	=?us-ascii?Q?9IION7wgWSx7eQS7q8dn3oHg4G/opCGu1YR+oteBfu7IjujNULLxZGnvSPON?=
	=?us-ascii?Q?m1m+8rnnbn9WcmKM51S6BCUZCQtPZuZd1kjegcSX6GMG2HFcCuVWMoBBiC6+?=
	=?us-ascii?Q?2tsNvm1ybTPchOri7tbqfH5Wfl4sQ3myVIrdFGG1TxJKeg8CTSlGtvttkNoN?=
	=?us-ascii?Q?h9kS01YhFrrDGzS/j9f4S7ttTVuHZZ1A4aNY8ZwMlhIoQa5OclQHynenVrAv?=
	=?us-ascii?Q?qF5eVDxyuk197eIGkSik6+lfWoiO5z/ODcoUQHtUlIUMUCe0SN53MDnBE/3y?=
	=?us-ascii?Q?bah1aHzx28/u/fja6f6A+Hlr0MoZyrrGrhzLzCqiBVsWWGMLIGzCjWtTTc3v?=
	=?us-ascii?Q?D1jePhv3Tqi8VzffaApzb46me1DMwXuuYYwjfC0+J96BBAbcqeoMSRCDdwkr?=
	=?us-ascii?Q?ligDMQMGVCcz+UT6u54WCa9KX7YRryAPNaD+eZRUdLh7kUr0JyzKzxTF0k7P?=
	=?us-ascii?Q?Pxc9ZMAnsHaOKA5m4Uindzweo+lTt1Xt98W8qa7cldAGXuVC9gu+Bja2ILEp?=
	=?us-ascii?Q?v/KXyzgEMiiqCv8sY5typCpw2UegHmLqhiN1hGHs+l+PIZOQ64xl5mYeRE7V?=
	=?us-ascii?Q?BdUEhv7fZ3JFWVlkwXRjqz8s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2af5db-fb02-442e-28bd-08d8ee8300ea
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 05:09:30.1794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cosEvighqs6dAh7BRcZ47qWhdPiBX7WWdug4zDoKuM2WRYl2oMpyLjtZxleNoTyVhyfw6Q5yDd5tlVrykX/CSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6089
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
Cc: Zhao Heming <heming.zhao@suse.com>
Subject: [linux-lvm] [PATCH] [PATCH] stable-2.02 - lvresize: deny operation
	on swap dev without force option
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When lvmetad is active on system and some memory pages of lvmetad
swapout, user may issue lvextend/lvresize on swap LV. The resize
operation will suspend & resume swap device (by reload dm table).
After suspended swap device, lvmetad will be in UN status for waiting
swapin pages from suspended swap dev. lvmetad will hung, then
lvresize will fail to conection to lvmetad. then the resize operation
will fail, lvresize leaves suspended swap, the logic dead lock is
happending.

This commit add "--force" checking for lvresize on swap device. The
"--force" and related error info make user to understand swap device
should be deactive when resizing.

Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
 lib/device/dev-swap.c   | 19 +++++++++++++++++++
 lib/device/dev-type.h   |  1 +
 lib/metadata/lv_manip.c |  9 +++++++++
 3 files changed, 29 insertions(+)

diff --git a/lib/device/dev-swap.c b/lib/device/dev-swap.c
index 3bfb72b38ce6..a65e75b06157 100644
--- a/lib/device/dev-swap.c
+++ b/lib/device/dev-swap.c
@@ -14,6 +14,7 @@
 
 #include "lib.h"
 #include "dev-type.h"
+#include "dev-cache.h"
 
 #ifdef __linux__
 
@@ -73,4 +74,22 @@ int dev_is_swap(struct device *dev, uint64_t *offset_found, int full)
 	return ret;
 }
 
+/* User may set up swap LV with complex underlying devs. */
+int lv_is_swap(struct logical_volume *lv, int *is_swap)
+{
+	struct device *dev;
+	struct dev_iter *iter;
+
+	if (!(iter = dev_iter_create(NULL, 1)))
+		return_0;
+
+	*is_swap = 0;
+	while ((dev = dev_iter_get(iter))) {
+		*is_swap |= dev_is_swap(dev, NULL, 1);
+	}
+	dev_iter_destroy(iter);
+
+	return 1;
+}
+
 #endif
diff --git a/lib/device/dev-type.h b/lib/device/dev-type.h
index bd989f8c8a2a..bbf6c0f1efad 100644
--- a/lib/device/dev-type.h
+++ b/lib/device/dev-type.h
@@ -63,6 +63,7 @@ int dev_is_luks(struct device *dev, uint64_t *signature, int full);
 int dasd_is_cdl_formatted(struct device *dev);
 int udev_dev_is_mpath_component(struct device *dev);
 int udev_dev_is_md_component(struct device *dev);
+int lv_is_swap(struct logical_volume *lv, int *is_swap);
 
 int dev_is_lvm1(struct device *dev, char *buf, int buflen);
 int dev_is_pool(struct device *dev, char *buf, int buflen);
diff --git a/lib/metadata/lv_manip.c b/lib/metadata/lv_manip.c
index 0918780f143c..c099db8419b0 100644
--- a/lib/metadata/lv_manip.c
+++ b/lib/metadata/lv_manip.c
@@ -4830,6 +4830,7 @@ static int _lvresize_check(struct logical_volume *lv,
 {
 	struct volume_group *vg = lv->vg;
 	struct lv_segment *seg = first_seg(lv);
+	int is_swap;
 
 	if (lv_is_external_origin(lv)) {
 		/*
@@ -4927,6 +4928,14 @@ static int _lvresize_check(struct logical_volume *lv,
 		return 0;
 	}
 
+	if (lv_is_swap(lv, &is_swap)) {
+		if (is_swap && !lp->force) {
+			log_error("LV is a swap device, and command without --force option.");
+			log_error("Please make sure swap is DEACTIVE and re-run with --force option.");
+			return 0;
+		}
+	}
+
 	return 1;
 }
 
-- 
2.26.2

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

