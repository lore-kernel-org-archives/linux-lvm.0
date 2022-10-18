Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3BAC433FE
	for <linux-lvm@archiver.kernel.org>; Tue, 18 Oct 2022 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666091754;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P/fLjqxMRmGr7IKRBxkoFyeJXgHPdOrYvzAtAQ1uCTY=;
	b=O9Jx2RjANFQTwOFkI6y6BO/DfIlV51KsKtKWSq4TqVKj2ns3/2ha3IpstloR8Vzx2lI0ZE
	cuYGXpJESgeqtKilBOHk3b7Ap1FYftu4uAIYR3d0uD9z3mP5gCYzQDgp9U5p4+C2sseiIq
	/MozXsmqS8yiVaKX/YIv1RPbleQ0h7I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-IH0wGAIDPROJPWBTCJX9jw-1; Tue, 18 Oct 2022 07:15:51 -0400
X-MC-Unique: IH0wGAIDPROJPWBTCJX9jw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35E551C05AB4;
	Tue, 18 Oct 2022 11:15:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1116410DE5;
	Tue, 18 Oct 2022 11:15:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 92C4A1946595;
	Tue, 18 Oct 2022 11:15:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B234C194658F
 for <linux-lvm@listman.corp.redhat.com>; Tue, 18 Oct 2022 11:15:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 33EBC2022C33; Tue, 18 Oct 2022 11:15:43 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CFE62022C2B
 for <linux-lvm@redhat.com>; Tue, 18 Oct 2022 11:15:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E5F73C138B4
 for <linux-lvm@redhat.com>; Tue, 18 Oct 2022 11:15:43 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-ed6zFMfnNTWq3PjvMhRK-Q-1; Tue, 18 Oct 2022 07:15:41 -0400
X-MC-Unique: ed6zFMfnNTWq3PjvMhRK-Q-1
Received: by mail-ej1-f54.google.com with SMTP id w18so31311862ejq.11;
 Tue, 18 Oct 2022 04:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gKsi2sQLbr77HsWyM/JdaX6wN7g4iR8PIk0ukJMKltQ=;
 b=ODCK8/TK59zDG05Lns7RObCuQyZWQbJuLgwkEo4+jR2RMDZxd+EOETCTIyJTTx4/dn
 vAJpPsTRpQ1LMuIZzCj0/yiW1rVP6yEef4uRF89B3A4UocEpSsQyH9UEB45nWZAv3Q3m
 ynYehtX7hS0NUZPVgcw7w2AU3Qc7xUc3G0cwB6wWSkGjUfnEQ8AsqADbbwJrtTr8Yl63
 2eVssZBHHH/Nb+ib67wD+AIDnH+7zHy2AYxx3aPjNtyrb0hHovPX0NG2IXUpl7UPhdTV
 tsXx9vztRtfCPgWfHFTCoM6tEpbeVep/cLtgLVaMXfmqRjYxYSSDsAuTZ7QcfBK8D/Bn
 OveA==
X-Gm-Message-State: ACrzQf0wG+YcKON/gxeXlezPAvTTOzimQNrhwXi6oVwfcs4lzYTAVcem
 il87bZPSxMLKJX5fJyKKYQ/6nSPTuxU+2w==
X-Google-Smtp-Source: AMsMyM4su7lt6/uMYKv7ivI50ogkyQg2sEQuKi8ECMJIsgafND10nMIsPGv3qWjakjdIzPG651TtUg==
X-Received: by 2002:a17:907:60d3:b0:78d:f874:3267 with SMTP id
 hv19-20020a17090760d300b0078df8743267mr1916196ejc.409.1666091739871; 
 Tue, 18 Oct 2022 04:15:39 -0700 (PDT)
Received: from [192.168.0.177] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a170906769400b00783f32d7eaesm7542576ejm.164.2022.10.18.04.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 04:15:39 -0700 (PDT)
Message-ID: <2bb9c754-3e8e-5c6a-c4fb-c4212d8de44f@gmail.com>
Date: Tue, 18 Oct 2022 13:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
To: Pawan Sharma <sharmapawan@microsoft.com>,
 LVM2 development <lvm-devel@redhat.com>,
 "linux-lvm@redhat.com" <linux-lvm@redhat.com>
References: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <91261aec-d0fd-7884-1f38-a575b4e540e2@gmail.com>
 <SI2P153MB0444EE48C7C6E92FB448262ED7249@SI2P153MB0444.APCP153.PROD.OUTLOOK.COM>
 <0e032336-8658-5686-3dfb-0e50cdcb7d91@gmail.com>
 <PUZP153MB0751F596ABAFA828502BA50FAC289@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <PUZP153MB0751F596ABAFA828502BA50FAC289@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [linux-lvm] [EXTERNAL] Re: LVM2 : performance drop even after
 deleting the snapshot
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
Cc: Kapil Upadhayay <kupadhayay@microsoft.com>,
 Mitta Sai Chaithanya <mittas@microsoft.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 18. 10. 22 v 5:33 Pawan Sharma napsal(a):
> Hi Zdenek,
> 
> I would like to highlight one point here is that we are creating and then 
> deleting the snapshot immediately without writing anything anywhere. In this 
> case, we are expecting the performance to go back to what it was before taking 
> the thin snapshot. Here we are not getting the original performance after 
> deleting the snapshot. Do you know any reason why that would be happening.

As explained in my previous post - with thin-provisioning - you are getting 
metadata updates for bTrees - thus there is no 'revert' to previous 'metadata 
state' - there is rolling update of bTrees which is by design 'seek 
unfriendly' - so for the performance hunting users the use of SSD/NVMe type 
storage for these metadata volumes is basically a must (and it's been designed 
for that).

The old 'thick' snapshot where you allocate explicit COW LV storage is going 
to give here your expected behavior - however you will (of course) loose all 
the benefits you get with thin-pools.

With thin-pool (as also mentioned in my previous post) - if you can't afford 
dedicated low-latency storage - you need to scale-up chunk size - so the 
amount of metadata updates is reduced together (lowering seeking). I'm afraid 
you can't expect much more in the near future.

FYI there is to be merged in the upcoming kernel this patch set:

https://listman.redhat.com/archives/dm-devel/2022-October/052367.html

which should also help a lot with multithreaded load on thin-pools

There is also some new metadata format being experimented with - but whether 
this will also tackle anything in the seek friendlier logic is hard to tell...

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

