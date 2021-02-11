Return-Path: <SRS0=jjTy=HN=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDE1C433E0
	for <linux-lvm@archiver.kernel.org>; Thu, 11 Feb 2021 11:24:43 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7297664DCF
	for <linux-lvm@archiver.kernel.org>; Thu, 11 Feb 2021 11:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7297664DCF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eworm.de
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-0QSLS8VeNUy4KKM4w5A7vQ-1; Thu, 11 Feb 2021 06:24:38 -0500
X-MC-Unique: 0QSLS8VeNUy4KKM4w5A7vQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE79D427C1;
	Thu, 11 Feb 2021 11:24:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF52B62467;
	Thu, 11 Feb 2021 11:24:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 490AF4E58D;
	Thu, 11 Feb 2021 11:24:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11BBO9x4013903 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 11 Feb 2021 06:24:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 464B0F4EAA; Thu, 11 Feb 2021 11:24:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40F49F4EA9
	for <linux-lvm@redhat.com>; Thu, 11 Feb 2021 11:24:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F01BF800B2A
	for <linux-lvm@redhat.com>; Thu, 11 Feb 2021 11:24:06 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-271-gSlyHI1sOmeK0mAoXBYNRw-1; Thu, 11 Feb 2021 06:24:01 -0500
X-MC-Unique: gSlyHI1sOmeK0mAoXBYNRw-1
Received: from leda.eworm.de (p54b79d46.dip0.t-ipconnect.de [84.183.157.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id 2A1EE109650;
	Thu, 11 Feb 2021 12:18:12 +0100 (CET)
Received: by leda.eworm.de (Postfix, from userid 1000)
	id C44781A029F; Thu, 11 Feb 2021 12:17:41 +0100 (CET)
From: Christian Hesse <list@eworm.de>
To: linux-lvm@redhat.com
Date: Thu, 11 Feb 2021 12:16:23 +0100
Message-Id: <20210211111623.34968-1-list@eworm.de>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Rspamd-Server: mx
X-Stat-Signature: pc5ifckuwewiso1kdhfwenznyzdiq5eo
X-Rspamd-Queue-Id: 2A1EE109650
X-Spamd-Result: default: False [1.37 / 15.00]; ARC_NA(0.00)[];
	GENERIC_REPUTATION(0.00)[-0.65566025730218];
	FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
	R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
	DKIM_SIGNED(0.00)[]; NEURAL_HAM_SHORT(-0.83)[-0.827];
	RCPT_COUNT_TWO(0.00)[2]; MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[list@eworm.de,eworm@leda.eworm.de];
	RCVD_COUNT_ZERO(0.00)[0]; MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:3320, ipnet:84.128.0.0/10, country:DE];
	FROM_NEQ_ENVFROM(0.00)[list@eworm.de,eworm@leda.eworm.de];
	BAYES_HAM(-3.00)[99.99%]
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11BBO9x4013903
X-loop: linux-lvm@redhat.com
Cc: Christian Hesse <mail@eworm.de>
Subject: [linux-lvm] [PATCH 1/1] pvscan: wait for udevd
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christian Hesse <mail@eworm.de>

Running the scan before udevd finished startup may result in failure.
This has been reported for Arch Linux [0] and proper ordering fixes
the issue.

[0] https://bugs.archlinux.org/task/69611

Signed-off-by: Christian Hesse <mail@eworm.de>
---
 scripts/lvm2-pvscan.service.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lvm2-pvscan.service.in b/scripts/lvm2-pvscan.service.in
index 09753e8c9..7b4ace551 100644
--- a/scripts/lvm2-pvscan.service.in
+++ b/scripts/lvm2-pvscan.service.in
@@ -4,6 +4,7 @@ Documentation=man:pvscan(8)
 DefaultDependencies=no
 StartLimitIntervalSec=0
 BindsTo=dev-block-%i.device
+After=systemd-udevd.service
 Before=shutdown.target
 Conflicts=shutdown.target
 


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

