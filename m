Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA305E71D38
	for <linux-lvm@archiver.kernel.org>; Fri, 29 Sep 2023 13:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695994997;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B0plofhlXiin9E23xYXYDqD4ZHzI+Vw3nE6J4jxoCiI=;
	b=hp5CiYezK5MmI5xmBi4lyTmy04qgzGdjlKCjzYipbdSZVEtrt5k0qOFw6ibozWow0K2yih
	rwF/PUY751J8rDL0Q0ZaZPVsVK7CjgAJJ+58QDQ/NjAP7NZYDKZHMHAQnCNUSjyewi+QIE
	dB8s3XNoGKYJex19OjrDeurJRzWYg+k=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-kYP8FWKJNKe9qVm8W3aEKA-1; Fri, 29 Sep 2023 09:43:14 -0400
X-MC-Unique: kYP8FWKJNKe9qVm8W3aEKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 069903C1F13E;
	Fri, 29 Sep 2023 13:43:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5958F1005E28;
	Fri, 29 Sep 2023 13:43:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D17FB1946588;
	Fri, 29 Sep 2023 13:43:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C751F1946586
 for <linux-lvm@listman.corp.redhat.com>; Fri, 29 Sep 2023 13:41:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B7E5C40C2070; Fri, 29 Sep 2023 13:41:51 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B021740C2064
 for <linux-lvm@redhat.com>; Fri, 29 Sep 2023 13:41:51 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C4593C14761
 for <linux-lvm@redhat.com>; Fri, 29 Sep 2023 13:41:51 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-CbzNeXNfPESd0Wx7JEtYDg-1; Fri, 29 Sep 2023 09:41:49 -0400
X-MC-Unique: CbzNeXNfPESd0Wx7JEtYDg-1
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-9ae2cc4d17eso1906521166b.1
 for <linux-lvm@redhat.com>; Fri, 29 Sep 2023 06:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695994908; x=1696599708;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v8sSV6PpIoFhoSMSmFXnu1wIw+R5Ke0pdLxwxowMKWk=;
 b=pc+qQj9nDab4RgC1guvcbkSPayO0UtJLXOQZZKSf47TxIUVJV7bbqXsqSMh4t0mYOW
 nCfn3FxrJX6wa7vfSQRPk5I1sbVRih5TngQUOXIPpeOGHBD4c0aavNEYqFuxnXJj0/7A
 ISHw1WZhijDOpxBtpXaMJhgYflrj+eAWhP2seao58k04MtduX3IT4Z741FDIInj/cHyc
 SWDem8rzqskdLltrMR3dVX3Z6KoMxMfgqS/j85ARLhfB2ZPOHJvEQK+4iMsEoyaQONBt
 qftwVwgEeeqz2a9ZiGU+hSs/wSEbT14gYmFG/y5I+1hCPNPDZhcqc5JXpeAUpefvoW+Z
 ID/w==
X-Gm-Message-State: AOJu0YwNuSGE2pz/ubp51Sv1bvtOsmGxEYp3ZkJT86uFo7jkm2xBGkTU
 IxQQgcC7vt7spJziE2ygmWuiSfiy2bETVw==
X-Google-Smtp-Source: AGHT+IEoomHFTY+7wkhsIKYkBqxQQ9xxN584GMX8fiUBeDB+WEc8lyD1/zf4ceNRnu6UaFhnIa/u5g==
X-Received: by 2002:a17:906:58c6:b0:9b2:6ce3:bdf3 with SMTP id
 e6-20020a17090658c600b009b26ce3bdf3mr4843243ejs.54.1695994908046; 
 Fri, 29 Sep 2023 06:41:48 -0700 (PDT)
