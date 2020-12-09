Return-Path: <SRS0=oYOT=FN=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2D0C433FE
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 20:46:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15FDA23C85
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 20:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15FDA23C85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607546806;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WYRVK4aT6ERMJOoFQrk2HTjjI7FIG1X9Oq7vEA0gfI4=;
	b=aLcVglcv/cFQN3ssvjE7lFhDEXZ1k993pvUNZN1ubgwgNrzYIYpvcWzJdWASFMvhDQZ+ju
	iEyUdr8AthaAqFjw2c9rXh+DorMNh2F68aOQ0dLVdOpaNdfLX7hyWUYg3D5ksK42rIZVDI
	L13d7S6PHgIgk2CsO3BDYJo2JcoLIW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-IGLMcBUFNr6ddfpR5xvzSw-1; Wed, 09 Dec 2020 15:46:43 -0500
X-MC-Unique: IGLMcBUFNr6ddfpR5xvzSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D50BD1012E6C;
	Wed,  9 Dec 2020 20:46:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A10195D9CA;
	Wed,  9 Dec 2020 20:46:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D23404A7C6;
	Wed,  9 Dec 2020 20:45:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B9Kjv6V026437 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 9 Dec 2020 15:45:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7463F1E5; Wed,  9 Dec 2020 20:45:57 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC9EA6F439;
	Wed,  9 Dec 2020 20:45:26 +0000 (UTC)
Date: Wed, 9 Dec 2020 14:45:25 -0600
From: David Teigland <teigland@redhat.com>
To: Dennis Schridde <devurandom@gmx.net>
Message-ID: <20201209204525.GD15208@redhat.com>
References: <4384449.LvFx2qVVIh@monk> <5900102.lOV4Wx5bFT@monk>
	<20201209193051.GC15208@redhat.com> <11903480.O9o76ZdvQC@monk>
MIME-Version: 1.0
In-Reply-To: <11903480.O9o76ZdvQC@monk>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-lvm@redhat.com
Cc: linux-lvm@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 09, 2020 at 08:57:07PM +0100, Dennis Schridde wrote:
> On Mittwoch, 9. Dezember 2020 20:30:51 CET David Teigland wrote:
> > On Wed, Dec 09, 2020 at 08:06:41PM +0100, Dennis Schridde wrote:
> > > How would you proceed to repair this cache?  I can recreate it as a
> > > cachepool, but first I need to gain back access to the data, i.e. get
> > > into a state where I can --uncache.
> >
> > I know that cachevols do not yet work with lvconvert --repair, which uses
> > cache_repair, but this must be another case where cache_repair is still
> > needed.  If this is writethough mode you should be able to simply drop the
> > cache with lvconvert --splitcache and then recreate it.
> 
> Sadly the cache is in writeback mode.
> 
> Is my understanding correct that the cache itself is fine?  It is just the
> inability to clear the needs_check flag that is preventing me from using the
> device?  

I suspect the cache itself is fine and we're just missing a way to clear
that flag in the cache metadata.  I'm looking for a workaround for that
until we can sort out a complete fix.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

