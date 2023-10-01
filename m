Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DD4E748ED
	for <linux-lvm@archiver.kernel.org>; Sun,  1 Oct 2023 09:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696152301;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZykFaQUFYh/2xoPXy/TyBmUtZ5A26L2DYJn+vV4/API=;
	b=FjnJQvcm7oiCuDcj9bP697HOnNhJUIC8kwou8H7W/kVbwnYoTO9ekz5zANfsuLPCxJQT7/
	4mQtiJ0oLnfL7Ga25zLgaq8pepI4MapoOqVm2EeK3CPh6eKS0TC18vXf7pB8XZg39tSrNe
	v4vfle3SzCwuVA1dIBw53+0lw15P4Pw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-QKG6EwdWMRSMxnIsuCWvmQ-1; Sun, 01 Oct 2023 05:24:58 -0400
X-MC-Unique: QKG6EwdWMRSMxnIsuCWvmQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2500811E7D;
	Sun,  1 Oct 2023 09:24:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C326B402710;
	Sun,  1 Oct 2023 09:24:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9BEDB19466F3;
	Sun,  1 Oct 2023 09:24:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 676011946587
 for <linux-lvm@listman.corp.redhat.com>; Sun,  1 Oct 2023 09:24:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 54182400E89; Sun,  1 Oct 2023 09:24:48 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C936492B16
 for <linux-lvm@redhat.com>; Sun,  1 Oct 2023 09:24:48 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 308C41C294A1
 for <linux-lvm@redhat.com>; Sun,  1 Oct 2023 09:24:48 +0000 (UTC)
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-sWT5tsZNMb2ahbL_vFq16Q-1; Sun, 01 Oct 2023 05:24:36 -0400
X-MC-Unique: sWT5tsZNMb2ahbL_vFq16Q-1
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 2F05F3FA0B
 for <linux-lvm@redhat.com>; Sun,  1 Oct 2023 11:14:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1efj8yedC8SI for <linux-lvm@redhat.com>;
 Sun,  1 Oct 2023 11:14:54 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 249553F8E5
 for <linux-lvm@redhat.com>; Sun,  1 Oct 2023 11:14:54 +0200 (CEST)
Received: from [192.168.0.132] (port=33964)
 by tnonline.net with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.96) (envelope-from <forza@tnonline.net>) id 1qmsXN-00035o-2z
 for linux-lvm@redhat.com; Sun, 01 Oct 2023 11:14:53 +0200
Date: Sun, 1 Oct 2023 11:14:53 +0200 (GMT+02:00)
From: Forza <forza@tnonline.net>
To: linux-lvm@redhat.com
Message-ID: <b51c197.ba16e860.18aea84e80f@tnonline.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [linux-lvm] How to flush dirty cache with dm-cache?
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: tnonline.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Is it possible to force a flush of the dirty cache in a dm-cache device?

I read in the kernel docs[*] that there is a cleaner policy, but it doesn't describe well how to use it.

Ideally, I'd like to be able to use `dmsetup message` to issue a flush after suspending the cache to ensure that all dirty data is written to origin and no more data is dirtied before resuming. Is this possible?


Thanks
Forza

[*] https://www.kernel.org/doc/html/v6.5/admin-guide/device-mapper/cache.html

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

