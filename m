Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E4BC00140
	for <linux-lvm@archiver.kernel.org>; Tue,  2 Aug 2022 14:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659451987;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=63lyzNwexPT8dHYzXHvIpeI8tm7ixxXNuuFeVe4kvFw=;
	b=Ezp4eT/4ryW61/k6ISBSDyCvN84nYXvQrp+iQ7g4zsA3T40+Y7F6GeCnlMGvZpFw6ZgpOc
	FY10klbgLyc2Pntw22qCyTiV6b/Ic34v9y/Kk34t9KCvGgSgqz4jfGq72rpp3pcllep8ws
	fk6nkHETkcvMpkbIc3/fFQ7WXwMp/js=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-gsVOyE_zOZm7BlwXjKQtGw-1; Tue, 02 Aug 2022 10:53:04 -0400
X-MC-Unique: gsVOyE_zOZm7BlwXjKQtGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A16BF811E76;
	Tue,  2 Aug 2022 14:53:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CBE390A04;
	Tue,  2 Aug 2022 14:52:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 54F2A1946A53;
	Tue,  2 Aug 2022 14:52:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2FC161946A50
 for <linux-lvm@listman.corp.redhat.com>; Tue,  2 Aug 2022 14:52:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 233651121315; Tue,  2 Aug 2022 14:52:55 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F95D1121314
 for <linux-lvm@redhat.com>; Tue,  2 Aug 2022 14:52:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0354A1032964
 for <linux-lvm@redhat.com>; Tue,  2 Aug 2022 14:52:55 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-P4KlI2_1NLOWl7FXYnhJvQ-1; Tue, 02 Aug 2022 10:52:53 -0400
X-MC-Unique: P4KlI2_1NLOWl7FXYnhJvQ-1
Received: by mail-ej1-f43.google.com with SMTP id k26so10675790ejx.5
 for <linux-lvm@redhat.com>; Tue, 02 Aug 2022 07:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n/o/z9QyNU6r21RbTqFA9CmcI+IKWmqc9CL9U7poLNw=;
 b=sfyuy4tXiUTKW5Ta0fimqDuXXa1f2aviFgMWS9RpCx1vEw6ASUpMCgYQ/x+ymIbMJF
 e/AK3pVZGVcolAZRbeADlpDLM4PNWw18zf5xw1citPXb5XmccZ5r1TYDUuDtfW7oOfps
 G787o5FvYjoN1+VjizsWlDAi80kWDRKKJWKJU5jibMARTVNYwsjEPFHJZIquNaG8GGgm
 lRGzrNW17fQFKAUsRFyY/LK67JWgJ7j3bdlmbpWv3JOhNYSfOsQ2ev24DOX37OU2qj1/
 V17bP/SkFdSpitOPQiDV0KlNy3QsrqMymgXJCMfK2YywoSnb1nXV6Cyf5EL0wmYA0Jbb
 d5Xw==
X-Gm-Message-State: AJIora8F+74GLTZWY5HC6ucxDWuJ8h8XnfZvkbSzJw3Kx3OZ/gQvyCvc
 knoQ7Qmi4BepLjBJUbneh1+GLMFRq96Ctw==
X-Google-Smtp-Source: AGRyM1tNoQswPf9UIe9u9a5bUo4dwWykUUknqLGUr9d+U5/+L7Z3VzmZYi3j+fT2mQ6RKSjkdpbavg==
X-Received: by 2002:a17:907:a0c7:b0:72f:b205:112 with SMTP id
 hw7-20020a170907a0c700b0072fb2050112mr16308182ejc.559.1659451968567; 
 Tue, 02 Aug 2022 07:52:48 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a17090690cc00b00730799724c3sm2804309ejw.149.2022.08.02.07.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 07:52:48 -0700 (PDT)
Message-ID: <63e2968a-cb32-fda5-8810-43f722ae2d28@gmail.com>
Date: Tue, 2 Aug 2022 16:52:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Thomas Deutschmann <whissi@whissi.de>
References: <000101d8a432$08688fe0$1939afa0$@whissi.de>
 <d73e7506-a754-55d0-734f-084ffda1d6f2@gmail.com>
 <17c7871a-0849-bd03-40b6-146e338e364e@gmail.com>
 <000601d8a5e6$29a770d0$7cf65270$@whissi.de>
 <000901d8a61c$3adf2fb0$b09d8f10$@whissi.de>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <000901d8a61c$3adf2fb0$b09d8f10$@whissi.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [linux-lvm] lvcreate hangs forever during snapshot creation
 when suspending volume
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 02. 08. 22 v 5:01 Thomas Deutschmann napsal(a):
> Hi,
> 
> Zdenek Kabelac wrote:
>> Now - you suggests you are able to reproduce this issue also on your bare
>> metal hw - in this case run these 3 commands  before  'lvcreate'
> 
>> Zdenek Kabelac wrote:
>> Note: you could always 'experiment' without lvm2 in the picture -
>> you can ran   'fsfreeze --freeze|--unfreeze'  yourself - to see whether
> even
>> this command is able to finish  ?
> 
> fsfreeze caused the same problem :/
> 
> I also changed filesystem from xfs to ext4 just in case... same issue.
> 
> For testing I stopped the MDRAID and removed one NVMe disk which I
> cleared and where I created a new ext4 partition. Running
> 
>    $ fsfreeze --freeze /mnt/test
> 
> returned within seconds and I was unable do any I/O against /mnt/test
> as expected.
> 
> I unfreezed the filesystem and started to copy ~50GB to the volume.
> After waiting 5 minutes and verifying that /proc/meminfo didn't list
> any 'dirty' pages, I re-run the fsfreeze command which caused the
> same issue -- system hangs. :/
> 
> I will repeat the test with the other NVMe later...
> 
> So probably a kernel/driver issue or hardware problem.
> 

Hi

So as guessed earlier - unrelated to lvm2.

You likely need to discover what is wrong with your 'raid' device ?
Was your raid array fully synchronized ?

Do you have only problem with one particular  MD 'raid' on your system - or 
any other 'raid' you attach/create will suffer the same problem ?

Is it 'nvme' related on your system ?

Are the 'individual' nvme  devices running fine - just when they are mixed 
together into a single array you get these  'fsfreeze' troubles ?

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

