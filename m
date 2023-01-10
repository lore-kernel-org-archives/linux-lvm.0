Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F79C46467
	for <linux-lvm@archiver.kernel.org>; Tue, 10 Jan 2023 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673337620;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Kkjw/KlmYm+yNgHXshhyrPp9c8qDxJdqXxVaAsJKRLg=;
	b=cbtRTpRxwYR580y3sObxCnHCmAADHkNUaCaT25xqrAn2Y1JHOreHoCtpl8WeOc/N1ev4um
	SffNCqdLwNmGswMmSonNjyyuMu3VcF+nPq2stdmy8QjiukKDHycPVcudZt2t3tdY99IPSD
	QH+PCNUPiDC3xxA5Fhb2uyCF/fqAjHQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-QES3KjoNPSeO1SHfWvfIWg-1; Tue, 10 Jan 2023 03:00:16 -0500
X-MC-Unique: QES3KjoNPSeO1SHfWvfIWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 478863C0E46B;
	Tue, 10 Jan 2023 08:00:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E8CE140EBF5;
	Tue, 10 Jan 2023 08:00:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1FA8F1940379;
	Tue, 10 Jan 2023 08:00:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AD9131946587
 for <linux-lvm@listman.corp.redhat.com>; Tue, 10 Jan 2023 03:48:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 58522140EBF6; Tue, 10 Jan 2023 03:48:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50CC9140EBF5
 for <linux-lvm@redhat.com>; Tue, 10 Jan 2023 03:48:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34F9D85A588
 for <linux-lvm@redhat.com>; Tue, 10 Jan 2023 03:48:58 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-lrqfsRVTPda742ZT1AmLJg-1; Mon, 09 Jan 2023 22:48:56 -0500
X-MC-Unique: lrqfsRVTPda742ZT1AmLJg-1
Received: by mail-pf1-f180.google.com with SMTP id a184so7790214pfa.9
 for <linux-lvm@redhat.com>; Mon, 09 Jan 2023 19:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ULps+T5ByFGXnZcRgojyNDivmabQKUTiWF3aQQmgPhI=;
 b=3pplltCZT91RuiiV426MzwqLbZFIP6syppoOEArx2fSNQ8wCR+DwV/F2Lfkd5L2WE8
 M0gvaJhlV6XPU84QgkD7WyHm2y0+u3ZpVRDTBaIKzBWLrPN0cLTINMa7zAwAgfaLAwC1
 CgmCzc7XHBcRhzMnhvw+UgliHaWddXWffttnuVhWTzm8hUwTjq/lHpAAz6SDOKJ/JTt3
 JltNVSHpCEHENDENJHJuAyax1SOjEaaLwVX/1K+jcK9PUoJFr86X2RzRYPy88KaHSSte
 D6lHD12d/MlxFaRGj8TcYS0PiBx5YGip7UP9s7Nj7oIDtx6u5aLXKOQvEQOP61+NZ9gR
 lCrA==
X-Gm-Message-State: AFqh2kodye4PrZPiUmAkjaycNkSr+jczg3JUZX6t/nNqBRvVW2iIHAHm
 h+5ckS4XGIehIhcW2xkKKE1tBA==
X-Google-Smtp-Source: AMrXdXvxmKoFZAol58kAoTzgKd077IuVAaXUkbOijz5HB7b/VNETAAkoDXNz0GbpZdZAt9svlz20kQ==
X-Received: by 2002:aa7:9685:0:b0:589:6338:9650 with SMTP id
 f5-20020aa79685000000b0058963389650mr3944941pfk.5.1673322535355; 
 Mon, 09 Jan 2023 19:48:55 -0800 (PST)
Received: from [10.254.157.45] ([139.177.225.228])
 by smtp.gmail.com with ESMTPSA id
 z30-20020aa7991e000000b005898fcb7c2bsm2024082pff.170.2023.01.09.19.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 19:48:54 -0800 (PST)
Message-ID: <82a25856-bba4-8f9f-a5f5-4a3cd2d65200@bytedance.com>
Date: Tue, 10 Jan 2023 11:48:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Zdenek Kabelac <zkabelac@redhat.com>,
 LVM general discussion and development <linux-lvm@redhat.com>
References: <eed877f5-53f5-101b-44ab-a61f1328e62f@bytedance.com>
 <930cea69-8e7a-d0df-a48c-93e7a668be2f@redhat.com>
 <d2c5bef2-a418-049e-1ff8-160375881e90@bytedance.com>
 <2b1466c2-f545-d06a-6ce4-d420ed038ad1@gmail.com>
 <ffd6b6d7-c197-1e3a-4b9b-c6fe8271a82d@bytedance.com>
 <255eaaae-e30b-2e69-cc03-38ca34902d16@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <255eaaae-e30b-2e69-cc03-38ca34902d16@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:00:09 +0000
Subject: Re: [linux-lvm] [External] Re: The feasibility of implementing an
 alternative snapshot approach
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hi Zdenek,

Thank you for your patience and explanations. I learned a lot from our 
discussions and thank you again for your help.

Regards

Zhiyong

On 1/10/23 6:18 AM, Zdenek Kabelac wrote:
> Dne 09. 01. 23 v 7:21 Zhiyong Ye napsal(a):
>> Hi Zdenek,
>>
>> Thank you for your detailed answer.
>>
>> For the thin snapshot I will use the latest version of kernel and lvm 
>> for further testing. I want to use both snapshot methods (thin and 
>> thick) in the production environment. But if the thick snapshot is 
>> only still in the maintenance phase, then for thick lv I have to see 
>> if there is any other way to accomplish the snapshot function.
> 
> FYI - there are still some delays with up-streaming of the latest 
> improvement patches - so stay tuned for further speedup gains & IO 
> throughput with thin provisioning)
> 
> By the maintenance phase for old thick snapshot I mean - the development 
> of the existing thick snapshot target is basically done - the format is 
> very ancient and cannot be changed without major rewrite of the whole 
> snapshot target as such - and that's what we've made with newly 
> introduced thin-provisioning target which addressed many shortcomings of 
> the old dm-snapshot target.
> 
>> I use lvm mainly for virtualized environments. Each lv acts as a block 
>> device of the virtual machine. So I also consider using qemu's own 
>> snapshot feature. When qemu creates a snapshot, the original image 
>> used by the virtual machine becomes read-only, and all write changes 
>> are stored in the new snapshot. But currently qemu's snapshots only 
>> support files, not block devices.
> 
> Depending on the use-case it might matter to pick the best fitting 
> chunk-size.
> i.e. if the changes are 'localized' in the filesystem areas to match 
> thin-pool chunks (also selection of the filesystem itself might be part 
> of equation here) - even if you use snapshots a lot, you may eventually 
> get better result with bigger chunks like 128k or even 256k size instead 
> of default 64K.
> 
> Regards
> 
> Zdenek
> 

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

