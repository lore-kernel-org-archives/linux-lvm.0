Return-Path: <SRS0=i8mD=GJ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0605AC433E0
	for <linux-lvm@archiver.kernel.org>; Wed,  6 Jan 2021 14:39:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45F1B23100
	for <linux-lvm@archiver.kernel.org>; Wed,  6 Jan 2021 14:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45F1B23100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-KRvPN59kP6OC0KQ6eqwtTg-1; Wed, 06 Jan 2021 09:39:20 -0500
X-MC-Unique: KRvPN59kP6OC0KQ6eqwtTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB62A1005504;
	Wed,  6 Jan 2021 14:39:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B07510016FE;
	Wed,  6 Jan 2021 14:39:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E77D14BB7B;
	Wed,  6 Jan 2021 14:38:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 106Ecn4E005755 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 6 Jan 2021 09:38:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D23FC2166B2D; Wed,  6 Jan 2021 14:38:49 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD1742166B29
	for <linux-lvm@redhat.com>; Wed,  6 Jan 2021 14:38:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4645C8007D9
	for <linux-lvm@redhat.com>; Wed,  6 Jan 2021 14:38:47 +0000 (UTC)
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-505-nWQcOsxBMuy3wCIvTWP8Tw-1; Wed, 06 Jan 2021 09:38:44 -0500
X-MC-Unique: nWQcOsxBMuy3wCIvTWP8Tw-1
Received: from localhost (localhost [127.0.0.1])
	by vps.thesusis.net (Postfix) with ESMTP id 28E9125406;
	Wed,  6 Jan 2021 09:38:44 -0500 (EST)
Received: from vps.thesusis.net ([IPv6:::1])
	by localhost (vps.thesusis.net [IPv6:::1]) (amavisd-new, port 10024)
	with ESMTP id IXB06N8Ejwdq; Wed,  6 Jan 2021 09:38:43 -0500 (EST)
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id CC48F253EC; Wed,  6 Jan 2021 09:38:43 -0500 (EST)
References: <87im8bch2c.fsf@vps.thesusis.net>
	<20210105204737.GC5546@agk.fab.redhat.com>
	<87v9cbdqzy.fsf@vps.thesusis.net>
	<20210106015254.GE5546@agk.fab.redhat.com>
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: Alasdair G Kergon <agk@redhat.com>
Date: Wed, 06 Jan 2021 09:36:39 -0500
In-reply-to: <20210106015254.GE5546@agk.fab.redhat.com>
Message-ID: <878s965dvw.fsf@vps.thesusis.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Mirror allocation policy
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Alasdair G Kergon writes:

> So despite that, it's not letting you have the 'anywhere' for the log
> part of the allocation.

Based on the number of extents it said it was looking for, I didn't
think it was the log that it couldn't place.

> However, for what you are doing, maybe you don't need an on-disk mirror
> log or can temporarily borrow a little space (add small temporary
> loopback PV to the VG?) for it?

I could have sworn that I had tried --corelog yesterday and it still
didn't work, but today it did.  Weird.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

