Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BE6EE4993
	for <linux-lvm@archiver.kernel.org>; Sat, 19 Aug 2023 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692461197;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TdJZG5ostHPLuj4OIL0V5wtngMiaH8jvKaApiUTOBjg=;
	b=hc8A7k6LVx4kMEzgZ1AI8yyv9y2COrNjhqyxzHqN49p2HBAVgiHuJjBazwIg24VEF4cEv9
	xDETe5o/f5DsiZZRUSdFa0bN3gXIYASFzuwcP5KwAEWe3pdsZQBWI+y6/upyR7w0SKIFio
	NkUe03eteEgI25aGe7sb6YDMqpzoCWw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-lM_0FSkbN364Ck0VAldQJA-1; Sat, 19 Aug 2023 12:06:34 -0400
X-MC-Unique: lM_0FSkbN364Ck0VAldQJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93D8C380671B;
	Sat, 19 Aug 2023 16:06:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E546C15BAD;
	Sat, 19 Aug 2023 16:06:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1AC641946589;
	Sat, 19 Aug 2023 16:06:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E0C31946587
 for <linux-lvm@listman.corp.redhat.com>; Sat, 19 Aug 2023 16:06:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4764C2026D2C; Sat, 19 Aug 2023 16:06:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4022D2026D2B
 for <linux-lvm@redhat.com>; Sat, 19 Aug 2023 16:06:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 696D03C02552
 for <linux-lvm@redhat.com>; Sat, 19 Aug 2023 16:06:02 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-512-ma6LRfU7PYup3pgpWDtjnQ-1; Sat,
 19 Aug 2023 12:06:00 -0400
