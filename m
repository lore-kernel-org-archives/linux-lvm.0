Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECFDC433EF
	for <linux-lvm@archiver.kernel.org>; Wed,  2 Feb 2022 10:05:12 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-cUeizUs5NN6YLYgp73tMLQ-1; Wed, 02 Feb 2022 05:05:07 -0500
X-MC-Unique: cUeizUs5NN6YLYgp73tMLQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A12C0100C661;
	Wed,  2 Feb 2022 10:05:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54C1662D72;
	Wed,  2 Feb 2022 10:04:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 642A64BB7C;
	Wed,  2 Feb 2022 10:04:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 212A4gr9003070 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 2 Feb 2022 05:04:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0646D1457F14; Wed,  2 Feb 2022 10:04:42 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 022291457F13
	for <linux-lvm@redhat.com>; Wed,  2 Feb 2022 10:04:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDD451C05B02
	for <linux-lvm@redhat.com>; Wed,  2 Feb 2022 10:04:41 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
	[209.85.218.50]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-92-Lyc01Tx_PeeH312yi6qAJQ-1; Wed, 02 Feb 2022 05:04:40 -0500
X-MC-Unique: Lyc01Tx_PeeH312yi6qAJQ-1
Received: by mail-ej1-f50.google.com with SMTP id p15so63686587ejc.7
	for <linux-lvm@redhat.com>; Wed, 02 Feb 2022 02:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=E64O/LIPpjj1BkaouOJpbuWg9mkOkgDnrS+R/kPD9vM=;
	b=X2U7IAiCHiiHMGsXuTkAWMgZP32WQYSKZ9k16CPIy9lFlv5faUQYHtEOnZc9bNnNfa
	OgW4dQ8lwYXekJfpZR+V+8dPFnLi2o2n1b1fdpML+8Y507s9SIYj+pPnTVTWr22qhxKS
	jDP78cOechtT1duymj4Qhqd72lm2/4XbzOsx4OxOyFuA28tF0CFZpYIwJBwiKOu7uGJ3
	q25DMrBVhhLgmcNxb1wvrEbCHp0M+RqAE7HO5TLDIGkA93xQVI1BfKYkh3IPNRFCV+c3
	KDLoqF7h7cAgYCEVoyyDfVS24FI2lfcjjkvIvJO8TBNESZzyfnSsEfiBjGCghigtE4Nd
	7//w==
X-Gm-Message-State: AOAM533GNjq1ct5FznWzHsnjL1N0+kuDIv/k6bUk+cSgPz7XqcyTP4fJ
	elzrUIIx3+M2LqzGfJZZFD0OilyCucl1ag==
X-Google-Smtp-Source: ABdhPJy1w0SvtKfz04ayTeD3Cyj/o7VbtIrEuL+XMytPeS0olsNLedHfqeatAtSv6q2QyipM2dnjVA==
X-Received: by 2002:a17:906:6d82:: with SMTP id
	h2mr24434996ejt.487.1643796278955; 
	Wed, 02 Feb 2022 02:04:38 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id
	f11sm20401043edv.29.2022.02.02.02.04.38
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 02 Feb 2022 02:04:38 -0800 (PST)
Message-ID: <3adf6eb1-94ac-dd91-e3e6-f0d44cd36b89@gmail.com>
Date: Wed, 2 Feb 2022 11:04:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.4.0
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
	<YfbApm+9ac6iBbbg@itl-email>
	<849ab633-ec3d-a0a5-38bf-72b87bbba2c5@gmail.com>
	<Yfnn+BcjuukqjfVO@itl-email>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <Yfnn+BcjuukqjfVO@itl-email>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 02. 02. 22 v 3:09 Demi Marie Obenour napsal(a):
> On Sun, Jan 30, 2022 at 06:43:13PM +0100, Zdenek Kabelac wrote:
>> Dne 30. 01. 22 v 17:45 Demi Marie Obenour napsal(a):
>>> On Sun, Jan 30, 2022 at 11:52:52AM +0100, Zdenek Kabelac wrote:
>>>> Dne 30. 01. 22 v 1:32 Demi Marie Obenour napsal(a):
>>>>> On Sat, Jan 29, 2022 at 10:32:52PM +0100, Zdenek Kabelac wrote:
>>>>>> Dne 29. 01. 22 v 21:34 Demi Marie Obenour napsal(a):
>> My biased advice would be to stay with lvm2. There is lot of work, many
>> things are not well documented and getting everything running correctly will
>> take a lot of effort  (Docker in fact did not managed to do it well and was
>> incapable to provide any recoverability)
> 
> What did Docker do wrong?  Would it be possible for a future version of
> lvm2 to be able to automatically recover from off-by-one thin pool
> transaction IDs?

Ensuring all steps in state-machine are always correct is not exactly simple.
But since I've not heard about off-by-one problem for a long while -  I 
believe we've managed to close all the holes and bugs in double-commit system
and metadata handling by thin-pool and lvm2.... (for recent lvm2 & kernel)

>> It's difficult - if you would be distributing lvm2 with exact kernel version
>> & udev & systemd with a single linux distro - it reduces huge set of
>> troubles...
> 
> Qubes OS comes close to this in practice.  systemd and udev versions are
> known and fixed, and Qubes OS ships its own kernels.

Systemd/udev evolves - so fixed today doesn't really mean same version will be 
there tomorrow.  And unfortunately systemd is known to introduce  backward 
incompatible changes from time to time...

>> I'm not familiar with QubesOS - but in many cases in real-life world we
>> can't push to our users latest&greatest - so we need to live with bugs and
>> add workarounds...
> 
> Qubes OS is more than capable of shipping fixes for kernel bugs.  Is
> that what you are referring to?
not going to starting discussing this topic ;)

>> Chain filesystem->block_layer->filesystem->block_layer is something you most
>> likely do not want to use for any well performing solution...
>> But it's ok for testing...
> 
> How much of this is due to the slow loop driver?  How much of it could
> be mitigated if btrfs supported an equivalent of zvols?

Here you are missing the core of problem from kernel POV aka
how the memory allocation is working and what are the approximation in kernel 
with buffer handling and so on.
So whoever is using  'loop' devices in production systems in the way described 
above has never really tested any corner case logic....

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

