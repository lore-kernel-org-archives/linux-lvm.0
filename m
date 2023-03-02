Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1841C678D4
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Mar 2023 18:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677782031;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sZsbbpP5nvgzHBevWrqK4bQSVjR0E4fiuSxytL7HEKU=;
	b=E2gW5iK/tFH2QRXaxWd1UtjOAhoUBTX4tEpCouJGLomgFRlhFiuyQaJ0HtverZ1cb8LsYh
	4bgbQFXllmbVJZx7NvB1VSMTMNeIQIb2JUCY6H9NTTwcvqAtIq72UmVYgMlMyre93B9kec
	8t/DbvQCHCBLNPxe7lX2jT+2o0ruvIc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-MurqSuy5MQW5wilsVISctA-1; Thu, 02 Mar 2023 13:33:48 -0500
X-MC-Unique: MurqSuy5MQW5wilsVISctA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62CA4196EF8C;
	Thu,  2 Mar 2023 18:33:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9FD5492B00;
	Thu,  2 Mar 2023 18:33:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8360C19452D0;
	Thu,  2 Mar 2023 18:33:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 856B019452CE
 for <linux-lvm@listman.corp.redhat.com>; Thu,  2 Mar 2023 18:33:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 65CD0492B01; Thu,  2 Mar 2023 18:33:41 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E362492C3E
 for <linux-lvm@redhat.com>; Thu,  2 Mar 2023 18:33:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D7591C12981
 for <linux-lvm@redhat.com>; Thu,  2 Mar 2023 18:33:41 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-CsX7YBtjMEat5bVlWE5fHA-1; Thu, 02 Mar 2023 13:33:39 -0500
X-MC-Unique: CsX7YBtjMEat5bVlWE5fHA-1
Received: by mail-ua1-f48.google.com with SMTP id p2so6823708uap.1
 for <linux-lvm@redhat.com>; Thu, 02 Mar 2023 10:33:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KREYw16Fnxoi2ulESF2PxcRXby7I+Rb8tiUtEvHlK3I=;
 b=lFuzbRBjqcht+3l7Q35QABdevVjd2FtXqmDH9hOcmyqGie/AMo4qLxqDmJ7cbYBJOF
 wCM14/hoiD5emaZWmOe7g5LvxEz2c+bwGaDR6i/KebXwFvNgb+ivVSppyd3z5KhJELIi
 1jlFtPX1hRexGCGmCDc+uTaD342xS62EytiExKOgYGtm4scY7lSCaSbWvUlZRukkfV51
 t1zeTpoPY8PejVk0QIPYrVB+7YrKSNzJgRh1YF8yJFmlw7omM8yNi+bvrCm8qBALjLxN
 /T+xKCyLmOQYExEQD4k4HtkaQ782NjEhgTgiBOaYM+vHlSvC9JMnFZBNB6EPK36eTnHu
 8DWg==
X-Gm-Message-State: AO0yUKWLkhKVYGmFYDECn+bfqo0uLC73p1Nlrll0dfVPtCr078NJ5CgY
 e5YVChLgb5OiKHW6Hcb3W8XbhD5rvFwfqsFbgJSU3Aai
X-Google-Smtp-Source: AK7set/D1iIPnle5Y357VclrKDaYjXfa610jEDrChEPJDajFZhjqW80Ya4DfPda5hshrX0YDgwa0xIPltPK+M9J/uAM=
X-Received: by 2002:ab0:58c1:0:b0:68b:716e:ed8a with SMTP id
 r1-20020ab058c1000000b0068b716eed8amr1747165uac.0.1677782018735; Thu, 02 Mar
 2023 10:33:38 -0800 (PST)
MIME-Version: 1.0
References: <2023967259.761825.1677710640334.JavaMail.zimbra@karlsbakk.net>
 <CAAMCDeftn7gLN8s3EMFer+jJ95dRkdpR4007hDMqNNhjrbGDJA@mail.gmail.com>
 <17a0cca9c38c6eb8384275f68a2b465f@assyoma.it>
