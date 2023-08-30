Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB241C6FA8F
	for <linux-lvm@archiver.kernel.org>; Wed, 30 Aug 2023 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693406024;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xdqVxSszPoGjOkJpehmV7qNlMQrPPCkeUaeSMilwos4=;
	b=DVGxEjhCmonBCAxBH6eQejWHrQGcf1W/UcT2oe4Hgb8hv/n0ae/FtRFRORNHtatW4/Mxz7
	DVFFN0k9c1dInxEV9sLPW+2JEjy6xG1AzexjETq5bLqClwnmFMAxwnSrK7rUf1n+JAfalj
	P7iB84U1F3ra6wuz3xXejOYanu7g3Gs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-8pohlM6WOPCzjql8aFesOw-1; Wed, 30 Aug 2023 10:33:41 -0400
X-MC-Unique: 8pohlM6WOPCzjql8aFesOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96CD580523D;
	Wed, 30 Aug 2023 14:33:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57CC51121315;
	Wed, 30 Aug 2023 14:33:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 18E5719465A3;
	Wed, 30 Aug 2023 14:33:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 858341946A45
 for <linux-lvm@listman.corp.redhat.com>; Wed, 30 Aug 2023 14:31:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7E881415F39; Wed, 30 Aug 2023 14:31:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7728A4021C8
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 14:31:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55F9F85CBE0
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 14:31:46 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-bRsFsJjaPwqCILNybXrqMw-2; Wed, 30 Aug 2023 10:31:44 -0400
X-MC-Unique: bRsFsJjaPwqCILNybXrqMw-2
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-99c93638322so203050166b.1
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 07:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693405903; x=1694010703;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eKMyZIvbldmDByveigHTa3OvHYIkXfJn6VOBc1MYN20=;
 b=jbEOc6x6ABCZGBbY7icwE8A9XaIde1AXYboMvcx4OoG2QdCtJexl+3kd1K30V0wrJ4
 G+yQteLNll1x+6/2jbJdQuETpoDR4I4zejQbnEjbncdSmVilXDjFxFAi/NvdYwm5e0Ul
 hBoLDbya01fyrGHCn8qR1GoteO3OspUHJV1ufCl31kDhhce4wv1GrIHOm+Tf4enmJzAw
 QlKEnnhsuXURxq31ffrx34iMztxrpO+gGrcRU3tLeI0yInLbz8rHL82VNSsefOgqR95b
 tw0vcMigZjUcXv9NTLWanS78nkmE2EtgUjMpMjzhSlmaGxwTbTri7fytBJkXYe9jU5Iv
 ao4w==
X-Gm-Message-State: AOJu0Yyse1LiaeMxEPDHgjeZCHz3XwvlcU/CF61KtSG+RnaNhRMUjTy8
 7WI9T3NZpQz47NusUHwDCLcWdEO4aFM=
X-Google-Smtp-Source: AGHT+IHA3zS9mBn6smI1RZxVmXLwwJIMl7awAcDLrsh0SzYmUtSsiqhYfLVFS+F9w/f3hHIAoGThLw==
X-Received: by 2002:a17:907:7248:b0:9a1:e0b1:e919 with SMTP id
 ds8-20020a170907724800b009a1e0b1e919mr6854252ejc.4.1693405903288; 
 Wed, 30 Aug 2023 07:31:43 -0700 (PDT)
Received: from [192.168.0.177] ([94.142.239.37])
 by smtp.gmail.com with ESMTPSA id
 d3-20020aa7d683000000b0051dfa2e30b2sm6866823edr.9.2023.08.30.07.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 07:31:42 -0700 (PDT)
Message-ID: <3cc29b24-8283-478a-bce2-56c392556391@gmail.com>
Date: Wed, 30 Aug 2023 16:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Vishal Chourasia <vishalc@linux.ibm.com>
References: <fa1ed1e4-9eae-f921-1506-87b46c13ad1f@linux.ibm.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <fa1ed1e4-9eae-f921-1506-87b46c13ad1f@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [linux-lvm] Trouble Booting Custom Kernel with QEMU:
 dracut-initqueue timeout waiting for /dev/sysvg/root
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, cs
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 30. 08. 23 v 8:40 Vishal Chourasia napsal(a):
> Hi All,
> 
> I hope this email finds you well. I am currently facing an issue with
> booting a VM using a custom-compiled kernel and would appreciate your
> expertise on the matter.
> 

Hi

Not really sure how this relates to 'lvm2' yet - your kernel 'stuck' seems to 
be caused by the inability to switch to 'rootfs'  - which should be located on 
/dev/vda3  (according to your qemu exec line) - but kernel panics
reports that device does not have recognizable filesystem.

There seems to be no lvm2 involved at all so far.


> ### Problem Description
> I have downloaded the `Fedora-Server-KVM-38-1.6.x86_64.qcow2` image and
> successfully booted it using `qemu-system-x86_64`. However, when I try
> to boot this VM with a custom-compiled kernel using the `-kernel` flag,
> it fails to boot. The root filesystem is on LVM, and it seems the kernel
> needs to activate volume groups before mounting the root filesystem.

If you believe the filesystem is really on LVM and your /dev/vda3 is just a PV 
- then your boot line is wrong - and you need to be using different naming -
possibly something like:
root=/dev/vgname/lvrootname rd.lvm.lv=vgname/lvrootname

dracut that needs to include lvm2 code and be able to activate such LV prior 
switch to rootfs  (having somewhere inside  lvchange -ay vgname/lvrootname)

But it's not really clear how have you moved from your /dev/vda3 to
something on top of lvm2...

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

