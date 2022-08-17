Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B19C25B08
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Aug 2022 08:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660723624;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jDYTMUJkQb0GsXr4R6p2GTkrNNKNewbRN2IaWFGWjoo=;
	b=g6XMGv3EJk4sfTqePuPBNcEcAQ1pqPmioFgIktfut57YRl5qiaIvEljJKFRfHSF3F6iA9h
	IL+YBKQuXYcfQlgFGJYJzAUx7lUjej43nn6WUENzP9ds9dSEdh17elNk7UFSYsPu6zGPFR
	1Mz+k5yzLcl4yMi2oZ655/elv4vknM8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-tSjugMeEPTuFSs1dEKe5hA-1; Wed, 17 Aug 2022 04:07:00 -0400
X-MC-Unique: tSjugMeEPTuFSs1dEKe5hA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E02E685A584;
	Wed, 17 Aug 2022 08:06:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE42D2166B29;
	Wed, 17 Aug 2022 08:06:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 55956193F517;
	Wed, 17 Aug 2022 08:06:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6C756193F6F6
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 08:06:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4FCA514152E2; Wed, 17 Aug 2022 08:06:49 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BDE214152E1
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 08:06:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33385101A589
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 08:06:49 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-169-VTxOBKn5N3uttsYNcA9Iag-1; Wed, 17 Aug 2022 04:06:37 -0400
X-MC-Unique: VTxOBKn5N3uttsYNcA9Iag-1
Received: by mail-ed1-f46.google.com with SMTP id a89so16479664edf.5;
 Wed, 17 Aug 2022 01:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=SC6UWzvivDsNpe6vKX5wwS8RKKaGmy4qnNY3Xcsu51w=;
 b=i+5U0OMLkytq/edxfhl9aP2pVpAesA6sRAA4lNKM0m6ONprBrUCea53o/oU8gbhJZx
 EXULuZ4Li4mvlRGxZI/PWDeRkAsKw72t9c2pLLB7Hnyp5pw9TGfzG/XWoenHr2Il8JmG
 F2ggzwqugV1IP1aFnmE/KXomG+LLfLW3znwbtuE5BjVeKaKhvv3W3zIhorRkquKAzNbQ
 Jcngmep+SNEGVfPaTWu33zKYHCsgj385o8gUximqygp8HgF8d2TGKCLdrPO8Dt0WimtC
 xff4UQLZh39Pizt5+61eUqee54V8yOervXH6CWCO46F0R+zw+c1lzYWtDhtBeegCKt3X
 CkUQ==
X-Gm-Message-State: ACgBeo3+DmYkF0K76wx5cAKjuve80crEBRWIlmz3h07LjA8dp0S8/zSb
 4f1T6eFZgO0gkRiw2wwT684f/grGB5haZA==
X-Google-Smtp-Source: AA6agR5PXcD8xXNlBoYuVUqtHmuNlCur9xeIeZ7+dfxaUhDie6HgRAktn8o163CulX6NQzuY4J0F8Q==
X-Received: by 2002:a05:6402:43c6:b0:43d:79a6:4e32 with SMTP id
 p6-20020a05640243c600b0043d79a64e32mr21360294edc.281.1660723596553; 
 Wed, 17 Aug 2022 01:06:36 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a17090660c700b00734b3194ecesm6380387ejk.163.2022.08.17.01.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 01:06:36 -0700 (PDT)
Message-ID: <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
Date: Wed, 17 Aug 2022 10:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
To: Heming Zhao <heming.zhao@suse.com>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
 <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <20220817020225.gf6ooxobdf5xhpxe@c73>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 17. 08. 22 v 4:03 Heming Zhao napsal(a):
