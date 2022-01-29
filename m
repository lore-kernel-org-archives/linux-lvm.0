Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9FFC433EF
	for <linux-lvm@archiver.kernel.org>; Sat, 29 Jan 2022 21:33:31 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-sH8ogKExPTmTE2YiixDUTw-1; Sat, 29 Jan 2022 16:33:28 -0500
X-MC-Unique: sH8ogKExPTmTE2YiixDUTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4091D1006AA6;
	Sat, 29 Jan 2022 21:33:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10D046AB92;
	Sat, 29 Jan 2022 21:33:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A96DD4BB7C;
	Sat, 29 Jan 2022 21:33:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20TLX1HX010363 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 29 Jan 2022 16:33:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 59C2F2026D65; Sat, 29 Jan 2022 21:33:01 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 551D42026D4D
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 21:32:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08D141C05AA9
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 21:32:58 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-84-VeH4e6P-MVOc3recCuH6_g-1; Sat, 29 Jan 2022 16:32:55 -0500
X-MC-Unique: VeH4e6P-MVOc3recCuH6_g-1
Received: by mail-ed1-f53.google.com with SMTP id p7so18037947edc.12
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 13:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:from:in-reply-to
	:content-transfer-encoding;
	bh=UwoQOeiEghEeq0BeFDnuGnPNBdJuuCy9UH7T2a7uje8=;
	b=SSmBKlmS3ZtUwQl3/Inls5qN1IRWu6pKEfoFBC2CNls7N33g6GiV/QJmrLXyR7GUAd
	Fli4Is6V7r3GcWztf1v+YXAKyhyMAXby2fp/DEyOk5qbVjrgaKegqW7Mfv1wvqQwIBXD
	U2eJuTo6Iusc0HmOThrlT8LiqdyE0qHg++PXgEEwCGQJ7kQb1/M/DUeAZUJWHkKMmend
	Um+qX8h+PAuGNlidu2X05ToJW/i3PMHmKeSNrfWVRbNh3qKprpvYA5laQ3jGEKkChTh9
	jZ/WZfL3BWcSYwYL7seGoZk2GyYbqsUc6jPheC2bHhKyzarPptuAqd2wcndzdCkdlmiv
	G58g==
X-Gm-Message-State: AOAM530dpwOk0qa2Di2w0+z/xK/VdBnZZf0avF1CjM3wYti+h5qTbfZM
	FheXN70J2HhmlzUm/RJnFTyLcC/UFfuOjw==
X-Google-Smtp-Source: ABdhPJwaW9b4CWUeyGF9aKsAv+0NBjpp6Z495wjwSjeLMhQCb7ms2ggMaAv5UyKF/HB5FTq+lntpZA==
X-Received: by 2002:a05:6402:3c3:: with SMTP id
	t3mr14143215edw.336.1643491974248; 
	Sat, 29 Jan 2022 13:32:54 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id
	cb5sm15009392edb.82.2022.01.29.13.32.53
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 29 Jan 2022 13:32:53 -0800 (PST)
Message-ID: <6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
Date: Sat, 29 Jan 2022 22:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.4.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YfWkwtOTFYxDyYrW@itl-email>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <YfWkwtOTFYxDyYrW@itl-email>
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
Subject: Re: [linux-lvm] LVM performance vs direct dm-thin
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 29. 01. 22 v 21:34 Demi Marie Obenour napsal(a):
> How much slower are operations on an LVM2 thin pool compared to manually
> managing a dm-thin target via ioctls?  I am mostly concerned about
> volume snapshot, creation, and destruction.  Data integrity is very
> important, so taking shortcuts that risk data loss is out of the
> question.  However, the application may have some additional information
> that LVM2 does not have.  For instance, it may know that the volume that
> it is snapshotting is not in use, or that a certain volume it is
> creating will never be used after power-off.
> 

Hi

Short answer: it depends ;)

Longer story:
If you want to create few thins per hour - than it doesn't really matter.
If you want to create few thins in a second - than the cost of lvm2 management 
is very high  - as lvm2 does far more work then just sending a simple ioctl 
(as it's called logical volume management for a reason)

So brave developers may always write their own management tools for their 
constrained environment requirements that will by significantly faster in 
terms of how many thins you could create per minute (btw you will need to also 
consider dropping usage of udev on such system)

It's worth to mention - the more bullet-proof you will want to make your 
project - the more closer to the extra processing made by lvm2 you will get.

However before you will step into these waters - you should probably evaluate 
whether thin-pool actually meet your needs if you have that high expectation 
for number of supported volumes - so you will not end up with hyper fast 
snapshot creation while the actual usage then is not meeting your needs...

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

