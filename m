Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BCFC83F10
	for <linux-lvm@archiver.kernel.org>; Thu, 31 Aug 2023 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693477492;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UqrsiNE7MazYd3MAe6toolW0uQ8f4Y6fo0G0A8p49n8=;
	b=RZvfE8piQPPQwgQrxqcLGqBrTPGCGsI5xep2qaiC3B8yCjTO6+8pMbBPeVh2YAbZIaRA0v
	xABS1+9BhgmLqyBpD0gYjyDEhtdZo6/4Kd2PIQnjhJFtZdC0u9nPMJjBw8ixjF4qikxHpq
	Wxmco/edjYUvcjFvRKRHgsKRuAoytxg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-oaB2a6_0PXuoD3iIlvzraw-1; Thu, 31 Aug 2023 06:24:49 -0400
X-MC-Unique: oaB2a6_0PXuoD3iIlvzraw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FCEA858290;
	Thu, 31 Aug 2023 10:24:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FE556B2B5;
	Thu, 31 Aug 2023 10:24:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 650AF1946A7C;
	Thu, 31 Aug 2023 10:24:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 937CE19465B1
 for <linux-lvm@listman.corp.redhat.com>; Thu, 31 Aug 2023 10:14:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6DEE7112131B; Thu, 31 Aug 2023 10:14:23 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65F3A1121315
 for <linux-lvm@redhat.com>; Thu, 31 Aug 2023 10:14:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 467BC1C02149
 for <linux-lvm@redhat.com>; Thu, 31 Aug 2023 10:14:23 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-S_V8uBMNOeK3oiop3EsE7w-1; Thu, 31 Aug 2023 06:14:21 -0400
X-MC-Unique: S_V8uBMNOeK3oiop3EsE7w-1
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2bd0d135ca3so12466511fa.3
 for <linux-lvm@redhat.com>; Thu, 31 Aug 2023 03:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693476860; x=1694081660;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Ur0hEk6RCBOINnRLQJIkaCeQPFUsFQ8o7c1W4run84=;
 b=YWVS/I0+Dz2W/xMKk5sORFdh6FQGfVZzVfmE094+Zuzwc5mamhVV2Vq/x2vOAtohZD
 AVGCUXJ4fosK9fYWvnB/hhpG/fzx+oenPC37azs3FTPmlOiN/a6AU6LabukPfFZQZWcn
 G9duF8LInn8hO1/INuXdIEjEd2IrH/4yEYHNZOqR/Yd3mTyP4nI74bf4RE17QeYs2DKV
 BkN+e37dLnK9Wj3LaE2rb4D3UZUH6OlW4XXtQJkZy84Cxjfb5o/UhjXPeCL8AbKh6he3
 MDkBj6YREKk3R7e7oN9L5ccmRR4rGcGYCeN199HEqPvh4oLWikI0H8ZF6ejDPRF3X/z5
 exKw==
X-Gm-Message-State: AOJu0Yz6sLwWVDEq6H3at+itBd7XHIYTaL/OgGE8UMXImw1weGOBA+OL
 nNf+/2yNPwQJzmgPh6HjL4k=
X-Google-Smtp-Source: AGHT+IEAvGZXV2gBBO5+zqNj5fzqO+YSPq0QKa9nKSDT0I22OkY+aHOO63lIgeCNF4cIdHYYNXOj+g==
X-Received: by 2002:a2e:a498:0:b0:2bd:a85:899e with SMTP id
 h24-20020a2ea498000000b002bd0a85899emr3518822lji.3.1693476858879; 
 Thu, 31 Aug 2023 03:14:18 -0700 (PDT)
Received: from [10.43.17.103] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a1709064a5900b0099bd8c1f67esm589128ejv.109.2023.08.31.03.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 03:14:18 -0700 (PDT)
Message-ID: <e867cf2c-6860-4914-bf39-8c011503b592@gmail.com>
Date: Thu, 31 Aug 2023 12:14:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vishal Chourasia <vishalc@linux.ibm.com>,
 LVM general discussion and development <linux-lvm@redhat.com>
