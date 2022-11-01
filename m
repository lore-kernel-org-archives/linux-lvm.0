Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45749C433FE
	for <linux-lvm@archiver.kernel.org>; Wed,  2 Nov 2022 08:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667378518;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kBxZD6MsXEwwUpIAznMrULaVBhh6ihT5nnVF1KRwIMg=;
	b=dmQgwyAUD/B6cooKnxnu9sFMZd30cAfV7rt8+4xdsKSJKvrWmNsJBEKHcv6WHCSBw+XZQb
	GegsSWbuTiL1ZIRI3Q2DynVj4Ju7i7CUrNbSlnTU8Zdt1xaa2tr3wtrrRL6WLW6Ssb+SaK
	7vPWgrp2TH4Z+HoVqHlP2pQuX0eJhkA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-auJHfQgCPfSRZH5o-3E2jQ-1; Wed, 02 Nov 2022 04:41:55 -0400
X-MC-Unique: auJHfQgCPfSRZH5o-3E2jQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C8BE811E7A;
	Wed,  2 Nov 2022 08:41:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28D1A207AD38;
	Wed,  2 Nov 2022 08:41:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 17C3019465A4;
	Wed,  2 Nov 2022 08:41:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C54B41946594
 for <linux-lvm@listman.corp.redhat.com>; Tue,  1 Nov 2022 17:02:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 817694EA5F; Tue,  1 Nov 2022 17:02:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A13C4EA5C
 for <linux-lvm@redhat.com>; Tue,  1 Nov 2022 17:02:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AC8D87A9E7
 for <linux-lvm@redhat.com>; Tue,  1 Nov 2022 17:02:45 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-46kEoChSNVKuBUXF2H3ycQ-1; Tue, 01 Nov 2022 13:02:33 -0400
X-MC-Unique: 46kEoChSNVKuBUXF2H3ycQ-1
Received: by mail-pf1-f176.google.com with SMTP id 130so14021624pfu.8
 for <linux-lvm@redhat.com>; Tue, 01 Nov 2022 10:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=o7J6FHaCtyOEDs0Ln0p414rXdYZT3VVqCs9Qhgbitpk=;
 b=nnWTyOBkovmAM3g+E7lJt3C4w1J1nl54CVcy4bwh15XvGRXFtxkv91l6f2WD78huPj
 4X2u7tD+2W7q8yEn7FpdQBsvQPXaW9JzctAmcNzHBk+WwPYdn0tAzRtJ3hkwqCtXuw99
 +H2OK40BHE9DC+oWJnT85/m6a4sqLk+2ZyXxV/OplokW6qSCYrIKuFv/xWb+KkjWTnI3
 xI7pqUx8F5upWG96lvyqfojv4r4AQFj5GeqPGK6DdZ1VbYUGRGIKXqBZGbPtTEErKnoF
 fs3kR+OirjYI1lJ/9eg5RycVqf2xcfLYeL7vHUrUG/ZxAz9iO87sPpVMUekvgzHimBUo
 trHA==
X-Gm-Message-State: ACrzQf2e80uGLdCVG98HN74q3IzIw9b/2jNHmcVNubGuO/eEXGSYi8Pe
 lSrn30bGffkZeS2UQRdz5HT9lw==
X-Google-Smtp-Source: AMsMyM72PBlP770eC3uL695hjtRs+E3KxP/wS4TD5tUwZ4jupLNt37mccyIIl8kMQ/NDBHA39UFRYg==
X-Received: by 2002:a63:8bc3:0:b0:46f:fa99:7d76 with SMTP id
 j186-20020a638bc3000000b0046ffa997d76mr2066345pge.134.1667322152232; 
 Tue, 01 Nov 2022 10:02:32 -0700 (PDT)
Received: from [10.254.159.200] ([139.177.225.243])
 by smtp.gmail.com with ESMTPSA id
 c200-20020a621cd1000000b005626a1c77c8sm6770710pfc.80.2022.11.01.10.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 10:02:31 -0700 (PDT)
Message-ID: <bd522c48-03df-1130-54af-bee8a58440f0@bytedance.com>
Date: Wed, 2 Nov 2022 01:02:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
To: David Teigland <teigland@redhat.com>
References: <4b031c4d-b83a-cc92-fabf-cc9cefb4e491@bytedance.com>
 <20221101144230.GA11193@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <20221101144230.GA11193@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Wed, 02 Nov 2022 08:41:47 +0000
