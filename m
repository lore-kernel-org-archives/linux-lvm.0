Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BE2C433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 22 Feb 2022 10:05:35 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-nJTu9AWXNDqFn8JzxQZMeA-1; Tue, 22 Feb 2022 05:05:31 -0500
X-MC-Unique: nJTu9AWXNDqFn8JzxQZMeA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B95C1091DA0;
	Tue, 22 Feb 2022 10:05:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 653A710595BF;
	Tue, 22 Feb 2022 10:05:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A1BB1809C98;
	Tue, 22 Feb 2022 10:05:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21MA5DE4015256 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 22 Feb 2022 05:05:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CA92F5361E3; Tue, 22 Feb 2022 10:05:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C65115361C4
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2022 10:05:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB05285A5BC
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2022 10:05:13 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-346-Jvxc4IacMmm1jlyuQ4Z4YQ-1; Tue, 22 Feb 2022 05:05:11 -0500
X-MC-Unique: Jvxc4IacMmm1jlyuQ4Z4YQ-1
Received: by mail-ed1-f43.google.com with SMTP id w3so35614196edu.8
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2022 02:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:from:in-reply-to
	:content-transfer-encoding;
	bh=+YFgg0bEwP/flNQydPcbSwm8JEj3luiuFplFY0Utalc=;
	b=mlz0oQO5uXl4DayQauRM/DtXfnWKTlvSVdU8KNKSa2YrpRXQvlS6ipTkoinzFvnnmK
	gSmSMWASLjmFWuYFOxp80QY972C39QdaxusCNcZwnB6nH3Bi4WV266vaeBPZKWKeDZyd
	8iSJ2SL6ML6CZaEh/t94h6LD0/vd+uNsV8MOr2KFGHAY6oOEuQg2KvO5d05ZaBk0HJvt
	de102BeeH5S2/M/GLZ0tqb8OefUzVNY/xkYasN+7QrKwDObK/2IOfo9tVJjj5N2VlsXc
	FW9gdea6n1odRwQQjtMuc28EfqgLrqLY6NDsR2txG0OKwGh1OhqOtDo2JjeIr1f8U7bZ
	oWHw==
X-Gm-Message-State: AOAM532maivz7sLNZKdfx2SySe5KRcfbnzvP0fJGliEiexZP4rawxg+1
	vCSYc0/xUrrxlSZSAl+9b/n4mXUvycEBBA==
X-Google-Smtp-Source: ABdhPJx2/8wBDmEzaQNX3zsnqrrzbmlTwpg/Rkk/O65JUpvKZ8f9V35f+RbrlWV7fGZnyP1IcuqSZw==
X-Received: by 2002:a05:6402:1756:b0:410:be91:cd5b with SMTP id
	v22-20020a056402175600b00410be91cd5bmr25630134edx.375.1645524310332;
	Tue, 22 Feb 2022 02:05:10 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id p14sm41206ejj.50.2022.02.22.02.05.09
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 22 Feb 2022 02:05:09 -0800 (PST)
Message-ID: <7034cec6-0b44-b34e-8e91-3f0ec3e50d9c@gmail.com>
Date: Tue, 22 Feb 2022 11:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.4.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Gk Gk <ygk.kmr@gmail.com>
References: <CAJreVFzLbOzu2Qx=0kecE+y0TU7jdvxKXXRwC3J4EAFYOYJkZA@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAJreVFzLbOzu2Qx=0kecE+y0TU7jdvxKXXRwC3J4EAFYOYJkZA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Need information
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
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 21. 02. 22 v 12:00 Gk Gk napsal(a):
> Hi,
> 
> I work on cloud platforms and linux. I need some guidance with an issue 
> observed with LVM.
> 
> How to forcefully kill a running lvm command like lvcreate ? I tried using 
> kill -9 but it is not killing it. Only a reboot seems to does the trick. How 
> to forcefully kill the lvcreate process or for that matter any running lvm 
> commands ?
> 
> Also how to check the progress of an lvm command like lvcreate or lvremove ?

Hi

1. lvm2 should not freeze - it would be some horrible bug.

2. You can't kill any userspace app which is blocked in an uninterruptible 
kernel function - kill always wait till it gets to signal handler  (i.e. you 
are opening&reading suspended device might be one such operation)

3. You need to tell us more about what you are doing - as without this there 
is no way to give meaningful help.


Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

