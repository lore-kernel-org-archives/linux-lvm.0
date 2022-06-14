Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EE6C433EF
	for <linux-lvm@archiver.kernel.org>; Wed, 15 Jun 2022 05:50:53 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-RqRg2DrJOTaGrdNSCfgDBQ-1; Wed, 15 Jun 2022 01:50:49 -0400
X-MC-Unique: RqRg2DrJOTaGrdNSCfgDBQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62FDB3800C22;
	Wed, 15 Jun 2022 05:50:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAB42492CA5;
	Wed, 15 Jun 2022 05:50:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 76D371947B84;
	Wed, 15 Jun 2022 05:50:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B68531947067
 for <linux-lvm@listman.corp.redhat.com>; Tue, 14 Jun 2022 13:29:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8E7ED1415106; Tue, 14 Jun 2022 13:29:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AA0A1415103
 for <linux-lvm@redhat.com>; Tue, 14 Jun 2022 13:29:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C970299E75A
 for <linux-lvm@redhat.com>; Tue, 14 Jun 2022 13:29:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-3X2X9G87OBuEzw4h6_WFew-1; Tue, 14 Jun 2022 09:29:22 -0400
X-MC-Unique: 3X2X9G87OBuEzw4h6_WFew-1
Received: by mail-pf1-f180.google.com with SMTP id 187so8558808pfu.9
 for <linux-lvm@redhat.com>; Tue, 14 Jun 2022 06:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z29HR0CGpYfUK4WWfBp81QAJNuyLIqNc0zBHg3tABWo=;
 b=gbsE4dc+vTVJJn8axiaaS2K6YMg30+kovlfarCXQsVXwKDzjRWLXDL2p/2DcikzoJk
 oanwHoTP7nVzHaVfwlMooucWnTtXK1vhy2LkD8Wy9d7t8RnwESc2O9qbhhZNINXOhPsS
 2T1d91W2atHe3r9JbyZcoexOPwL3pC1HRd8vQ7HO2tqXOjv4epCoiryqlXG35yviKCLQ
 S+7HW/7s6ExwYTohwzGPswl8i/7vkbjS1UJc5UAXJhKOPYBoh1vqMK9apzi1RHSV7J2M
 kyf7BeDPja9lnXucUDBKDJeev3k7i3p6IkHlB21yqZaZeKWJtbNPLZd9Agp4hTeiCcLC
 AKOQ==
X-Gm-Message-State: AOAM533pRatTu8aCDBmST3zLB0cRvd4CKqytm92kdPIIW4K87J9qLlQJ
 PFNMQywE5r81CuLM09lPEshEHhz5au/MXw==
X-Google-Smtp-Source: ABdhPJwXYfMA42WidIgpkPpg8NCxevi1vhnj6llFsxjA4f0cS06I+f8zeGtaFlaEKK94gBsIg7HAxg==
X-Received: by 2002:a63:6b02:0:b0:3fb:da3f:4926 with SMTP id
 g2-20020a636b02000000b003fbda3f4926mr4714930pgc.346.1655213361507; 
 Tue, 14 Jun 2022 06:29:21 -0700 (PDT)
