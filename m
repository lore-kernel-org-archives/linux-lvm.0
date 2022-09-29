Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97175C433FE
	for <linux-lvm@archiver.kernel.org>; Thu, 29 Sep 2022 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664449133;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tSjhkW2cHMmqfnDBrP1uxKjKtAh3czZkYG3X+0ByUsc=;
	b=CP/FKeLjtYijjPdn7hB6+OdxxcMKr3vzRYtl+u2tlsuzFHm8YgOYPxv0+SXq4EqPjpFaqB
	V/vdY/+HhC3LGt4TAon68VZsMJlUaceCH0PPwuoBjKxsteGVRsu10aJm2K+wScJbkBqG0s
	NmFLQWuyfwNbOZxdQsixOaD9LRkFV/U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-5mySTiz-MrKlpuyXyS_nPQ-1; Thu, 29 Sep 2022 06:58:52 -0400
X-MC-Unique: 5mySTiz-MrKlpuyXyS_nPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7E6B3804535;
	Thu, 29 Sep 2022 10:58:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0745040EFB02;
	Thu, 29 Sep 2022 10:58:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C47611946A47;
	Thu, 29 Sep 2022 10:58:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D206119465B8
 for <linux-lvm@listman.corp.redhat.com>; Thu, 29 Sep 2022 10:58:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BEB82492B05; Thu, 29 Sep 2022 10:58:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E96492B04
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 10:58:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CF433804526
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 10:58:46 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-7FuD-qoFMYerGSERqaP-qA-1; Thu, 29 Sep 2022 06:58:43 -0400
X-MC-Unique: 7FuD-qoFMYerGSERqaP-qA-1
Received: by mail-wr1-f51.google.com with SMTP id l18so1563131wrw.9;
 Thu, 29 Sep 2022 03:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=lYEEd75ByDVJFKOtsMTexPX9/DnncJtbHyTD5nYhZ74=;
 b=qrTJIczkHlLv75xQJNmkhU4fBRZjmRh25Nb96QYFfvkh+lxNBNKg/D6LTbI7FMcA/8
 SYcgSOYGjH+hoPi/gGw7qslihli4dxL+4FZye+OQgl/7s9WpzDDBG6LzHlq/vdkTh2py
 F76TrYe5uKgwYgaY+darp3zGT5Nu0iEh0KD+AySFveZdGx0rbpZQMKsGJ89u4ynNPE0L
 8vxpa0ZyqwgaUesY8TJ9NTYt0mrmzO+AFCH69LuacGJU2o1ENmIMb4R/loiERa19Gb8r
 uzfu+WlfJJu+JXWfUnDFpDHNc9SEL9Sc29IVPWIymZws9mW7GGivervYRXDelyIeYuov
 lX0g==
X-Gm-Message-State: ACrzQf2wRrvY113iu/3tigZY8b8W5kIRTdm21Sc5Z39FPq25dUxOAb9U
 qiXHyXepIPYe2s4pyjDsCq/Y2c1mdEg=
X-Google-Smtp-Source: AMsMyM4FhI5cP2q3+v/+UY3DrxX2rgDuW44d3Q//5jNUzOyJvO15z4bpdUO4YlOCf0/ZjK7noOYVXA==
X-Received: by 2002:adf:eb84:0:b0:22a:917e:1c20 with SMTP id
 t4-20020adfeb84000000b0022a917e1c20mr1742274wrn.223.1664449121343; 
 Thu, 29 Sep 2022 03:58:41 -0700 (PDT)
Received: from [192.168.0.177] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a5d4381000000b002205cbc1c74sm6322777wrq.101.2022.09.29.03.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 03:58:40 -0700 (PDT)
Message-ID: <17734cfc-cef2-3f6b-1426-ea8100bdd667@gmail.com>
Date: Thu, 29 Sep 2022 12:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
To: LVM2 development <lvm-devel@redhat.com>,
 =?UTF-8?Q?Bart=c5=82omiej_B=c5=82achut?= <bartlomiejblachut@gmail.com>,
 linux-lvm@redhat.com
