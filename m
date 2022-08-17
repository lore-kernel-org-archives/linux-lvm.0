Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A91C25B08
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Aug 2022 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660734824;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wQfk6+mPggFP1jPzW/F0fM67CBd+4CAUXsskaTskdVI=;
	b=Vw3mq5ecsG75J4KDxfp3hR7sDTvyciYPxV3jBHa0a65GeGigKUL3ZYwJ9ZIWzqieACtv2N
	KXCbJG4t/3y3z7xqVqkRtxbnUSaCy4xTWXlrr9DplACgt/9swPdEQNPuzY/FBa5xtx8ysT
	o87lEtXUdLVqK/ozch+W/Ff4E8tjs1c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-JRpz0tvROyCcTVQGmgM4fg-1; Wed, 17 Aug 2022 07:13:42 -0400
X-MC-Unique: JRpz0tvROyCcTVQGmgM4fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BED8803C80;
	Wed, 17 Aug 2022 11:13:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B822B94585;
	Wed, 17 Aug 2022 11:13:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 610E0193F516;
	Wed, 17 Aug 2022 11:13:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6A9DB1946A40
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 11:13:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4927FC15BB8; Wed, 17 Aug 2022 11:13:32 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4475BC15BB3
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 11:13:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D04F8039A8
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 11:13:32 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306--BVk-9voMJ-E_INjTIRvhQ-1; Wed, 17 Aug 2022 07:13:30 -0400
X-MC-Unique: -BVk-9voMJ-E_INjTIRvhQ-1
Received: by mail-ej1-f41.google.com with SMTP id kb8so23957438ejc.4;
 Wed, 17 Aug 2022 04:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ArIONiYYXKqrYJGvpDxNoSjLrxSfrlQ/9RgDqMPoBt4=;
 b=uZi/ShbrwT1mnfbqwDUrqq8SdE/kh0Nu+5oN3lfWG43ssf15kU9IvVxHOMzoeVIImd
 7fvbC41o1f4yLMIlihC/nqWl/NA+SGtyg+N6JzP81nbDCahIZc0po0m+/l+o5Ie5pDG4
 TkfUPK3WGs2j83ajHtsqqGbCE1WmhFcp6wd+avjTzWAxIKa0OoXeLkQuV3SMCK8Tw1s/
 Rh9498xyo1hVtR2pej4GIQbVuN88eXNUwteWjmngSX7aJ1WhZX0K6L3qBJLLPQQGMlYH
 lHMz9FTmU2qzHO/1cqy+YNaN/8/0P7ozLK4q/dSSedcdUvpxwbixgIGHqt8XQsgLKyfu
 hriw==
X-Gm-Message-State: ACgBeo2HcM6kjTCEHQPtTeH7AAl+wgvN8+6Ys8mACyD1y8jS2TvJG4cx
 91TVdTJ3x5yaMUFQ3JtGIv1THNS2p8NNrQ==
X-Google-Smtp-Source: AA6agR7tTz5swEd/K6NQG8jnxMAjjRein8qcUPRjh6KXrk4991Z/fGCeHv+otyoF8f/RLmZyFn0SQw==
X-Received: by 2002:a17:907:7214:b0:731:465d:a77c with SMTP id
 dr20-20020a170907721400b00731465da77cmr16096856ejc.308.1660734809116; 
 Wed, 17 Aug 2022 04:13:29 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b00726abf9a32bsm6627446eje.138.2022.08.17.04.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 04:13:28 -0700 (PDT)
Message-ID: <50e6ca8f-9dfc-b1e4-f1c5-ca2af81ccfcb@gmail.com>
Date: Wed, 17 Aug 2022 13:13:27 +0200
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
 <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
 <20220817104732.jhu3ug6ahep3rnpq@c73>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <20220817104732.jhu3ug6ahep3rnpq@c73>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 17. 08. 22 v 12:47 Heming Zhao napsal(a):
> On Wed, Aug 17, 2022 at 11:46:16AM +0200, Zdenek Kabelac wrote:
>> Dne 17. 08. 22 v 10:43 Heming Zhao napsal(a):
>>> On Wed, Aug 17, 2022 at 10:06:35AM +0200, Zdenek Kabelac wrote:
>>>> Dne 17. 08. 22 v 4:03 Heming Zhao napsal(a):
>>>>> On Tue, Aug 16, 2022 at 12:26:51PM +0200, Zdenek Kabelac wrote:
>>>>>> Dne 16. 08. 22 v 12:08 Heming Zhao napsal(a):
>>>>>>> Ooh, very sorry, the subject is wrong, not IO performance but cpu high load
>>>>>>> is triggered by pvmove.
>>>>>>>
> The machine connecting disks are more than 250. The VG has 103 PVs & 79 LVs.
> 
> # /sbin/vgs
>    VG           #PV #LV #SN Attr   VSize   VFree
>    <vgname>     103  79   0 wz--n-  52t    17t

Ok - so main issue could be too many  PVs with relatively high latency of 
mpath devices  (which could be all actually simulated easily in lvm2 test suite)

> The load is generated by multipath. lvmpolld does the IN_CLOSE_WRITE action
> which is the trigger.
> 

I'll check lvmpolld whether it's using correct locking while checking for the 
operational state - you may possibly extend checking interval of polling 
(although that's where the mentioned patchset has been enhancing couple things)


>>
>> If you have too many disks in VG  (again unclear how many there are paths
>> and how many distinct PVs) - user may *significantly* reduce burden
>> associated with metadata updating by reducing number of 'actively'
>> maintained metadata areas in VG - so i.e. if you have 100PVs in VG - you may
>> keep metadata only on 5-10 PVs to have 'enough' duplicate copies of lvm2
>> metadata within VG (vgchange --metadaatacopies X) - clearly it depends on
>> the use case and how many PVs are added/removed from a VG over the
>> lifetime....
> 
> Thanks for the important info. I also found the related VG config from
> /etc/lvm/backup/<vgname>, this file shows 'metadata_copies = 0'.
> 
> This should be another solution. But why not lvm2 takes this behavior by
> default, or give a notification when pv number beyond a threshold when user
> executing pvs/vgs/lvs or pvmove.
> There are too many magic switch, users don't know how to adjust them for
> better performance.

Problem is always the same -  selecting right 'default' :) what suites to user 
A is sometimes  'no go' for user B. So ATM it's more 'secure/safe' to keep 
metadata with each PV - so when a PV is discovered it's known how the VG using 
such PV looks like.  When only fraction of PV have the info - VG is way more 
fragile on damage when disks are lost i.e. there is no 'smart' mechanism to 
pick disks in different racks....

So this option is there for administrators that are 'clever' enough to deal 
with a new set of problems it may create for them.

Yes - lvm2 has lot of options - but that's what is usually necessary when we 
want to be capable to provide optimal solution for really wide variety of 
setups - so I think spending couple minutes on reading man pages pays off - 
especially if you had to spend 'days' on build your disk racks ;)

And yes we may add few more hints - but then we are asked by 'second' group of 
users ('skilled admins')  - why do we print so many dumb messages every time 
they do some simple operation :)

> I'm busy with many bugs, still can't find a time slot to set up a env.
> For this performance issue, it relates with mpath, I can't find a easy
> way to set up a env. (I suspect it may trigger this issue by setting up
> 300 fake PVs without mpath, then do pvmove cmd.)


'Fragmented' LVs with small segment sizes my significantly raise the amount of 
metadata updates needed during pvmove operation as  each single LV segments 
will be mirrored by individual mirror.


Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

