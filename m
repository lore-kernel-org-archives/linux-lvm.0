Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214C6C6FD1F
	for <linux-lvm@archiver.kernel.org>; Wed, 22 Mar 2023 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679494539;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jnVgxBUOpstVPjlpovLnlHBuRBTorofQ1G8UpssHs5w=;
	b=HGd0YrwOaPmyfUhrWxah3h7VcBc32se5lrSKxq2ma9lCmmgu2BFhRhUxDRoCXgc2Z45yjU
	UU/XNPs0afhaDblsVgO/VkLGZ0JUBBBf/Thctd7F4QRR8aCmZ1xtyJHlYccKfNqvEJLWfg
	b/ZJ1g94Ile3gybNKI73fR5bzCNyLOs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-l4VdmWl_PCOlhKjERcS8RA-1; Wed, 22 Mar 2023 10:15:34 -0400
X-MC-Unique: l4VdmWl_PCOlhKjERcS8RA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5A212814241;
	Wed, 22 Mar 2023 14:15:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 523182166B29;
	Wed, 22 Mar 2023 14:15:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 32C8E19465BC;
	Wed, 22 Mar 2023 14:15:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D8AE819465BA
 for <linux-lvm@listman.corp.redhat.com>; Wed, 22 Mar 2023 14:11:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BAF8EC15BAD; Wed, 22 Mar 2023 14:11:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B31DCC15BA0
 for <linux-lvm@redhat.com>; Wed, 22 Mar 2023 14:11:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9817B88B7AF
 for <linux-lvm@redhat.com>; Wed, 22 Mar 2023 14:11:14 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-HUOYLfOWO2SNVC3fQW2hVA-2; Wed, 22 Mar 2023 10:11:12 -0400
X-MC-Unique: HUOYLfOWO2SNVC3fQW2hVA-2
Received: by mail-ed1-f54.google.com with SMTP id r11so73553309edd.5
 for <linux-lvm@redhat.com>; Wed, 22 Mar 2023 07:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679494271;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ztSxrEqVwdaOMH/zU/fStO46dAWMH5OgaBCtjZx7qs=;
 b=qc/4g2RO4OYGUCd8lStJr6TYW1tPqBa/xGMLATwGWFni+Ar0/yCBOPOrXibBWvWR4K
 WViDBmhML5qDvqsc2zKEOGUrlCBpluuNw87wsP6uzU/3NvysHG4TfwHfvXMfDulxWnfG
 2u6Rjog7kL7pxyNAgkXKNz+mhVUejDWbPTsvln9KoUWqjH+OSH0hv6y9jxUoyUc95gLc
 kt0kYeiQLG1+6ZDRLUBjFCuv3y3CR7MH6l75anie5qHUWyU4U6P+oq4S0oDEPRmWbm7q
 rKwj5n4EU0KJESXlL1QqlZ6pD/oTq873Q25DEVKLpuf5ovL93i4NKDpa3lnkLsF6FNCg
 LBbg==
X-Gm-Message-State: AO0yUKUH/kGbJ2mzQwP+tdlFsHX31XYfKGg8+M8fZByaFagpbHsOHDL+
 1lb5+gncR4VtDa9ijybdi1WWkVQErl5gug==
X-Google-Smtp-Source: AK7set+7qP3/dPxXw5XzF+g/mFS/+ZfoGiZX6C5p8LCdas4dlAGnDLOcpjBXcc/cU5Sig/D596hDbA==
X-Received: by 2002:a17:906:d0da:b0:927:8285:18a3 with SMTP id
 bq26-20020a170906d0da00b00927828518a3mr2384905ejb.0.1679494270832; 
 Wed, 22 Mar 2023 07:11:10 -0700 (PDT)
