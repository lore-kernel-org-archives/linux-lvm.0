Return-Path: <SRS0=qNHw=FD=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF64C3E8C5
	for <linux-lvm@archiver.kernel.org>; Sun, 29 Nov 2020 21:35:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C36F2078D
	for <linux-lvm@archiver.kernel.org>; Sun, 29 Nov 2020 21:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C36F2078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=colorremedies.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-cdgaM4_0N6WdBJ174UhYqQ-1; Sun, 29 Nov 2020 16:35:40 -0500
X-MC-Unique: cdgaM4_0N6WdBJ174UhYqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAAB910051CB;
	Sun, 29 Nov 2020 21:35:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED071271B1;
	Sun, 29 Nov 2020 21:35:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7269C1809C9F;
	Sun, 29 Nov 2020 21:35:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ATLZBqA021673 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 29 Nov 2020 16:35:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E34E220296A6; Sun, 29 Nov 2020 21:35:10 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE5B220296A5
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2020 21:35:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88ED810580C0
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2020 21:35:08 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-391-m0YWlYujNkS_CrFNNLOJEQ-1; Sun, 29 Nov 2020 16:35:05 -0500
X-MC-Unique: m0YWlYujNkS_CrFNNLOJEQ-1
Received: by mail-wr1-f43.google.com with SMTP id 64so12775931wra.11
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2020 13:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lW002gJyGqqieI/ce5s0hcknuVMvMIb+aIC2Oo68M3k=;
	b=ltQ2EDkUmbyDQkkH4ShNnuCxDpUjBOcQj6QRaYWIbXbm0mLD3Q1cJx3StMBfHvym0E
	3ncfZ0A9sJzyyxYSzrUXKdLtEM62YJ/4NbYZIAlHKnbr49LxjmQYnEx2MapGTQf0uKJ1
	yUDAvvAXnBB8W6f+/luD7MXrq216p3ZoO5Xu4QwX5ZYFB8xh+3zuKqIKvFxdqgVvYc3q
	ruGHBiX+0geq/imHsOKV9wsdFOThgy9hC7BMIi4jRdacW1yPXMS0Y9Bd6ZpjGEoVcyvZ
	SK63H5B+YE3Ff6ECRjLg1K1Xgrcm1ptEVdlE9uIRTjXhI6+IKroTWXhmtLlpl2N9bbP7
	UqYQ==
X-Gm-Message-State: AOAM530Gqwj/QVTPKOnkP3Z5JyS3bKnVwM3tsPcA8LZtT1aeoU1AgbZh
	IoEO5TmmvVcPcu9Ws9B38XYmpHUv4tqbzSJ0rAyX9CV4vqi0Ww==
X-Google-Smtp-Source: ABdhPJze7V3D/FE8J+jDFeX+8onU5VAJyNkRgBkN7weKd+uVhhACDbkiGzSOdbDTGeWzN1N9qi1t31100bMBXh+N44k=
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr24326678wrw.42.1606685704258; 
	Sun, 29 Nov 2020 13:35:04 -0800 (PST)
MIME-Version: 1.0
References: <c2a0606a-6e76-816b-e76f-165a1c1aac91@service4.ru>
	<49f2e53b-6f89-d4dd-4bee-290a26a8e208@izyk.ru>
	<20201127162203.ckpi3y2bhoffdwef@chatter.i7.local>
In-Reply-To: <20201127162203.ckpi3y2bhoffdwef@chatter.i7.local>
From: Chris Murphy <lists@colorremedies.com>
Date: Sun, 29 Nov 2020 14:34:48 -0700
Message-ID: <CAJCQCtRN0BnmB4v-fatfgzZ1LYAMEEK6HWHeFJFoqRnYuyesKQ@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
Cc: konstantin@linuxfoundation.org
Subject: [linux-lvm] listserver dropping posts? was: Search in the list
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 27, 2020 at 9:22 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Fri, Nov 27, 2020 at 12:40:40PM +0300, Ilia Zykov wrote:
> > Hello.
> > Please, tell me if there is a way to search the archive of this list?
> > https://www.redhat.com/archives/linux-lvm/index.html
>
> I realized that we don't have it on lore yet, so I imported mailman
> archives and it should now be available here:
> https://lore.kernel.org/linux-lvm/

Thanks for that. However, I'm now confused.

I went to that URL and I see a thread I started at the top
"[linux-lvm] swap on thin-provisioning"
But I don't see that thread at:
https://www.redhat.com/archives/lvm-devel/2020-November/thread.html

Also, I have a reply on that thread from Danti Gionatan. That too is
not listed at redhat.com but is on lore. And it also came to me by
email directly from him, not from the list server.

Something seems wrong.


--
Chris Murphy

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