Subject: Re: [linux-lvm] How to implement live migration of VMs in thinlv
 after using lvmlockd
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
Cc: damon.devops@gmail.com,
 LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGkgRGF2ZSwKClRoYW5rIHlvdSBmb3IgeW91ciByZXBseSEKCkRvZXMgdGhpcyBtZWFuIHRoYXQg
dGhlcmUgaXMgbm8gd2F5IHRvIGxpdmUgbWlncmF0ZSBWTXMgd2hlbiB1c2luZyBsdm1sb2NrZD8K
CkFzIHlvdSBkZXNjcmliZSwgdGhlIGdyYW51bGFyaXR5IG9mIHRoaW5sdidzIHNoYXJpbmcvdW5z
aGFyaW5nIGlzIHBlciAKcmVhZC93cml0ZSBJTywgZXhjZXB0IHRoYXQgbHZtbG9ja2QgcmVpbmZv
cmNlcyB0aGlzIGxpbWl0YXRpb24gZm9yIHRoZSAKbHZtIGFjdGl2YXRpb24gY29tbWFuZC4KCklz
IGl0IHBvc3NpYmxlIHRvIG1vZGlmeSB0aGUgY29kZSBvZiBsdm1sb2NrZCB0byBicmVhayB0aGlz
IGxpbWl0YXRpb24gCmFuZCBsZXQgbGlidmlydC9xZW11IGd1YXJhbnRlZSB0aGUgbXV0dWFsIGV4
Y2x1c2l2aXR5IG9mIGVhY2ggcmVhZC93cml0ZSAKSU8gYWNyb3NzIGhvc3RzIHdoZW4gbGl2ZSBt
aWdyYXRpb24/CgpUaGFua3MhCgpaaGl5b25nCgrlnKggMTEvMS8yMiAxMDo0MiBQTSwgRGF2aWQg
VGVpZ2xhbmQg5YaZ6YGTOgo+IE9uIFR1ZSwgTm92IDAxLCAyMDIyIGF0IDAxOjM2OjE3UE0gKzA4
MDAsIFpoaXlvbmcgWWUgd3JvdGU6Cj4+IEhpIGFsbCwKPj4KPj4gSSB3YW50IHRvIGltcGxlbWVu
dCBsaXZlIG1pZ3JhdGlvbiBvZiBWTXMgaW4gdGhlIGx2bSArIGx2bWxvY2tkICsgc2FubG9jawo+
PiBlbnZpcm9ubWVudC4gVGhlcmUgYXJlIG11bHRpcGxlIGhvc3RzIGluIHRoZSBjbHVzdGVyIHVz
aW5nIHRoZSBzYW1lIGlzY3NpCj4+IGNvbm5lY3Rpb24sIGFuZCB0aGUgVk1zIGFyZSBydW5uaW5n
IG9uIHRoaXMgZW52aXJvbm1lbnQgdXNpbmcgdGhpbmx2Cj4+IHZvbHVtZXMuIEJ1dCBpZiB3YW50
IHRvIGxpdmUgbWlncmF0ZSB0aGUgdm0sIGl0IHdpbGwgYmUgZGlmZmljdWx0IHNpbmNlCj4+IHRo
aW5sdiB3aGljaCBmcm9tIHRoZSBzYW1lIHRoaW4gcG9vbCBjYW4gb25seSBiZSBleGNsdXNpdmUg
YWN0aXZlIG9uIG9uZQo+PiBob3N0Lgo+Pgo+PiBJIGZvdW5kIGEgcHJldmlvdXMgc3ViamVjdCB0
aGF0IGRpc2N1c3NlZCB0aGlzIGlzc3VlOgo+Pgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAxODAzMDUxNjU5MjYuR0EyMDUyN0ByZWRoYXQuY29tLwo+IAo+IEhpLCBpbiB0aGF0IGVt
YWlsIEkgdHJpZWQgdG8gcG9pbnQgb3V0IHRoYXQgdGhlIHJlYWwgcHJvYmxlbSBpcyBub3QgdGhl
Cj4gbG9ja2luZywgYnV0IHJhdGhlciB0aGUgaW5hYmlsaXR5IG9mIGRtLXRoaW4gdG8gc2hhcmUg
YSB0aGluIHBvb2wgYW1vbmcKPiBtdWx0aXBsZSBob3N0cy4gIFRoZSBsb2NraW5nIHJlc3RyaWN0
aW9ucyBqdXN0IHJlZmxlY3QgdGhhdCB0ZWNobmljYWwKPiBsaW1pdGF0aW9uLgo+IAo+IERhdmUK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJl
ZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBh
dCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

