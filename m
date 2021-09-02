Return-Path: <SRS0=nGmI=NY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_ALL,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB887C433F5
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 19:18:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75B9161056
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 19:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75B9161056
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ookaze.fr
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-Bx-IeAucNrqBfCYFLDEjRg-1; Thu, 02 Sep 2021 15:18:30 -0400
X-MC-Unique: Bx-IeAucNrqBfCYFLDEjRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59505801AE3;
	Thu,  2 Sep 2021 19:18:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9FC476BF9;
	Thu,  2 Sep 2021 19:18:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32AEF1809C98;
	Thu,  2 Sep 2021 19:18:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 182JANli032147 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 2 Sep 2021 15:10:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3FF08202A945; Thu,  2 Sep 2021 19:10:23 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B53520A8C1D
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2021 19:10:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9860A811E7F
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2021 19:10:20 +0000 (UTC)
Received: from ookaze.fr (82-65-226-53.subs.proxad.net [82.65.226.53])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-506-uH9jVwSUMDefUceDMnYxCQ-1; Thu, 02 Sep 2021 15:10:19 -0400
X-MC-Unique: uH9jVwSUMDefUceDMnYxCQ-1
Message-ID: <cf9e7f54098f38f87c2935366dfb1e9d3427bee2.camel@ookaze.fr>
From: Jean-Michel Pollion <jmp-lvm2@ookaze.fr>
To: linux-lvm <linux-lvm@redhat.com>
Date: Thu, 02 Sep 2021 21:10:16 +0200
In-Reply-To: <1cac267f-cad7-a511-c72d-d9a309c38b3f@redhat.com>
References: <079c89596cbea06f80874fdc3ffe8cfe05841c4d.camel@ookaze.fr>
	<d864434e-0823-9082-00a4-605d17862310@redhat.com>
	<1059a9981045d052b49f0d386a9b19f1b7f1a8e2.camel@ookaze.fr>
	<1cac267f-cad7-a511-c72d-d9a309c38b3f@redhat.com>
