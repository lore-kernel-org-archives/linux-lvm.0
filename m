Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862F8E7F124
	for <linux-lvm@archiver.kernel.org>; Tue, 26 Sep 2023 20:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695761726;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Nwc1VS/6Ue2gZI0tIWPJUlW20Qya572Jg+/YVV674xc=;
	b=O+hD/8fxLYZ4aBXHjuvftGYPAWnWtifnaQGf6etdUJgCKN8hkcBuR3IA6f5LDfLG+wF4AR
	mYDhwJYDun7MODWckZfRVrUgFUwe4Hg9pXJObRQViZZCZ3tvENQ2ihlYEFdIA1xC9eTcWC
	Nun3jTltQbz5lOJqi0jQLxyxOzOGnig=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-7GPvHSMfMDazgZVcHevE4w-1; Tue, 26 Sep 2023 16:55:22 -0400
X-MC-Unique: 7GPvHSMfMDazgZVcHevE4w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DA5185A5BF;
	Tue, 26 Sep 2023 20:55:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22AB110EE402;
	Tue, 26 Sep 2023 20:55:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CEDF919465A3;
	Tue, 26 Sep 2023 20:55:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CD074194658D
 for <linux-lvm@listman.corp.redhat.com>; Tue, 26 Sep 2023 20:01:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8E67D40C6E76; Tue, 26 Sep 2023 20:01:01 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8635740C6EA8
 for <linux-lvm@redhat.com>; Tue, 26 Sep 2023 20:01:01 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 600A43C100C3
 for <linux-lvm@redhat.com>; Tue, 26 Sep 2023 20:01:01 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-d5UmkmN7MQKICrfthtMvYg-1; Tue, 26 Sep 2023 16:00:57 -0400
X-MC-Unique: d5UmkmN7MQKICrfthtMvYg-1
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-9ada2e6e75fso1265042466b.2
 for <linux-lvm@redhat.com>; Tue, 26 Sep 2023 13:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695758455; x=1696363255;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dAvI0AN/+QmaSNm7mDBymdC4l9YLG1/+NnzIrIpG4MA=;
 b=Wp7JMTtTL1n8XdcLgKzz2e2BwK9pnRp0yUYqbKLguFCmjKjX7niZDJHqrRp0HVoDs7
 xOXhbtxLf5mRx8TetLiwmqegGCiu8P2iY67639911VgaBrRnAqWWkzwChcYN5y965O3R
 uLCv+mGlkeDrf2LR0/0jA6JWR/ldG3382I68tRTcWDQMRLl671kRPXkzz2MM529KFvfm
 Tye4f+EwNuLL6va6UcO9p/r08Hfh6KDUNWd5pwDtGQnCd6077AVga+onGkAP1E3cTbUK
 84mtHRs+JGoAc4SHvnWEY8ylCGbCm9YVcrZLAXKWyRme/XQhhxRmbnXCqw/tBHgoTV5l
 EKQg==
X-Gm-Message-State: AOJu0YzzlJFs56Ya3TUhGMuEFprdJBJZgXwhYpDjXGJWQUScPBl+fDBc
 MTqkjHk0TLUnNuO2GexVfj5/qAIbbLjd7w==
X-Google-Smtp-Source: AGHT+IFf+7ZpS4d/GIeLJnOJPtVyFG8J7yGayja/Jr2eVIO1SanyWPLGWI9RNZIVHn6sA8vUvhWllw==
X-Received: by 2002:a17:906:73c2:b0:9a1:b7ec:c8bd with SMTP id
 n2-20020a17090673c200b009a1b7ecc8bdmr12291726ejl.42.1695758455332; 
 Tue, 26 Sep 2023 13:00:55 -0700 (PDT)
Received: from [192.168.0.177] ([94.142.239.37])
 by smtp.gmail.com with ESMTPSA id
 qo9-20020a170907874900b009b27d4153c0sm3701451ejc.178.2023.09.26.13.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 13:00:53 -0700 (PDT)
