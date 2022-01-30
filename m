Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C66C4332F
	for <linux-lvm@archiver.kernel.org>; Sun, 30 Jan 2022 18:43:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-Po0C0BMPN4O4L-bkpdgtCg-1; Sun, 30 Jan 2022 13:43:06 -0500
X-MC-Unique: Po0C0BMPN4O4L-bkpdgtCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FEAC8070F0;
	Sun, 30 Jan 2022 18:43:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 320597E2EA;
	Sun, 30 Jan 2022 18:42:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E98CA4BB7C;
	Sun, 30 Jan 2022 18:42:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20UIgktB024657 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 30 Jan 2022 13:42:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D50E140CFD10; Sun, 30 Jan 2022 18:42:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0D3540CFD08
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 18:42:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B812E380450C
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 18:42:46 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-516-2_4SN5IZMVSVHNQ-dC-d2Q-1; Sun, 30 Jan 2022 13:42:44 -0500
X-MC-Unique: 2_4SN5IZMVSVHNQ-dC-d2Q-1
Received: by mail-ed1-f48.google.com with SMTP id b13so22651246edn.0
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 10:42:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=F6o/p6A9Y9U0RZxLitv7tx02t+nX5yln+bD9o9/tCqQ=;
	b=paF7ZgIwTUHvlZ5suWqLBIl+pb7ecoObwblUCSv2DdibJI7ZBuJV6z8GHMzpFo5FWb
	2uy7dAGKgetAWKuG9v7JsJjcX+gN8IlWQQIT9faoG/mL3xA8YeuvWFM1ZVnSQEGEwB5V
	FAS5bWEAtoxCO2OjJ9+/xkA2TaMrmf8xZZy8xT7BuZhABtFeLYYGI4kPdQDXbqDcmEW/
	7KtS7UGZYaO09M4gVBwOmCC/logspapSaL5NdPLAH7N8zZAcW/fVKaHKdS+W9zGuYIit
	zEZEETEzX6LQ7OIBSFGgmjSmWUbu3VmgHavUO0ihFZlRDrudCa3KaW08qvUAMNXi1G5J
	HcPQ==
X-Gm-Message-State: AOAM533cWXwRpBg1pVeSbfzcNAGWyBgpwCxzUMkd17eJFmYmrZ2IlILg
	zIguBLlU1yHNe4WmxfhC4ZUag1QERL8DTA==
X-Google-Smtp-Source: ABdhPJyhNBuyO8R8UMO2AB2Yv0828sQCFPKZNTnKCXrbpSrFyeU+YqW97k+brNl6NImHv5qtgGf+VA==
X-Received: by 2002:a05:6402:354d:: with SMTP id
	f13mr17675058edd.289.1643568163431; 
	Sun, 30 Jan 2022 10:42:43 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id
	h1sm16201121edz.64.2022.01.30.10.42.42
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 30 Jan 2022 10:42:43 -0800 (PST)
Message-ID: <b2b01159-638f-f09a-a3c8-3c9c9826ee8e@gmail.com>
Date: Sun, 30 Jan 2022 19:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.4.0
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YfWM+8w1TonBXNsP@itl-email>
	<9156ffae-650d-198d-5c7a-32f84dbcb332@gmail.com>
	<YfWfAAGK8L1iy7LU@itl-email>
	<83468eda-6697-5f15-d949-e23611cded84@gmail.com>
	<YfXoBour6CGZt9NH@itl-email>
	<b66e90ec-28ed-3962-ac99-69f8e1b01936@gmail.com>
	<YfbLMQ7a6D479vz6@itl-email>
	<57a77ded-703d-d8a6-a919-2a68ba4cf97f@gmail.com>
	<YfbSkfdz2cAV4Iaz@itl-email>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <YfbSkfdz2cAV4Iaz@itl-email>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Running thin_trim before activating a thin pool
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

Dne 30. 01. 22 v 19:01 Demi Marie Obenour napsal(a):
> On Sun, Jan 30, 2022 at 06:56:43PM +0100, Zdenek Kabelac wrote:
>> Dne 30. 01. 22 v 18:30 Demi Marie Obenour napsal(a):
>>> On Sun, Jan 30, 2022 at 12:18:32PM +0100, Zdenek Kabelac wrote:
>> Then are always landing in upstream kernel once they are all validated &
>> tested (recent kernel already has many speed enhancements).
> 
> Thanks!  Which mailing list should I be watching?

lkml

>> You could easily run in parallel individual blkdiscards for your thin LVs....
>> For most modern drives thought it's somewhat waste of time...
>>
>> Those trimming tools should be used when they are solving some real
>> problems, running them just for fun is just energy & performance waste....
> 
> My understanding (which could be wrong) is that periodic trim is
> necessary for SSDs.

This was useful for archaic SSDs. Modern SSD/NVMe drives are much smarter...

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

