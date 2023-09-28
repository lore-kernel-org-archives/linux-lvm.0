Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E66E732C8
	for <linux-lvm@archiver.kernel.org>; Thu, 28 Sep 2023 12:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695905851;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HB1yx3XDI43wURH1fdHJEkQOonQUnTwxDXmxxnPA8Pc=;
	b=RVzNF2CZNf0AHkFJs9T31Rx+NV0f3nVs0JS2ykfbQoRsorVrYdmfqoDzhYjA5ZQq6UEFKT
	+s/lbSPfiwYtyYKZf9RyHzNAQPYVny8V36ABTGnXDwPXIdp4/vauTptJ9pL7ryRH561Kv6
	Zp653hCgs1/WgwLHbBztfO+sxsBjjVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-DDj21acnOLGGS1JNpxqqVA-1; Thu, 28 Sep 2023 08:57:28 -0400
X-MC-Unique: DDj21acnOLGGS1JNpxqqVA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3453C858F1D;
	Thu, 28 Sep 2023 12:57:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34E45401025;
	Thu, 28 Sep 2023 12:57:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C0E2C1946589;
	Thu, 28 Sep 2023 12:57:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E7A071946587
 for <linux-lvm@listman.corp.redhat.com>; Thu, 28 Sep 2023 12:23:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C3F7928FE; Thu, 28 Sep 2023 12:23:36 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC121170EC
 for <linux-lvm@redhat.com>; Thu, 28 Sep 2023 12:23:36 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 997163C0E445
 for <linux-lvm@redhat.com>; Thu, 28 Sep 2023 12:23:36 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-vOMAcw3jM3u-JUVaB65ciw-1; Thu, 28 Sep 2023 08:23:34 -0400
X-MC-Unique: vOMAcw3jM3u-JUVaB65ciw-1
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-32003aae100so9422460f8f.0
 for <linux-lvm@redhat.com>; Thu, 28 Sep 2023 05:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695903813; x=1696508613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mr6Kv/wrEAVLYIrBZ3Sa8Wle8hXRycPO54C5AKJUNm0=;
 b=sgTIi31P5BQQvke43hM2AjFBgenL7fokL8cCxx/CLQnsomtKdn1G5pg301S4yuhKUI
 eQXYdRKFI7RYqnD9dSE5B93WrYbYpBnv9K3uOPu94AtgQha2gKD3C52tK9h6Mt62QiAj
 mzMFg5er/FdFCaDSQU1xx5rm+HTg7PSQgAJdV1kK9tHL3H4CGEoeqZuHLabpaL5yB8oY
 qBJ28UugNese3FPqc9Mb3Xni5W8Gm1mQFsrRYfll+po7EQDqGrokouhYPKvbQD/kTz6h
 vg/Ud6QjVww+J6rgeWvb5NJv2HWLQ5/2wQ5qY0rl490vvsJlR479nj1GlALeeMDf1VT0
 xWqw==
X-Gm-Message-State: AOJu0YzkB3o8TaF+4ulesP0YaE9I7bH8y0ZuT+Wd8jOp2LedaffF52jw
 NSAnrmdXLaj7z3w19D7aiWBWoHP1RK9lA0qQgHPt+sM219k=
X-Google-Smtp-Source: AGHT+IEFxgTE3y8kC+lUDQYO3z2JIECJLlJaTM9rZ/81pWbR6/eUrWv2xGIoJoGOLBWFMiEu9O5QpcuNWflv4IO8DXk=
X-Received: by 2002:a5d:690b:0:b0:320:938:3016 with SMTP id
 t11-20020a5d690b000000b0032009383016mr1054554wru.18.1695903813206; Thu, 28
 Sep 2023 05:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
 <6e0faedf-f450-4454-a86b-6448a1b4747b@gmail.com>
 <CAM5YWZfL8zf9=re+VU2MiAQcYvXodqDV-08Zu5RkKUMfkDJ7Tg@mail.gmail.com>
 <90d9a21d-f748-4ca1-b327-6c38f4440298@gmail.com>
 <CAM5YWZfbEhSJo_01SXRuxSwRPOWYexxDVm9-3W_+=rP+icHStQ@mail.gmail.com>
 <b7754a3e-ed6f-4f7e-afea-ed24426d7dd5@gmail.com>
