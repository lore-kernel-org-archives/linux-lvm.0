Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6FAC43217
	for <linux-lvm@archiver.kernel.org>; Thu,  3 Nov 2022 07:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667462229;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EFCei8bdLyrdz/9hrpsQwCZQU3vxNqOl/VwIWdW37fE=;
	b=gKorrihjv7aj9nRZWYbodmtrCguwODbmgN7Fe2cGHc4RJPOPpsDPvtErIC3HiA1rDhC6OX
	jczmPVgUM7frzkXUkJKDSbix9gmHSvpA7FvQGhHRvGMbFZ8xiRCxRNb1wcjfuEaeyh46Sl
	UOS7N/5L7zSsFQIKtoc98Yz/A/Ch8o0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-5UL2TTUCNEyi-sqT4p5WlQ-1; Thu, 03 Nov 2022 03:57:06 -0400
X-MC-Unique: 5UL2TTUCNEyi-sqT4p5WlQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5F6D1875041;
	Thu,  3 Nov 2022 07:57:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6198A112132E;
	Thu,  3 Nov 2022 07:56:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2909D1946A6C;
	Thu,  3 Nov 2022 07:56:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 52F871946594
 for <linux-lvm@listman.corp.redhat.com>; Wed,  2 Nov 2022 09:02:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 33FA64EA49; Wed,  2 Nov 2022 09:02:08 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BE1C1731B
 for <linux-lvm@redhat.com>; Wed,  2 Nov 2022 09:02:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A7A286F130
 for <linux-lvm@redhat.com>; Wed,  2 Nov 2022 09:02:08 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-Tp7Ivr4_P0yIsaxAT6jDAA-1; Wed, 02 Nov 2022 05:02:06 -0400
X-MC-Unique: Tp7Ivr4_P0yIsaxAT6jDAA-1
Received: by mail-pj1-f42.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so1364740pji.0
 for <linux-lvm@redhat.com>; Wed, 02 Nov 2022 02:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DnwtMVarYmrr22qUTHoDXLqZR17cLEejRdEc/cjLooo=;
 b=QKkT48P4uMElFP9VH4JCyya/s4XJF+XG9SUPRaEEfFHGRUSvqQtTpK0N7XaYuX1bsp
 PBsVg1wsI/Iaf3SAqlX7psCJ/FtgcEGV9y78oMZrQNlgDM4d3OTaQjbHvwemglcj0gvJ
 aqU1+GHJIYNEu/zkcxOFSWWbJ7M/0oh575mcavdCT5k9KdNKX9swnTT9ZC0Xn6olW0VN
 MkCHrFFgBKt8a/zzq4s7ng6FNPpoGJAzDVkMXUKWH6D4lDKMPhjFx52l568ZtM596gKH
 maFrliOl/UyTEuQmNO2MPZBJmuE07Z0u8gNJc57fTn5xTxCdoBYwR0Hf4Y8o1xVsd3CE
 tnew==
X-Gm-Message-State: ACrzQf1kn4brHeUj5sTpJsC1s8pPIElgLg362FG0v6bCj3WXyltN5/Pk
 S8ttmYPgTD6ygr6GAtk/bt0ybwz+79kqDw==
X-Google-Smtp-Source: AMsMyM4uOn0052yPa9EbnCGd6qqWa8AUwPKtzN7ql124l6f8BrxyzzTGMyu2h+FK9huYl1+CWDt0nQ==
X-Received: by 2002:a17:90b:3510:b0:214:2af4:f8ae with SMTP id
 ls16-20020a17090b351000b002142af4f8aemr2778120pjb.173.1667379725304; 
 Wed, 02 Nov 2022 02:02:05 -0700 (PDT)
Received: from [10.87.56.20] ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id
 e10-20020aa798ca000000b0056286c552ecsm7907524pfm.184.2022.11.02.02.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:02:04 -0700 (PDT)
Message-ID: <db994d2a-65e6-c0bf-aa21-d587b5a7de69@bytedance.com>
Date: Wed, 2 Nov 2022 17:01:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
To: David Teigland <teigland@redhat.com>
References: <4b031c4d-b83a-cc92-fabf-cc9cefb4e491@bytedance.com>
 <20221101144230.GA11193@redhat.com>
 <bd522c48-03df-1130-54af-bee8a58440f0@bytedance.com>
 <20221101175756.GB11193@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <20221101175756.GB11193@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Thu, 03 Nov 2022 07:56:52 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgrlnKggMTEvMi8yMiAxOjU3IEFNLCBEYXZpZCBUZWlnbGFuZCDlhpnpgZM6Cj4gT24gV2VkLCBO
