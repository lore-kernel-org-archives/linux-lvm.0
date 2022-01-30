Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63A5C433EF
	for <linux-lvm@archiver.kernel.org>; Sun, 30 Jan 2022 10:53:27 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-Bf41ZyjjOxawEa-p0HH7dw-1; Sun, 30 Jan 2022 05:53:25 -0500
X-MC-Unique: Bf41ZyjjOxawEa-p0HH7dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 546488144E7;
	Sun, 30 Jan 2022 10:53:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8076778C3E;
	Sun, 30 Jan 2022 10:53:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77F734BB7C;
	Sun, 30 Jan 2022 10:53:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20UAqvTg028344 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 30 Jan 2022 05:52:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 479CC40D1B9F; Sun, 30 Jan 2022 10:52:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43B0440D1B9D
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 10:52:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29D2485A5A8
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 10:52:57 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
	[209.85.218.44]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-221-ID4EXg9QNEKDaN1CrswSgw-1; Sun, 30 Jan 2022 05:52:55 -0500
X-MC-Unique: ID4EXg9QNEKDaN1CrswSgw-1
Received: by mail-ej1-f44.google.com with SMTP id m4so33499691ejb.9
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 02:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=x0cls6EwS5O7jls+5S2nIvxA4s37yXx5imRj+L4m3Ck=;
	b=qIEPZMhyTwEYdoxh+K3GxfXjaPtDndB5wdaX5dipAlkjIGEne68UHuqtpmE4+QIl/Q
	lkWFynwMwNqS3b2bhVRFnlE63mIijru/otERm6LWTR7kY2eMdPx63rei0yeI6eKixeXW
	9tToRhsTPawyvoqqgsoE2gpjYISazApYUmw9adTEbPEcrWgEmJ2NDNZkT0iuT4rKWG6i
	1CKGUcJNzhDiroQEGm+yL6NJL9IkLyMVUyRW9mBzTXYI4tAT0KPrj5AVCvAHOfIdjgmq
	RnrxUe+3lPvAAZ3QHsJ0fvaKwRpmGICO5wnLh38KdVwPQX2TopJqqYaxLBec9IT/95Hu
	uQiA==
X-Gm-Message-State: AOAM531qF9Qj7dBKS989Z9z7dOTw2E6FR0aFpUklp/2eRAj2H2/QMDzT
	2jkOCOeHoy8g4coBSoKmf7zY3YfFDzElFQ==
X-Google-Smtp-Source: ABdhPJzAYztxThrDmmZHc+3YSIx34XrlC0dAjQn5Thn1kDAakQNkkhAVI17zS1f53TGojuUQZFzeCg==
X-Received: by 2002:a17:907:7da4:: with SMTP id
	oz36mr1414436ejc.416.1643539973853; 
	Sun, 30 Jan 2022 02:52:53 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id
	e15sm15895510edy.46.2022.01.30.02.52.53
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 30 Jan 2022 02:52:53 -0800 (PST)
Message-ID: <4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
Date: Sun, 30 Jan 2022 11:52:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.4.0
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <YfXcxHenCZw4+EFX@itl-email>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 30. 01. 22 v 1:32 Demi Marie Obenour napsal(a):
> On Sat, Jan 29, 2022 at 10:32:52PM +0100, Zdenek Kabelac wrote:
>> Dne 29. 01. 22 v 21:34 Demi Marie Obenour napsal(a):
>>> How much slower are operations on an LVM2 thin pool compared to manually
>>> managing a dm-thin target via ioctls?  I am mostly concerned about
>>> volume snapshot, creation, and destruction.  Data integrity is very
>>> important, so taking shortcuts that risk data loss is out of the
>>> question.  However, the application may have some additional information
>>> that LVM2 does not have.  For instance, it may know that the volume that
>>> it is snapshotting is not in use, or that a certain volume it is
>>> creating will never be used after power-off.
>>>
> 
>> So brave developers may always write their own management tools for their
>> constrained environment requirements that will by significantly faster in
>> terms of how many thins you could create per minute (btw you will need to
>> also consider dropping usage of udev on such system)
> 
> What kind of constraints are you referring to?  Is it possible and safe
> to have udev running, but told to ignore the thins in question?

Lvm2 is oriented more towards managing set of different disks,
where user is adding/removing/replacing them.  So it's more about 
recoverability, good support for manual repair  (ascii metadata),
tracking history of changes,  backward compatibility, support
of conversion to different volume types (i.e. caching of thins, pvmove...)
Support for no/udev & no/systemd, clusters and nearly every linux distro 
available... So there is a lot - and this all adds quite complexity.

So once you scratch all this - and you say you only care about single disc 
then you are able to use more efficient metadata formats which you could even 
keep permanently in memory during the lifetime - this all adds great performance.

But it all depends how you could constrain your environment.

It's worth to mention there is lvm2 support for 'external' 'thin volume' 
creators - so lvm2 only maintains 'thin-pool' data & metadata LV - but thin 
volume creation, activation, deactivation of thins is left to external tool.
This has been used by docker for a while - later on they switched to overlayFs 
I believe..

> 
>> It's worth to mention - the more bullet-proof you will want to make your
>> project - the more closer to the extra processing made by lvm2 you will get.
> 
> Why is this?  How does lvm2 compare to stratis, for example?

Stratis is yet another volume manager written in Rust combined with XFS for 
easier user experience. That's all I'd probably say about it...

>> However before you will step into these waters - you should probably
>> evaluate whether thin-pool actually meet your needs if you have that high
>> expectation for number of supported volumes - so you will not end up with
>> hyper fast snapshot creation while the actual usage then is not meeting your
>> needs...
> 
> What needs are you thinking of specifically?  Qubes OS needs block
> devices, so filesystem-backed storage would require the use of loop
> devices unless I use ZFS zvols.  Do you have any specific
> recommendations?

As long as you live in the world without crashes, buggy kernels, apps  and 
failing hard drives everything looks very simple.
And every development costs quite some time & money.

Since you mentioned ZFS - you might want focus on using 'ZFS-only' solution.
Combining  ZFS or Btrfs with lvm2 is always going to be a painful way as those 
filesystems have their own volume management.

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

