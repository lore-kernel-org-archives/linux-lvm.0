Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C07C19F28
	for <linux-lvm@archiver.kernel.org>; Wed,  3 Aug 2022 07:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659511168;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K9im9NYszJ+S9EyrMbRjLSPJZFUpkDcf6ntYUxH1Haw=;
	b=YenoWzT2r8CMfjM/uCjuVlsZp6hzkMy5XrIs+i372LkYqj22u54B8QajYYGFZgP6MK9Og/
	tlfB0Yd53ezDSab51SfhaWaR9dD2/4Mjjrs0RBHvJ4x/KfzJkBv220KqUTM8r2ygMFfyUE
	50lVZm4+aIDviX4vueHf7wt9agDuoWg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-lyZdYMXWNNC-rr6h6aBaqQ-1; Wed, 03 Aug 2022 03:19:24 -0400
X-MC-Unique: lyZdYMXWNNC-rr6h6aBaqQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E876B801585;
	Wed,  3 Aug 2022 07:19:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE55C492C3B;
	Wed,  3 Aug 2022 07:19:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A999F1946A5C;
	Wed,  3 Aug 2022 07:19:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A91D31946A4A
 for <linux-lvm@listman.corp.redhat.com>; Tue,  2 Aug 2022 14:44:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9DA6F2026D64; Tue,  2 Aug 2022 14:44:24 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A13B2026D4C
 for <linux-lvm@redhat.com>; Tue,  2 Aug 2022 14:44:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8271285A587
 for <linux-lvm@redhat.com>; Tue,  2 Aug 2022 14:44:24 +0000 (UTC)
Received: from mx1.helsinki.tools (mx1.helsinki.tools [116.202.14.156]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-epy4RE21P3-goYY5Rq1VXw-1; Tue, 02 Aug 2022 10:44:21 -0400
X-MC-Unique: epy4RE21P3-goYY5Rq1VXw-1
Date: Tue, 2 Aug 2022 16:27:53 +0200
From: ajs124 <linux-lvm@ajs124.de>
To: <linux-lvm@redhat.com>
Message-ID: <20220802162753.6c214fe5@desk>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mailman-Approved-At: Wed, 03 Aug 2022 07:19:15 +0000
Subject: [linux-lvm] raidintegrity on non top level LVs
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I've been wondering. Why does lvconvert not allow me to add raid
integrity to LVs that are not top level?
It only says "Integrity can only be added to top level raid LV."

Skimming the commit that added this [1] did not provide me with
an answer, so I thought I'd ask here.

Best Regards

[1]: https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=d9e8895a96539d75166c0f74e58f5ed4e729e551

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