b3YgMDIsIDIwMjIgYXQgMDE6MDI6MjdBTSArMDgwMCwgWmhpeW9uZyBZZSB3cm90ZToKPj4gSGkg
RGF2ZSwKPj4KPj4gVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5IQo+Pgo+PiBEb2VzIHRoaXMgbWVh
biB0aGF0IHRoZXJlIGlzIG5vIHdheSB0byBsaXZlIG1pZ3JhdGUgVk1zIHdoZW4gdXNpbmcgbHZt
bG9ja2Q/Cj4gCj4gWW91IGNvdWxkIGJ5IHVzaW5nIGxpbmVhciBMVnMsIG92aXJ0IGRvZXMgdGhp
cyB1c2luZyBzYW5sb2NrIGRpcmVjdGx5LAo+IHNpbmNlIGx2bWxvY2tkIGFycml2ZWQgbGF0ZXIu
Cj4gCgpZZXMsIHN0YW5kYXJkIExWIGlzIHRoZW9yZXRpY2FsbHkgY2FwYWJsZSBvZiBsaXZlIG1p
Z3JhdGlvbiBiZWNhdXNlIGl0IApzdXBwb3J0cyBtdWx0aXBsZSBob3N0cyB1c2luZyB0aGUgc2Ft
ZSBMViBjb25jdXJyZW50bHkgd2l0aCBhIHNoYXJlZCAKbG9jayAobHZjaGFuZ2UgLWFzeSkuIEJ1
dCBJIHdhbnQgdG8gc3VwcG9ydCB0aGUgbGl2ZSBtaWdyYXRpb24gZmVhdHVyZSAKZm9yIGJvdGgg
TFZzICh0aGluIExWIGFuZCBzdGFuZGFyZCBMVikuCgo+PiBBcyB5b3UgZGVzY3JpYmUsIHRoZSBn
cmFudWxhcml0eSBvZiB0aGlubHYncyBzaGFyaW5nL3Vuc2hhcmluZyBpcyBwZXIKPj4gcmVhZC93
cml0ZSBJTywgZXhjZXB0IHRoYXQgbHZtbG9ja2QgcmVpbmZvcmNlcyB0aGlzIGxpbWl0YXRpb24g
Zm9yIHRoZSBsdm0KPj4gYWN0aXZhdGlvbiBjb21tYW5kLgo+Pgo+PiBJcyBpdCBwb3NzaWJsZSB0
byBtb2RpZnkgdGhlIGNvZGUgb2YgbHZtbG9ja2QgdG8gYnJlYWsgdGhpcyBsaW1pdGF0aW9uIGFu
ZAo+PiBsZXQgbGlidmlydC9xZW11IGd1YXJhbnRlZSB0aGUgbXV0dWFsIGV4Y2x1c2l2aXR5IG9m
IGVhY2ggcmVhZC93cml0ZSBJTwo+PiBhY3Jvc3MgaG9zdHMgd2hlbiBsaXZlIG1pZ3JhdGlvbj8K
PiAKPiBsdm1sb2NrZCBsb2NraW5nIGRvZXMgbm90IGFwcGx5IHRvIHRoZSBkbSBpL28gbGF5ZXJz
LiAgVGhlIGtpbmQgb2YKPiBtdWx0aS1ob3N0IGxvY2tpbmcgdGhhdCB5b3Ugc2VlbSB0byBiZSB0
YWxraW5nIGFib3V0IHdvdWxkIG5lZWQgdG8gYmUKPiBpbXBsZW1lbnRlZCBpbnNpZGUgZG0tdGhp
biB0byBwcm90ZWN0IG9uLWRpc2sgZGF0YSBzdHJ1Y3R1cmVzIHRoYXQgaXQKPiBtb2RpZmllcy4g
IEluIHJlYWxpdHkgeW91IHdvdWxkIG5lZWQgdG8gd3JpdGUgYSBuZXcgZG0gdGFyZ2V0IHdpdGgg
bG9ja2luZwo+IGFuZCBkYXRhIHN0cnVjdHVyZXMgZGVzaWduZWQgZm9yIHRoYXQga2luZCBvZiBz
aGFyaW5nLgoKSSBjYW4gdHJ5IHRvIHdyaXRlIGEgbmV3IGRtIHRoaW4gdGFyZ2V0IG9yIG1ha2Ug
c29tZSBtb2RpZmljYXRpb25zIGJhc2VkIApvbiB0aGUgZXhpc3RpbmcgZG0tdGhpbiB0YXJnZXQg
dG8gc3VwcG9ydCB0aGlzIGZlYXR1cmUsIGlmIGl0IGlzIAp0ZWNobmljYWxseSBmZWFzaWJsZS4g
QnV0IEknbSBjdXJpb3VzIHdoeSB0aGUgY3VycmVudCBkbS10aGluIGRvZXNuJ3QgCnN1cHBvcnQg
bXVsdGktaG9zdCBzaGFyZWQgYWNjZXNzLCBqdXN0IGxpa2UgZG0tbGluZWFyIGRvZXMuCgpSZWdh
cmRzIQoKWmhpeW9uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczov
L2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBM
Vk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCg==

