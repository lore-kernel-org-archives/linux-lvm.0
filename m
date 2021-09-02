Return-Path: <SRS0=nGmI=NY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DEAC433F5
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 19:16:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E90C60FC0
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 19:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E90C60FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630610204;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IDDqyZSFqZJVOMHHwrQYi4wL8G0DP4eylrIkubypiHQ=;
	b=H90r2FWDx0u/2yz9u40A45IEcX4PFE4DIq6YsW1ked0inBxQdL1lHUBOyTkoZ+ojVmU+c5
	Gzcw4TKyez8oVmJSi0RSKwkowrkhsHybkSh/x5XzyN+jpHq1da/GcASiF08rMehw0AH4ub
	CEi5Zx9xw04gYBtVdjkbBEN70+OsbgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-78g_EsfUNMuLz2Std2IDlQ-1; Thu, 02 Sep 2021 15:16:42 -0400
X-MC-Unique: 78g_EsfUNMuLz2Std2IDlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 633191854E20;
	Thu,  2 Sep 2021 19:16:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 657FA19D9B;
	Thu,  2 Sep 2021 19:16:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2234418087F1;
	Thu,  2 Sep 2021 19:16:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 182JEU1g032307 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 2 Sep 2021 15:14:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 04DCA60C4A; Thu,  2 Sep 2021 19:14:30 +0000 (UTC)
