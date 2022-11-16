Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6ADC433FE
	for <linux-lvm@archiver.kernel.org>; Wed, 16 Nov 2022 10:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668595858;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZI5GLQM93fgiQk/cStC2WmaSefGkOriGmzE1pcOlUZc=;
	b=dT0JJu33mXw5BAirEelMhayuHTKHp6YjTEKiiDbjNM+48iK3ggoxzV66Ws5smutUtegXzv
	Cj3+2dnKREDeMi/ZgG0JcfBswTUT/bNCSICqEtjz88yxTy4AKSlcYFRDYZAc8JSPzMhuRn
	yPNXwsJ1+/w9HhrJnNm3uzvofoTXDew=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-H0qIWtPbMGCgNNxkvmRlRw-1; Wed, 16 Nov 2022 05:50:55 -0500
X-MC-Unique: H0qIWtPbMGCgNNxkvmRlRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FB17101A56C;
	Wed, 16 Nov 2022 10:50:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D299240C6EC3;
	Wed, 16 Nov 2022 10:50:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C49919465A4;
	Wed, 16 Nov 2022 10:50:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 060CA19465A2
 for <linux-lvm@listman.corp.redhat.com>; Wed, 16 Nov 2022 10:50:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D79861415102; Wed, 16 Nov 2022 10:50:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEFE5140EBF3
 for <linux-lvm@redhat.com>; Wed, 16 Nov 2022 10:50:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 332AC3833285
 for <linux-lvm@redhat.com>; Wed, 16 Nov 2022 10:50:45 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-388-L_fRax_KOaWo2QsbrmDt8w-1; Wed, 16 Nov 2022 05:50:38 -0500
X-MC-Unique: L_fRax_KOaWo2QsbrmDt8w-1
Received: by mail-qv1-f42.google.com with SMTP id ml12so11677642qvb.0
 for <linux-lvm@redhat.com>; Wed, 16 Nov 2022 02:50:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xJeXvdJaotcqBaVUsgKOgNQY0Guog+67IhDo3LwWQMs=;
 b=a+iAm7stb2s+j48PtfvDEwWiGIdhiJ5psSMdMRCpfw36jvlGjKOxX354Hlxo1AUsW7
 KDc6v2Nq6TDJ6pIFgvs5Y1DlmV53iUpw4wTQYuO2yHtyDX0d6TK5O5k0j29WSO/AwPQn
 V0luVMoqlqil1CjXGjlEaWCXMcrJi52drJPN5IL2K7+TMQJ8pLIGDufib7ujLe23q7vD
 d1XgeI/5sHEp5PxTBy2P0XPDuggaFOj76AhaeHlNtjVbhSyllLmyvPuY2SBd79UCdaf/
 6BZN+b/hTKjajrygwktdZzTWBw+Ymz8kEraLrWSk7ulnFjhPxhAgFuV+jRyDlk1sKaE4
 bfUg==
X-Gm-Message-State: ANoB5plMnOAqloQ0rtmzTWGMOR/nYFDRjModO3zFejn6UfooJHNKWSGr
 lNqXZgXbnAughGmvZaHiDQGgF2g/SrU=
X-Google-Smtp-Source: AA0mqf5K8lfRPg8LgSfQWGu3qxDaOSSMgQ6AhXv4ionbU86NMxhdejjmAjHFsW6c6oRI1FqFWZUIpA==
X-Received: by 2002:ad4:4e21:0:b0:4b1:d18b:642a with SMTP id
 dm1-20020ad44e21000000b004b1d18b642amr19782111qvb.11.1668595837485; 
 Wed, 16 Nov 2022 02:50:37 -0800 (PST)
Received: from [10.43.17.48] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 bs40-20020a05620a472800b006bbc3724affsm9937111qkb.45.2022.11.16.02.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 02:50:37 -0800 (PST)
Message-ID: <8865e8e7-fede-d904-8970-771afae19504@gmail.com>
Date: Wed, 16 Nov 2022 11:50:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
To: Gionatan Danti <g.danti@assyoma.it>
References: <8404c979411230748aa52deacca89cd8@assyoma.it>
 <0c1d5e76-085c-cb46-c477-3bcd70a8acb2@gmail.com>
 <df0c4d08b1973c2b506323003f201796@assyoma.it>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <df0c4d08b1973c2b506323003f201796@assyoma.it>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDE1LiAxMS4gMjIgdiAyMzo0MSBHaW9uYXRhbiBEYW50aSBuYXBzYWwoYSk6Cj4gSWwgMjAy
