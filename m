Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010FEC433FE
	for <linux-lvm@archiver.kernel.org>; Tue, 15 Nov 2022 21:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668549376;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0GatKzB8Y2opI76gmQ+daCr1HtnOu7zzmRCevL9Gbs4=;
	b=PQO+crDc+4bhLDAJWvb8MUQic/ehtLc9hJS2r61ksRhwmJpYGMrM4OVeyjZ880iebJvqBB
	QVPuOrH2sEsSGphNe5+uQP9VhpJ/6ZR0DKkNAt5VlrSGsrSQKT/+eNn0YUfX4UZSF94EDd
	qUh/ky4db73iyaiD5WqO7BqeAowJwsI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-VNWl9qJkM5W3UjEB5ulAJw-1; Tue, 15 Nov 2022 16:56:15 -0500
X-MC-Unique: VNWl9qJkM5W3UjEB5ulAJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97728803D4B;
	Tue, 15 Nov 2022 21:56:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDFEA2024CC0;
	Tue, 15 Nov 2022 21:56:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8FA5819465A2;
	Tue, 15 Nov 2022 21:56:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2D76E1946597
 for <linux-lvm@listman.corp.redhat.com>; Tue, 15 Nov 2022 21:56:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B258A35429; Tue, 15 Nov 2022 21:56:06 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB7834EA4D
 for <linux-lvm@redhat.com>; Tue, 15 Nov 2022 21:56:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CBDE3C025D3
 for <linux-lvm@redhat.com>; Tue, 15 Nov 2022 21:56:06 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-22-YwoOXQrMMWiG8hcxvqCAFw-1; Tue, 15 Nov 2022 16:56:04 -0500
X-MC-Unique: YwoOXQrMMWiG8hcxvqCAFw-1
Received: by mail-ed1-f47.google.com with SMTP id x2so23932282edd.2
 for <linux-lvm@redhat.com>; Tue, 15 Nov 2022 13:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FYvTE+dGWrQlRT0WxENaZtuYHcBfkWFOwgRf6zWREU4=;
 b=FecRRC+gBAv8eufCMgYGX2a2Dao9SbyJ+nwCwnL1lSRkCRB0Hbs4pF6ncHII8scHVs
 47pT5OTqs3AKxEEJw2XqALvP1fdgE+vNJBdd+/Xn6mNXOMwwH6pLBng6uN8dF2tnCK7w
 g1sb79jhPm7YSi5yL72+6OIvuc38jW7rIbTUX+ivAhmXjQ10S9qaYLE5Y6Io7oJkH7DY
 YpFaFrvyWDGU6oi6M6Hqne18jQtvLouvqVWlhERsUnVR6RXzxtGBgqAQUcsWf9evVkM3
 YS0ScPmFITHvVP8cFJS4wLhEP6PRuBWdOFyKllarww8vYq4Lc/GOvqINQdH+s6flSwy0
 XsJw==
X-Gm-Message-State: ANoB5plsiJtEK57FyZaKmZQLY50N+z9kidNc/4lMDW27xmXGOzWrD5Xu
 YEvzuL/BN+6aeIqoVUBUndc7F7Qd6XE=
X-Google-Smtp-Source: AA0mqf7MaVxHsumLHEZwFZQ7a2QUhZs90GkpWQqY2BZ8sNdQClbVjYGksJRljwMbHYSfx6YrLaGf5A==
X-Received: by 2002:a05:6402:604:b0:458:d1c4:106f with SMTP id
 n4-20020a056402060400b00458d1c4106fmr16563384edv.408.1668549363118; 
 Tue, 15 Nov 2022 13:56:03 -0800 (PST)
Received: from [192.168.0.177] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 ck11-20020a0564021c0b00b00461b169c02csm6642176edb.91.2022.11.15.13.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 13:56:02 -0800 (PST)
Message-ID: <0c1d5e76-085c-cb46-c477-3bcd70a8acb2@gmail.com>
Date: Tue, 15 Nov 2022 22:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Gionatan Danti <g.danti@assyoma.it>
References: <8404c979411230748aa52deacca89cd8@assyoma.it>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <8404c979411230748aa52deacca89cd8@assyoma.it>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [linux-lvm] lvm-vdo, snapshots and cache
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

Dne 15. 11. 22 v 18:42 Gionatan Danti napsal(a):
> Dear all,
> as previous vdo utils are gone in RHEL9, VDO volumes must be created via 
> lvm-vdo and associated lvm commands.
> 
> What is not clear to me is how to combine lvm-vdo with lvmthin (for fast CoW 
> snapshots) and/or lvmcache (for SSD caching of an HDD pool). For example, with 
> the old /dev/mapper/vdo style volumes (ie: the one created via vdo create) one 
> can do something as physical_dev -> vdo -> lvmthin -> lvmcache.
> 
> How to do the same with lvm-vdo?


Hi

You could try  'vg' on top of another 'vg' - however I'd not recommend to use 
it this way (and it's unssuported (&unsupportable) by lvm2 in general)

We aim to support multiple VDO LV within a single VDOPOOL - will hopefully 
happen relatively soon  (so it should work like with thin pools)

IMHO I'd not recommend to combine 2 provisioning technologies - it's already 
hard to resolve 'out-of-space' troubles with just one technology...

We will see if the 'VDO thick snapshot' will also go with multiple VDO LV 
support - likely not - but will be added later on.

Caching should be already support - on VDO LV as well as on VDOPOOL LV (both 
work somewhat differently).

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