Organization: Deva Team
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 182JANli032147
X-loop: linux-lvm@redhat.com
Cc: Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [linux-lvm] LVM tools segfault since 2.03.12
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TGUgamV1ZGkgMDIgc2VwdGVtYnJlIDIwMjEgw6AgMTk6MjEgKzAyMDAsIFpkZW5layBLYWJlbGFj
IGEgw6ljcml0wqA6Cj4gRG5lIDAyLiAwOS4gMjEgdiAxNzo0OSBKZWFuLU1pY2hlbCBQb2xsaW9u
IG5hcHNhbChhKToKPiA+IExlIGpldWRpIDAyIHNlcHRlbWJyZSAyMDIxIMOgIDE2OjExICswMjAw
LCBaZGVuZWsgS2FiZWxhYyBhIMOpY3JpdMKgOgo+ID4gPiBEbmUgMDIuIDA5LiAyMSB2IDk6MzQg
SmVhbi1NaWNoZWwgUG9sbGlvbiBuYXBzYWwoYSk6Cj4gPiA+ID4gSGVsbG8sCj4gPiA+ID4gCj4g
PiA+ID4gSSBoYXZlIHRoZSBsdm0yIHRvb2xzIHNlZ2ZhdWx0aW5nIHNpbmNlIDIuMDMuMTIgd2l0
aCBhIG1lc3NhZ2UKPiA+ID4gPiBvZgo+ID4gPiA+IHVuc29ydGVkIGNvbW1hbmRzIGluIGNtZHMu
aC4KPiA+ID4gPiBJdCB0dXJucyBvdXQgdGhhdCBpbiBteSBsb2NhbGUgYW5kIG9uIG15IHNldHVw
LCB0aGUgTEFORz1DCj4gPiA+ID4gc2V0dGluZwo+ID4gPiA+IGJlZm9yZSAic29ydCAtdSIgaW4g
dG9vbHMvTWFrZWZpbGUuaW4gaXMgbm90IGVub3VnaCwgSSBoYWQgdG8KPiA+ID4gPiBwYXRjaAo+
ID4gPiA+IGFuZAo+ID4gPiA+IGFkZCBMQ19DT0xMQVRFPUMgdG9vLCBvciB0aGUgcnVsZXMgd2ls
bCBub3QgY291bnQgdGhlCj4gPiA+ID4gdW5kZXJzY29yZQo+ID4gPiA+IHdoaWxlCj4gPiA+ID4g
c29ydGluZywgY2F1c2luZyB0aGUgc2VnZmF1bHQgaW4gdGhlIGNvZGUgKGNvbW1hbmQuYyBJSVJD
KS4KPiA+ID4gPiBUaGlzIGJyb2tlIHRoZSBib290IG9uIHNvbWUgb2YgbXkgc2VydmVycywgc28g
SSB0aGluayBpdCdzIGEKPiA+ID4gPiByYXRoZXIKPiA+ID4gPiBiaWcKPiA+ID4gPiBwcm9ibGVt
IHRoYXQgcGVyaGFwcyBjYW4ndCBiZSBjYXVnaHQgaW4gcmVwcm9kdWNpYmxlIGJ1aWxkcy4KPiA+
ID4gPiBDYW4gdGhpcyBiZSBjb3JyZWN0ZWQgdXBzdHJlYW0gb3Igc2hvdWxkIEkganVzdCBtb2Rp
ZnkgbXkgYnVpbGQKPiA+ID4gPiBlbnZpcm9ubWVudCBmb3IgTFZNMj8KPiA+ID4gPiAKPiA+ID4g
Cj4gPiA+IEhpCj4gPiA+IAo+ID4gPiBJbnRlcmVzdGluZyAtIGNhbiB5b3Ugc2VuZCBhIHBhdGNo
IHRvIE1ha2VmaWxlwqAgdG8gaW5jbHVkZQo+ID4gPiBMQ19DT0xMQVRFPUMKPiA+ID4gaW4gY2Fz
ZSBpdCBkb2VzIGZpeGVzIHlvdXIgcHJvYmxlbQo+ID4gSSBmaXhlZCBpdCB3aXRoIGEgc2VkLCB0
aGUgcmVzdWx0aW5nIHBhdGNoIGlzIGF0dGFjaGVkOgo+ID4gLS0tIExWTTIuMi4wMy4xMy1vcmln
L3Rvb2xzL01ha2VmaWxlLmluIDIwMjEtMDgtMTEKPiA+IDE3OjM3OjQzLjAwMDAwMDAwMAo+ID4g
KzAyMDAKPiA+ICsrKyBMVk0yLjIuMDMuMTMvdG9vbHMvTWFrZWZpbGUuaW7CoMKgwqDCoMKgIDIw
MjEtMDktMDIKPiA+IDE3OjQxOjQyLjExMzcwMjk5MAo+ID4gKzAyMDAKPiA+IEBAIC0xODEsNyAr
MTgxLDcgQEAKPiA+IMKgwqDCoMKgwqDCoMKgwqAgKCBjYXQgJChzcmNkaXIpL2xpY2Vuc2UuaW5j
ICYmIFwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVjaG8gIi8qIERvIG5vdCBlZGl0LiBUaGlz
IGZpbGUgaXMgZ2VuZXJhdGVkIGJ5IHRoZQo+ID4gTWFrZWZpbGUuCj4gPiAqLyIgJiYgXAo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZWNobyAiY21kKENNRF9OT05FLCBub25lKSIgJiYgXAo+ID4g
LcKgwqDCoMKgwqDCoMKgwqAgJChHUkVQKSAnXklEOicgJChzcmNkaXIpL2NvbW1hbmQtbGluZXMu
aW4gfCBMQU5HPUMKPiA+ICQoU09SVCkgLXUKPiA+ID4gJChBV0spICd7cHJpbnQgImNtZCgiICQk
MiAiX0NNRCwgIiAkJDIgIikifScgJiYgXAo+ID4gK8KgwqDCoMKgwqDCoMKgwqAgJChHUkVQKSAn
XklEOicgJChzcmNkaXIpL2NvbW1hbmQtbGluZXMuaW4gfCBMQU5HPUMKPiA+IExDX0NPTExBVEU9
QyAkKFNPUlQpIC11IHwgJChBV0spICd7cHJpbnQgImNtZCgiICQkMiAiX0NNRCwgIiAkJDIKPiA+
ICIpIn0nCj4gPiAmJiBcCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlY2hvICJjbWQoQ01EX0NP
VU5ULCBjb3VudCkiIFwKPiA+IMKgwqDCoMKgwqDCoMKgwqAgKSA+ICRACj4gCj4gCj4gQW5kIGRv
ZXMgaXQgYWxzbyB3b3JrIGlmIHlvdSBzZXTCoCBMQ19BTEw9Q8KgwqAgKGluc3RlYWQgb2YgTEFO
Rz1DCj4gTENfQ09MTEFURT1DKSA/CgpZZXMsIGl0IHdvcmtzIGFsc28gd2l0aCBMQ19BTEw9QyBh
bG9uZSAod2l0aG91dCBlaXRoZXIgTEFOR19DIG9yCkxDX0NPTExBVEU9QyksIEkgcmVwbGFjZWQg
TEFORz1DIGJ5IExDX0FMTD1DIGluIHRoZSBNYWtlZmlsZSBhbmQgaXQKd29ya2VkIHBlcmZlY3Rs
eSwgYXMgZXhwZWN0ZWQsIGFzIExDX0FMTCBpcyBzdXBwb3NlZCB0byBzdXBlcnNlZGUgTEFORy4K
Cj4gCj4gWmRlbmVrCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRw
czovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRo
ZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