In-Reply-To: <b7754a3e-ed6f-4f7e-afea-ed24426d7dd5@gmail.com>
From: Jean-Marc Saffroy <saffroy+redhat@gmail.com>
Date: Thu, 28 Sep 2023 14:23:21 +0200
Message-ID: <CAM5YWZdnPJtZ_BDWkspDzoTk=6Zk-BG=eiH6hbVe2F-e57dDhg@mail.gmail.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBTZXAgMjcsIDIwMjMgYXQgNTo0MeKAr1BNIFpkZW5layBLYWJlbGFjIDx6ZGVuZWsu
a2FiZWxhY0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBXaGF0IGlzIHRoZSByb2xlIG9mICJkbXNl
dHVwIHN1c3BlbmQiPyBJIGFtIGhhdmluZyB0cm91YmxlIGZpbmRpbmcKPiA+IGRlY2VudCBkb2N1
bWVudGF0aW9uIGFib3V0IGl0cyBwdXJwb3NlIGFuZCBob3cgaXQncyByZWxhdGVkIHRvCj4gPiBz
bmFwc2hvdHMuIEkgZGlkIG5vdCBuZWVkIGl0IGluIG15IGV4cGVyaW1lbnRzLCBzbyBJIGFtIGN1
cmlvdXMuCj4gPgo+Cj4KPiBTdXNwZW5kIGlzIGZyZWV6aW5nIGRldmljZSdzIGkvbyBxdWV1ZSAg
KHRvZ2V0aGVyIHdpdGggZnJlZXppbmcgRlMgbGF5ZXIgLSBzbwo+IHRoZSBzbmFwc2hvdCBzaG91
bGQgYmUgZWFzaWx5IG1vdW50YWJsZSB3aXRob3V0IHJlcXVpcmluZyBleHRlbnNpdmUgZnNjawo+
IG9wZXJhdGlvbiBhcyBpdCB3b3VsZCBiZSBtaXNzaW5nIHNvbWUgaW1wb3J0YW50IG1ldGFkYXRh
IHRvIGJlIHdyaXR0ZW4gb24gZGlzaykKPiBTbyB0aGUgZ29hbCBvZiBhIHN1c3BlbmQgaXMgdG8g
dGFrZSBhICdnb29kIHBvaW50IGluIHRpbWUnIHdoZXJlIHRoZSBjb250ZW50Cj4gb2Ygc25hcHNo
b3QgaXMgaGF2aW5nIGFsbCAnY29tbWl0dGVkJyB0cmFuc2FjdGlvbiBvbiBkaXNrIGluIHZhbGlk
IHN0YXRlLgoKSXMgdGhpcyBzdGlsbCByZXF1aXJlZCBvciB1c2VmdWwgd2l0aCBhIGpvdXJuYWxp
bmcgRlMgbGlrZSBleHQ0PyBJdCBpcwpyb2J1c3QgdG8gcHVsbGluZyB0aGUgcGx1ZyBhdCBhbnkg
dGltZSwgc28gYW55IHBvaW50IGluIHRpbWUgc2hvdWxkIGJlCmdvb2QsIG5vPwoKPiBDbGVhcmx5
IHRoYXQgbmVlZHMgYSAndG9wLWxldmVsIGRldmljZSAtIHdoaWNoIHdvdWxkIGJlIGEgY3J5cHRv
IERNIGluIHlvdXIKPiBjYXNlIC0gYW5kIGdvZXMgdmlhICd0cmVlJyBkb3duIHRvIFBWIGxldmVs
Lgo+Cj4gQ2xlYXJseSBsdm0yIGRvZXMgdGhpcyB3aGlsZSB0YWtpbmcgc25hcHNob3QgIC0gYW5k
IHlvdSBjYW4gZWFzaWx5IG9ic2VydmUKPiB0aGF0ICdtYWdpYycgaWYgeW91IHJlYWQgY2FyZWZ1
bGx5ICAtdnZ2diAgdHJhY2Ugb2YgYSBjb21tYW5kLgo+Cj4gVGhlbiB5b3VyIHNjcmlwdCBuZWVk
cyB0byByZXBsaWNhdGUgdGhpcyBhdCBzY3JpcHQgbGV2ZWwuCj4gRnVuIHdvdWxkIGJlZ2luIG9u
Y2UgeW91IHdvdWxkIHN0YXJ0IHRvIHJlc29sdmUgYWxsIHRoZSBwb3NzaWJsZSBlcnJvciBwYXRo
cy4uLgoKQ2xlYXJseSBJIGhhdmUgbm8gcGxhbiB0byByZWltcGxlbWVudCBMVk0gd2l0aCBob21l
Z3Jvd24gc2NyaXB0cy4gOi0pCgpUaGF0IHNhaWQsIEkgYW0gY3VyaW91cyBhYm91dCB3aGF0IGNh
biBiZSBhY2hpZXZlZCB3aXRoIGRtc2V0dXAKY29tbWFuZHMuIEJ5IGFueSBjaGFuY2UsIGRvIHlv
dSBoYXZlIHBvaW50ZXJzIHRvIGRvY3VtZW50YXRpb24gYmVzaWRlcwp3aGF0J3MgaW4gdGhlIGtl
cm5lbCAoRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9kZXZpY2UtbWFwcGVyLyk/Cgo+ID4gSWYg
SSB3ZXJlIG9rYXkgd2l0aCBnaXZpbmcgdGhlIHBhc3NwaHJhc2UgdG8gbXkgYmFja3VwIHNjcmlw
dCwgdGhlbiBJCj4gPiBjb3VsZCBzaW1wbHkgaGF2ZSB0aGUgYmFja3VwIHNjcmlwdCBjcmVhdGUg
aXRzIHNuYXBzaG90IGZyb20gdGhlCj4gPiBlbmNyeXB0ZWQgTFYsIGFuZCBJIHdvdWxkbid0IGhh
dmUgc3RhcnRlZCB0aGlzIHRocmVhZCBpbiB0aGlzIGNhc2UuCj4gPiA6LSkKPgo+IE1heWJlIHlv
dSBjb3VsZCBkcm9wIHlvdXIgd2hvbGUgZGlzayBlbmNyeXB0aW9uIGlkZWEgdGhlbiBhbmQganVz
dCB1c2Ugc29tZQo+IGVuY3J5cHRlZCB0YXJiYWxscyAtIHNpbmNlIGlmIHlvdSB0ZW5kIHRvIHBs
YWNlIHBhc3N3b3JkcyBpbnRvIHNjcmlwdHMgLSBpdCdzCj4ga2luZCBvZiBiaWcgc2VjdXJpdHkg
aG9sZS4uLi4KClNvIEkgdGhpbmsgSSd2ZSBmb3VuZCBhIGRlY2VudCBhbHRlcm5hdGl2ZSB0byBw
dXR0aW5nIHBhc3N3b3JkcyBpbnRvCnNjcmlwdHMgb3IgZmlsZXM6IGtlcm5lbCBrZXkgcmluZ3Mu
CgpJdCB0dXJucyBvdXQgY3J5cHR0YWIgKGF0IGxlYXN0IG9uIERlYmlhbikgY2FuIGxldmVyYWdl
IGtleWN0bCB0bwplbmFibGUgcmV1c2luZyBzb21lIHNlY3JldHMgd2l0aG91dCBleHBvc2luZyB0
aGVtIHRvbyBtdWNoLgoKSSBoYWxmLXRlc3RlZCBhIGNyeXB0dGFiIGZpbGUgbGlrZSB0aGlzOgoK
IyA8dGFyZ2V0IG5hbWU+IDxzb3VyY2UgZGV2aWNlPiAgICAgICAgIDxrZXkgZmlsZT4gICAgICA8
b3B0aW9ucz4KaG9tZSAgICAvZGV2L3ZnMS9jcnlwdGhvbWUgICAgICBob21lCmx1a3Msbm9lYXJs
eSxrZXlzY3JpcHQ9L3Jvb3QvZGVjcnlwdF9rZXljdGwKc25hcCAgICAvZGV2L3ZnMS9zbmFwICAg
ICAgICAgICBob21lCmx1a3Msbm9hdXRvLGtleXNjcmlwdD0vcm9vdC9kZWNyeXB0X2tleWN0bAoK
VGhlIHJlZmVyZW5jZWQgc2NyaXB0IGFib3ZlIGlzIG1lcmVseSBhIGNvcHkgRGViaWFuJ3MgZGVj
cnlwdF9rZXljdGwKd2l0aCB0aGUgImtleWN0bCB0aW1lb3V0IiBsaW5lcyBjb21tZW50ZWQuCgpJ
biB0aGlzIHdheSwgZWFjaCByZS1jcmVhdGlvbiBvZiB0aGUgc25hcHNob3Qgc2hvdWxkIHJldXNl
IHRoZSBzZWNyZXQKc3RvcmVkIGluIHJvb3QncyAidXNlciIga2V5cmluZyB3aXRoIHRoZSAiY3J5
cHRzZXR1cDpob21lIgpkZXNjcmlwdGlvbiwgYW5kIHRoaXMgc2VjcmV0IHNob3VsZCBiZSBmaXJz
dCBzdG9yZWQgaW4gdGhlIGtleXJpbmcKd2hlbiBwcm9tcHRpbmcgdGhlIHVzZXIgYXQgYm9vdCB0
aW1lLgoKVGhlIGJhY2t1cCBqb2IgY2FuIGxhdGVyIGRvIHNvbWV0aGluZyBsaWtlIHRoaXM6Cgo+
ICsgbHZjcmVhdGUgLW4gc25hcCAtLXNuYXBzaG90IC1MIDFHIC9kZXYvdmcxL2NyeXB0aG9tZQo+
ICAgTG9naWNhbCB2b2x1bWUgInNuYXAiIGNyZWF0ZWQuCj4gKyBjcnlwdGRpc2tzX3N0YXJ0IHNu
YXAKPiBTdGFydGluZyBjcnlwdG8gZGlzay4uLnNuYXAgKHN0YXJ0aW5nKS4uLlVzaW5nIGNhY2hl
ZCBwYXNzcGhyYXNlIGZvciBzbmFwLgo+IHNuYXAgKHN0YXJ0ZWQpLi4uZG9uZS4KPiArIG1vdW50
IC9kZXYvbWFwcGVyL3NuYXAgL21udC9zbmFwCi4uLiBwZXJmb3JtIHRoZSBhY3R1YWwgZmlsZSBi
YWNrdXAuLi4KPiArIHVtb3VudCAvbW50L3NuYXAKPiArIGNyeXB0ZGlza3Nfc3RvcCBzbmFwCj4g
U3RvcHBpbmcgY3J5cHRvIGRpc2suLi5zbmFwIChzdG9wcGluZykuLi5kb25lLgo+ICsgbHZyZW1v
dmUgLXkgL2Rldi92ZzEvc25hcAo+ICAgTG9naWNhbCB2b2x1bWUgInNuYXAiIHN1Y2Nlc3NmdWxs
eSByZW1vdmVkLgoKQW5kIHNvIGluIHRoaXMgY2FzZSwgTFVLUyBvbiBMVk0gY2FuIGRvIHRoZSBq
b2IgYW5kIG1lZXQgYWxsIG15IHJlcXVpcmVtZW50cy4KClRoZSBtaW5vciBkcmF3YmFjayBpcyB0
aGF0IHRoZSBwYXNzcGhyYXNlIGNhbiBzdGlsbCBiZSBzZWVuIGJ5IHJvb3QKd2l0aCBhIGNvbW1h
bmQgbGlrZToKICBrZXljdGwgcHJpbnQgJChrZXljdGwgc2VhcmNoIEB1IHVzZXIgY3J5cHRzZXR1
cDpob21lKQoKQnV0IHRoYXQncyBnb29kIGVub3VnaCBmb3IgbWUuCgpDaGVlcnMsCkpNCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFp
bGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDov
L3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