Mi0xMS0xNSAyMjo1NiBaZGVuZWsgS2FiZWxhYyBoYSBzY3JpdHRvOgo+PiBZb3UgY291bGQgdHJ5
wqAgJ3ZnJyBvbiB0b3Agb2YgYW5vdGhlciAndmcnIC0gaG93ZXZlciBJJ2Qgbm90IHJlY29tbWVu
ZAo+PiB0byB1c2UgaXQgdGhpcyB3YXkgKGFuZCBpdCdzIHVuc3N1cG9ydGVkICgmdW5zdXBwb3J0
YWJsZSkgYnkgbHZtMiBpbgo+PiBnZW5lcmFsKQo+IAo+IEhpIFpkZW5laywKPiB5ZWFoLCBJIHdv
dWxkIHN0cm9uZ2x5IGF2b2lkIHRoYXQgb3V0c2lkZSBsYWIgdGVzdGluZy4KPiAKPj4gSU1ITyBJ
J2Qgbm90IHJlY29tbWVuZCB0byBjb21iaW5lIDIgcHJvdmlzaW9uaW5nIHRlY2hub2xvZ2llcyAt
IGl0J3MKPj4gYWxyZWFkeSBoYXJkIHRvIHJlc29sdmUgJ291dC1vZi1zcGFjZScgdHJvdWJsZXMg
d2l0aCBqdXN0IG9uZQo+PiB0ZWNobm9sb2d5Li4uCj4gCj4gVGhlIGlzc3VlIGlzIHRoYXQgZmFz
dCBzbmFwc2hvdHMgYXJlIG9ubHkgcHJvdmlkZWQgYnkgZG0tdGhpbiwgbWVhbmluZyB0aGF0IAo+
IGx2bXRoaW4gaXMgYWxtb3N0IG1hbmRhdG9yeSBmb3IgaW1wbGVtZW50aW5nIGEgcm9sbGluZy9j
b250aW51b3VzIHNuYXBzaG90IAo+IHNjaGVtZS4gQW5kLCBvbiBhIG1vcmUgYmFzaWMgbGV2ZWws
IGlmIHdlIGNhbiBub3Qgc3RhY2sgTFZNIG9uIHRvcCBvZiBhIFZETyBMViAKPiAoaW4gYSBzdXBw
b3J0ZWQgbWFubmVyKSwgaG93IGNhbiB3ZSB0YWtlIGEgc25hcHNob3Qgb2YgdXNlciBkYXRhIHJl
c2lkaW5nIG9uIAo+IHRoYXQgc3BlY2lmaWMgdm9sdW1lPwoKV2VsbCAtIGFzIHNhaWQgLSB2ZyBv
biB2ZyBpcyBiYXNpY2FsbHkgZXF1aXZhbGVudCBvZiB0aGUgb3JpZ2luYWwgTFYgb24gdG9wIG9m
IApWRE8gbWFuYWdlci4KCkJ1dCBzdGlsbCB0aGVzZSBmYXN0IHNuYXBzaG90IGRvIG5vdCBzb2x2
ZSB5b3UgYSBwcm9ibGVtIG9mIGRvdWJsZSAKb3V0LW9mLXNwYWNlIGZhdWx0LgoKPiBUaGlzIHNl
ZW1zIGEgY2xlYXIgcmVncmVzc2lvbiB2cyBhIHNlcGFyYXRlIFZETyBkZXZpY2UuIEFtIEkgbWlz
c2luZyBzb21ldGhpbmc/CgpJdCdzIGdvb2QgZm9yIGV4cGVyaW1lbnRpbmcgLSBidXQgSSdkIG5v
dCBzdWdnZXN0IHRvIHVzZSB0aGlzIHNldHVwLgoKUmVnYXJkcwoKWmRlbmVrCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBs
aXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAu
b3JnL0hPV1RPL0xWTS1IT1dUTy8K

