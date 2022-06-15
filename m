Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB9DC433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 16 Jun 2022 07:33:30 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-yyAXt1ZjPLyUBYROYc4cHw-1; Thu, 16 Jun 2022 03:33:26 -0400
X-MC-Unique: yyAXt1ZjPLyUBYROYc4cHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AE9F811E76;
	Thu, 16 Jun 2022 07:33:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 395132026985;
	Thu, 16 Jun 2022 07:33:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E4676194705B;
	Thu, 16 Jun 2022 07:33:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B71A81947B84
 for <linux-lvm@listman.corp.redhat.com>; Wed, 15 Jun 2022 09:46:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 98C4C492CA6; Wed, 15 Jun 2022 09:46:42 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94245492CA5
 for <linux-lvm@redhat.com>; Wed, 15 Jun 2022 09:46:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AE27101E985
 for <linux-lvm@redhat.com>; Wed, 15 Jun 2022 09:46:42 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-CwlqIroKODqdqiUFb9m5hg-1; Wed, 15 Jun 2022 05:46:40 -0400
X-MC-Unique: CwlqIroKODqdqiUFb9m5hg-1
Received: by mail-pl1-f181.google.com with SMTP id k7so598613plg.7
 for <linux-lvm@redhat.com>; Wed, 15 Jun 2022 02:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zkCZ/uDvE0mV1rAfPiu7MqB0PQV30DGk9aBbXqbduVk=;
 b=SZhZYZK9Kap00IesfoRF41Z7wItxbEalSgeJqIHMZ+RvsDZmxxRxgtf+iEvKYQPzDe
 uDQVWNwlbkVYpMVHDeyxnPYL7g5s0V9eDD5kS7TGgyH6gDBGPN5ZSEJzDuW3Q/DejFhN
 soJiF8w9IWuaWAa99GhnXTgd3OQrZhpUHspFjRG0GdFeaMfnY6oG/iwiqVpk1q7RfkmW
 TsKIFFWx8Hy6gtCgCe4l6XseadRCt53z3HsOzyI75m4CO3X9yhtMOVaJ/uMEqVWdtyB1
 vqPQ/LF4kOv/hQMpafG01oRWlhDPGRG5o+ZH/mF/YXnJqzujDEl/IudK9B6Ft0TsvgMO
 Q0uA==
X-Gm-Message-State: AJIora9S3/TJEPJZuDGOUbS32fukqJ1eWGxP3BE+yFwVH7Q9TXXJxJud
 pkrvuoSgSG26uU6tykGn4xDSL5GpI1aFww==
X-Google-Smtp-Source: AGRyM1u4JeWhyV9jl7YJ3iI5sYBhpfZvq/16hbjXVrLEsEyTftjKLC9+ylwCoMT8ehpSKIyD35lTCg==
X-Received: by 2002:a17:902:e484:b0:167:5b79:2b61 with SMTP id
 i4-20020a170902e48400b001675b792b61mr8306553ple.132.1655286399302; 
 Wed, 15 Jun 2022 02:46:39 -0700 (PDT)
Received: from [10.87.58.194] ([139.177.225.245])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a170902a38800b001674d61c1c6sm8789588pla.272.2022.06.15.02.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 02:46:38 -0700 (PDT)
Message-ID: <ad5c7a16-1a66-488a-46c8-10bb3fdd6e60@bytedance.com>
Date: Wed, 15 Jun 2022 17:46:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
To: Gionatan Danti <g.danti@assyoma.it>
References: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
 <e779f9dc7139963adfa64b03eca170f3@assyoma.it>
 <8baee796-9bfb-47a8-1661-7e94437826c9@bytedance.com>
 <daaa5fa473c1ce56f9d9d4e149047fe6@assyoma.it>
 <5970db8d-462f-0e35-741c-fa0fdc188fa2@bytedance.com>
 <d927c03eef10c508161ad52daa7e908e@assyoma.it>
 <d354dfb0-c37e-8a85-6cf6-d4b3a7e9257d@bytedance.com>
 <31a7b7e9ea9e60fe42d93f6f113fcaf0@assyoma.it>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <31a7b7e9ea9e60fe42d93f6f113fcaf0@assyoma.it>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Thu, 16 Jun 2022 07:33:19 +0000
Subject: Re: [linux-lvm] Why is the performance of my lvmthin snapshot so
 poor
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgrlnKggNi8xNS8yMiA1OjM0IFBNLCBHaW9uYXRhbiBEYW50aSDlhpnpgZM6Cj4gSWwgMjAyMi0w
Ni0xNSAwOTo0MiBaaGl5b25nIFllIGhhIHNjcml0dG86Cj4+IEkgcmVnZW5lcmF0ZWQgdGhlIHRo
aW4gdm9sdW1lIHdpdGggdGhlIGNodW5rc2l6ZSBvZiA2NEsgYW5kIHRoZSByYW5kb20KPj4gd3Jp
dGUgcGVyZm9ybWFuY2UgZGF0YSB0ZXN0ZWQgd2l0aCBmaW8gNjRrIHJlcXVlc3RzIGlzIGFzIGZv
bGxvd3M6Cj4+IGNhc2XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpb3Bz
Cj4+IHRoaW4gbHbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA5MzgxCj4+IHNuYXBz
aG90dGVkIHRoaW4gbHbCoMKgwqDCoCA4MzA3Cj4gCj4gQXMgZXhwZWN0ZWQsIGluY3JlYXNpbmcg
SS9PIHNpemUgKHRvIGF2b2lkIHIvbS93KSBncmVhdGx5IHJlZHVjZWQgdGhlIAo+IGlzc3VlICh0
aGUgfjExJSBoaXQgaXMgZHVlIHRvIG1ldGFkYXRhIGFsbG9jYXRpb24gb3ZlcmhlYWQpLgo+IAo+
IEkgZG9uJ3Qgc2VlIGFueXRoaW5nIHdyb25nLCBzbyBJIHRoaW5rIHlvdSBoYWQgdG8gbGl2ZSB3
aXRoIHRoZSAKPiBwcmV2aW91c2x5IHJlY29yZGVkIDEweCBwZXJmb3JtYW5jZSBoaXQgd2hlbiBv
dmVyd3JpdGluZyA0SyBibG9ja3Mgb24gYSAKPiA2NEsgY2h1bmsgc2l6ZSB0aGluIHZvbHVtZS4u
LgoKSSBhbHNvIHRoaW5rIGl0IG1lZXRzIGV4cGVjdGF0aW9ucy4gQnV0IGlzIHRoZXJlIGFueSBv
dGhlciB3YXkgdG8gCm9wdGltaXplIHNuYXBzaG90IHBlcmZvcm1hbmNlIGF0IHRoZSBjb2RlIGxl
dmVsPyBEb2VzIGl0IGhlbHAgdG8gcmVkdWNlIAp0aGUgY2h1bmtzaXplIHNpemUgaW4gdGhlIGNv
ZGUsIEkgc2VlIGluIHRoZSBoZWxwIGRvY3VtZW50YXRpb24gdGhhdCB0aGUgCmNodW5rc2l6ZSBj
YW4gb25seSBiZSA2NGsgbWluaW11bS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5j
b20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0K
cmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