In-Reply-To: <17a0cca9c38c6eb8384275f68a2b465f@assyoma.it>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Thu, 2 Mar 2023 12:33:28 -0600
Message-ID: <CAAMCDed4T5wF9VEZzkmLURS7vueLYhRPVZ+kJdGTYAtkMx81Bw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [linux-lvm] lvconvert --uncache takes hours
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
Cc: Malin Bruland <malin.bruland@pm.me>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBNYXIgMiwgMjAyMyBhdCAxMTo0NOKAr0FNIEdpb25hdGFuIERhbnRpIDxnLmRhbnRp
QGFzc3lvbWEuaXQ+IHdyb3RlOgo+Cj4gSWwgMjAyMy0wMy0wMiAwMTo1MSBSb2dlciBIZWZsaW4g
aGEgc2NyaXR0bzoKPiA+IEEgc3Bpbm5pbmcgcmFpZDYgYXJyYXkgaXMgc2xvdyBvbiB3cml0ZXMg
KHNlZSByYWlkNiAgd3JpdGUgcGVuYWx0eSkuCj4gPiBCZWNhdXNlIG9mIHRoYXQgdGhlIGFycmF5
IGNhbiBvbmx5IGRvIGFib3V0IDEwMCB3cml0ZSBvcGVyYXR0aW9ucy9zZWMuCj4KPiBUcnVlLiBC
dXQgZG9lcyBmbHVzaGluZyBjYWNoZWQgZGF0YSByZWFsbHkgcHJvY2VlZCBpbiByYW5kb20gTEJB
IG9yZGVyCj4gKGFzIHNlZW4gYnkgSEREcyksIHJhdGhlciB0aGFuIHRyeWluZyB0byBjb2FsZXNj
ZSB3cml0ZXMgaW4gbGluZWFyCj4gZmFzaGlvbj8KPgpJdCBpcyBhIDEwMEcgY2FjaGUgb3ZlciAx
NlRCLCBzbyBldmVuIGlmIGl0IGZsdXNoZXMgaW4gb3JkZXIgdGhlIG1heQpub3QgYmUgdGhhdCBj
bG9zZSB0byBlYWNoIG90aGVyICgxIGluIDE2MCkuCgpBbHNvIGlmIHBpZWNlcyBhcmUgZGVjaWRl
ZCBhbmQgYWRkZWQgdG8gdGhlIGNhY2hlZCB0aGVuIHRoZSBjYWNoZSBpcwpub3QgaW4gb3JkZXIg
b24gdGhlIHNzZCBhbmQgcHJvcGVyIGNvYWxlc2Npbmcgd291bGQgcmVxdWlyZSByZWFkaW5nCnRo
ZSBlbnRpcmUgY2FjaGUgYW5kIHNvcnRpbmcgdGhlIDMsMDAwLDAwMCBsb2NhdGlvbiBlbnRyaWVz
IGJlZm9yZQpzdGFydGluZyB0aGUgZGUtc3RhZ2UuICBBbmQgdGhhdCBjb21wbGljYXRpb24gb2Yg
YSBkZS1zdGFnZSBpcyBsaWtlbHkKbm90IGJlZW4gY29kZWQgeWV0IGlmIEkgd2FzIGp1c3QgZ3Vl
c3NpbmcsIHRoZSBkZS1zdGFnZSBzdGFydHMgYXQgdGhlCmJlZ2lubmluZyBhbmQgY29udGludWVz
IHRvIHRoZSBlbmQgb2YgdGhlIGNhY2hlLgoKRXZlbiBjb2RlZCB0aG91Z2gsIGlmIHRoZSB5b3Ug
aGF2ZSBlbm91Z2ggYmxvY2tzIGNhY2hlZCBhbmQgaWYgdGhlCmJsb2NrcyBzcHJlYWQgc2F5IG9u
ZSBvciAyIG9uIGVhY2ggdHJhY2sgaXQgd291bGQgYnJlYWsgZG93biB0byBoYXZpbmcKdG8gd3Jp
dGUgYSB0aW55IGJpdCBvbiBlYWNoIHRyYWNrIHdpdGggc2Vla3MgYmV0d2VlbiBtb3N0bHkgYnJl
YWtpbmcKZG93biB0byB0aGUgdGltZSByZXF1aXJlZCB0byBzaW1wbHkgcmVhZC93cml0ZSAgdGhl
IEhEIGVuZCB0byBlbmQuICBBdAoxNTBNQi9zZWMgKHNob3VsZCBiZSBhYm91dCB0aGUgcGxhdHRl
ciBzcGVlZCkgdGhhdCB3b3VsZCB0YWtlIDMuNQpob3Vycy4KCgo+ID4gSWYgdGhlIGRpc2sgaXMg
ZG9pbmcgb3RoZXIgd29yayB0aGVuIGl0IG9ubHkgaGFzIHRoZSBleHRyYSBjYXBhY2l0eSBzbwo+
ID4gaXQgY291bGQgZGVzdGFnZSBzbG93ZXIuCj4gPgo+ID4gQSBsb3QgZGVwZW5kcyBvbiBob3cg
YmlnIGVhY2ggY2h1bmsgaXMuICAgICBUaGUgbHZtY2FjaGUgaW5kaWNhdGVzIHRoZQo+ID4gc21h
bGxlc3QgY2h1bmtzaXplIGlzIDMyay4KPiA+Cj4gPiAxMDBHIC8gMzJrID0gMyBtaWxsaW9uLCBh
bmQgYXQgMTAwc2Vla3Mvc2VjIHRoYXQgY29tZXMgdG8gYXQgbGVhc3QgYW4KPiA+IGhvdXIuCj4K
PiBZb3UgYXJlIG9mZiBhbiBvcmRlciBvZiBtYWduaXR1ZGU6IDMgbWlsbGlvbnMgSU9QIGF0IDEw
MCBJT1BzIG1lYW5zCj4gfjMwMDAwcywgc28gYWJvdXQgOSBob3Vycy4KClJpZ2h0LCBJIGRpZCB0
aGUgY2FsYyBpbiBteSBoZWFkIGFuZCBzY3Jld2VkIGl0IHVwLiAgSSB0aG91Z2h0IGl0CnNob3Vs
ZCBoYXZlIGJlZW4gaGlnaGVyIGJ1dCBkaWQgbm90IHJlLWNoZWNrIGl0Lgo+Cj4gPiBMdm0gYm9v
a2tlZXBpbmcgaGFzIHRvIGFsc28gYmUgd3JpdHRlbiB0byB0aGUgc3Bpbm5pbmcgZGlza3MgSSB3
b3VsZAo+ID4gdGhpbmssIHNvIDIgaG91cnMgaWYgdGhlIGFycmF5IHdlcmUgaWRsZS4KPiA+Cj4g
PiBUaHJvdyBpbiBhIDUwJSBiYXNlbG9hZCBvbiB0aGUgZGlza3MgYW5kIHlvdSBnZXQgNCBob3Vy
cy4KPiA+Cj4gPiBIb3VycyBpcyByZWFzb25hYmxlLgo+Cj4gSWYgZmx1c2hpbmcgaGFwcGVucyBp
biByYW5kb20gZGlzayBvcmRlciwgdGhhbiB5ZXMsIHlvdSBhcmUgYm91bmQgdG8KPiB3YWl0IHNl
dmVyYWwgaG91cnMgaW5kZWVkLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29t
Cmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJl
YWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

