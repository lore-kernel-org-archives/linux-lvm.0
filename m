Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBF8C433F5
	for <linux-lvm@archiver.kernel.org>; Fri, 20 May 2022 15:16:27 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-AyXi13exMAK79hxbjkkoyw-1; Fri, 20 May 2022 11:16:25 -0400
X-MC-Unique: AyXi13exMAK79hxbjkkoyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFD1C1C068C4;
	Fri, 20 May 2022 15:16:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 558691121314;
	Fri, 20 May 2022 15:16:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D5639194705A;
	Fri, 20 May 2022 15:16:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 54723194704C
 for <linux-lvm@listman.corp.redhat.com>; Fri, 20 May 2022 15:16:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 36758C44AE2; Fri, 20 May 2022 15:16:18 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3226EC44AE1
 for <linux-lvm@redhat.com>; Fri, 20 May 2022 15:16:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B4531C068C2
 for <linux-lvm@redhat.com>; Fri, 20 May 2022 15:16:18 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-LWcKk6GoNtupyfyowIvi_Q-1; Fri, 20 May 2022 11:16:16 -0400
X-MC-Unique: LWcKk6GoNtupyfyowIvi_Q-1
Received: by mail-ej1-f53.google.com with SMTP id gh17so3169076ejc.6
 for <linux-lvm@redhat.com>; Fri, 20 May 2022 08:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lWHCwiRLJQgYH4vrGfuNeP7Dam/0MLKClvodsKkwqfo=;
 b=vZE3GxiCkLBbTvUiGymh2OxnQuG04ZLfaUWQkLIrLSZnMBaI8Wvhh3N/hvLSy68mhx
 MCTYrbBf1Ake1aEW0LWhQ4s8Mgwtgj8T4Yhuz2I0SWfK4RU96MSuv4kR/74kxgSGCTrJ
 X6Jmn3aek7xHyUR2mIwbv6CGZbsPoAxl6RYcKumI+q8nbbD8AwOmAiLR5ql94FK1z4FZ
 yLZ5gKzNcOzDGGPPC3plnq4hOq1Nvq6O0mQbIWoUTjv1Z9WGCcYsp2yGmR6zyncWfqsj
 EZuLXeO0Hsw0sfINZoqgWDug8s8Bu+UcN3z5JV0kibj73Aj5iX/PGESnZvV4dx0lsXgk
 h9GQ==
X-Gm-Message-State: AOAM5313iS0lgxWq/iiRj4sOZK0ip4IZob0ngtAXd/2D+7Six9SR895g
 i/r2Ff6rJSIebyS9VYX98KpuAmoL4yjbug==
X-Google-Smtp-Source: ABdhPJxMgf6g2RiVBTa2Y5dKEERJ73iOjaIsID7JqzWpiz8Hmse7VxetpIlJIdFDamu4icbgqZOtFA==
X-Received: by 2002:a17:907:1c06:b0:6df:b257:cbb3 with SMTP id
 nc6-20020a1709071c0600b006dfb257cbb3mr9048970ejc.631.1653059774726; 
 Fri, 20 May 2022 08:16:14 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906008400b006fe8a4ec62fsm2949257ejc.4.2022.05.20.08.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 08:16:14 -0700 (PDT)
Message-ID: <bdb01c04-868b-97e9-a052-54fa4460aec4@gmail.com>
Date: Fri, 20 May 2022 17:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 "Yu, Mingli" <Mingli.Yu@windriver.com>
References: <CO1PR11MB5009B1F51212981FB8292E99F1D19@CO1PR11MB5009.namprd11.prod.outlook.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CO1PR11MB5009B1F51212981FB8292E99F1D19@CO1PR11MB5009.namprd11.prod.outlook.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [linux-lvm] The lvm partiton size is not accurate
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

Dne 18. 05. 22 v 12:35 Yu, Mingli napsal(a):
> Hi Experts,
> 
> When use lvcreate to claim 72M partition, but it turns out to be 69M, more 
> details as below, any hints?
> 

lvm2 partition size *IS* 72M

DF reports amount of space in your filesystem - which will be always smaller 
then the actual size of partition itself.

I.e. try to do exact same steps with i.e. GPT partition size - you will get 
very much same results.

So simply said:

lvm2 partitions size >> size of filesystem user usable size

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