Received: from [10.43.17.103] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 sd18-20020a170906ce3200b009a198078c53sm12449387ejb.214.2023.09.29.06.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 06:41:47 -0700 (PDT)
Message-ID: <f4f236a4-e78a-416c-8ebb-65ed66dd3513@gmail.com>
Date: Fri, 29 Sep 2023 15:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jean-Marc Saffroy <saffroy+redhat@gmail.com>
References: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
 <6e0faedf-f450-4454-a86b-6448a1b4747b@gmail.com>
 <CAM5YWZfL8zf9=re+VU2MiAQcYvXodqDV-08Zu5RkKUMfkDJ7Tg@mail.gmail.com>
 <90d9a21d-f748-4ca1-b327-6c38f4440298@gmail.com>
 <CAM5YWZfbEhSJo_01SXRuxSwRPOWYexxDVm9-3W_+=rP+icHStQ@mail.gmail.com>
 <b7754a3e-ed6f-4f7e-afea-ed24426d7dd5@gmail.com>
 <CAM5YWZdnPJtZ_BDWkspDzoTk=6Zk-BG=eiH6hbVe2F-e57dDhg@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAM5YWZdnPJtZ_BDWkspDzoTk=6Zk-BG=eiH6hbVe2F-e57dDhg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, cs
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDI4LiAwOS4gMjMgdiAxNDoyMyBKZWFuLU1hcmMgU2FmZnJveSBuYXBzYWwoYSk6Cj4gT24g
V2VkLCBTZXAgMjcsIDIwMjMgYXQgNTo0MeKAr1BNIFpkZW5layBLYWJlbGFjIDx6ZGVuZWsua2Fi
ZWxhY0BnbWFpbC5jb20+IHdyb3RlOgo+Pgo+Pj4gV2hhdCBpcyB0aGUgcm9sZSBvZiAiZG1zZXR1
cCBzdXNwZW5kIj8gSSBhbSBoYXZpbmcgdHJvdWJsZSBmaW5kaW5nCj4+PiBkZWNlbnQgZG9jdW1l
bnRhdGlvbiBhYm91dCBpdHMgcHVycG9zZSBhbmQgaG93IGl0J3MgcmVsYXRlZCB0bwo+Pj4gc25h
cHNob3RzLiBJIGRpZCBub3QgbmVlZCBpdCBpbiBteSBleHBlcmltZW50cywgc28gSSBhbSBjdXJp
b3VzLgo+Pj4KPj4KPj4KPj4gU3VzcGVuZCBpcyBmcmVlemluZyBkZXZpY2UncyBpL28gcXVldWUg
ICh0b2dldGhlciB3aXRoIGZyZWV6aW5nIEZTIGxheWVyIC0gc28KPj4gdGhlIHNuYXBzaG90IHNo
b3VsZCBiZSBlYXNpbHkgbW91bnRhYmxlIHdpdGhvdXQgcmVxdWlyaW5nIGV4dGVuc2l2ZSBmc2Nr
Cj4+IG9wZXJhdGlvbiBhcyBpdCB3b3VsZCBiZSBtaXNzaW5nIHNvbWUgaW1wb3J0YW50IG1ldGFk
YXRhIHRvIGJlIHdyaXR0ZW4gb24gZGlzaykKPj4gU28gdGhlIGdvYWwgb2YgYSBzdXNwZW5kIGlz
IHRvIHRha2UgYSAnZ29vZCBwb2ludCBpbiB0aW1lJyB3aGVyZSB0aGUgY29udGVudAo+PiBvZiBz
bmFwc2hvdCBpcyBoYXZpbmcgYWxsICdjb21taXR0ZWQnIHRyYW5zYWN0aW9uIG9uIGRpc2sgaW4g
dmFsaWQgc3RhdGUuCj4gCj4gSXMgdGhpcyBzdGlsbCByZXF1aXJlZCBvciB1c2VmdWwgd2l0aCBh
IGpvdXJuYWxpbmcgRlMgbGlrZSBleHQ0PyBJdCBpcwo+IHJvYnVzdCB0byBwdWxsaW5nIHRoZSBw
bHVnIGF0IGFueSB0aW1lLCBzbyBhbnkgcG9pbnQgaW4gdGltZSBzaG91bGQgYmUKPiBnb29kLCBu
bz8KCldvbmRlcmluZyB3aGVyZSBkbyB5b3UgY2FtZSB0byB0aGUgaWRlYSB0aGF0IGpvdXJuYWxp
bmcgRlMgY2FuIHJlc2N1ZSBzdWNoIApzY2VuYXJpbyBmbGF3bGVzc2x5LiAgU3VyZSAnRlMnIHNo
b3VsZCBub3QgY29tcGxldGVseSBicm9rZSBpdHNlbGYgaWYgeW91IAphdm9pZCB0aGlzIHN1c3Bl
bnNpb24gJiBmc2ZyZWV6ZSAgLSBidXQgb24gdGhlIG90aGVyIGhhbmQgdGhlIGludGVybmFsIApp
bmNvbnNpc3RlbmN5IHdpdGhpbiBhIHNuYXBzaG90IHdvdWxkIHJlcXVpcmUgc29tZSByZXBhaXJp
bmcgb3BlcmF0aW9uIHRvIApoYXBwZW4gLSBhbmQgcG90ZW50aWFsIHJpc2sgb2YgdmFsaWQgZGF0
YSBsb3NzIGFzIGV2ZW4gZXh0NCBieSBkZWZhdWx0IApqb3VybmFscyBvbmx5IGl0J3MgbWV0YWRh
dGEsIGFuZCAnZGF0YScgYXJlIGpvdXJuYWxlZCBvbmx5IGluICdkYXRhPWpvdXJuYWwnIAptb2Rl
IC0gd2hpY2ggaXMgaG93ZXZlciB1c2VkIG9ubHkgYnkgdmVyeSBzbWFsbCBncm91cCBvZiB1c2Vy
cyB3aG8gYXJlIHdpbGxpbmcgCnRvIGdpdmUtdXAgcGVyZm9ybWFuY2UgZm9yIHRoaXMgZmVhdHVy
ZS4KCkluIGFsbCBvdGhlciBjYXNlcyAtIHlvdSB3YW50IHRvIGdldCBGUyBpbnRvIGZyb3plbiBz
dGF0ZSBiZWZvcmUgdGFraW5nIGl0cyAKc25hcHNob3QgLSBzbyB0aGVyZSBpcyBtYXhpbWFsIGNv
bnNpc3RlbmN5LgoKCj4gVGhhdCBzYWlkLCBJIGFtIGN1cmlvdXMgYWJvdXQgd2hhdCBjYW4gYmUg
YWNoaWV2ZWQgd2l0aCBkbXNldHVwCj4gY29tbWFuZHMuIEJ5IGFueSBjaGFuY2UsIGRvIHlvdSBo
YXZlIHBvaW50ZXJzIHRvIGRvY3VtZW50YXRpb24gYmVzaWRlcwo+IHdoYXQncyBpbiB0aGUga2Vy
bmVsIChEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIvKT8KClRoZXJlIGFy
ZSBzb21lIERNIHRhbGtzIGF2YWlsYWJsZSBvbiB0aGUgbmV0IGRlc2NyaWJpbmcgc29tZSB0YXJn
ZXQgbG9naWMgaW4gCmdyZWF0ZXIgZGV0YWlscyB3aXRoIHNvbWUgZHJhd24gYm94ZXMgZGVzY3Jp
YmluZyBJL08gZmxvdyAtIGJ1dCBvdGhlciB0aGVuIAp0aGF0IEknbSBub3Qgc3VyZSB3aGF0IG90
aGVyIGtpbmQgb2YgaGVscCB3b3VsZCBiZSBuZWVkZWQgaGVyZT8KClJlZ2FyZHMKClpkZW5lawoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZt
IG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0
dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCg==