Received: from [10.4.113.62] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 f126-20020a62db84000000b005180c127200sm7639699pfg.24.2022.06.14.06.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 06:29:21 -0700 (PDT)
Message-ID: <5970db8d-462f-0e35-741c-fa0fdc188fa2@bytedance.com>
Date: Tue, 14 Jun 2022 21:29:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
To: Gionatan Danti <g.danti@assyoma.it>
References: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
 <e779f9dc7139963adfa64b03eca170f3@assyoma.it>
 <8baee796-9bfb-47a8-1661-7e94437826c9@bytedance.com>
 <daaa5fa473c1ce56f9d9d4e149047fe6@assyoma.it>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <daaa5fa473c1ce56f9d9d4e149047fe6@assyoma.it>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mailman-Approved-At: Wed, 15 Jun 2022 05:50:41 +0000
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CuWcqCA2LzE0LzIyIDg6NTYgUE0sIEdpb25hdGFuIERhbnRpIOWGmemBkzoKPiBJbCAyMDIyLTA2
LTE0IDEyOjE2IFpoaXlvbmcgWWUgaGEgc2NyaXR0bzoKPj4gQWZ0ZXIgY3JlYXRpbmcgdGhlIFBW
IGFuZCBWRyBiYXNlZCBvbiB0aGUgaVNDU0kgZGV2aWNlLCBJIGNyZWF0ZWQgdGhlCj4+IHRoaW4g
cG9vbCBhcyBmb2xsb3dzOgo+PiBsdmNyZWF0ZSAtbiBwb29sIC1MIDEwMDBHIHRlc3QtdmcKPj4g
bHZjcmVhdGUgLW4gcG9vbG1ldGEgLUwgMTAwRyB0ZXN0LXZnCj4+IGx2Y29udmVydCAtLXR5cGUg
dGhpbi1wb29sIC0tY2h1bmtzaXplIDY0ayAtLXBvb2xtZXRhZGF0YQo+PiB0ZXN0LXZnL3Bvb2xt
ZXRhIHRlc3QtdmcvcG9vbAo+PiBsdmNoYW5nZSAtWiBuIHRlc3QtdmcvcG9vbAo+IAo+IEkgZGlk
IG15IHBlcmZvcm1hbmNlIHRlc3Qgd2l0aCBiaWdnZXIgY2h1bmsgc2l6ZSwgaW4gdGhlIHJhbmdl
IG9mIAo+IDEyOC01MTJLLiBJdCBjYW4gdmVyeSB3ZWxsIGJlIHRoYXQgdGhlIG92ZXJsb2FkIG9m
IGEgc21hbGxlciBjaHVuayBzaXplIAo+IHJlc3VsdHMgaW4gMTB4IGxvd2VyIElPUHMgZm9yIHRv
LWJlLWFsbG9jYXRlZC1hbmQtY29waWVkIGNodW5rcy4gQ2FuIHlvdSAKPiByZXRyeSBmaW8gYWZ0
ZXIgaW5jcmVhc2luZyBjaHVuayBzaXplPwoKWWVzLCBJIGFsc28gdGVzdGVkIHRoZSB3cml0ZSBw
ZXJmb3JtYW5jZSBhZnRlciBjcmVhdGluZyBzbmFwc2hvdHMgd2l0aCAKZGlmZmVyZW50IGNodW5r
c2l6ZS4gQnV0IHRoZSBkYXRhIHNob3dzIHRoYXQgdGhlIGxhcmdlciB0aGUgY2h1bmtzaXplLCAK
dGhlIHdvcnNlIHRoZSBwZXJmb3JtYW5jZS4gVGhlIGRhdGEgaXMgc2hvd24gYmVsb3c6CmNodW5r
c2l6ZSAgICAgICAgICAgICAgIGlvcHMKNjRrICAgICAgICAgICAgICAgICAgICAgNTI0NQoyNTZr
ICAgICAgICAgICAgICAgICAgICAyMTE1CjEwMjRrICAgICAgICAgICAgICAgICAgIDUwOQoKVGhl
IHJlYXNvbiBmb3IgdGhpcyBtYXkgYmUgdGhhdCB3aGVuIHRoZSB2b2x1bWUgY3JlYXRlcyBhIHNu
YXBzaG90LCBlYWNoIAp3cml0ZSB0byBhbiBleGlzdGluZyBibG9jayB3aWxsIGNhdXNlIGEgQ09X
IChDb3B5LW9uLXdyaXRlKSwgYW5kIHRoZSBDT1cgCmlzIGEgY29weSBvZiB0aGUgZW50aXJlIGRh
dGEgYmxvY2sgaW4gY2h1bmtzaXplLCBmb3IgZXhhbXBsZSwgd2hlbiB0aGUgCmNodW5rc2l6ZSBp
cyA2NGssIGV2ZW4gaWYgb25seSA0ayBvZiBkYXRhIGlzIHdyaXR0ZW4sIHRoZSBlbnRpcmUgNjRr
IApkYXRhIGJsb2NrIHdpbGwgYmUgY29waWVkLiBJJ20gbm90IHN1cmUgaWYgSSB1bmRlcnN0YW5k
IHRoaXMgY29ycmVjdGx5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRw
czovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRo
ZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCg==

