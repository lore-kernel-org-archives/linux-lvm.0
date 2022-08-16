Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2D3C2BB41
	for <linux-lvm@archiver.kernel.org>; Tue, 16 Aug 2022 10:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660645628;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zBPjdlURzJn6rEEIXQ5ajblSw4VCcwX3N5BnJS53aCA=;
	b=FCVLfxsdn4UlQErePMN5RU5CvIzRtNw8XTwhDy6p3aw8u/kh0v3bar/WZX3Rbuicxf2CzR
	frVsttW8zt4fQURtMd4wAY2YXywwk9smgnnRqudLqMmr1MgPtVrnIU/pbAU9jmledbantR
	7UWhSTMGYCMix293rbHEc2H0D/DQO8A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-qLxjwRvNNvi_zxZb7lzYrQ-1; Tue, 16 Aug 2022 06:27:04 -0400
X-MC-Unique: qLxjwRvNNvi_zxZb7lzYrQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EE0A1C006A0;
	Tue, 16 Aug 2022 10:27:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDD3D492C3B;
	Tue, 16 Aug 2022 10:27:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4D4251940352;
	Tue, 16 Aug 2022 10:27:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B6D631940350
 for <linux-lvm@listman.corp.redhat.com>; Tue, 16 Aug 2022 10:26:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6FF1040D0168; Tue, 16 Aug 2022 10:26:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BC5D40D0166
 for <linux-lvm@redhat.com>; Tue, 16 Aug 2022 10:26:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23A3C8037AE
 for <linux-lvm@redhat.com>; Tue, 16 Aug 2022 10:26:58 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-U1TssGhIMvuF2PYrhtLkUA-1; Tue, 16 Aug 2022 06:26:54 -0400
X-MC-Unique: U1TssGhIMvuF2PYrhtLkUA-1
Received: by mail-ej1-f50.google.com with SMTP id kb8so18092928ejc.4;
 Tue, 16 Aug 2022 03:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=YORUzxY2t8IeRqQo31cypEVx1OzytLg9zBQuoZ9x5Ro=;
 b=plnjBddYH7S0urCbeRzz3c5RJDvfYnJCN2D1g+XJ16LFruv50rxnZzA2kUpHstuMHX
 L/r4ruP3x/CafJlSkcjDj8RqCWbjnji3tDL/ndILtl/Rqqv2S0yffvnZOxUGXWb/SB+O
 /BArNvHVw8StZVw3Cyimy4cxlo1BBwNe4U4JP0PT6MsGLa9LAhZaOPxvi+WJbj67objj
 +IjbFI2cnPaHBYwWXqhYmwZYR20qlb8c5nALRo6iHjZX6vuDL1zGw3pmDA4mcbyVB/ta
 +8Jl14vGfuoa+dk284q8s1GAuFUrslRh4LMR9Mvn+LVNayych9aevirVeHBupp5JX5fo
 ISTw==
X-Gm-Message-State: ACgBeo3l+HPoJ9IRplH3jBg/xooY4PH0aNsmBl3n4+0aKzG35vghe5HA
 UuYacKmhsfcWmWv3It4X47XmXNU4us079A==
X-Google-Smtp-Source: AA6agR7lZb5rxZjInPrZ4H5H3pig9L8zEaQlFvhMq7uH910mCgBa0ndQjLUdRvjbleQcveQu0Xc5yQ==
X-Received: by 2002:a17:906:93f0:b0:730:6d4e:970c with SMTP id
 yl16-20020a17090693f000b007306d4e970cmr13378988ejb.188.1660645613449; 
 Tue, 16 Aug 2022 03:26:53 -0700 (PDT)
