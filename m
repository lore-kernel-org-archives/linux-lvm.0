Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78BDECAAD5
	for <linux-lvm@archiver.kernel.org>; Mon, 29 Aug 2022 10:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661769192;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TnKZ2Hu4Tbq5Cf9nBHNYsazyfgjSIy2sgv5IO6j+zpk=;
	b=IBnWOXG/ibZ/K8w3IYBotwt8VTF52i44KgOyer+SsublemVL/aDiok9Vh1IBJUXft/G734
	Hb0vVqCbLBcKr/Jtj+lxhqHFKgIfJwm9KP7Gvzdl/o0Y+IYdU9nQt4a8a7DeGsfa2wmSh8
	twWYLfQjcup5Xq9O/GnOxUph5gXuK1Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-zUv5M_-aM-aP-X-6QbJfww-1; Mon, 29 Aug 2022 06:33:09 -0400
X-MC-Unique: zUv5M_-aM-aP-X-6QbJfww-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02FE71C08960;
	Mon, 29 Aug 2022 10:33:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AF4D492CA2;
	Mon, 29 Aug 2022 10:33:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C50051946A48;
	Mon, 29 Aug 2022 10:33:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D0A691946A40
 for <linux-lvm@listman.corp.redhat.com>; Mon, 29 Aug 2022 10:33:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A54CC40315A; Mon, 29 Aug 2022 10:33:01 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1838492C3B
 for <linux-lvm@redhat.com>; Mon, 29 Aug 2022 10:33:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A5F9380673F
 for <linux-lvm@redhat.com>; Mon, 29 Aug 2022 10:33:01 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-98-UJaKnawIPmeYuAgGSQGk_Q-1; Mon, 29 Aug 2022 06:32:59 -0400
X-MC-Unique: UJaKnawIPmeYuAgGSQGk_Q-1
Received: by mail-ej1-f46.google.com with SMTP id gb36so14758059ejc.10
 for <linux-lvm@redhat.com>; Mon, 29 Aug 2022 03:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=v5aOEBgQDi4b7mNaclSd5l+j5/bLmlYUWaki+uwPzDI=;
 b=sbtdKTkHcZXsKrlL6n2/VX8ZQ7QRNrgV6pUFLV2MGj1kGgkKVlMcHqMj/UIUB9j8nO
 kS2K/ciKR0LSDdirjCbvlPal906KmmGpFMLT23oCkDlJncyVSd5rD/YL3BgIPQtnQar2
 UvEKj8WmYnJKqRMgH7LIiVQg8hl7TEW/8W2qTc8I/MiNyFeWA99Mp24gbwLh31gsl+Av
 HudWxgFHVq1FzvI5eg9TG79dmglmME17ZBKezLMfeCxK3hlH00Bd28CG0vyy9s4h9Yzf
 pIDnQ6rN8ea4ZbuUKSjJX34AeDql6YVWCxzgqysSWZa6nUOXLLrl2E3uATbRNqyWpu3U
 QDDQ==
X-Gm-Message-State: ACgBeo1tUj9sWRJoB77SqwxSZAVzKKIil2V11dSGBA43cbKCEyoJkEMb
 l3Rdg6gKFh1S7+9saLRi5uX0pOe5Izc=
X-Google-Smtp-Source: AA6agR6ueyYtNhlq3DP95pKJBYmj7GUWrNng7yIMjKitIBV/EeBTKX109KpQa2MlecuTjv0GjGRJOQ==
X-Received: by 2002:a17:907:2894:b0:741:636b:7b6e with SMTP id
 em20-20020a170907289400b00741636b7b6emr5182187ejc.178.1661769178268; 
 Mon, 29 Aug 2022 03:32:58 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a170906538b00b0072b85a735afsm4340736ejo.113.2022.08.29.03.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 03:32:57 -0700 (PDT)
Message-ID: <86c5d0b5-f3ff-ace7-b5e1-f220bab66787@gmail.com>
Date: Mon, 29 Aug 2022 12:32:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Thomas Deutschmann <whissi@whissi.de>
References: <000101d8a432$08688fe0$1939afa0$@whissi.de>
 <d73e7506-a754-55d0-734f-084ffda1d6f2@gmail.com>
 <17c7871a-0849-bd03-40b6-146e338e364e@gmail.com>
 <000601d8a5e6$29a770d0$7cf65270$@whissi.de>
 <000901d8a61c$3adf2fb0$b09d8f10$@whissi.de>
 <63e2968a-cb32-fda5-8810-43f722ae2d28@gmail.com>
 <000c01d8a6d9$908f63e0$b1ae2ba0$@whissi.de>
 <6123ac3e-9571-afc3-149a-71b412db2405@whissi.de>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <6123ac3e-9571-afc3-149a-71b412db2405@whissi.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [linux-lvm] lvcreate hangs forever during snapshot creation
 when suspending volume
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 29. 08. 22 v 0:38 Thomas Deutschmann napsal(a):
> Hi,
> 
> just for the records: My problem is now resolved.
> 
> As expected, my problem was caused by a bug in kernel. A patch was already 
> merged into mainline: 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e053aaf4da56cbf0afb33a0fda4a62188e2c0637 
> 
> 
> Backport for 5.15 and 5.19 is available but pending, 
> https://www.spinics.net/lists/stable/msg588671.html.
> 
> Read https://lore.kernel.org/all/000401d8a746$3eaca200$bc05e600$@whissi.de/ 
> for all details.
> 
> Thank you all for your help!
> 
> 

Hi

Great thanks for the follow-up and good investigation work on this issue.

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

