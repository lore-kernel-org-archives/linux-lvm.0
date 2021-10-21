Return-Path: <SRS0=7RWj=PJ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31970C433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 21 Oct 2021 21:24:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 546486121F
	for <linux-lvm@archiver.kernel.org>; Thu, 21 Oct 2021 21:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 546486121F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eworm.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-5CzjZM6NMGGzR0_Fh6cdQw-1; Thu, 21 Oct 2021 17:24:03 -0400
X-MC-Unique: 5CzjZM6NMGGzR0_Fh6cdQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 913A069720;
	Thu, 21 Oct 2021 21:23:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D64860D30;
	Thu, 21 Oct 2021 21:23:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE4F24EA2A;
	Thu, 21 Oct 2021 21:23:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19LLBglv002582 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 17:11:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61687D019F; Thu, 21 Oct 2021 21:11:42 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BB1117458
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2021 21:11:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71163899EC5
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2021 21:11:39 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-546-h88LGEMfNnmrNMrFfyjnvQ-1; Thu, 21 Oct 2021 17:11:36 -0400
X-MC-Unique: h88LGEMfNnmrNMrFfyjnvQ-1
Received: from leda.eworm.de (tmo-120-76.customers.d1-online.com
	[80.187.120.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
	SHA256) (No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id 88AD51994AF;
	Thu, 21 Oct 2021 23:02:11 +0200 (CEST)
Received: by leda.eworm.de (Postfix, from userid 1000)
	id 43B5F1A1AD6; Thu, 21 Oct 2021 23:01:40 +0200 (CEST)
From: Christian Hesse <list@eworm.de>
To: linux-lvm@redhat.com
Date: Thu, 21 Oct 2021 23:01:34 +0200
Message-Id: <20211021210134.23008-1-list@eworm.de>
MIME-Version: 1.0
X-Rspamd-Server: mx
X-Stat-Signature: wmn5zh7uzw5aa8mw197zz3zd6awffbw4
X-Rspamd-Queue-Id: 88AD51994AF
X-Spamd-Result: default: False [-1.80 / 15.00]; ARC_NA(0.00)[];
	GENERIC_REPUTATION(0.00)[-0.69976569409412];
	FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
	R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
	NEURAL_HAM_LONG(-3.00)[-1.000];
	DKIM_SIGNED(0.00)[eworm.de:s=mail];
	NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_TWO(0.00)[2];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[list@eworm.de,eworm@leda.eworm.de];
	RCVD_COUNT_ZERO(0.00)[0]; MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:3320, ipnet:80.187.0.0/16, country:DE];
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19LLBglv002582
X-loop: linux-lvm@redhat.com
Cc: Christian Hesse <mail@eworm.de>
Subject: [linux-lvm] [PATCH 1/1] udev: use absolute path in rule
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

From: Christian Hesse <mail@eworm.de>

The path is known anyway and should be the bullet proof option.

Signed-off-by: Christian Hesse <mail@eworm.de>
---
 udev/69-dm-lvm.rules.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/udev/69-dm-lvm.rules.in b/udev/69-dm-lvm.rules.in
index 39e5b9807..d6bf1e0e9 100644
--- a/udev/69-dm-lvm.rules.in
+++ b/udev/69-dm-lvm.rules.in
@@ -80,7 +80,7 @@ ENV{SYSTEMD_READY}="1"
 # it's better suited to appearing in the journal.
 
 IMPORT{program}="(LVM_EXEC)/lvm pvscan --cache --listvg --checkcomplete --vgonline --udevoutput --journal=output $env{DEVNAME}"
-ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="/usr/bin/systemd-run -r --no-block --property DefaultDependencies=no --unit lvm-activate-$env{LVM_VG_NAME_COMPLETE} lvm vgchange -aay --nohints $env{LVM_VG_NAME_COMPLETE}"
+ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="/usr/bin/systemd-run -r --no-block --property DefaultDependencies=no --unit lvm-activate-$env{LVM_VG_NAME_COMPLETE} (LVM_EXEC)/lvm vgchange -aay --nohints $env{LVM_VG_NAME_COMPLETE}"
 GOTO="lvm_end"
 
 LABEL="lvm_end"


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

