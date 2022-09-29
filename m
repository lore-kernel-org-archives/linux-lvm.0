Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A42DC433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 29 Sep 2022 10:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664448770;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aL03D71u22mH94Y3w1VkCE1mYLJxWOfkINtKVgV6xwY=;
	b=E+KnpHSwBE+bfpYdhCidpJ8GIUvmN2c5snHPWulJuex+6zRyPevHuJi1hggQvjfJ05xXl2
	jVxHpXT6oS+deDEV71lSL3h8kCmRXLlkopyQ7tKPIyqepRaZLjIXWkAK+0r1aFDQyN1hQF
	Oz9iemp0Cuv+xErTk7wDMQqbSiJW5X0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-Ni1Q1R1JPlmkawD_cTg1OQ-1; Thu, 29 Sep 2022 06:52:46 -0400
X-MC-Unique: Ni1Q1R1JPlmkawD_cTg1OQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC8E6811E81;
	Thu, 29 Sep 2022 10:52:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC82F207B34A;
	Thu, 29 Sep 2022 10:52:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B95471946A47;
	Thu, 29 Sep 2022 10:52:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2BCAA19465B8
 for <linux-lvm@listman.corp.redhat.com>; Thu, 29 Sep 2022 10:52:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D530240EFB13; Thu, 29 Sep 2022 10:52:37 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDA7440EFB12
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 10:52:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFD0E85A5A6
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 10:52:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-529-VGIZeInfNyquotRF-pPZQw-1; Thu, 29 Sep 2022 06:52:36 -0400
X-MC-Unique: VGIZeInfNyquotRF-pPZQw-1
Received: by mail-wr1-f43.google.com with SMTP id c11so1533693wrp.11
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 03:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=aFvk3cFWG640ykOwXwyLYMGk21uZ3jLpopL5/dzwXpU=;
 b=gpupM1Vw8Wf2Q+KuprR/GE948G6Ip4zWsasK+34RKCFQUR1jPQkwDJUKYLLcZ9IBCP
 TeTKYhy9M+0Gr0OqRG07/Ql4qdof8wqC8MjBujBFJ8eCD0K2HTsbH/b3/dCxP8vUqB8W
 Yp8rEIejUuNSCa+H/QduJVlGeXQe4WzbKHoaAauBU0Ac0MNK2ztXMugee4myRtFhsaQF
 L3xvS5hregguEzJrtxgSJUzi2ldIZVIcZE/+khvVZzx5WLAGfqmGVTsUt+5Tcpa7ClGj
 yRl9we3kPp2S8L/0ZWbIYLr/VItzFhFXDng9/Z6Ls4wjWI4YAtq3hgGHt0sr33ANdngN
 fV3A==
X-Gm-Message-State: ACrzQf2+PaNTv5nWovnWTCoctRQbHwr6z1K9O9Z+I6Mil+mgAZNuhVhG
 r4rjaDygTJ1BxVU4kzTgeiRBx+aMPIo=
X-Google-Smtp-Source: AMsMyM5qSVUHM53sh72PKN0w+pZd9nQJQQPWC6ZOVagUVCTDGN6eZGUcZsUxQX8ogjDPBkZdKOW5hw==
X-Received: by 2002:a5d:47c5:0:b0:22a:6d4c:f21e with SMTP id
 o5-20020a5d47c5000000b0022a6d4cf21emr1766702wrc.417.1664448754409; 
 Thu, 29 Sep 2022 03:52:34 -0700 (PDT)
Received: from [192.168.0.177] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 bk9-20020a0560001d8900b002252884cc91sm6412611wrb.43.2022.09.29.03.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 03:52:33 -0700 (PDT)
Message-ID: <6c03a8e8-c4ed-4c2a-a23b-bf4513577d1e@gmail.com>
Date: Thu, 29 Sep 2022 12:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Roberto Fastec <roberto.fastec@gmail.com>
References: <CADoUXWv+Po7pdhcAUk=JSwaDYJ2qp6B7aXm_djOuaOB0r9Usrw@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CADoUXWv+Po7pdhcAUk=JSwaDYJ2qp6B7aXm_djOuaOB0r9Usrw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [linux-lvm] LVM2 Metadata structure, extents ordering,
 metadata corruptions
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 27. 09. 22 v 12:10 Roberto Fastec napsal(a):
> Dear friends of the LVM mailing list
> 
> I suppose this question is for some real LVM2 guru or even developer
> 
> Here I kindly make three question with three premises
> 
> premises
> 1. I'm a total noob about LVM2 low level logic, so I'm sorry of the questions 
> will sound silly :-)
> 2. The following applies to a whole md RAID (in my example it will be a RAID5 
> made of 4 drives 1TB each so useful available space more or less 2.7TB)
> 3. I assign whole those 2.7TB to one single PV and one single VG and one 
> single LV.
> 
> questions
> 1. Given the premise 3. The corresponding LVM2 metadata/tables are and will be 
> just a (allow me the term) "grid" "mapping that space" in an ordered sequence 
> to in the subsequent use (and filling) of the RAID space "just mark" the used 
> ones and the free ones? Or those grid cells will/could be in a messed order ?
> And explicitly I mean. In case of metadata corruption (always with respect of 
> premise 3.) , could we just generate a dummy metadata table with all the 
> extents marked as "used" in such a way that we can anyway access them
> And can we expect to have them ordered?

lvm2  'metadata handling'  is purely internal to the lvm2 codebase - you can't 
rely on any 'witnessed/observed' logic.

There is cmdline API to access and manipulate metadata in most cases.

Temporarily you can i.e. update/modify your current metadata with 'vi' editor 
and vgcfgrestore them - however this is not a 'guaranteed' operational mode - 
rather a workaround if the 'cmdline' interface is not handling some error case 
well - and it should be used as  RFE to enhance lvm2 in such case.

> 
> 2. Does it exist a sort of "fsck" for the LVM2 metadata ? We do technical 
> assistance and recently, specifically with those NAS devices that make use of 

In general - lvm2 metadata on disk always do have CRC32  checksum - when 
invalid -> metadata is garbage.

Each loaded CRC32 correct metadata is always then fully validated - yep it can 
be sometimes a bit costly in the case of very large metadata size - but so far 
- no big problems -  CPUs are mostly getting faster as well...  so bigger 
setups tends to have also powerful hw....

> LVM2, we have experienced really easy metadata corruption in occurence of just 
> nothing or because of a electric power interruption (which is really 
> astonishing). We mean no drives failures , no bad SMARTs . Just corruption 
> from "nowhere" and "nocause"


Corrupted metadata are always considered unusable - user has to restore to 
previous valid version (and here sometimes all the combinations of error might 
eventually require  'vi editor' assistance - but again - in very very unusual 
circumstances.

Metadata are archived in /etc/lvm/archive and  they are also in ring-buffer 
present on all PVs in a VG  -  if there are too many PVs - user can 'opt-out' 
and consider only a subset of PVs to hold metadata - i.e.  200PVs - and only 
20PVs holding metadata - but these are highly unusual configurations...

Regards


Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

