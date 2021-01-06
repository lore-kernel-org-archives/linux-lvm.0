Return-Path: <SRS0=i8mD=GJ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7463DC433DB
	for <linux-lvm@archiver.kernel.org>; Wed,  6 Jan 2021 14:46:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC5B92311B
	for <linux-lvm@archiver.kernel.org>; Wed,  6 Jan 2021 14:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC5B92311B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609944403;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qhoOdIhL5x8Q0nI4kc6bWl0MSPIFaeRQZQdkhyXALXo=;
	b=h616rZ6OleusaMOfpY4O+vCk2M5iJd7wPITxEAh/cEM0A3PRplj3B2cruHT/+oYHI8x6YQ
	NZwd+4TwCg6tREP/BxgDjwEw9X9bvs99+GXZm43Gd+u4s7FbEXCkyCGVjB3YZ81+ChUeyE
	qaKM/MzNaWJbVrsGFfZD0kzNzBR4ylU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-1UMHm0wBOXuZ7KS7VCBzYg-1; Wed, 06 Jan 2021 09:46:40 -0500
X-MC-Unique: 1UMHm0wBOXuZ7KS7VCBzYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D66C18B9F1D;
	Wed,  6 Jan 2021 14:46:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 838905D9E2;
	Wed,  6 Jan 2021 14:46:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D94C34E58E;
	Wed,  6 Jan 2021 14:46:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 106EkQUh006814 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 6 Jan 2021 09:46:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 65BEC5D9DD; Wed,  6 Jan 2021 14:46:26 +0000 (UTC)
Received: from agk.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E39DB5D9D2;
	Wed,  6 Jan 2021 14:46:17 +0000 (UTC)
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1kxA4m-0002Pf-Io; Wed, 06 Jan 2021 14:46:16 +0000
Date: Wed, 6 Jan 2021 14:46:16 +0000
From: Alasdair G Kergon <agk@redhat.com>
To: Phillip Susi <phill@thesusis.net>
Message-ID: <20210106144616.GA9263@agk.fab.redhat.com>
Mail-Followup-To: Phillip Susi <phill@thesusis.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
References: <87im8bch2c.fsf@vps.thesusis.net>
	<20210105204737.GC5546@agk.fab.redhat.com>
	<87v9cbdqzy.fsf@vps.thesusis.net>
	<20210106015254.GE5546@agk.fab.redhat.com>
	<878s965dvw.fsf@vps.thesusis.net>
Mime-Version: 1.0
In-Reply-To: <878s965dvw.fsf@vps.thesusis.net>
User-Agent: Mutt/1.4.1i
Organization: Red Hat UK Ltd. Registered in England and Wales,
	number 03798903. Registered Office: Amberley Place,
	107-111 Peascod Street, Windsor, Berkshire, SL4 1TE.
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 06, 2021 at 09:36:39AM -0500, Phillip Susi wrote:
> Based on the number of extents it said it was looking for, I didn't
> think it was the log that it couldn't place.

It was looking for what it calls 'parallel' extents i.e. extents not on
the same device as the ones belonging to the existing LV being
converted, and, at first sight, it wasn't giving you the option of
overriding that in respect of the log.  Clearly the code could be
improved, but it's a very much a niche case, well outside the
normal way it's expected to be used.

Alasdair

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