Received: from [10.40.193.87] (unknown [10.40.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82B4960BF1;
	Thu,  2 Sep 2021 19:14:26 +0000 (UTC)
To: Jean-Michel Pollion <jmp-lvm2@ookaze.fr>, linux-lvm <linux-lvm@redhat.com>
References: <079c89596cbea06f80874fdc3ffe8cfe05841c4d.camel@ookaze.fr>
	<d864434e-0823-9082-00a4-605d17862310@redhat.com>
	<1059a9981045d052b49f0d386a9b19f1b7f1a8e2.camel@ookaze.fr>
	<1cac267f-cad7-a511-c72d-d9a309c38b3f@redhat.com>
	<cf9e7f54098f38f87c2935366dfb1e9d3427bee2.camel@ookaze.fr>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <81fc311d-2380-27e7-5ef7-bba816c833ac@redhat.com>
Date: Thu, 2 Sep 2021 21:14:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cf9e7f54098f38f87c2935366dfb1e9d3427bee2.camel@ookaze.fr>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-lvm@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDAyLiAwOS4gMjEgdiAyMToxMCBKZWFuLU1pY2hlbCBQb2xsaW9uIG5hcHNhbChhKToKPiBM
ZSBqZXVkaSAwMiBzZXB0ZW1icmUgMjAyMSDDoCAxOToyMSArMDIwMCwgWmRlbmVrIEthYmVsYWMg
YSDDqWNyaXTCoDoKPj4gRG5lIDAyLiAwOS4gMjEgdiAxNzo0OSBKZWFuLU1pY2hlbCBQb2xsaW9u
IG5hcHNhbChhKToKPj4+IExlIGpldWRpIDAyIHNlcHRlbWJyZSAyMDIxIMOgIDE2OjExICswMjAw
LCBaZGVuZWsgS2FiZWxhYyBhIMOpY3JpdMKgOgo+Pj4+IERuZSAwMi4gMDkuIDIxIHYgOTozNCBK
ZWFuLU1pY2hlbCBQb2xsaW9uIG5hcHNhbChhKToKPj4+Pj4gSGVsbG8sCj4+Pj4+Cj4+Pj4+IEkg
aGF2ZSB0aGUgbHZtMiB0b29scyBzZWdmYXVsdGluZyBzaW5jZSAyLjAzLjEyIHdpdGggYSBtZXNz
YWdlCj4+Pj4+IG9mCj4+Pj4+IHVuc29ydGVkIGNvbW1hbmRzIGluIGNtZHMuaC4KPj4+Pj4gSXQg
dHVybnMgb3V0IHRoYXQgaW4gbXkgbG9jYWxlIGFuZCBvbiBteSBzZXR1cCwgdGhlIExBTkc9Qwo+
Pj4+PiBzZXR0aW5nCj4+Pj4+IGJlZm9yZSAic29ydCAtdSIgaW4gdG9vbHMvTWFrZWZpbGUuaW4g
aXMgbm90IGVub3VnaCwgSSBoYWQgdG8KPj4+Pj4gcGF0Y2gKPj4+Pj4gYW5kCj4+Pj4+IGFkZCBM
Q19DT0xMQVRFPUMgdG9vLCBvciB0aGUgcnVsZXMgd2lsbCBub3QgY291bnQgdGhlCj4+Pj4+IHVu
ZGVyc2NvcmUKPj4+Pj4gd2hpbGUKPj4+Pj4gc29ydGluZywgY2F1c2luZyB0aGUgc2VnZmF1bHQg
aW4gdGhlIGNvZGUgKGNvbW1hbmQuYyBJSVJDKS4KPj4+Pj4gVGhpcyBicm9rZSB0aGUgYm9vdCBv
biBzb21lIG9mIG15IHNlcnZlcnMsIHNvIEkgdGhpbmsgaXQncyBhCj4+Pj4+IHJhdGhlcgo+Pj4+
PiBiaWcKPj4+Pj4gcHJvYmxlbSB0aGF0IHBlcmhhcHMgY2FuJ3QgYmUgY2F1Z2h0IGluIHJlcHJv
ZHVjaWJsZSBidWlsZHMuCj4+Pj4+IENhbiB0aGlzIGJlIGNvcnJlY3RlZCB1cHN0cmVhbSBvciBz
aG91bGQgSSBqdXN0IG1vZGlmeSBteSBidWlsZAo+Pj4+PiBlbnZpcm9ubWVudCBmb3IgTFZNMj8K
Pj4+Pj4KPj4+PiBIaQo+Pj4+Cj4+Pj4gSW50ZXJlc3RpbmcgLSBjYW4geW91IHNlbmQgYSBwYXRj
aCB0byBNYWtlZmlsZcKgIHRvIGluY2x1ZGUKPj4+PiBMQ19DT0xMQVRFPUMKPj4+PiBpbiBjYXNl
IGl0IGRvZXMgZml4ZXMgeW91ciBwcm9ibGVtCj4+PiBJIGZpeGVkIGl0IHdpdGggYSBzZWQsIHRo
ZSByZXN1bHRpbmcgcGF0Y2ggaXMgYXR0YWNoZWQ6Cj4+PiAtLS0gTFZNMi4yLjAzLjEzLW9yaWcv
dG9vbHMvTWFrZWZpbGUuaW4gMjAyMS0wOC0xMQo+Pj4gMTc6Mzc6NDMuMDAwMDAwMDAwCj4+PiAr
MDIwMAo+Pj4gKysrIExWTTIuMi4wMy4xMy90b29scy9NYWtlZmlsZS5pbsKgwqDCoMKgwqAgMjAy
MS0wOS0wMgo+Pj4gMTc6NDE6NDIuMTEzNzAyOTkwCj4+PiArMDIwMAo+Pj4gQEAgLTE4MSw3ICsx
ODEsNyBAQAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgKCBjYXQgJChzcmNkaXIpL2xpY2Vuc2UuaW5j
ICYmIFwKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlY2hvICIvKiBEbyBub3QgZWRpdC4gVGhp
cyBmaWxlIGlzIGdlbmVyYXRlZCBieSB0aGUKPj4+IE1ha2VmaWxlLgo+Pj4gKi8iICYmIFwKPj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlY2hvICJjbWQoQ01EX05PTkUsIG5vbmUpIiAmJiBcCj4+
PiAtwqDCoMKgwqDCoMKgwqDCoCAkKEdSRVApICdeSUQ6JyAkKHNyY2RpcikvY29tbWFuZC1saW5l
cy5pbiB8IExBTkc9Qwo+Pj4gJChTT1JUKSAtdQo+Pj4+ICQoQVdLKSAne3ByaW50ICJjbWQoIiAk
JDIgIl9DTUQsICIgJCQyICIpIn0nICYmIFwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgICQoR1JFUCkg
J15JRDonICQoc3JjZGlyKS9jb21tYW5kLWxpbmVzLmluIHwgTEFORz1DCj4+PiBMQ19DT0xMQVRF
PUMgJChTT1JUKSAtdSB8ICQoQVdLKSAne3ByaW50ICJjbWQoIiAkJDIgIl9DTUQsICIgJCQyCj4+
PiAiKSJ9Jwo+Pj4gJiYgXAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVjaG8gImNtZChDTURf
Q09VTlQsIGNvdW50KSIgXAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgKSA+ICRACj4+Cj4+IEFuZCBk
b2VzIGl0IGFsc28gd29yayBpZiB5b3Ugc2V0wqAgTENfQUxMPUPCoMKgIChpbnN0ZWFkIG9mIExB
Tkc9Qwo+PiBMQ19DT0xMQVRFPUMpID8KPiBZZXMsIGl0IHdvcmtzIGFsc28gd2l0aCBMQ19BTEw9
QyBhbG9uZSAod2l0aG91dCBlaXRoZXIgTEFOR19DIG9yCj4gTENfQ09MTEFURT1DKSwgSSByZXBs
YWNlZCBMQU5HPUMgYnkgTENfQUxMPUMgaW4gdGhlIE1ha2VmaWxlIGFuZCBpdAo+IHdvcmtlZCBw
ZXJmZWN0bHksIGFzIGV4cGVjdGVkLCBhcyBMQ19BTEwgaXMgc3VwcG9zZWQgdG8gc3VwZXJzZWRl
IExBTkcuCj4KClNvIHRoYW5rcyBmb3IgY2hlY2tpbmcswqAgSSdsbCBwdXNoIHRoaXMgZml4IHRo
ZW4uCgoKUmVnYXJkcwoKClpkZW5lawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNv
bQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpy
ZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

