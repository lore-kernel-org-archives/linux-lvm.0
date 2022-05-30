Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D521DC433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 30 May 2022 15:15:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-REZrEnfYM-GHQTUhqDTODg-1; Mon, 30 May 2022 11:15:17 -0400
X-MC-Unique: REZrEnfYM-GHQTUhqDTODg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 394182A2AD74;
	Mon, 30 May 2022 15:15:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43AA51121314;
	Mon, 30 May 2022 15:15:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A76131947051;
	Mon, 30 May 2022 15:15:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5FCEC19466DF
 for <linux-lvm@listman.corp.redhat.com>; Mon, 30 May 2022 15:15:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3FAEFC15E72; Mon, 30 May 2022 15:15:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BB22C27E97
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 15:15:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 252C6101AA47
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 15:15:09 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-NFTNmPv9Pwqa45wK_cVu5A-1; Mon, 30 May 2022 11:15:07 -0400
X-MC-Unique: NFTNmPv9Pwqa45wK_cVu5A-1
Received: by mail-ej1-f43.google.com with SMTP id gh17so21453285ejc.6
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 08:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:newsgroups:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZBTLwdQvVsHIBEXoWqs+I02/N6UO7XN0Uzf1gcX/2tE=;
 b=JHken9QkvYGPUlJCCrFDGgqdt4+K+QettHEHniKD0EgFMjfe+EqJXOO/pUKWVWb2OO
 XKDP7tlMof/jLHK54kn1a/Bd4fPR2NRtQLN88LZTu5tRH0nmRCU+GHdk9Ijroguoy7pK
 CAbhui5FnB6K7MVfd6D58xC0vIXZ+kG8DpWDij31/76FydyaTTbw8k3QIAjzUs6gQeaI
 l89e0w8u3gyPWnDqV4zPFYr1s0iApLZpTtC1gsuztBEUfOKKRjx4u2kYnYq1UD7ryUXP
 IGwwqtzKrB7Ga/BtTQ9RlDJ39uUmJ2DUuolAGhCIn0S0J7PQlUMWu9cGNAGIXPKCteUI
 gPsw==
X-Gm-Message-State: AOAM530Wf0eEr/ZstDNw4h+clbMMsOB1yqozpVusVlihZhadCWik0u68
 q3Ft6w17F/26tIGwWwDjUqegdc7fzJJKRA==
X-Google-Smtp-Source: ABdhPJyKuC32lOyJ+85y/KDTV57+AMMbM5ugGQz10OF2J4u3LceRy/vsxI0dH7JLEE4rf0x0vo0/ZQ==
X-Received: by 2002:a17:907:1c8d:b0:6f2:eb2:1cd6 with SMTP id
 nb13-20020a1709071c8d00b006f20eb21cd6mr48126373ejc.568.1653923705473; 
 Mon, 30 May 2022 08:15:05 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 18-20020a508e12000000b0042dd4f9c464sm1402678edw.84.2022.05.30.08.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 08:15:05 -0700 (PDT)
Message-ID: <e1896ba1-fc6f-b4f1-d4f9-fac91193dcbc@gmail.com>
Date: Mon, 30 May 2022 17:15:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Abhishek Agarwal <mragarwal.developer@gmail.com>
Newsgroups: gmane.linux.lvm.general
References: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [linux-lvm] lvm commands hanging when run from inside a
 kubernetes pod
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 27. 05. 22 v 9:02 Abhishek Agarwal napsal(a):
> When a kubernetes pod is scheduled on the node having lvm2 libraries already 
> installed and trying to run lvm commands using those node binaries from inside 
> the pod container, the commands hang and are waiting on something to complete. 
> Although when ctrl+c is pressed the terminal session resumes and checking the 
> final code for the execution returns a "0" error code and the commands 
> operation is also carried out successfully.
> 
> 

lvm2 is *NOT* designed to be executed in/from a container.

It cannot work properly as it directly communicates with system's udevd - 
which you likely don't have running in your container.

You could kind of 'fake it' by running lvm2 wihout udev synchronization - but 
this will just open another cave of other problems (missing synchronization).

So your lvm2 command should be always executed on your hosting machine
(since it does control resources without containerization support - like 
devices) and then you should 'pass' created LV to  your container in some way.

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

