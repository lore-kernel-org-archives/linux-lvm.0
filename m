Return-Path: <SRS0=oYOT=FN=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13024C4361B
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 19:31:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55A7C23C90
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 19:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55A7C23C90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607542274;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jrreorNaxpq/ocmtZzYebO3coXOEagzlXkYwx2oDeUM=;
	b=XhXb/l/iEiFybDDBwww79EK7D7yBNY1ZiLXyAuAqLFzPGkfFZAKU+k1tagQRilD90cinGR
	yM4XxsrkiAFM/w22ldl05NFdiNZ808ZmD71RVuHXTRXu+XXAsxCHHMuvpikC3T68M/PJUj
	HAN2ZAZV5iaEiKVMU+dJrxxWHjEqUSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-XbeGtQs4PP2R04k47DV29g-1; Wed, 09 Dec 2020 14:31:10 -0500
X-MC-Unique: XbeGtQs4PP2R04k47DV29g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED29318C89DA;
	Wed,  9 Dec 2020 19:31:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B2BC5C261;
	Wed,  9 Dec 2020 19:31:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ACB384BB7B;
	Wed,  9 Dec 2020 19:30:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B9JUrQc016471 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 9 Dec 2020 14:30:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B44E310023AD; Wed,  9 Dec 2020 19:30:53 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E83B1002391;
	Wed,  9 Dec 2020 19:30:53 +0000 (UTC)
Date: Wed, 9 Dec 2020 13:30:51 -0600
From: David Teigland <teigland@redhat.com>
To: Dennis Schridde <devurandom@gmx.net>
Message-ID: <20201209193051.GC15208@redhat.com>
References: <4384449.LvFx2qVVIh@monk>
	<a2927a4a-006e-6b5b-3597-d7b592e21ec7@redhat.com>
	<5900102.lOV4Wx5bFT@monk>
MIME-Version: 1.0
In-Reply-To: <5900102.lOV4Wx5bFT@monk>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] cache_check --clear-needs-check-flag does not clear
 needs_check flag?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 09, 2020 at 08:06:41PM +0100, Dennis Schridde wrote:
> How would you proceed to repair this cache?  I can recreate it as a cachepool,
> but first I need to gain back access to the data, i.e. get into a state where
> I can --uncache.

I know that cachevols do not yet work with lvconvert --repair, which uses
cache_repair, but this must be another case where cache_repair is still
needed.  If this is writethough mode you should be able to simply drop the
cache with lvconvert --splitcache and then recreate it.
Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

