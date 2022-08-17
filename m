Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B039C25B08
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Aug 2022 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660729591;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7Q5GGg8wtiXCvJbR1kV6RitiYgh6yPbr07UHCoFFNWA=;
	b=IM7kMiEHhfLvQsuurkhhKKWc8NwlUKMRKv1P+/miDoXysiZh74twlsydntdQxk+DfuTpll
	mSEFX+H2Cem2Tny1cecSuog2ptiHZbbZesLOFpGf7haBS48zLQ2XjyleNyYPddscROo+vk
	xql7Tj5ihfbrnAf7jVmzXcJ/AtxW/94=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-tvkHxjppM_6YO70cZnKHGA-1; Wed, 17 Aug 2022 05:46:27 -0400
X-MC-Unique: tvkHxjppM_6YO70cZnKHGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C986585A584;
	Wed, 17 Aug 2022 09:46:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D7AD4010D45;
	Wed, 17 Aug 2022 09:46:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 36D4C193F516;
	Wed, 17 Aug 2022 09:46:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 190AF1946A40
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 09:46:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DF6CB1457F4C; Wed, 17 Aug 2022 09:46:20 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D10661457F42
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 09:46:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3991294EDC2
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 09:46:20 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-567-tX2GgqQ1O5GnGHXtVgSWOA-1; Wed, 17 Aug 2022 05:46:19 -0400
X-MC-Unique: tX2GgqQ1O5GnGHXtVgSWOA-1
Received: by mail-ed1-f53.google.com with SMTP id t5so16757820edc.11;
 Wed, 17 Aug 2022 02:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=drFskU0C5cv1H8Q2xweszITwZwv8rse42Ml1JmlM5V8=;
 b=tAykjk/BLjr+GmEUB/0+mq8AjQInvL8Hd5DfxAz40oCQBjVOL3q8NZ0QYCIbIluKOP
 sq5vt15niiRcFM4FW9UF7RFL7wFcY44QO3iR1sb4iCUW/R1CNfrhSfE8LEqBTQeD01At
 MnghnPHfN2yAWokk/DtpP/1Qr9Owd7uUo0KIGFf4+zjVV6ufsHdn1RY5DBB55L9tn7MG
 UqCgK5F99Gn578PGkJi2BvLkhQaweF7EPA5b3CRDRUUpytLZ55Rnprc2KlHiJfU+TIKN
 x7bFnbO53iJC71WcSdf1jusZpnG+D6YRkquC4I6pz59jcsYVguBrNh17o3nnKNSy6DI2
 jUCA==
X-Gm-Message-State: ACgBeo37/Iy9+pgvpb6vOLYIYuFj4pRSxGSQICxT/sgVfVeju35I5Qi4
 BmsBcsEbHXiON/uFAYoods5B+f303adUSQ==
X-Google-Smtp-Source: AA6agR4UFtmgRFSgrqkhxrO7xdNZ7kcXlnEvKD3D1HHWUu+zvsGuuaTFhP9XRL9H7rfI0Q5zp94HpQ==
X-Received: by 2002:a05:6402:447:b0:440:d482:495f with SMTP id
 p7-20020a056402044700b00440d482495fmr22943083edw.264.1660729577483; 
 Wed, 17 Aug 2022 02:46:17 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 ss28-20020a170907c01c00b00730a18a8b68sm6500185ejc.130.2022.08.17.02.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 02:46:17 -0700 (PDT)
Message-ID: <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
Date: Wed, 17 Aug 2022 11:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
To: Heming Zhao <heming.zhao@suse.com>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
 <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
 <20220817084343.33la7o6fdh5txul4@c73>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <20220817084343.33la7o6fdh5txul4@c73>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 17. 08. 22 v 10:43 Heming Zhao napsal(a):