Received: from [10.43.17.48] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170906748600b008bfe95c46c3sm7304557ejl.220.2023.03.22.07.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 07:11:10 -0700 (PDT)
Message-ID: <699c4cd0-fa9d-09d3-ed4f-e7139ccc1db4@gmail.com>
Date: Wed, 22 Mar 2023 15:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 lacsaP Patatetom <patatetom@gmail.com>
References: <CAGhAaddYD7Y8ObY6Q3Yprhruzb8s6-q0t+GJUv5oYGLR3LCpRg@mail.gmail.com>
 <5b9e31d6-2675-8903-619c-cf33c48f1ba8@gmail.com>
 <CAGhAade3Uzobn5amNYVB489NJ-OOj2MFW591eHVaK3ZoEKr15Q@mail.gmail.com>
 <CAGhAaddCmjQeOrdqueHHpM6znVpvMK_vy8XfTxgsMgWPLwyndQ@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAGhAaddCmjQeOrdqueHHpM6znVpvMK_vy8XfTxgsMgWPLwyndQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [linux-lvm] LVM and RO device/partition(s
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDIwLiAwMy4gMjMgdiAxNzozNyBsYWNzYVAgUGF0YXRldG9tIG5hcHNhbChhKToKPiBoaSwK
PiAKPiBJIGNvbWUgYmFjayB0byB5b3Ugd2l0aCB0aGUgbWVtbyBtZW50aW9uZWQgOiAKPiBodHRw
czovL2dpdGh1Yi5jb20vcGF0YXRldG9tL2x2bS1vbi1yZWFkb25seS1ibG9jay1kZXZpY2UgCj4g
PGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRhdGV0b20vbHZtLW9uLXJlYWRvbmx5LWJsb2NrLWRldmlj
ZT4KPiBJIGhvcGUgdGhhdCBpdCB3aWxsIGFsbG93IHlvdSB0byBiZXR0ZXIgdW5kZXJzdGFuZCB0
aGlzIHByb2JsZW0gb2YgYWx0ZXJhdGlvbiAKPiBvZiB0aGUgZGlzay4KPiAKPiBhcyBJIG1lbnRp
b25lZCwgTFZNIHNob3VsZCBub3JtYWxseS90aGVvcmV0aWNhbGx5IG5vdCB0b3VjaCB0aGUgZGlz
ayBhcyBsb25nIAo+IGFzIGl0IGlzIHJlYWQtb25seSwgYnV0IHdoYXQgYm90aGVycyBtZSB0aGUg
bW9zdCBpcyB0aGUgZmFjdCB0aGF0IEkgY2FuJ3QgCj4gImNhdGNoIHVwIiBieSBjb3JyZWN0aW5n
IHRoZSBuZXcgNi4xLjE1IGtlcm5lbCBhcyBJIGRpZCBiZWZvcmUuCj4gCj4gcmVnYXJkcywgbGFj
c2FQLgo+IAo+IExlwqBsdW4uIDIwIG1hcnMgMjAyMyDDoMKgMTU6MTUsIGxhY3NhUCBQYXRhdGV0
b20gPHBhdGF0ZXRvbUBnbWFpbC5jb20gCgpIaQoKU28gSSdtIHBvc3NpYmx5IGZpbmFsbHkgc3Rh
cnRpbmcgdG8gdW5kZXJzdGFuZCB5b3VyIHByb2JsZW0gaGVyZS4KCllvdSBhcmUgdXNpbmcgeW91
ciBvd24gcGF0Y2hlZCBrZXJuZWwgLSB3aGVyZSB5b3Ugd2VyZSByZXZlcnRpbmcKYTMyZTIzNmVi
OTNlNjJhMGY2OTJlNzliN2MzYzk2MzY2ODk1NTliOSAgbGludXgga2VybmVsIHBhdGNoLgoKd2l0
aG91dCBsaWtlbHkgdW5kZXJzdGFuZGluZyB0aGUgY29uc2VxdWVuY2VzLgoKV2l0aCBrZXJuZWwg
Ni5YIHRoZXJlIGlzIGNvbW1pdCBiZGI3ZDQyMGM2ZjZkMjYxOGQ0YzkwN2NkNzc0MmMzMTk1YzQy
NWUyCm1vZGlmeWluZyBiaW9fY2hlY2tfcm8oKSB0byByZXR1cm4gdm9pZCAgLSBzbyB5b3VyICdy
ZXZlcnRpbmcnIHBhdGNoCmlzIG5vIGxvbmdlciB1c2FibGUgdGhlIHdheSBpdCdzIGJlZW4gY3Jl
YXRlZC4KCgogRnJvbSB5b3VyIGdpdGh1YiByZXBvcnQgaXQgc2VlbXMgeW91IGFyZSBjcmVhdGlu
ZyAgJ3JhaWQnIGFjcm9zcyAzIHNkYiBkcml2ZXMuCgpTbyB3aXRoIG5vcm1hbCBrZXJuZWwgLSBp
dCBoYXBwZW5zIHRvIGJlIHRoYXQgICdkbScgZHJpdmVzIGFyZSBhbGxvd2VkIHRvIApieXBhc3Mg
YW55ICdyZWFkLW9ubHknIHByb3RlY3Rpb24gc2V0IG9uIGEgZGV2aWNlLgoKU28gd2hlbiB5b3Ug
YWN0dWFsbHkgY3JlYXRpbmcgcmFpZCBMViBvbiAgbG9vcDAgJiBsb29wMSAtIGRlYWN0aXZhdGUs
IHRoZW4geW91IAptYWtlIGxvb3AwICYgbG9vcDEgIHJlYWQtb25seSwgYWN0aXZlIHJhaWQgTFYg
LSB0aGVuIHlvdSBjYW4gZWFzaWx5IGNhbGwgCidta2ZzJyBhbmQgaXQgd2lsbCBub3JtYWxseSB3
b3JrLgoKUmFpZCBkZXZpY2UgY29uc2lzdCBvciAgJ19yaW1hZ2UnICYgJ19ybWV0YScgTFYgcGVy
IGxlZyAtIHdoZXJlIF9ybWV0YSBpcyAKbWV0YWRhdGEgZGV2aWNlIHVwZGF0ZWQgd2l0aCBhY3Rp
dmF0aW9uIG9mIHJhaWQgTFYuCgpTbyB3aGVuIHlvdXIgbG9jYWwgJ3JldmVydCcgcGF0Y2ggZm9y
IDYuWCBrZXJuZWwgbm8gbG9uZ2VyIHdvcmtzIC0gdGhlcmUgaXMgbm8gCnN1cnByaXNlIHRoYXQg
eW91ciAgJ3NkYlgnIGRyaXZlcyBhcmUgYmVpbmcgYWN0dWFsbHkgbW9kaWZpZWQgLSBzaW5jZSBB
VE0gIGRtIAp0YXJnZXRzIGFyZSBhbGxvd2VkIHRvIGJ5cGFzcyAgcmVhZC1vbmx5IHByb3RlY3Rp
b24uCgpTaW5jZSB0aGUgcmVhc29uIGZvciB0aGUgICdieXBhc3MnIChzbmFwc2hvdCByZWFkLW9u
bHkgYWN0aXZhdGlvbikgIHdhcyBmaXhlZCAKNSB5ZWFycyBhZ28gd2Ugc2hvdWxkIHByb2JhYmx5
IGJ1aWxkIHNvbWUgYmV0dGVyIHdheSBob3cgdG8gcmVzdG9yZSB0byAKJ3JlYWQtb25seScgcHJv
dGVjdGlvbiAtIGFuZCBhbGxvdyB0byBkaXNhYmxlIGl0IG9ubHkgd2hlbiB1c2VyIHJlcXVlc3Rz
IHN1Y2ggCmJlaGF2aW9yIGR1ZSB0byB1c2Ugb2Ygb2xkIHVzZXItc3BhY2UgdG9vbGluZy4KClJl
Z2FyZHMKClpkZW5lawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczov
L2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBM
Vk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCg==

