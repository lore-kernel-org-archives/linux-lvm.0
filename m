Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2157C433F5
	for <linux-lvm@archiver.kernel.org>; Sat, 29 Jan 2022 19:42:50 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-zmF_cNh4PPKTOpCl9u5egw-1; Sat, 29 Jan 2022 14:42:46 -0500
X-MC-Unique: zmF_cNh4PPKTOpCl9u5egw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44C0F80A19E;
	Sat, 29 Jan 2022 19:42:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C5D160843;
	Sat, 29 Jan 2022 19:42:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1DA41809CB8;
	Sat, 29 Jan 2022 19:42:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20TJgSWI003284 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 29 Jan 2022 14:42:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 24EDEC1D3AD; Sat, 29 Jan 2022 19:42:28 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2120AC07F47
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 19:42:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0554F85A5A8
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 19:42:28 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
	[209.85.218.43]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-411-UU8upA5sPLqTlfehspRCHA-1; Sat, 29 Jan 2022 14:42:24 -0500
X-MC-Unique: UU8upA5sPLqTlfehspRCHA-1
Received: by mail-ej1-f43.google.com with SMTP id me13so28414276ejb.12
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 11:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:from:in-reply-to
	:content-transfer-encoding;
	bh=kLfH2MJnms7dGsiSXqxPho8gdbcrHmQ9FmwzeldNjg4=;
	b=d6s66M3hyug++yOCPun0n9+DxD4J2r4fR9a03iheXHbbSSTwjVNrG4G0633yNU6hwr
	vdQY/kHB30+nDYJkJZTDiQYhZY3+zuYOFNeEqwTUd/RKeFWYRN05W29gV7+GrQuVwz4X
	4qkgzjs3U7oDCk0+Lt2Adod0HdwDP3TrqozyXhV0JB8lAgyuA5TCYLg4ZReBoagWc01p
	Jzssl0v7fgW2X51Tjf5pvquI1VYNdhNOuv55RhOS/N8FMxbSfuPIicYguMpsIeMj7QsZ
	5ltpal6PWPONi2juw1h7fQ9JjI6TABVq62o40kV/jr20g8iZqCoABU7bn9JWziRqw+vN
	TdjA==
X-Gm-Message-State: AOAM532lwyjhorULLXmbrjPvwnKDTif36Cgd2FKg7ou0zhnPs631ZCST
	TLSEFjlfnZcOd/RE04KD1IBtiX0Ts85Rjg==
X-Google-Smtp-Source: ABdhPJwqYkrZHNuWylCDJ0MaXj/4PYkhs28jUB7CQha83DIHLQcQeSSJFkPuzIDG0rozXix4UWFuXg==
X-Received: by 2002:a17:907:7d91:: with SMTP id
	oz17mr3868698ejc.140.1643485343310; 
	Sat, 29 Jan 2022 11:42:23 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id
	jt17sm11359423ejb.161.2022.01.29.11.42.22
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 29 Jan 2022 11:42:22 -0800 (PST)
Message-ID: <9156ffae-650d-198d-5c7a-32f84dbcb332@gmail.com>
Date: Sat, 29 Jan 2022 20:42:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.4.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YfWM+8w1TonBXNsP@itl-email>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <YfWM+8w1TonBXNsP@itl-email>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 29. 01. 22 v 19:52 Demi Marie Obenour napsal(a):
> Is it possible to configure LVM2 so that it runs thin_trim before it
> activates a thin pool?  Qubes OS currently runs blkdiscard on every thin
> volume before deleting it, which is slow and unreliable.  Would running
> thin_trim during system startup provide a better alternative?

Hi


Nope there is currently no support from lvm2 side for this.
Feel free to open RFE.

I guess this would possibly justify some form of support for 'writable' 
component activation.

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