> On Tue, Aug 16, 2022 at 12:26:51PM +0200, Zdenek Kabelac wrote:
>> Dne 16. 08. 22 v 12:08 Heming Zhao napsal(a):
>>> Ooh, very sorry, the subject is wrong, not IO performance but cpu high load
>>> is triggered by pvmove.
>>>
>>> On Tue, Aug 16, 2022 at 11:38:52AM +0200, Zdenek Kabelac wrote:
>>>> Dne 16. 08. 22 v 11:28 Heming Zhao napsal(a):
>>>>> Hello maintainers & list,
>>>>>
>>>>> I bring a story:
>>>>> One SUSE customer suffered lvmpolld issue, which cause IO performance dramatic
>>>>> decrease.
>>>>>
>>>>> How to trigger:
>>>>> When machine connects large number of LUNs (eg 80~200), pvmove (eg, move a single
>>>>> disk to a new one, cmd like: pvmove disk1 disk2), the system will suffer high
>>>>> cpu load. But when system connects ~10 LUNs, the performance is fine.
>>>>>
>>>>> We found two work arounds:
>>>>> 1. set lvm.conf 'activation/polling_interval=120'.
>>>>> 2. write a speical udev rule, which make udev ignore the event for mpath devices.
>>>>>       echo 'ENV{DM_UUID}=="mpath-*", OPTIONS+="nowatch"' >\
>>>>>        /etc/udev/rules.d/90-dm-watch.rules
>>>>>
>>>>> Run above any one of two can make the performance issue disappear.
>>>>>
>>>>> ** the root cause **
>>>>>
>>>>> lvmpolld will do interval requeset info job for updating the pvmove status
>>>>>
>>>>> On every polling_interval time, lvm2 will update vg metadata. The update job will
>>>>> call sys_close, which will trigger systemd-udevd IN_CLOSE_WRITE event, eg:
>>>>>      2022-<time>-xxx <hostname> systemd-udevd[pid]: dm-179: Inotify event: 8 for /dev/dm-179
>>>>> (8 is IN_CLOSE_WRITE.)
>>>>>
>>>>> These VGs underlying devices are multipath devices. So when lvm2 update metatdata,
>>>>> even if pvmove write a few data, the sys_close action trigger udev's "watch"
>>>>> mechanism to gets notified frequently about a process that has written to the
>>>>> device and closed it. This causes frequent, pointless re-evaluation of the udev
>>>>> rules for these devices.
>>>>>
>>>>> My question: Does LVM2 maintainers have any idea to fix this bug?
>>>>>
>>>>> In my view, does lvm2 could drop VGs devices fds until pvmove finish?
>>>>
>>>> Hi
>>>>
>>>> Please provide more info about lvm2  metadata and also some  'lvs -avvvvv'
>>>> trace so we can get better picture about the layout - also version of
>>>> lvm2,systemd,kernel in use.
>>>>
>>>> pvmove is progressing by mirroring each segment of an LV - so if there would
>>>> be a lot of segments - then each such update may trigger udev watch rule
>>>> event.
>>>>
>>>> But ATM I could hardly imagine how this could cause some 'dramatic'
>>>> performance decrease -  maybe there is something wrong with udev rules on
>>>> the system ?
>>>>
>>>> What is the actual impact ?
>>>>
>>>> Note - pvmove was never designed as a high performance operation (in fact it
>>>> tries to not eat all the disk bandwidth as such)
>>>>
>>>> Regards
>>>> Zdenek
>>>
>>> My mistake, I write here again:
>>> The subject is wrong, not IO performance but cpu high load is triggered by pvmove.
>>>
>>> There is no IO performance issue.
>>>
>>> When system is connecting 80~200, the cpu load increase by 15~20, the
>>> cpu usage by ~20%, which corresponds to about ~5,6 cores and led at
>>> times to the cores fully utilized.
>>> In another word: a single pvmove process cost 5-6 (sometime 10) cores
>>> utilization. It's abnormal & unaccepted.
>>>
>>> The lvm2 is 2.03.05, kernel is 5.3. systemd is v246.
>>>
>>> BTW:
>>> I change this mail subject from:  lvmpolld causes IO performance issue
>>> to: lvmpolld causes high cpu load issue
>>> Please use this mail for later discussing.
>>
>>
>> Hi
>>
>> Could you please retest with recent version of lvm2. There have been
>> certainly some improvements in scanning - which might have caused in the
>> older releases some higher CPU usage with longer set of devices.
>>
>> Regards
>>
>> Zdenek
> 
> The highest lvm2 version in SUSE products is lvm2-2.03.15, does this
> version include the improvements change?
> Could you mind to point out which commits related with the improvements?
> I don't have the reproducible env, I need to get a little detail before
> asking customer to try new version.
> 


Please try to reproduce your customer's problem and see if the newer version 
solves the issue.   Otherwise we could waste hours on theoretical discussions 
what might or might not have helped with this problem. Having a reproducer is 
a starting point for fixing it, if the problem is still there.

Here is one commit that may possibly affect CPU load:

d2522f4a05aa027bcc911ecb832450bc19b7fb57


Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

