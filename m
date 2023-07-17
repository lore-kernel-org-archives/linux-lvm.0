Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0DFEB64DC
	for <linux-lvm@archiver.kernel.org>; Mon, 17 Jul 2023 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689596803;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=POv/YdiDE84II/IZUBkx2wZtqXg72Y1cb9S2Py/wO8o=;
	b=ETcZklOgfMlAwt+f4ZpvxuTgsxp63MwZBrswVg6RJUG/m694OmYx05eQhIy47piYkxrUkm
	zEt7JszsAdh9eENydIYrSjKG4pgb+LLUq27bwublW1vd9JuM1EQiPZMEx7OPxlIJ2fptwc
	l+BlI3CURkctznXhA9nrYyeP9P+ImRM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-v3VCr94XMBKixOVxoI6T-w-1; Mon, 17 Jul 2023 08:26:41 -0400
X-MC-Unique: v3VCr94XMBKixOVxoI6T-w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70FC9800CAF;
	Mon, 17 Jul 2023 12:26:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D42704CD0F3;
	Mon, 17 Jul 2023 12:26:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9E1B0194658D;
	Mon, 17 Jul 2023 12:26:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 08C921946588
 for <linux-lvm@listman.corp.redhat.com>; Mon, 17 Jul 2023 12:26:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A8C16200C0F2; Mon, 17 Jul 2023 12:26:27 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1457207B2DA
 for <linux-lvm@redhat.com>; Mon, 17 Jul 2023 12:26:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86E6588D4E1
 for <linux-lvm@redhat.com>; Mon, 17 Jul 2023 12:26:27 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-dWaJB3FRNU2As3PW0t21jg-2; Mon, 17 Jul 2023 08:26:25 -0400
X-MC-Unique: dWaJB3FRNU2As3PW0t21jg-2
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-51e48e1f6d1so5946913a12.1
 for <linux-lvm@redhat.com>; Mon, 17 Jul 2023 05:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689596784; x=1692188784;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6MLcp4cwD5tSTJ6mvrMWTmkqi/Qoat7cV8v9TFjoNY=;
 b=fsf1m/FiIp16CgcFDNX2x7mBd1TA3+441lhK4/VjsH0R+F41U7+7yhbfX8oDMN3OgB
 ZMdCwcvIIFbrI1beEm1aWlE0P8ZeQHftUA+69mbe78dwhVniKOxAbxdb5APwPNgcE1jC
 FUXL9RO9Iw7xKCCR3IabrXPTLJ2Tplkb3PCN34Fv7WOVnEO8dZm3NjrjIII2UzSM7P4i
 FROLtiqVndE2akmInMZaq8fn0+ZC5tSKWZKjdqtJkhmu6skku61WWNU9VdbPuL23Iqqp
 F6iJg1GG82EUszVLuEc1Ey6eDJe5ZV4LDPhqeXYJnfQWtb+LCgyBisYU6b2gZXgbIqnk
 RJjw==
X-Gm-Message-State: ABy/qLaarlIAl0370NT8HrlLgPwUdg7SbqqL7yYIXL6qmu6qdtkNmWlE
 qSE/DYQQiFyWrWCIJQJ8jJyPrbhnmaxWqw==
X-Google-Smtp-Source: APBJJlFrepnsgZLMLh2dysoiWGzYMUEfU6Vs1wEBQdEb+LyAvaQ/2FQF7dqrz1NJ6WdSVWnN7N6f3Q==
X-Received: by 2002:a17:906:11:b0:992:6d73:568e with SMTP id
 17-20020a170906001100b009926d73568emr9758553eja.68.1689596784016; 
 Mon, 17 Jul 2023 05:26:24 -0700 (PDT)
