Return-Path: <SRS0=HjLT=OM=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86684C433EF
	for <linux-lvm@archiver.kernel.org>; Wed, 22 Sep 2021 07:41:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAFF8610A1
	for <linux-lvm@archiver.kernel.org>; Wed, 22 Sep 2021 07:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAFF8610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=maven.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-Vc9DQ2d8MMmPCjd-gteRIg-1; Wed, 22 Sep 2021 03:41:27 -0400
X-MC-Unique: Vc9DQ2d8MMmPCjd-gteRIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FF82835DE1;
	Wed, 22 Sep 2021 07:41:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA39660BF4;
	Wed, 22 Sep 2021 07:41:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D40EF1800FE4;
	Wed, 22 Sep 2021 07:41:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18M7fDRM020149 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 22 Sep 2021 03:41:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D5C9202717B; Wed, 22 Sep 2021 07:41:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97AAB2011C7B
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2021 07:41:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0E7F811E7A
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2021 07:41:00 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-69-gDyFHmb7MV2JfvDkM2jEpA-1; Wed, 22 Sep 2021 03:40:58 -0400
X-MC-Unique: gDyFHmb7MV2JfvDkM2jEpA-1
Received: by mail-lf1-f48.google.com with SMTP id i25so8345899lfg.6
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2021 00:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:from:to:references:in-reply-to
	:content-transfer-encoding;
	bh=kOxPLFy4M93+P4eBD6PuNv6EVLiJSoYDU0yEVgy6P9E=;
	b=NlrEaSO+nRO5AS+7s5m6SkuSHYx110DDUlsFSPWBb/J9D+Gs4t4ipi+nzwOvz2m3ca
	g86Jblb2DlhdPcU4RHokYBCpGrn2iUowuzpHyn2ojiZX0i5c7Jkv03G0MkvwBMewxqPo
	2nVWXXZlR+dms1iYEj5NMLE8UHUFbQPTzAsvWExMiNhcyTqHMPmCCky3m1Tu/8bTex3T
	fir1h6P+ml5tNI2FWtaQDJexVOVdkIy6uQIuqbQfRL88UVNxXWSc0/d4N68DYkeeO+E2
	YDS0vpGiFxXgEX+170H3SKJUu5ZGq5CFxvCSoFsxNbwcW2BOG9lYduWIPx5v8NadusOK
	N6FA==
X-Gm-Message-State: AOAM532jE8isnRzz2psCmlIzyDfEkmtOncE0TSLDoOgGiuHPJf5xMHAp
	y4XJ/XmcMYTXcDNuu4rIKBJutIXjOdg=
X-Google-Smtp-Source: ABdhPJxEF8gfBGbh2zWDyZtJlf3snCRWTFirXqu5PIgKhTPy3MOFj2/brQRHnVriq7EFK6XtfPPP4w==
X-Received: by 2002:a2e:9150:: with SMTP id q16mr32263245ljg.418.1632296457226;
	Wed, 22 Sep 2021 00:40:57 -0700 (PDT)
Received: from [192.168.68.193] (user-5-173-156-29.play-internet.pl.
	[5.173.156.29]) by smtp.gmail.com with ESMTPSA id
	a21sm173067lji.135.2021.09.22.00.40.56 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 22 Sep 2021 00:40:56 -0700 (PDT)
Message-ID: <67321bdd-7ee3-16d8-8bab-559afe3728ca@maven.pl>
Date: Wed, 22 Sep 2021 09:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.1.1
From: =?UTF-8?Q?Arkadiusz_Mi=c5=9bkiewicz?= <arekm@maven.pl>
To: linux-lvm@redhat.com
References: <fd7cf93d-4f51-28a9-d7a8-dd61fd59268b@maven.pl>
In-Reply-To: <fd7cf93d-4f51-28a9-d7a8-dd61fd59268b@maven.pl>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] vgchange -a n --sysinit hangs without udevd
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: pl
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VyBkbml1IDIyLjA5LjIwMjEgb8KgMDk6MTksIEFya2FkaXVzeiBNacWba2lld2ljeiBwaXN6ZToK
Cj4gT3RoZXIgdGVzdDoKPiAKPiBmdWxseSBydW5uaW5nIHN5c3RlbQo+ICMgdWRldmQgLS12ZXJz
aW9uCj4gMjQ2Cj4gIyBraWxsYWxsIHVkZXZkCj4gIyB2Z2NoYW5nZSAtYSBuIC0tc3lzaW5pdCAt
LXZlcmJvc2UgLS1kZWJ1Zwo+ICAgRGVhY3RpdmF0aW5nIGxvZ2ljYWwgdm9sdW1lIHZnc3RvcmFn
ZS9sdmhvbWUuCj4gICBSZW1vdmluZyB2Z3N0b3JhZ2UtbHZob21lICgyNTM6MCkKPiAgIERlYWN0
aXZhdGVkIDEgbG9naWNhbCB2b2x1bWVzIGluIHZvbHVtZSBncm91cCB2Z3N0b3JhZ2UuCj4gYW5k
IGhhbmdzCj4gCj4gCj4gV2h5IGlzIHVkZXZkIG5lZWRlZCBmb3IgdmdjaGFuZ2UgdGhlcmU/IEl0
IHdhc24ndCBuZWVkZWQgdG8gZGVhY3RpdmF0ZQo+IHZnIGJlZm9yZSBBRkFJSy4KCgp2Z2NoYW5n
ZSAtYSBuIC0tc3lzaW5pdCAtLW5vdWRldnN5bmMKCmFsc28gd29ya3MgYnV0IEkgd29uZGVyIHdo
YXQgaGFzIGNoYW5nZWQsIHNvIHRoYXQgdGhpcyBvcHRpb24gaXMgbmVlZGVkIG5vdz8KCi0tIApB
cmthZGl1c3ogTWnFm2tpZXdpY3osIGFyZWttIC8gKCBtYXZlbi5wbCB8IHBsZC1saW51eC5vcmcg
KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
bHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0
IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