Message-ID: <6e0faedf-f450-4454-a86b-6448a1b4747b@gmail.com>
Date: Tue, 26 Sep 2023 22:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Jean-Marc Saffroy <saffroy+redhat@gmail.com>
References: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [linux-lvm] Can I combine LUKS and LVM to achieve encryption
 and snapshots?
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, cs
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDI1LiAwOS4gMjMgdiAwOjA5IEplYW4tTWFyYyBTYWZmcm95IG5hcHNhbChhKToKPiBIZWxs
byBMVk0gZXhwZXJ0cywKPiAKPiBJIGFtIHRyeWluZyB0byBjcmVhdGUgYSB2b2x1bWUgd2l0aCB0
aGUgZm9sbG93aW5nIHByb3BlcnRpZXM6Cj4gLSB0aGUgdm9sdW1lIGNhbiBiZSByZXNpemVkCj4g
LSB0aGUgdm9sdW1lIGlzIGVuY3J5cHRlZAo+IC0gdGhlIHZvbHVtZSBjYW4gYmUgc25hcHNob3R0
ZWQgKGZvciBvbmxpbmUgYmFja3VwcykKPiAKPiBTbyBJIHRob3VnaHQgSSdkIGNyZWF0ZSB0aGUg
dm9sdW1lIHdpdGggTFZNLCBlbmNyeXB0IGl0IHdpdGggTFVLUywgYW5kIAo+IHNuYXBzaG90IGl0
IHdpdGggTFZNLiBIb3dldmVyLCBMVk0gZG9lc24ndCB3YW50IHRvIHNuYXBzaG90IHRoZSB1bmVu
Y3J5cHRlZCAKPiBMVUtTIHZvbHVtZSwgYXMgaXQgaXMgbm90IGFuIGFjdHVhbCBsb2dpY2FsIHZv
bHVtZSBrbm93biB0byBMVk0gKGFuZCBJIGFtIG5vdCAKPiBrZWVuIG9uIHNuYXBzaG90dGluZyB0
aGUgZW5jcnlwdGVkIHZvbHVtZSwgYXMgdGhhdCBtZWFucyB0aGUgYmFja3VwIHByb2Nlc3MgCj4g
d291bGQgbmVlZCB0aGUgcGFzc3BocmFzZSB0byBtb3VudCB0aGUgZW5jcnlwdGVkIHNuYXBzaG90
KS4KPiAKPiBJcyB0aGVyZSBhIGdvb2Qgd2F5IHRvIGFjaGlldmUgdGhpcyB3aXRoIExVS1MgYW5k
IExWTSwgb3Igc2hvdWxkIEkgbG9vayBlbHNld2hlcmU/Cj4gCj4gSSBoYXZlIHR3byBpZGVhcyBi
dXQgSSBkb24ndCBrbm93IGlmIHRoZXkgYXJlIHNhZmUgb3IgcHJhY3RpY2FsOgo+IC0gSSBjb3Vs
ZCB0cnkgcnVubmluZyBMVk0gKHNuYXBzaG90cykgb250b3Agb2YgTFVLUyAoZW5jcnlwdGlvbilp
dHNlbGYgb250b3AgCj4gb2YgTFZNIChyZXNpemUpCgpIaQoKClllcCB0eXBpY2FsIHVzYWdlIGlz
IHRvIGVuY3J5cHQgdW5kZXJseWluZyBQViAtIGFuZCB0aGVuIGNyZWF0ZSBMVnMgYW5kIGl0cyAK
c25hcHNob3RzIG9uIGVuY3J5cHRlZCBkZXZpY2UuCgoKPiAtIG9yIEkgY291bGQgdHJ5IHdvcmtp
bmcgd2l0aCBkbXNldHVwIHRvIGZpbGwgdGhlIGdhcCBiZXR3ZWVuIExVS1MgYW5kIExWTQo+IAo+
IEkgZGlkIHNpbXBsZSB0ZXN0cyB3aXRoIGRtc2V0dXAsIGFuZCB0aGF0ICpzZWVtcyogdG8gd29y
aywgaG93ZXZlciBJIGFtIG5vdCAKPiBzdXJlIGF0IGFsbCBpZiB0aGF0IHdvdWxkIGJlIHJvYnVz
dC4gQW4gb3V0bGluZSBvZiBteSB0ZXN0Ogo+IC0gY3JlYXRlIGFuIExWTSB2b2x1bWUgKGx2Y3Jl
YXRlKSBmcm9tIGEgbGFyZ2VyIHZvbHVtZSBncm91cAo+IC0gbWFrZSBpdCBhIExVS1Mgdm9sdW1l
IChjcnlwdHNldHVwIGx1a2ZzRm9ybWF0KQo+IC0gIm9wZW4iIHRoZSBMVUtTIHZvbHVtZSAoY3J5
cHRzZXR1cCBvcGVuKQo+IC0gY3JlYXRlIGEgc25hcHNob3Qtb3JpZ2luIHZvbHVtZSBmcm9tIHRo
ZSBvcGVuIExVS1Mgdm9sdW1lIChkbXNldHVwIGNyZWF0ZSkKPiAtIG1vdW50IHRoYXQgYXMgbXkg
YWN0aXZlIHZvbHVtZQo+IC0gZXZlcnkgdGltZSBJIHdhbnQgdG8gZG8gYSBiYWNrdXA6Cj4gIMKg
IGNyZWF0ZSBhIHRlbXBvcmFyeSBzbmFwc2hvdCB2b2x1bWUgZnJvbSB0aGUgb3JpZ2luLCBtb3Vu
dCBpdCwgcnVuIHRoZSAKPiBiYWNrdXAsIHVubW91bnQgaXQsIGRlbGV0ZSBpdAoKVXN1YWxseSB0
aG9zZSAnaW50byBlbmNyeXB0aW9uJyB3YW50IHRvIGhhdmUgZW5jcnlwdGVkIGV2ZXJ5dGhpbmcg
LSB0aHVzIGV2ZW4gCmxheW91dCBvZiB0aGUgd2hvbGUgc3RvcmFnZS4KCkVuY3J5cHRpbmcgJ2lu
ZGl2aWR1YWwnIExWcyAtIHdoaWxlIGNlcnRhaW5seSAnZG9hYmxlJyB3b3VsZCBpLmUuIGNyZWF0
ZSBhIApjb25zaWRlcmFibGUgbGFyZ2VyIGFtb3VudCBvZiB2b2x1bWVzIHRoYXQgd291bGQgbmVl
ZCBpbmRpdmlkdWFsICd1bmxvY2tpbmcnIAp3aXRoIGVhY2ggYWN0aXZhdGlvbi4KClNwZWFraW5n
IGFib3V0IHNuYXBzaG90cyAtIHlvdSBzaG91bGQgY29uc2lkZXIgc3dpdGNoaW5nIHRvICd0aGlu
LXBvb2xzJyAgZm9yIApmYXIgYmV0dGVyIHBlcmZvcm1hbmNlLi4uCgpSZWdhcmRzCgpaZGVuZWsK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1s
dm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRo
YXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQg
aHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

