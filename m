Return-Path: <SRS0=f/k/=N4=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9C9C433F5
	for <linux-lvm@archiver.kernel.org>; Mon,  6 Sep 2021 18:00:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F083360F92
	for <linux-lvm@archiver.kernel.org>; Mon,  6 Sep 2021 18:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F083360F92
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630951230;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GTcdqAqukEsfxY7OSN/P2cQydHWhA5K0DO/rIX6W3RQ=;
	b=eIEFsWfaap8b3WQhR8E9KtTJzNlxYAW7a34h7TWDmzeYujHLdcR9zwLL6TFy1Qsc7KmrT1
	IGlaMjMHv8VG1wDkxFw4uKq032Z2R9aXU2OlF0mbTWRVxIGQHU0dc4LnRCB0YV17/gOusM
	br/FN6BQWmgC1u2KnzudjOx+5wfX+nQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-RYue6R8hM86n2zMAa4-fmA-1; Mon, 06 Sep 2021 14:00:29 -0400
X-MC-Unique: RYue6R8hM86n2zMAa4-fmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C662E10054F6;
	Mon,  6 Sep 2021 18:00:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26F23779D2;
	Mon,  6 Sep 2021 18:00:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 560121809C98;
	Mon,  6 Sep 2021 18:00:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 186HxtpE019342 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 6 Sep 2021 13:59:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A686D1025E77; Mon,  6 Sep 2021 17:59:55 +0000 (UTC)
Received: from [10.40.194.106] (unknown [10.40.194.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED21C1007611;
	Mon,  6 Sep 2021 17:59:51 +0000 (UTC)
Message-ID: <f396588e-5880-5559-5f4b-bc46727cd769@redhat.com>
Date: Mon, 6 Sep 2021 19:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.0.3
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Jean-Michel Pollion <jmp-lvm2@ookaze.fr>
References: <079c89596cbea06f80874fdc3ffe8cfe05841c4d.camel@ookaze.fr>
	<d864434e-0823-9082-00a4-605d17862310@redhat.com>
	<1059a9981045d052b49f0d386a9b19f1b7f1a8e2.camel@ookaze.fr>
	<1cac267f-cad7-a511-c72d-d9a309c38b3f@redhat.com>
	<cf9e7f54098f38f87c2935366dfb1e9d3427bee2.camel@ookaze.fr>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <cf9e7f54098f38f87c2935366dfb1e9d3427bee2.camel@ookaze.fr>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gMDIuIDA5LiAyMSAyMToxMCwgSmVhbi1NaWNoZWwgUG9sbGlvbiB3cm90ZToKPiBMZSBqZXVk
aSAwMiBzZXB0ZW1icmUgMjAyMSDDoCAxOToyMSArMDIwMCwgWmRlbmVrIEthYmVsYWMgYSDDqWNy
aXTCoDoKPj4gRG5lIDAyLiAwOS4gMjEgdiAxNzo0OSBKZWFuLU1pY2hlbCBQb2xsaW9uIG5hcHNh
bChhKToKPj4+IExlIGpldWRpIDAyIHNlcHRlbWJyZSAyMDIxIMOgIDE2OjExICswMjAwLCBaZGVu
ZWsgS2FiZWxhYyBhIMOpY3JpdMKgOgo+Pj4+IERuZSAwMi4gMDkuIDIxIHYgOTozNCBKZWFuLU1p
Y2hlbCBQb2xsaW9uIG5hcHNhbChhKToKPj4+Pj4gSGVsbG8sCiAgPwo+IAo+IFllcywgaXQgd29y
a3MgYWxzbyB3aXRoIExDX0FMTD1DIGFsb25lICh3aXRob3V0IGVpdGhlciBMQU5HX0Mgb3IKPiBM
Q19DT0xMQVRFPUMpLCBJIHJlcGxhY2VkIExBTkc9QyBieSBMQ19BTEw9QyBpbiB0aGUgTWFrZWZp
bGUgYW5kIGl0Cj4gd29ya2VkIHBlcmZlY3RseSwgYXMgZXhwZWN0ZWQsIGFzIExDX0FMTCBpcyBz
dXBwb3NlZCB0byBzdXBlcnNlZGUgTEFORy4KClVwc3RyZWFtZWQgd2l0aDoKCmh0dHBzOi8vbGlz
dG1hbi5yZWRoYXQuY29tL2FyY2hpdmVzL2x2bS1kZXZlbC8yMDIxLVNlcHRlbWJlci9tc2cwMDAw
MS5odG1sCgpSZWdhcmRzCgpaZGVuZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5j
b20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0K
cmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLw==