Received: from [10.43.17.48] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 az8-20020a170907904800b0072ae174cdd4sm5123332ejc.111.2022.08.16.03.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 03:26:53 -0700 (PDT)
Message-ID: <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
Date: Tue, 16 Aug 2022 12:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
To: Heming Zhao <heming.zhao@suse.com>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
 <20220816100802.yy3xqvynil4pcspb@c73>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <20220816100802.yy3xqvynil4pcspb@c73>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [linux-lvm] lvmpolld causes high cpu load issue
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
Cc: linux-lvm@redhat.com, teigland@redhat.com, martin.wilck@suse.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 16. 08. 22 v 12:08 Heming Zhao napsal(a):
> Ooh, very sorry, the subject is wrong, not IO performance but cpu high load
> is triggered by pvmove.
> 
> On Tue, Aug 16, 2022 at 11:38:52AM +0200, Zdenek Kabelac wrote:
>> Dne 16. 08. 22 v 11:28 Heming Zhao napsal(a):
>>> Hello maintainers & list,
>>>
>>> I bring a story:
>>> One SUSE customer suffered lvmpolld issue, which cause IO performance dramatic
>>> decrease.
>>>
>>> How to trigger:
>>> When machine connects large number of LUNs (eg 80~200), pvmove (eg, move a single
>>> disk to a new one, cmd like: pvmove disk1 disk2), the system will suffer high
>>> cpu load. But when system connects ~10 LUNs, the performance is fine.
>>>
>>> We found two work arounds:
>>> 1. set lvm.conf 'activation/polling_interval=120'.
>>> 2. write a speical udev rule, which make udev ignore the event for mpath devices.
>>>      echo 'ENV{DM_UUID}=="mpath-*", OPTIONS+="nowatch"' >\
>>>       /etc/udev/rules.d/90-dm-watch.rules
>>>
>>> Run above any one of two can make the performance issue disappear.
>>>
>>> ** the root cause **
>>>
>>> lvmpolld will do interval requeset info job for updating the pvmove status
>>>
>>> On every polling_interval time, lvm2 will update vg metadata. The update job will
>>> call sys_close, which will trigger systemd-udevd IN_CLOSE_WRITE event, eg:
>>>     2022-<time>-xxx <hostname> systemd-udevd[pid]: dm-179: Inotify event: 8 for /dev/dm-179
>>> (8 is IN_CLOSE_WRITE.)
>>>
>>> These VGs underlying devices are multipath devices. So when lvm2 update metatdata,
>>> even if pvmove write a few data, the sys_close action trigger udev's "watch"
>>> mechanism to gets notified frequently about a process that has written to the
>>> device and closed it. This causes frequent, pointless re-evaluation of the udev
>>> rules for these devices.
>>>
>>> My question: Does LVM2 maintainers have any idea to fix this bug?
>>>
>>> In my view, does lvm2 could drop VGs devices fds until pvmove finish?
>>
>> Hi
>>
>> Please provide more info about lvm2  metadata and also some  'lvs -avvvvv'
>> trace so we can get better picture about the layout - also version of
>> lvm2,systemd,kernel in use.
>>
>> pvmove is progressing by mirroring each segment of an LV - so if there would
>> be a lot of segments - then each such update may trigger udev watch rule
>> event.
>>
>> But ATM I could hardly imagine how this could cause some 'dramatic'
>> performance decrease -  maybe there is something wrong with udev rules on
>> the system ?
>>
>> What is the actual impact ?
>>
>> Note - pvmove was never designed as a high performance operation (in fact it
>> tries to not eat all the disk bandwidth as such)
>>
>> Regards
>> Zdenek
> 
> My mistake, I write here again:
> The subject is wrong, not IO performance but cpu high load is triggered by pvmove.
> 
> There is no IO performance issue.
> 
> When system is connecting 80~200, the cpu load increase by 15~20, the
> cpu usage by ~20%, which corresponds to about ~5,6 cores and led at
> times to the cores fully utilized.
> In another word: a single pvmove process cost 5-6 (sometime 10) cores
> utilization. It's abnormal & unaccepted.
> 
> The lvm2 is 2.03.05, kernel is 5.3. systemd is v246.
> 
> BTW:
> I change this mail subject from:  lvmpolld causes IO performance issue
> to: lvmpolld causes high cpu load issue
> Please use this mail for later discussing.


Hi

Could you please retest with recent version of lvm2. There have been certainly 
some improvements in scanning - which might have caused in the older releases 
some higher CPU usage with longer set of devices.

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