References: <CAPA01J3mh6G22h1938GYvPAZunah2Nv+HGikjBef05RBNHBj3w@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAPA01J3mh6G22h1938GYvPAZunah2Nv+HGikjBef05RBNHBj3w@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [linux-lvm] How to change default system dir
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDI4LiAwOS4gMjIgdiAxNzoxNiBCYXJ0xYJvbWllaiBCxYJhY2h1dCBuYXBzYWwoYSk6Cj4g
SGksCj4gSSBoYXZlIGEgcXVlc3Rpb27CoGZvciB5b3UsIGJlY2F1c2Ugd2hhdCBJIG5lZWQgaXMg
dG8gY2hhbmdlIGluIG15IAo+IHVidW50dSgyMi4wNCkgdGhlIGxvY2FsaXNhdGlvbiBvZiBkZWZh
dWx0LXN5c3RlbS1kaXIgZnJvbSAvZXRjL2x2bSB0byBhIHBsYWNlIAo+IHdoZXJlIEkgaGF2ZSB3
cml0ZSBhY2Nlc3MgZS5nLiAvaG9tZS9teV91c2VyL25ld19sdm1fZGlyLiBJJ3ZlIHRyaWVkIHNv
IGZhciB0byAKPiBwcm92aWRlIHRvIC4vY29uZmlndXJlIG9wdGlvbiAKPiAtLXdpdGgtZGVmYXVs
dC1zeXN0ZW0tZGlyPS9ob21lL215X3VzZXIvbmV3X2x2bV9kaXIgb3IgbGF0ZXIgSSByZXBsYWNl
IAo+IGV2ZXJ5d2hlcmUgaW4gY29kZSBwYXR0ZXJuIC9ldGMvbHZtIHRvIC9ob21lL215X3VzZXIv
bmV3X2x2bV9kaXIgYnV0IHdpdGhvdXQgCj4gYW55IHN1Y2Nlc3MuIEFyZSB5b3UgYWJsZSB0byBn
aXZlIG1lIGFueSBpZGVhIGhvdyBJIGNhbiBkbyBpdCA/Cj4gCj4gSSB0cmllZCBpdCBvbiBtYWlu
L3N0YWJsZSBicmFuY2hlc8KgZ2l0Oi8vc291cmNld2FyZS5vcmcvZ2l0L2x2bTIuZ2l0IAo+IDxo
dHRwOi8vc291cmNld2FyZS5vcmcvZ2l0L2x2bTIuZ2l0Pgo+IAoKSGkKCgpsdm0yIGJhc2ljYWxs
eSBhbHdheXMgcmVxdWlyZSBhICdyb290JyBhY2Nlc3MgZm9yIGFueSAncmVhbCB1c2FibGUnIGx2
bTIgCmNvbW1hbmQgLSBzbyBzYXlpbmcgeW91IGRvbid0IGhhdmUgd3JpdGUgYWNjZXNzIHRvIC9l
dGMgIGxvb2tzIHZlcnkgc3RyYW5nZSB0byAKc3RhcnQgd2l0aC4KCldlIGhhdmUgYWxzbyBjb25m
aWd1cmUgb3B0aW9uICAtLXdpdGgtY29uZmRpcj1bL2V0Y10KYnV0IEkgc3RpbGwgdGhpbmsgeW91
IHNob3VsZCBzdGFydCB3aXRoIGV4cGxhaW5pbmcgd2hhdCBhcmUgeW91IGFjdHVhbGx5IAp0cnlp
bmcgdG8gZG8gLSBhcyBtYXliZSB0aGVyZSBpcyBzb21lIGRlc2lnbiBpc3N1ZT8/CgoKUmVnYXJk
cwoKWmRlbmVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlz
dG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBI
T1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

