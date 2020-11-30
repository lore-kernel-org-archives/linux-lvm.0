Return-Path: <SRS0=nNlY=FE=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCE2C64E8A
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 13:11:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E7BF20575
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 13:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E7BF20575
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-Hz7ZUyYSOBSR60iEiLlVfw-1; Mon, 30 Nov 2020 08:11:22 -0500
X-MC-Unique: Hz7ZUyYSOBSR60iEiLlVfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8826A803F41;
	Mon, 30 Nov 2020 13:11:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7353110013C1;
	Mon, 30 Nov 2020 13:11:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2AE234BB40;
	Mon, 30 Nov 2020 13:11:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AUDAO3a007610 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 08:10:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0C7AE42AB8; Mon, 30 Nov 2020 13:10:24 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06D9E33231
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2020 13:10:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB731101A53F
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2020 13:10:20 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-425-8Msomc2ENUeDt4JdHsIKUQ-1; Mon, 30 Nov 2020 08:10:18 -0500
X-MC-Unique: 8Msomc2ENUeDt4JdHsIKUQ-1
Received: by mail-qt1-f182.google.com with SMTP id f15so7988555qto.13
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2020 05:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to;
	bh=qpEAAu9glGYLbnjbUgRxazazdohECmB/iiCrQYUG7z0=;
	b=XAe4QkMWYkDS4qI7TZVG9U4QZXoLJVdyu5mRwBEr5cLhKDufd6ykAEdyfBNFajhdq1
	+r8xHbPwm7DmmUefRUM8vd07zVmty3zkNGjiSDZ98GOP+L826/eI8eTykl4H2tJ9x8ZF
	ZDFUsK3O6bq2bLi9GkSE9KFCn+ttODAn2BQvXlT52OWXjHOAI1dir1on/lCeFhVHNZeS
	LyYgBDJecF4608QXD0FF7L0JZ+qzp2lo8FQtDcAnSxbonULiZT6zQ2VFmZ1pZ0ANJrPo
	d06dbuE4BLtB1F67d0DGY9bYuYz0B5LBacMjInPKQq461mYNQ6LMqLgXEKjsZKu87aIg
	0M6Q==
X-Gm-Message-State: AOAM532rOjpc48p5tJ9AAaG8phMH9/nGvpsAgjtpqt8dIbgy4FNxFnA5
	tOJgTlHBkm+K4QN349A2jLBC3jrcoB0pUZ9y
X-Google-Smtp-Source: ABdhPJzwRZf5hLX0HVErLCZmGkZxMsxQr7OPU6adF58qO8T+BtuAYmxkFWWw0i+UkuitaLOG5UvQgg==
X-Received: by 2002:ac8:6c49:: with SMTP id z9mr21516889qtu.82.1606741818106; 
	Mon, 30 Nov 2020 05:10:18 -0800 (PST)
Received: from chatter.i7.local ([89.36.78.230])
	by smtp.gmail.com with ESMTPSA id
	v31sm11658795qtd.29.2020.11.30.05.10.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Nov 2020 05:10:17 -0800 (PST)
Date: Mon, 30 Nov 2020 08:10:15 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Chris Murphy <lists@colorremedies.com>
Message-ID: <20201130131015.6lcmoqhx46evra6p@chatter.i7.local>
Mail-Followup-To: Chris Murphy <lists@colorremedies.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
References: <c2a0606a-6e76-816b-e76f-165a1c1aac91@service4.ru>
	<49f2e53b-6f89-d4dd-4bee-290a26a8e208@izyk.ru>
	<20201127162203.ckpi3y2bhoffdwef@chatter.i7.local>
	<CAJCQCtRN0BnmB4v-fatfgzZ1LYAMEEK6HWHeFJFoqRnYuyesKQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJCQCtRN0BnmB4v-fatfgzZ1LYAMEEK6HWHeFJFoqRnYuyesKQ@mail.gmail.com>
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] listserver dropping posts? was: Search in the list
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 29, 2020 at 02:34:48PM -0700, Chris Murphy wrote:
> > I realized that we don't have it on lore yet, so I imported mailman
> > archives and it should now be available here:
> > https://lore.kernel.org/linux-lvm/
> 
> Thanks for that. However, I'm now confused.
> 
> I went to that URL and I see a thread I started at the top
> "[linux-lvm] swap on thin-provisioning"
> But I don't see that thread at:
> https://www.redhat.com/archives/lvm-devel/2020-November/thread.html
> 
> Also, I have a reply on that thread from Danti Gionatan. That too is
> not listed at redhat.com but is on lore. And it also came to me by
> email directly from him, not from the list server.
> 
> Something seems wrong.

lore.kernel.org is just a regular subscriber to the list, so you'll need 
to send these questions to whoever administers mailman at Red Hat.

-K

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

