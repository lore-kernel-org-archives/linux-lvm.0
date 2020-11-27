Return-Path: <SRS0=Wamy=FB=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209BCC3E8C5
	for <linux-lvm@archiver.kernel.org>; Fri, 27 Nov 2020 16:22:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9066221D7A
	for <linux-lvm@archiver.kernel.org>; Fri, 27 Nov 2020 16:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9066221D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-mmH5OnMVPKKAgrmLtR7QPQ-1; Fri, 27 Nov 2020 11:22:38 -0500
X-MC-Unique: mmH5OnMVPKKAgrmLtR7QPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D40C6803F49;
	Fri, 27 Nov 2020 16:22:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5006C63BA7;
	Fri, 27 Nov 2020 16:22:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEAEF180954D;
	Fri, 27 Nov 2020 16:22:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ARGMBjs007606 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 27 Nov 2020 11:22:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1EF42D7B2E; Fri, 27 Nov 2020 16:22:11 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18C04D7B35
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2020 16:22:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02BA1185A794
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2020 16:22:09 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
	[209.85.219.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-89-0Vo5agPfPw2GwKUKkuDDFA-1; Fri, 27 Nov 2020 11:22:06 -0500
X-MC-Unique: 0Vo5agPfPw2GwKUKkuDDFA-1
Received: by mail-qv1-f52.google.com with SMTP id k3so2554156qvz.4
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2020 08:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to;
	bh=PvAo2L/HbbsdZ06FvXiYqc3dZUb3WDEwggEESCk0uZw=;
	b=ZqhD1xFvHj7UyH/MnKgde4oTm795Yw3kho1sO+LjhiLXicv7Oqr3GjREaGJ4TbeMgU
	v4emPucjJMtZ42HmH68t43W7Jk08DA1s133JoiPU2gwYL3TtAhCi7ZDbCg2HoC5LzQO6
	dDMwouOLHKSIAXaygZPoKuR3hbUHG5FGpR0GYqlG9+JtBQefLRUpZG561H+7cKnhrR2p
	dDKyuziRXBsy2JeK8ao64G3xF8pAQfagZsjVb5pSUZ+TtY22XqEFoxGzsGPkC17n78km
	zdSGLGqW0hIzZbWaZNm+27BVtt7xwRUybNovWXMBxqMmF53DEle/LPj904PjI4Uye6Gx
	98fA==
X-Gm-Message-State: AOAM531LRw7sP4aGJivemh6GrLFs4lNNNYXorg9b7yLPt4B1ZcYMeiwi
	JgDqQN95MNnsHop8ma/LEHixw8mVydHiT8UO
X-Google-Smtp-Source: ABdhPJy1txypWm+lrSMyg3ETFaktbTQf59OjLCMJ0oJeOme7xn2dD5HQPZWrDqHZcpzO+eZpBwhBEw==
X-Received: by 2002:a05:6214:a8f:: with SMTP id
	ev15mr8988098qvb.20.1606494125764; 
	Fri, 27 Nov 2020 08:22:05 -0800 (PST)
Received: from chatter.i7.local ([89.36.78.230])
	by smtp.gmail.com with ESMTPSA id
	t126sm6178800qkh.133.2020.11.27.08.22.04 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Nov 2020 08:22:04 -0800 (PST)
Date: Fri, 27 Nov 2020 11:22:03 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20201127162203.ckpi3y2bhoffdwef@chatter.i7.local>
Mail-Followup-To: LVM general discussion and development <linux-lvm@redhat.com>
References: <c2a0606a-6e76-816b-e76f-165a1c1aac91@service4.ru>
	<49f2e53b-6f89-d4dd-4bee-290a26a8e208@izyk.ru>
MIME-Version: 1.0
In-Reply-To: <49f2e53b-6f89-d4dd-4bee-290a26a8e208@izyk.ru>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Search in the list
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 27, 2020 at 12:40:40PM +0300, Ilia Zykov wrote:
> Hello.
> Please, tell me if there is a way to search the archive of this list?
> https://www.redhat.com/archives/linux-lvm/index.html

I realized that we don't have it on lore yet, so I imported mailman 
archives and it should now be available here: 
https://lore.kernel.org/linux-lvm/

Regards,
-K

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