X-MC-Unique: ma6LRfU7PYup3pgpWDtjnQ-1
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.179.90] ([81.173.181.202]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mft7t-1q4wXO0wNV-00g13S for
 <linux-lvm@redhat.com>; Sat, 19 Aug 2023 18:05:59 +0200
Message-ID: <5f40e362-e6b9-d66e-312b-6999e40ba951@web.de>
Date: Sat, 19 Aug 2023 18:05:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.1
From: Roland <devzero@web.de>
To: LVM general discussion and development <linux-lvm@redhat.com>
References: <fa206f6a-2675-95c9-d6fe-7ef8466a0dd5@web.de>
In-Reply-To: <fa206f6a-2675-95c9-d6fe-7ef8466a0dd5@web.de>
X-Provags-ID: V03:K1:1R10GOmgtycPs7JUiUqE6fj4FA7WfyRRIAuN5gYoO5Jc7vPW0Dl
 MDJD6X4JHFD+u0oBhmnVTUkguAZQZoYl6Nppq4bvYzZ+bdfbKbSGWNZSAsmmQXPEcnTvkve
 KOlGSSVz+gwRnwEvVHRhJ/GnKhVoKZ6Ho9yLR8NVhi2p43KtiLWCqX+7HgETQbUoYJ7TSJU
 pERV8aMa63vbiE9BNxGMQ==
UI-OutboundReport: notjunk:1;M01:P0:a5wgFVqVRU4=;+k+rm76bVTdyxT+9jf52zrqJiwN
 /G9mOPoU599nSfESnZTL6FliKJT5blz8X41hq0gv0NuSp7N15v/e4ttxDE/6iXpPWuplJiZIJ
 389oVnNeApN0fB3uVrgC05OoK5XrnomZ8qIWMxLKj4Up+jw5mNmagDsdgxLHkPjDqVNFdpiWz
 nVa34KvocmiSMO/7aR0U9ZrP1GFihl/397r+7fhS7XjlyMR2GeAHsV0oxXZoVdte2n4lfOJUO
 ltK0y7j4dwwpGAKWrQog90jfX8P24xUUpChYP7nK9gXHvIlDat3SVIWuUk/8wOUSa7Ny4bFWM
 /QPpH5g+LUfoBAFuwN369lWsNWVoFt9CtyjM7CnbN4hZZMvrWnCHST/IknzwaVrt6Sge2E1Bk
 yI8Ruab2WtkyFoScG0SVc3mvjtEFHpqOEG+JgsAtpi3ykQUL1ip5v5Alto7YDxPsSljoAoM72
 yxzT1QikhDtOcna+EntiqM3T1Dk8+Vkt/9DZdwbr7Ai77ieeVUYh2okpK1VxXiGEElTH3coX9
 x0UF7M0sj5jAGP50qfQFHIqr0vUZV8jh15bwp49qr3RO0kjFeloOftw1yJooSSP+Md2goD2JI
 blRhr9I4bgFs9R4wChKt+ycHt8cz6LHJtJySjmMCybKQ1PGsM8+AZgTBs94+MxdpAAnGPy8ps
 Z2xwCQdoxpYzMT1vTwnUV6cZ1Gn3b9+ENsfGpe4qnpumOdigoZM8/ev+CNlzgwu5V9yYaQYX7
 gnAoMaVm3+vwA0DP2nUukjm+tRmBXk5VSnbprwT4SrIkyyhjhMZ002JpT/lUhKy4swzrajRUn
 vyfCTceS1t+lY/WUubJWrJFAI6HpwcbvT3qNO7CaQU/OHJbCrcdOtbgPumK4Mr4yaWOgNIyuQ
 G5QeU5aQ8Ua9wlJf4AnBWEtB6e57Px7Kjh1Zw1WHxkVjz5oTe0ojUhz3nqwnFSbkcsKq3jUsB
 IGJOWw==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [linux-lvm] indistinguishable column names ( BA Start Start
 Start Start )
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: web.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

ID4gZnVydGhlcm1vcmUsIGl0J3MgYSBsaXR0bGUgYml0IHdlaXJkIHRoYXQgc29tZSBjb2x1bW5z
IGJlaW5nIHByaW50ZWQgDQpieSBkZWZhdWx0IHdoZW4gdXNpbmcgLW8sIGlzDQogPiB0aGVyZSBh
biBlYXNpZXIgd2F5IHRvIHJlbW92ZSB0aG9zZSBiZXNpZGVzIGV4cGxpY3RseSByZW1vdmluZyB0
aGVtIA0Kb25lIGJ5IG9uZSB3aXRoIHNldmVyYWwgLW8gb3B0aW9ucyA/ICItby1vcHQxLC1vcHQy
LC4uLiIgZG9lc24ndCB3b3JrDQoNCnNvcnJ5IGZvciB0aGlzIG5vaXNlLCBpIHdhcyB0b28gZHVt
YiBmb3IgdGhhdCAsICItbytvcHQxLG9wdDIgDQotby1vcHQzLG9wdDQiIHdvcmtzIGFzIGRlc2ly
ZWQgKGFzIGRvY3VtZW50ZWQgaW4gbWFucGFnZSkNCg0KID4gdGhlbXNlbHZlcyxhbmQgdGhlcmUg
YWxzbyBzZWVtcyBubyB3YXkgdG8gYWRkIHNlcGFyYXRvcnMgaW4gYmV0d2VlbiANCihsaWtlIHdp
dGggcHJpbnRmKSBmb3Igc2VwYXJhdGlvbi9mb3JtYXR0aW5nDQoNCmFsc28gc29ycnkgZm9yIHRo
aXMsIGFzIHdlIGNhbiB1c2UgLS1zZXBhcmF0b3I9IiwiwqDCoCAoYXBwYXJlbnRseSBkaWQgDQpo
YXZlIHRvbyBtdWNoIGNvZmZlZSBhbmQgaGFkIG92ZXJzZWVuIHRoYXQgaW4gdGhlIG1hbnBhZ2Up
DQoNCnRoZSBxdWVzdGlvbiByZWdhcmRpbmcgbmF0aXZlIGNvbHVtbiBoZWFkZXJzL2Rlc2NyaXB0
aW9uIHJlbWFpbnMNCg0Kcm9sYW5kDQoNCkFtIDE5LjA4LjIzIHVtIDE3OjIwIHNjaHJpZWIgUm9s
YW5kOg0KPiBoZWxsbywNCj4NCj4gZG9lcyBzb21lYm9keSBrbm93IGhvdyB3ZSBjYW4gaGF2ZSBu
YXRpdmUgKGkuZS4gbm9uIHRyYW5zbGF0ZWQpIGNvbHVtbiANCj4gZmllbGQgbmFtZXMgaW4gZmly
c3QgbGluZSBvZiBvdXRwdXQgb2YgcHZzID8NCj4NCj4gaW4gaXRzIGN1cnJlbnQgaW1wbGVtZW50
YXRpb24sIG91dHB1dCBpcyBoYXJkIHRvIHJlYWQgLCBkaWZmaWN1bHQgdG8gDQo+IGRpc3Rpbmd1
aXNoIGFuZCBhbHNvIG5vdCBzY3JpcHRhYmxlL3BhcnNlYWJsZSwgYXMgd2hpdGVzcGFjZSBpcyB1
c2VkIA0KPiBmb3IgZmllbGQgc2VwYXJhdG9yIGFuZCB0aGVyZSBhcmUgZmllbGRzIHdoaWNoIGFs
c28gY29udGFpbiB3aGl0ZXNwYWNlIA0KPiB0aGVtc2VsdmVzLGFuZCB0aGVyZSBhbHNvIHNlZW1z
IG5vIHdheSB0byBhZGQgc2VwYXJhdG9ycyBpbiBiZXR3ZWVuIA0KPiAobGlrZSB3aXRoIHByaW50
ZikgZm9yIHNlcGFyYXRpb24vZm9ybWF0dGluZw0KPg0KPiAjIHB2cyAtLXVuaXRzIHMgLW8rcHZf
YmFfc3RhcnQsc2VnX3N0YXJ0LHNlZ19zdGFydF9wZSxwdnNlZ19zdGFydA0KPiDCoCBQVsKgwqDC
oMKgwqDCoMKgwqAgVkfCoMKgwqDCoMKgwqDCoCBGbXTCoCBBdHRyIFBTaXplwqDCoMKgwqDCoMKg
wqAgUEZyZWUgQkEgU3RhcnQgU3RhcnTCoMKgwqAgDQo+IFN0YXJ0IFN0YXJ0DQo+IMKgIC9kZXYv
c2RiwqDCoCBWR3JlY3ljbGUgbHZtMiBhLS3CoCAxMTcyMDk4MjUyOFPCoMKgwqAgMFPCoMKgwqDC
oMKgwqAgMFMgDQo+IDIwOTcxNTJTwqDCoMKgwqAgMcKgwqDCoMKgIDANCj4gwqAgL2Rldi9zZGLC
oMKgIFZHcmVjeWNsZSBsdm0yIGEtLcKgIDExNzIwOTgyNTI4U8KgwqDCoCAwU8KgwqDCoMKgwqDC
oCAwUyANCj4gMjA5NzE1MlPCoMKgwqDCoCAxwqDCoMKgwqAgMQ0KPiDCoCAvZGV2L3NkYsKgwqAg
VkdyZWN5Y2xlIGx2bTIgYS0twqAgMTE3MjA5ODI1MjhTwqDCoMKgIDBTIDBTIDBTwqDCoMKgwqAg
MMKgIDUzMDkNCj4gwqAgL2Rldi9zZGLCoMKgIFZHcmVjeWNsZSBsdm0yIGEtLcKgIDExNzIwOTgy
NTI4U8KgwqDCoCAwUyAwUyAwU8KgwqDCoMKgIDDCoCA1NTg3DQo+IMKgIC9kZXYvc2RiwqDCoCBW
R3JlY3ljbGUgbHZtMiBhLS3CoCAxMTcyMDk4MjUyOFPCoMKgwqAgMFMgMFMgMFPCoMKgwqDCoCAw
wqAgNTU4OA0KPg0KPiBpIG1lYW4gbGlrZSB0aGlzOg0KPg0KPiAjIHB2cyAtLXVuaXRzIHMgLW8r
cHZfYmFfc3RhcnQsc2VnX3N0YXJ0LHNlZ19zdGFydF9wZSxwdnNlZ19zdGFydA0KPiDCoCBQVsKg
wqDCoMKgwqDCoMKgwqAgVkfCoMKgwqDCoMKgwqDCoCBGbXTCoCBBdHRyIFBTaXplwqDCoMKgwqDC
oMKgwqAgUEZyZWUgcHZfYmFfc3RhcnQgDQo+IHNlZ19zdGFydCBzZWdfc3RhcnRfcGUgcHZzZWdf
c3RhcnQNCj4gwqAgL2Rldi9zZGLCoMKgIFZHcmVjeWNsZSBsdm0yIGEtLcKgIDExNzIwOTgyNTI4
U8KgwqDCoCAwU8KgwqDCoMKgwqDCoCDCoMKgIDBTIA0KPiAyMDk3MTUyU8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMcKgwqDCoMKgwqDCoMKgwqDCoMKgIDANCj4gwqAgL2Rldi9zZGLCoMKgIFZHcmVj
eWNsZSBsdm0yIGEtLcKgIDExNzIwOTgyNTI4U8KgwqDCoCAwU8KgwqDCoMKgwqDCoMKgwqDCoCAw
UyANCj4gMjA5NzE1MlPCoMKgwqAgwqAgwqAgwqAgwqAgMcKgwqDCoMKgwqDCoMKgwqDCoMKgIDEN
Cj4gwqAgL2Rldi9zZGLCoMKgIFZHcmVjeWNsZSBsdm0yIGEtLcKgIDExNzIwOTgyNTI4U8KgwqDC
oCAwUyAwUyAwU8KgwqDCoCDCoCDCoCDCoCDCoCAwIA0KPiDCoCDCoCDCoMKgIDUzMDkNCj4gwqAg
L2Rldi9zZGLCoMKgIFZHcmVjeWNsZSBsdm0yIGEtLcKgIDExNzIwOTgyNTI4U8KgwqDCoCAwUyAw
UyAwU8KgwqDCoCDCoCDCoCDCoCDCoCANCj4gMMKgwqDCoMKgwqDCoMKgIDU1ODcNCj4gwqAgL2Rl
di9zZGLCoMKgIFZHcmVjeWNsZSBsdm0yIGEtLcKgIDExNzIwOTgyNTI4U8KgwqDCoCAwUyAwUyAw
U8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgDQo+IDDCoMKgwqDCoMKgwqDCoCA1NTg4DQo+DQo+IGZ1
cnRoZXJtb3JlLCBpdCdzIGEgbGl0dGxlIGJpdCB3ZWlyZCB0aGF0IHNvbWUgY29sdW1ucyBiZWlu
ZyBwcmludGVkIA0KPiBieSBkZWZhdWx0IHdoZW4gdXNpbmcgLW8sIGlzIHRoZXJlIGFuIGVhc2ll
ciB3YXkgdG8gcmVtb3ZlIHRob3NlIA0KPiBiZXNpZGVzIGV4cGxpY3RseSByZW1vdmluZyB0aGVt
IG9uZSBieSBvbmUgd2l0aCBzZXZlcmFsIC1vIG9wdGlvbnMgPyANCj4gIi1vLW9wdDEsLW9wdDIs
Li4uIiBkb2Vzbid0IHdvcmsNCj4NCj4gIyBwdnMgLS11bml0cyBzIC1vK3B2X2JhX3N0YXJ0LHNl
Z19zdGFydCxwdnNlZ19zdGFydCxzZWdfc3RhcnRfcGUgDQo+IC1vLXZnX25hbWUgLW8tcHZfbmFt
ZSAtby1wdl9mbXQgLW8tYXR0ciAtbyAtcHZfc2l6ZSAtbyAtcHZfZnJlZQ0KPiDCoCBCQSBTdGFy
dCBTdGFydMKgwqDCoCBTdGFydCBTdGFydA0KPiDCoMKgwqDCoMKgwqDCoCAwUyAyMDk3MTUyU8Kg
wqDCoMKgIDDCoMKgwqDCoCAxDQo+IMKgwqDCoMKgwqDCoMKgIDBTIDIwOTcxNTJTwqDCoMKgwqAg
McKgwqDCoMKgIDENCj4gwqDCoMKgwqDCoMKgwqAgMFPCoMKgwqDCoMKgwqAgMFPCoCA1MzA5wqDC
oMKgwqAgMA0KPiDCoMKgwqDCoMKgwqDCoCAwU8KgwqDCoMKgwqDCoCAwU8KgIDU1ODfCoMKgwqDC
oCAwDQo+IMKgwqDCoMKgwqDCoMKgIDBTwqDCoMKgwqDCoMKgIDBTwqAgNTU4OMKgwqDCoMKgIDAN
Cj4NCj4gcm9sYW5kDQo+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBz
Oi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhl
IExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

