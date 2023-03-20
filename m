Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41945C7618A
	for <linux-lvm@archiver.kernel.org>; Mon, 20 Mar 2023 14:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679320829;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZdYtCSa5RiKQF4MSitKcrPkpKgjcqeSGGwrMWY4Cppg=;
	b=D5VSOwpsjac9ySelyyGaztRyVdYxTQoxVaY84Qvb1wajyDTRthkxS2uZ0LyIYI+kSGCnjn
	vWXMEn2NCFWPkMkcJOG/7L5fEAg7donU50JNUzXxRqwl2DunbEmmFYMDy/tR6xRNvdgzGE
	IRhIJgeLG4XjLn7CbSKKT8VohINBw+k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-HTbHGEf-NpiL0ekR8FloKg-1; Mon, 20 Mar 2023 10:00:23 -0400
X-MC-Unique: HTbHGEf-NpiL0ekR8FloKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C131100DEB6;
	Mon, 20 Mar 2023 14:00:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCC182027047;
	Mon, 20 Mar 2023 14:00:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A16B119465A8;
	Mon, 20 Mar 2023 14:00:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D49B01946594
 for <linux-lvm@listman.corp.redhat.com>; Mon, 20 Mar 2023 14:00:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B5D241121318; Mon, 20 Mar 2023 14:00:05 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE6BB1121315
 for <linux-lvm@redhat.com>; Mon, 20 Mar 2023 14:00:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D86738145A8
 for <linux-lvm@redhat.com>; Mon, 20 Mar 2023 14:00:05 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-FSQ2Ve61O2muojVV76k6kQ-1; Mon, 20 Mar 2023 10:00:04 -0400
X-MC-Unique: FSQ2Ve61O2muojVV76k6kQ-1
Received: by mail-ed1-f43.google.com with SMTP id y4so47194782edo.2
 for <linux-lvm@redhat.com>; Mon, 20 Mar 2023 07:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679320802;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k6T6JlEgcZK3ZoN4DY4TqH4IwyHqiLvmxcaocB08Sac=;
 b=JxqmRUBQ/sp8bSevdf7FZ3tcfOkeOzsZOgc0RuPunk7heqI32aNdar265F4acn/6fy
 QTSUuJY6Uiz99q+4IiSAnyT20BONx1ccIr4FTAgN0S1duClnWkOjJIYDV+46pNDqBoE1
 Q/gtV2ntsVSVGDWN43r8Lt99NAekmfM/jLOaE8BeroDvwepWDqR+3sAMCHGupiUiJ5HM
 LRxxZRu0ZxJZ3mG/T9h7ksNcxbAYN+r5oyXsVRFUzOP6bCqDAp/r2CMy95+IntGuvdzP
 +1sDOBYhb1vwkSGN3/a4d+kMKF97zwaAbwKUPo9RAqwmG97vHm0uvAP3oeWUYIYh4etT
 bjXg==
X-Gm-Message-State: AO0yUKW2XSKk/p2yVs/Wjkn+uAuKoVoLt+aUHAfTukK7inffWMjDivXq
 dVax2TxC2rS5FikfRrEsZ6AldGsnuXcA99+6
X-Google-Smtp-Source: AK7set+5jlHAqJn5b/c4Y61mRt0QEc027o/8UdFNHVljbN92vVKSMIwy+SVE01BOIGZeClPf1gdHRQ==
X-Received: by 2002:a50:fe8c:0:b0:4fe:9621:ffdc with SMTP id
 d12-20020a50fe8c000000b004fe9621ffdcmr12851333edt.16.1679320802398; 
 Mon, 20 Mar 2023 07:00:02 -0700 (PDT)
Received: from [192.168.0.177] ([94.142.239.37])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a50d658000000b00501d5432f2fsm136754edj.60.2023.03.20.07.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 07:00:02 -0700 (PDT)
Message-ID: <5b9e31d6-2675-8903-619c-cf33c48f1ba8@gmail.com>
Date: Mon, 20 Mar 2023 14:57:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Pascal <patatetom@gmail.com>
References: <CAGhAaddYD7Y8ObY6Q3Yprhruzb8s6-q0t+GJUv5oYGLR3LCpRg@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAGhAaddYD7Y8ObY6Q3Yprhruzb8s6-q0t+GJUv5oYGLR3LCpRg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [linux-lvm] LVM and RO device/partition(s)
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

Dne 19. 03. 23 v 11:27 Pascal napsal(a):
> hi,
> 
> the bio_check_ro function of the blk-core.c source file of the Linux kernel 
> refers to LVM :
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/block/blk-core.c?h=v6.2.7#n500 <https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/block/blk-core.c?h=v6.2.7#n500>
> 
> how does LVM currently behave when faced with a device marked as readonly ?
> does it automatically switch itself in readonly mode?
> 
> according to some tests carried out in a virtual machine, it seems that it 
> doesn't and that LVM modifies the disk/partition(s) even though they are all 
> readonly (chmod 444 && blockdev --setro).


Hi

There is no extra logic around RO devices in lvm2.  When lvm2 succeeds opening 
device in write mode, it'll use it for writing.

Also note - when you 'activate' a LV in read-write mode - someone opens such 
LV/device and you later on 'lvchange' such active LV to read-only mode - all 
writers will keep writing to such device.

It's not quite clear which kind of problem you are actually hitting - so maybe 
adding some more descriptive  environment +  logs  might give more info about 
your individual case.

Note: root admin typically can overwrite any 'mild' protections...

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

