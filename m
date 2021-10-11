Return-Path: <SRS0=PlQC=O7=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C54DC433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 11 Oct 2021 16:30:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E686560EE2
	for <linux-lvm@archiver.kernel.org>; Mon, 11 Oct 2021 16:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E686560EE2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633969834;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yesqGZ6Waner6TOYa530CZf7Bk8PxMVAeawiYE4zKys=;
	b=ZdIQDgbOYlYnQ32H9CYeAeah5lieVa/DjVCwHGrHzxR4FXWIexlL7/Vi3LLz1U8Vqd9P1d
	wFJ7o+oR0DIupLK8Id42BFwY316ZS00NPbz+J1TO/XT2uElMR2oxXTQBF8wHeL7Cc0SLF2
	/YEBKvN5L4BX5yJ/rDMdWWPUJQy+rTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-EuSvEO0dMXioOmOe834Hsg-1; Mon, 11 Oct 2021 12:30:30 -0400
X-MC-Unique: EuSvEO0dMXioOmOe834Hsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1DDD84A5E1;
	Mon, 11 Oct 2021 16:30:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93299100EBBE;
	Mon, 11 Oct 2021 16:30:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B61441806D00;
	Mon, 11 Oct 2021 16:30:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BGU5dw013806 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 12:30:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2203C4047279; Mon, 11 Oct 2021 16:30:05 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D770404727C
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2021 16:30:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A763318A01B0
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2021 16:30:04 +0000 (UTC)
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
	[209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-328-TGWM1G51OM2JFmF9ldMyOA-1; Mon, 11 Oct 2021 12:30:03 -0400
X-MC-Unique: TGWM1G51OM2JFmF9ldMyOA-1
Received: by mail-oo1-f72.google.com with SMTP id
	b3-20020a4a9bc3000000b002b66bb6c794so10329095ook.20
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2021 09:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=oTsPkCc0j0TEKJKnlS+cZpUxZMF2jbZ0CLHAJTXAii4=;
	b=JsCroKOXAgSZN3mSrk0kJWc6ZXgyOaalnufvJZHaQjgmqR2cUa54a3bGqfsjiKhafX
	myHKkIkt7cfCRD4WxUnHjj9Pc7yPTb4AdAybXqb1ZObbALHKH6JKoHWahza311+eK0ac
	KotIRUVrBHmqU1TiilasTUHSoUPVc5/5VmmOgVymbp8aH46biHAfSXk5EWpoAhGs8xvO
	7jpfO1vUoQSnxvp7xNEZ3uZzYcc5pu8OfBQN9n9nVsntQq8IofarRHDT0Suiuf+itlgy
	ysLNEv/ri7S5ocfuAuOPjziUVpBWEei9c8gOjKxZivk+lBNfNaF6QYVmTb0Orty6FzR9
	mHEg==
X-Gm-Message-State: AOAM5326dWpozBsQEsLPCbZurzs/aiErtFCWj0c2CPyONEsPl5jH+s8E
	rkcDuoFitvnIBK6nQNcjZ1X80g5dZYo3txJSZkCUERQ0gxB8qeKMz4ybvRFUTC1VxWSFmSfuqY6
	ajOG61/Nt6o8zJxHHoskJEpatCClfxoc=
X-Received: by 2002:aca:c693:: with SMTP id
	w141mr18592517oif.109.1633969802080; 
	Mon, 11 Oct 2021 09:30:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzF2cnAeZKruLfjmUCtq6ksL9hwXFHUp/MwHF6i8vkOjWQO2SV0sVPXEcknQqefDwM6LUJmkB7YMZcau2hiU4=
X-Received: by 2002:aca:c693:: with SMTP id
	w141mr18592498oif.109.1633969801869; 
	Mon, 11 Oct 2021 09:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAPWGHt1MCzPbEHrF-5SRDavHqOfhMSqhkfAUQDMYT=HJ7TRfuQ@mail.gmail.com>
	<CAPWGHt3bB4QiM6RZkC_58X8jev+mVwpkuCY==45Gr4j5jOYHBA@mail.gmail.com>
	<b9e10482-e508-63fa-5518-94cccc007e81@redhat.com>
	<CALjSBEsb9gSMt7yNHNdYyFgG-Z_Yd3d0X-er24gvCUF1ZjrWog@mail.gmail.com>
	<CAPWGHt11L-ZGtLbZ08UVga7WP5fq6pY7gUS9HYtnVWvB11zj7Q@mail.gmail.com>
	<CALjSBEt0TdOr4jL4JhCKrRCfO+LiT_0tNaQYfQ9mLgQNjhq8Aw@mail.gmail.com>
	<CAPWGHt3vS8L7y_t_QFjmSoM7CTerEOeQ50fevfAOvTU0X3cnZw@mail.gmail.com>
In-Reply-To: <CAPWGHt3vS8L7y_t_QFjmSoM7CTerEOeQ50fevfAOvTU0X3cnZw@mail.gmail.com>
From: Ming Hung Tsai <mtsai@redhat.com>
Date: Tue, 12 Oct 2021 00:29:50 +0800
Message-ID: <CALjSBEuNvVdnFuRATStE8jLMgq2c=Tt2e-qn8QQ-WTfrmXPrxw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] LVM cachepool inconsistency after power event
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 11, 2021 at 8:18 PM Krzysztof Chojnowski
<frirajder@gmail.com> wrote:
> Unfortunately, I don't have clear reproducing steps. As you've guessed
> correctly - the power event has happened shortly (the same day) after
> I created the cached volume. IIRC the volume hasn't even been used at
> all so the cache would be empty.

So the cache is clean without any data written? I thought that there
was dirty data since you mentioned you've copied data from _corig in
the first post, so now I just want to confirm my understanding.


Ming-Hung Tsai

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