Received: from [192.168.0.177] ([94.142.239.37])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170906080600b00993470682e5sm9115860ejd.32.2023.07.17.05.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 05:26:23 -0700 (PDT)
Message-ID: <36ecd456-b80e-7afe-9fc9-a91b160781af@gmail.com>
Date: Mon, 17 Jul 2023 14:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Anton Kulshenko <shallriseagain@gmail.com>
References: <CAA3xStJ7bRT5iiUy3fY3fkbiHDChbGw5RjMksSQuhPYUXijBCA@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAA3xStJ7bRT5iiUy3fY3fkbiHDChbGw5RjMksSQuhPYUXijBCA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [linux-lvm] ThinPool performance problem with NVMe
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDI0LiAwNi4gMjMgdiAxOjIyIEFudG9uIEt1bHNoZW5rbyBuYXBzYWwoYSk6Cj4gSGVsbG8u
Cj4gCj4gUGxlYXNlIGhlbHAgbWUgZmlndXJlIG91dCB3aGF0IG15IHByb2JsZW0gaXMuwqBObyBt
YXR0ZXIgaG93IEkgY29uZmlndXJlIHRoZSAKPiBzeXN0ZW0sIEkgY2FuJ3QgZ2V0IGhpZ2ggcGVy
Zm9ybWFuY2UsIGVzcGVjaWFsbHkgb24gd3JpdGVzLgo+IAo+IE9TOiBPcmFjbGUgTGludXggOC42
LCA1LjQuMTctMjEzNi4zMTEuNi5lbDh1ZWsueDg2XzY0Cj4gUGxhdGZvcm06IEdpZ2FieXRlIFIy
ODItWjk0IHdpdGggMnggNzcwMiA2NGNvcmVzIEFNRCBFUFlDIGFuZCAyIFRCIG9mIFJBTQo+IERp
c2tzOsKgTlZNZSBTYW1zdW5nIFBNMTczMyA3LjY4IFRCCj4gCj4gV2hhdCBJIGRvOgo+IHZnY3Jl
YXRlIHZnMSAvZGV2L252bWUwbjEgL2Rldi9udm1lMW4xIC9kZXYvbnZtZTJuMSAvZGV2L252bWUz
bjEgL2Rldi9udm1lNG4xCj4gbHZjcmVhdGUgLW4gdGhpbl9wb29sXzEgLUwgMjBUIHZnMSAvZGV2
L252bWUwbjEgL2Rldi9udm1lMW4xIC9kZXYvbnZtZTJuMSAKPiAvZGV2L252bWUzbjEgLWkgNCAt
SSA0Cj4gCj4gLWk0IGZvciBzdHJpcGluZyBiZXR3ZWVuIGFsbCBkaXNrcywgLUk0IHN0cmlwIHNp
emUuIEFsc28gSSB0cmllZCA4LCAxNiwgMzIuLi4gCj4gSW4gbXkgc2V0dXAgSSBjYW4ndCBmaW5k
IGEgYmlnIGRpZmZlcmVuY2UuCj4gCgpzdHJpcGUgc2l6ZSBuZWVkcyB0byBiZSBhbGlnbmVkIHdp
dGggc29tZSAnaHcnIHByb3BlcnRpZXMuCgpJbiB0aGUgY2FzZSBvZiAnTlZNZScgd2hlcmUgdGhl
IHdyaXRlIHVuaXQgZm9yIG9wdGltYWwgcGVyZm9ybWFuY2UgaXMgdXN1YWxseSAKMC41TSBvciBt
b3JlIC0gdXNpbmcgNEsgYmxvY2sgaXMgYmFzaWNhbGx5IG1hc3NpdmVseSBkZXN0cm95aW5nIHlv
dXIgCnBlcmZvcm1hbmNlIHNpbmNlIHlvdSBnZW5lcmF0ZSBmb3IgZWFjaCAgbGFyZ2Ugd3JpdGUg
aHVnZSBhbW91bnQgb2Ygc3BsaXRzLgoKPiBJIG9ubHkgZ2V0IDQwayBpb3BzLCB3aGlsZSBvbmUg
ZHJpdmUgYXQgdGhlIHNhbWUgbG9hZCBlYXNpbHkgZ2l2ZXMgMTMwayBpb3BzLgo+IEkgaGF2ZSB0
cmllZCBkaWZmZXJlbnQgYmxvY2sgc2l6ZXMsIHN0cmlwIHNpemVzLCBldGMuIHdpdGggbm8gcmVz
dWx0LiBXaGVuIEkgCj4gbG9vayBpbiBpb3N0YXQgSSBzZWUgdGhlIGxvYWQgb24gdGhlIGRpc2sg
d2hlcmUgdGhlIG1ldGFkYXRhIGlzOgo+IDgwIFdNQi9zLCAxMjUwMCB3cnFtL3MsIDY4ICV3cnFt
Cj4gCj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgSSdtIG1pc3Npbmcgd2hlbiBjb25maWd1cmlu
ZyB0aGUgc3lzdGVtLgo+IAoKQXMgbWVudGlvbmVkIGJ5IE1hdGhldyAtIHlvdSBsaWtlbHkgc2hv
dWxkIHN0YXJ0IHdpdGggc29tZSAnaW5pdGlhbCcgdGhpbi1wb29sIApzaXplIC0gbWF5YmUgc2l0
dGluZyBmdWxseSBvbiBzaW5nbGUgTlZNZSAtICBwb3NzaWJseSBkZXBsb3kgbWV0YWRhdGEgb24g
Mm5kLiAKTlZNZSBmb3IgYmV0dGVyIGJ1cyB1dGlsaXphdGlvbi4KCkZvciBzdHJpcGluZyAtIHlv
dSB3b3VsZCBuZWVkIHRvIGdvIHdpdGggNTEySyB1bml0cyBhdCBsZWFzdCAtIHRoZW4gaXQncyB0
aGUgCnF1ZXN0aW9uIGhvdyBpdCBmaXRzIHlvdXIgd29ya2xvYWQuLi4KCkFueXdheSBub3cgeW91
IGhhdmUgd2F5IG1vcmUgdGhpbmdzIHRvIGV4cGVyaW1lbnQgYW5kIGJlbmNobWFyayBhbmQgZmln
dXJlIG91dCAKd2hhdCBpcyB0aGUgYmVzdCBvbiB5b3VyIHBhcnRpY3VsYXIgaHcuCgpPbmUgbW9y
ZSB0aGluZyAtIGluY3JlYXNpbmcgY2h1bmtzaXplIHRvIDI1Nksgb3IgNTEySyBhbHNvIG1heSBz
aWduaWZpY2FudGx5IApyYWlzZSB0aGUgcGVyZm9ybWFuY2UgLSBidXQgYXQgdGhlIHByaWNlIG9m
IHJlZHVjZWQgc2hhcmluZyBpbiBjYXNlIG9mIHRha2luZyAKYSBzbmFwc2hvdCBvZiBhIHRoaW4g
dm9sdW1lLi4uCgpSZWdhcmRzCgpaZGVuZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhh
dC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1s
dm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RP
Lwo=

