Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40545C433FE
	for <linux-lvm@archiver.kernel.org>; Sat, 29 Jan 2022 21:40:57 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-4W4qClSHPZW4eB3SRLo8eA-1; Sat, 29 Jan 2022 16:40:52 -0500
X-MC-Unique: 4W4qClSHPZW4eB3SRLo8eA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97A091083F60;
	Sat, 29 Jan 2022 21:40:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD81C56F79;
	Sat, 29 Jan 2022 21:40:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D15161809CB8;
	Sat, 29 Jan 2022 21:40:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20TLedqg010675 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 29 Jan 2022 16:40:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 08555401E4C; Sat, 29 Jan 2022 21:40:39 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04104401E53
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 21:40:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDA16800882
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 21:40:38 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-393-8dwI7hFgPQ2q5lEp8SLhSw-1; Sat, 29 Jan 2022 16:40:36 -0500
X-MC-Unique: 8dwI7hFgPQ2q5lEp8SLhSw-1
Received: by mail-ed1-f45.google.com with SMTP id j2so18003024edj.8
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 13:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:from:in-reply-to
	:content-transfer-encoding;
	bh=4GDcjJI68ls3lG1b2nLqPc3VvlqOrp1cav6PVYlx4Ec=;
	b=LXKEs97dpgfQ4e9O/tE3MOGS15f1YFB4d7YAKh8dxsYlOZ62JLywQHgxaH9qdgr0RX
	oTdhDRTsQ3dsTD+yEGcM0b2C9Xq3rY+vTYjudHHkGvkxrOqWe2geMfrPBbvE3i04p9kI
	Tz7/HyP8VrhM3/uU7Kbdndzg0p3x+2p9rQMsuJBD5snuN7VBnfwjA49/BxcAE6CK9Bjh
	uBUDq0Wnz0GYlN6ejSb7pRXjr82iXh9iqV0jTbtCzZOanRtWRn0lmlc95ltNqTQSYuGX
	VL1hTOEvx0/gcLoREu9x5IZUPRTs0UYIx3Kf8yz5lOiAlTwfMQRcqgmoNM+LQ1OaZ7tx
	L6Qg==
X-Gm-Message-State: AOAM5327Rfl1n8eriAxUZYRQdea9UAEPE20/SUW8cjssu7EEg5Me5Mls
	pW+1ETQAwfX6aDeUyZmSXHmDvJcpsgZgxA==
X-Google-Smtp-Source: ABdhPJwppsUgFn1o4zNUOn0B/0H6NP/3k5oSmeSzhLamquJ8dDt+x2nMhJq/Bd/tMTpo4lslyfSCxQ==
X-Received: by 2002:aa7:cb17:: with SMTP id s23mr13965588edt.282.1643492435161;
	Sat, 29 Jan 2022 13:40:35 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id
	r10sm11654061ejy.148.2022.01.29.13.40.34
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 29 Jan 2022 13:40:34 -0800 (PST)
Message-ID: <83468eda-6697-5f15-d949-e23611cded84@gmail.com>
Date: Sat, 29 Jan 2022 22:40:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.4.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YfWM+8w1TonBXNsP@itl-email>
	<9156ffae-650d-198d-5c7a-32f84dbcb332@gmail.com>
	<YfWfAAGK8L1iy7LU@itl-email>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <YfWfAAGK8L1iy7LU@itl-email>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 29. 01. 22 v 21:09 Demi Marie Obenour napsal(a):
> On Sat, Jan 29, 2022 at 08:42:21PM +0100, Zdenek Kabelac wrote:
>> Dne 29. 01. 22 v 19:52 Demi Marie Obenour napsal(a):
>>> Is it possible to configure LVM2 so that it runs thin_trim before it
>>> activates a thin pool?  Qubes OS currently runs blkdiscard on every thin
>>> volume before deleting it, which is slow and unreliable.  Would running
>>> thin_trim during system startup provide a better alternative?
>>
>> Hi
>>
>>
>> Nope there is currently no support from lvm2 side for this.
>> Feel free to open RFE.
> 
> Done: https://bugzilla.redhat.com/show_bug.cgi?id=2048160
> 
> 

Thanks

Although your use-case Thinpool on top of VDO is not really a good plan and 
there is a good reason behind why lvm2 does not support this device stack 
directly (aka thin-pool data LV as VDO LV).
I'd say you are stepping on very very thin ice...

Also I assume you have already checked performance of discard on VDO, but I 
would not want to run this operation frequently on any larger volume...

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