References: <fa1ed1e4-9eae-f921-1506-87b46c13ad1f@linux.ibm.com>
 <3cc29b24-8283-478a-bce2-56c392556391@gmail.com>
 <675f9bba-4c0b-205d-83ff-431567a31fe5@linux.ibm.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <675f9bba-4c0b-205d-83ff-431567a31fe5@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [linux-lvm] Trouble Booting Custom Kernel with QEMU:
 dracut-initqueue timeout waiting for /dev/sysvg/root
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, cs
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDMxLiAwOC4gMjMgdiAwOjQwIFZpc2hhbCBDaG91cmFzaWEgbmFwc2FsKGEpOgo+IE9uIDgv
MzAvMjMgMjA6MDEsIFpkZW5layBLYWJlbGFjIHdyb3RlOgo+PiBEbmUgMzAuIDA4LiAyMyB2IDg6
NDAgVmlzaGFsIENob3VyYXNpYSBuYXBzYWwoYSk6Cj4+PiBIaSBBbGwsCj4+Pgo+ICMgY2F0IC9w
cm9jL2NtZGxpbmUKPiBCT09UX0lNQUdFPShoZDAsZ3B0Mikvdm1saW51ei02LjQuNy0yMDAuZmMz
OC54ODZfNjQKPiByb290PS9kZXYvbWFwcGVyL3N5c3ZnLXJvb3Qgcm8gY29uc29sZT10dHkxIGNv
bnNvbGU9dHR5UzAsMTE1MjAwbjgKPiByZC5sdm0ubHY9c3lzdmcvcm9vdAo+IAo+IEkgaGF2ZSB0
cmllZCBwYXNzaW5nICJyb290PS9kZXYvbWFwcGVyL3N5c3ZnLXJvb3QgcmQubHZtLmx2PXN5c3Zn
L3Jvb3QiCj4gd2l0aCB0aGUgLWFwcGVuZCBvcHRpb24gYW5kIGl0IGhhc24ndCB3b3JrZWQgZWl0
aGVyLgo+Pgo+PiBkcmFjdXQgdGhhdCBuZWVkcyB0byBpbmNsdWRlIGx2bTIgY29kZSBhbmQgYmUg
YWJsZSB0byBhY3RpdmF0ZSBzdWNoIExWCj4+IHByaW9yIHN3aXRjaCB0byByb290ZnPCoCAoaGF2
aW5nIHNvbWV3aGVyZSBpbnNpZGXCoCBsdmNoYW5nZSAtYXkKPj4gdmduYW1lL2x2cm9vdG5hbWUp
Cj4gMS4gSG93IG1heSBJIHZlcmlmeSB0aGF0IGRyYWN1dCBoYXMgaW5jbHVkZWQgbHZtMiBjb2Rl
IG9yIG5vdD8KPiAyLiBXaGljaCBmaWxlIGluIHRoZSBkcmFjdXQgd291bGQgY29udGFpbgo+ICAg
ICBgbHZjaGFuZ2UgLWF5IHZnbmFtZS9sdnJvb3RuYW1lYCBjb2RlPwoKSGkKCklmIHlvdSBhcmUg
bWFraW5nIHJhbWRpc2sgaW1hZ2UgZnJvbSB0aGUgc3lzdGVtIC0gZHJhY3V0IHNob3VsZCBhdXRv
ZGV0ZWN0IApzdWNoIGNhc2UgYW5kIGJ1aWxkIHRoZSBpbWFnZSB3aXRoIGx2bTIgc3VwcG9ydCBp
bnNpZGUgKHVubGVzcyB5b3UndmUgCmluc3RydWN0ZWQgaW4gZHJhY3V0LmNvbmYgdG8gbm90IGRv
aW5nIHNvKS4KCllvdSBjYW4gY2hlY2sgaWYgeW91IGRyYWN1dCByYW1kaXNrIGltYWdlIGNvbnRh
aW5zIC91c3Ivc2Jpbi9sdm0KYW5kIGFsc28gaWYgZGlycyAgaW4gL3Vzci9saWIvZHJhY3V0L2hv
b2tzIGRvIGhhdmUgbHZtMiBzY3JpcHRzIGluc2lkZSBhcyB3ZWxsIAphcyAvZXRjL2x2bS9sdm0u
Y29uZi4KCk5vdCByZWFsbHkgc3VyZSBob3cgYXJlIHlvdSB0cnlpbmcgdG8gYnVpbGQgdGhpcyB5
b3Vyc2VsZiBzaW5jZSB0aGUgRmVkb3JhIAphbmFjb25kYSBpbnN0YWxsZXIgc2hvdWxkIGJlIGRv
aW5nIGFsbCBvZiB0aGlzIGZvciB5b3UgYXV0b21hdGljYWxseSAtIHNvIGhvdyAKZGlkIHlvdSBn
b3QgdG8gdGhlIHBvaW50IHlvdSBkb24ndCBnZXQgdGhpcyBmcm9tIHlvdXIgaW5zdGFsbGF0aW9u
IHRpbWUgPwoKUmVnYXJkcwoKWmRlbmVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQu
Y29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZt
CnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

