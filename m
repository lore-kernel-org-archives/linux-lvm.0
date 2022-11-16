Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6C9C433FE
	for <linux-lvm@archiver.kernel.org>; Wed, 16 Nov 2022 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668612961;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YvmAgkg61oLjogQwA+EPi/uY+qRmzWt1RMu0FtLuytU=;
	b=Z+hTZhHYgIZIfAjpK2DyFTPn4HVWcV7HjfR8bOYf0tumd6niOCBps4LAssYxmf2j+p2v1w
	LEPxK5iapNbNxDxNt1J+g4PLDKbWwNkprgQg4psEH3FsjWxhOAmW1fq64yTJaZeKqLr5pI
	wAMNtW6TbxlPQekA4OFRJRmv/TspCmc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-xPurmD1JNfemL08M2MW1Vg-1; Wed, 16 Nov 2022 10:36:00 -0500
X-MC-Unique: xPurmD1JNfemL08M2MW1Vg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44DDF3C025B8;
	Wed, 16 Nov 2022 15:35:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4C4B49BB60;
	Wed, 16 Nov 2022 15:35:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 92D1319465A4;
	Wed, 16 Nov 2022 15:35:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5924119465A2
 for <linux-lvm@listman.corp.redhat.com>; Wed, 16 Nov 2022 15:35:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 40E5D404CD8A; Wed, 16 Nov 2022 15:35:54 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3998140C6EC3
 for <linux-lvm@redhat.com>; Wed, 16 Nov 2022 15:35:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F3422A59544
 for <linux-lvm@redhat.com>; Wed, 16 Nov 2022 15:35:54 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-VHDyljF2MlSAyiSY7g5I-A-1; Wed, 16 Nov 2022 10:35:51 -0500
X-MC-Unique: VHDyljF2MlSAyiSY7g5I-A-1
Received: by mail-qk1-f177.google.com with SMTP id i9so11828459qki.10
 for <linux-lvm@redhat.com>; Wed, 16 Nov 2022 07:35:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0QutVas1W+tT82X2hxfH8dsVnesunIZELfoDnejlZNI=;
 b=2T/CdGoFP0jcymfxpLymkx6Gt1CzjWoO6CUteT5w5MeJftcnKuHXRTFDpCJRGKgMc4
 +Y6TrkmADIWY6WpRVMu79w2PKByn6zHE+ijlkzBA5FJQDmDz2r4HbBApoi3WD1XC5t8B
 6SdhnBwdZDgUFjfCO3C/RSVlkJf99Xt5j5oTQw6ZNA5ysVxNprwf9MDb38QOMfoUVpc6
 W3jSP9tswn+wpTXcUigOFgkcizZXc80bDxdKI7pWFV2vwqYU7v/dHrScBuC3Y8ymeefS
 FfNtu0FfbR5L+OYl4jkj4uAt+Gs+LA0zjdcmvWca2WxQaALa4g9Jid+Cfs9ckGYyUDAz
 APCQ==
X-Gm-Message-State: ANoB5pkvpk5wi90i5D1h/63IWK4binnptncz+p0EuZMlGYBAXcf5vBbY
 qbU6GcSDjTtfmuCuO3oHquABPhuSZn0=
X-Google-Smtp-Source: AA0mqf6HYz2UWiW1my4BDlcMEI8RJlh3UVTkHq1Lp24RGl8H0iwiL4NyhHaxk54JeZHqDTnbPpOZyA==
X-Received: by 2002:a05:620a:c09:b0:6ce:3f1c:a4ef with SMTP id
 l9-20020a05620a0c0900b006ce3f1ca4efmr20079464qki.507.1668612951033; 
 Wed, 16 Nov 2022 07:35:51 -0800 (PST)
Received: from [10.43.17.48] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a05620a29c100b006faeecef56fsm10286185qkp.68.2022.11.16.07.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 07:35:50 -0800 (PST)
Message-ID: <605a0a83-4403-253a-73e1-e70849178eb7@gmail.com>
Date: Wed, 16 Nov 2022 16:35:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
To: Gionatan Danti <g.danti@assyoma.it>
References: <8404c979411230748aa52deacca89cd8@assyoma.it>
 <0c1d5e76-085c-cb46-c477-3bcd70a8acb2@gmail.com>
 <df0c4d08b1973c2b506323003f201796@assyoma.it>
 <8865e8e7-fede-d904-8970-771afae19504@gmail.com>
 <99746334610331ae0f7cca166649fdd0@assyoma.it>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <99746334610331ae0f7cca166649fdd0@assyoma.it>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [linux-lvm] lvm-vdo, snapshots and cache
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 16. 11. 22 v 15:38 Gionatan Danti napsal(a):
> Il 2022-11-16 11:50 Zdenek Kabelac ha scritto:
>> Well - as said - vg on vg is basically equivalent of the original LV
>> on top of VDO manager.
> 
> Hi Zdenek,
> it seems clunkier to manage two nested VG/LV if you ask me.

IMHO not different from lvm on top of vdo managed volume.
It should be mostly equal (and in few cases possibly even easier or at least 
more OS friendly)

> 
>> But still these fast snapshot do not solve you a problem of double
>> out-of-space fault.
> 
> Yeah, but available space requires constant monitor even when dealing with 
> lvmthin.
> 
>> It's good for experimenting - but I'd not suggest to use this setup.
> 
> In RHEL7 it was specifically supported - see here[1]:
> 
> "As a general rule, you should place certain storage layers under VDO and 
> others on top of VDO:
> Under VDO: DM-Multipath, DM-Crypt, and software RAID (LVM or mdraid).
> On top of VDO: LVM cache, LVM snapshots, and LVM Thin Provisioning"
> 
> For a practical example: in the past I experimented with a storage stack 
> composed of raid -> vdo -> lvmthin -> xfs serving qemu/kvm virtual disk files. 
> The lvmthin layer enabled rolling snapshots, and was a key feature of the test 
> setup.
> 
> Now the only method to replicate that is to have two nested LVM instances, one 
> running vdo and one lvmthin - right?
> 

Well - it's not difficult 'coding' to enable using 'VDO LV' as thinpool data 
LV, however we currently lack a lot on support for 'VDO LV' recovery alone in 
lvm2 - so until this will get polished - we try to avoid shot ourself to our 
foots with enabling these complicated stacks ATM :)

We also have some ideas for different snapshoting inside VDO - so we will see 
how that will go - it looks more supportable then combining VDO+THIN together.

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