> On Wed, Aug 17, 2022 at 10:06:35AM +0200, Zdenek Kabelac wrote:
>> Dne 17. 08. 22 v 4:03 Heming Zhao napsal(a):
>>> On Tue, Aug 16, 2022 at 12:26:51PM +0200, Zdenek Kabelac wrote:
>>>> Dne 16. 08. 22 v 12:08 Heming Zhao napsal(a):
>>>>> Ooh, very sorry, the subject is wrong, not IO performance but cpu high load
>>>>> is triggered by pvmove.
>>>>>
>>>>> On Tue, Aug 16, 2022 at 11:38:52AM +0200, Zdenek Kabelac wrote:
>>>>>> Dne 16. 08. 22 v 11:28 Heming Zhao napsal(a):
>>>>>>> Hello maintainers & list,
>>>>>>>
>>>>>>> I bring a story:
>>>>>>> One SUSE customer suffered lvmpolld issue, which cause IO performance dramatic
>>>>>>> decrease.
>>>>>>>
>>>>>>> How to trigger:
>>>>>>> When machine connects large number of LUNs (eg 80~200), pvmove (eg, move a single
>>>>>>> disk to a new one, cmd like: pvmove disk1 disk2), the system will suffer high
>>>>>>> cpu load. But when system connects ~10 LUNs, the performance is fine.
>>>>>>>
>>>>>>> We found two work arounds:
>>>>>>> 1. set lvm.conf 'activation/polling_interval=120'.
>>>>>>> 2. write a speical udev rule, which make udev ignore the event for mpath devices.
>>>>>>>        echo 'ENV{DM_UUID}=="mpath-*", OPTIONS+="nowatch"' >\
>>>>>>>         /etc/udev/rules.d/90-dm-watch.rules
>>>>>>>
>>>>>>> Run above any one of two can make the performance issue disappear.
>>>>>>>
>>>>>>> ** the root cause **
>>>>>>>
>>>>>>> lvmpolld will do interval requeset info job for updating the pvmove status
>>>>>>>
>>>>>>> On every polling_interval time, lvm2 will update vg metadata. The update job will
>>>>>>> call sys_close, which will trigger systemd-udevd IN_CLOSE_WRITE event, eg:
>>>>>>>       2022-<time>-xxx <hostname> systemd-udevd[pid]: dm-179: Inotify event: 8 for /dev/dm-179
>>>>>>> (8 is IN_CLOSE_WRITE.)
>>>>>>>
>>>>>>> These VGs underlying devices are multipath devices. So when lvm2 update metatdata,
>>>>>>> even if pvmove write a few data, the sys_close action trigger udev's "watch"
>>>>>>> mechanism to gets notified frequently about a process that has written to the
>>>>>>> device and closed it. This causes frequent, pointless re-evaluation of the udev
>>>>>>> rules for these devices.
>>>>>>>
>>>>>>> My question: Does LVM2 maintainers have any idea to fix this bug?
>>>>>>>
>>>>>>> In my view, does lvm2 could drop VGs devices fds until pvmove finish?
>>>>>>
>>>>>> Hi
>>>>>>
>>>>>> Please provide more info about lvm2  metadata and also some  'lvs -avvvvv'
>>>>>> trace so we can get better picture about the layout - also version of
>>>>>> lvm2,systemd,kernel in use.
>>>>>>
>>>>>> pvmove is progressing by mirroring each segment of an LV - so if there would
>>>>>> be a lot of segments - then each such update may trigger udev watch rule
>>>>>> event.
>>>>>>
>>>>>> But ATM I could hardly imagine how this could cause some 'dramatic'
>>>>>> performance decrease -  maybe there is something wrong with udev rules on
>>>>>> the system ?
>>>>>>
>>>>>> What is the actual impact ?
>>>>>>
>>>>>> Note - pvmove was never designed as a high performance operation (in fact it
>>>>>> tries to not eat all the disk bandwidth as such)
>>>>>>
>>>>>> Regards
>>>>>> Zdenek
>>>>>
>>>>> My mistake, I write here again:
>>>>> The subject is wrong, not IO performance but cpu high load is triggered by pvmove.
>>>>>
>>>>> There is no IO performance issue.
>>>>>
>>>>> When system is connecting 80~200, the cpu load increase by 15~20, the
>>>>> cpu usage by ~20%, which corresponds to about ~5,6 cores and led at
>>>>> times to the cores fully utilized.
>>>>> In another word: a single pvmove process cost 5-6 (sometime 10) cores
>>>>> utilization. It's abnormal & unaccepted.
>>>>>
>>>>> The lvm2 is 2.03.05, kernel is 5.3. systemd is v246.
>>>>>
>>>>> BTW:
>>>>> I change this mail subject from:  lvmpolld causes IO performance issue
>>>>> to: lvmpolld causes high cpu load issue
>>>>> Please use this mail for later discussing.
>>>>
>>>>
>>>> Hi
>>>>
>>>> Could you please retest with recent version of lvm2. There have been
>>>> certainly some improvements in scanning - which might have caused in the
>>>> older releases some higher CPU usage with longer set of devices.
>>>>
>>>> Regards
>>>>
>>>> Zdenek
>>>
>>> The highest lvm2 version in SUSE products is lvm2-2.03.15, does this
>>> version include the improvements change?
>>> Could you mind to point out which commits related with the improvements?
>>> I don't have the reproducible env, I need to get a little detail before
>>> asking customer to try new version.
>>>
>>
>>
>> Please try to reproduce your customer's problem and see if the newer version
>> solves the issue.   Otherwise we could waste hours on theoretical
>> discussions what might or might not have helped with this problem. Having a
>> reproducer is a starting point for fixing it, if the problem is still there.
>>
>> Here is one commit that may possibly affect CPU load:
>>
>> d2522f4a05aa027bcc911ecb832450bc19b7fb57
>>
>>
>> Regards
>>
>> Zdenek
> 
> I gave a little bit explain for the root cause in previous mail, And the
> work around <2> also matchs my analysis.
> 
> The machine connects lots of LUNs. pvmove one disk will trigger lvm2
> update all underlying mpath devices (80~200). I guess the update job is
> vg_commit() which updates latest metadata info, and the metadata locates in
> all PVs. The update job finished with close(2) which trigger hundreds
> devices udevd IN_CLOSE_WRITE event. every IN_CLOSE_WRITE will trigger
> mpathd udev rules (11-dm-mpath.rules) to start scanning devices. So the
> real world will flooding hundreds of multipath processes, the cpus load
> become high.


Your 'guess explanation' is not as useful as you might think - as we do not 
know the layout of lvm2 metadata, how many disks are involved into the 
operation, number of segments  and many other things (in RHEL we have 
'sosreport' to harvest all the needed info).

ATM I'm not even sure if you are complaining about how CPU usage of lvmpolld 
or just huge udev rules processing overhead.

If you have too many disks in VG  (again unclear how many there are paths and 
how many distinct PVs) - user may *significantly* reduce burden associated 
with metadata updating by reducing number of 'actively' maintained metadata 
areas in VG - so i.e. if you have 100PVs in VG - you may keep metadata only on 
5-10 PVs to have 'enough' duplicate copies of lvm2 metadata within VG 
(vgchange --metadaatacopies X) - clearly it depends on the use case and how 
many PVs are added/removed from a VG over the lifetime....

There are IMHO still too many variations to guess from - so it's easier to 
create the most similar reproducer to your customer case if you can't reveal 
more physical info about it  and  lvm2 test suite has lot of power to emulate 
most of your system setup combination (it's easy to put there 100 fake PVs and 
prepare metadata set similar to customer's one - once we will have a local 
reproducer it's easier to seek for solution.


Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

