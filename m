Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2741C77B6F
	for <linux-lvm@archiver.kernel.org>; Tue, 11 Apr 2023 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681232764;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=heUR/R4EfBP91KO7jxDhRNB5F0P88GWtIHGrM9Osuxo=;
	b=HlcFWLDHnJ9thvCSkB0XzcMCBkzsFcfUBLQ1CG+JcgkEQe/ej+eXpljYL/nU9dv0RpBTPi
	v/ed+UrMIdRzTlhknLXh9lT4qtcujcKbewgiYVkcgzXwfqTljGV7GXBr3iA2hS88YSc3T0
	okKnbrKClcMdNxTVXZ5BuRsQ3x5FsOM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-YuQ98-rRNjCXAr2L9hhAMQ-1; Tue, 11 Apr 2023 13:06:02 -0400
X-MC-Unique: YuQ98-rRNjCXAr2L9hhAMQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AA8818A63EF;
	Tue, 11 Apr 2023 17:05:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F24F614171D5;
	Tue, 11 Apr 2023 17:05:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B4ED51946A42;
	Tue, 11 Apr 2023 17:05:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 023401946A41
 for <linux-lvm@listman.corp.redhat.com>; Tue, 11 Apr 2023 17:05:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D3CA747CD0; Tue, 11 Apr 2023 17:05:32 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC1BA728FB
 for <linux-lvm@redhat.com>; Tue, 11 Apr 2023 17:05:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B8BC101A552
 for <linux-lvm@redhat.com>; Tue, 11 Apr 2023 17:05:32 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-B4_-SZknO4i82b7IsEroeQ-1; Tue, 11 Apr 2023 13:05:28 -0400
X-MC-Unique: B4_-SZknO4i82b7IsEroeQ-1
Received: by mail-ua1-f41.google.com with SMTP id ba16so6089081uab.4
 for <linux-lvm@redhat.com>; Tue, 11 Apr 2023 10:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681232727;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mfd0ziMufzh6JJ5lMxb4j6MuN+5nTU1WXpf4KpR4KPI=;
 b=DMwY51Tl/WPf3Bl/NOUtJSzdY5YgPIM3UfZiBC+eK4W8+4JVDjq2H7yQ1713hqxaYQ
 NBqMesI1BoB/CBVEioGMZdgHqR4AV06ocNxkVz5f5xOoPhcdmSj2iP/rSAcTxxDXEf2O
 Dkq7KVZRwrUGKTZGrLV3/xvZQe57i8A42UUMHM/ULbuJUbHcRcVVBph+pk+WRjNPUUMC
 82anc8rXhEBIZNvzWGdIN5qFnTOWTB1kA7xhsNaB5SKHpSY6FyBovKyyrTGAXhoxKvs2
 hnyzodGYacxH0EQfbO5x0FRayEGIu9Dzw1M1r5ofTyGsqcs2ts2mirXXQkVhI4ZT70Fx
 semQ==
X-Gm-Message-State: AAQBX9cw/3JSLU+YG2DGOTXGy7QqESrPc3u+8uUVjHS1hxjtPAT5UZv5
 FpVnURHRH4rqVDc8aLup4NVATdSwwf4Yph2L/8xixht7
X-Google-Smtp-Source: AKy350abezhKVv3z5xr4nJYv9ohPPAfGoMfB4tcQCkJKiQGiFGezK8RzPt4ozNijjOJ9LlTC/Y8ia1+9PUL3ny0UJK8=
X-Received: by 2002:a1f:a948:0:b0:43b:ce3f:12bd with SMTP id
 s69-20020a1fa948000000b0043bce3f12bdmr8308477vke.3.1681232727444; Tue, 11 Apr
 2023 10:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <1043528017.520337.1681071486811.ref@mail.yahoo.com>
 <1043528017.520337.1681071486811@mail.yahoo.com>
In-Reply-To: <1043528017.520337.1681071486811@mail.yahoo.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Tue, 11 Apr 2023 12:05:16 -0500
Message-ID: <CAAMCDecPPh48=u-iECpf9YKUt4YA8KtkiMbwLEn+0UOkgZCN_Q@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [linux-lvm] bug? shrink lv by specifying pv extent to be
 removed does not behave as expected
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBBcHIgMTEsIDIwMjMgYXQgMTo0NOKAr0FNIG1hdHRoZXcgcGF0dG9uIDxwYXR0b25t
ZUB5YWhvby5jb20+IHdyb3RlOgo+Cj4gPiBteSBwbGFuIGlzIHRvIHNjYW4gYSBkaXNrIGZvciB1
c2FibGUgc2VjdG9ycyBhbmQgbWFwIHRoZSBsb2dpY2FsIHZvbHVtZQo+ID4gYXJvdW5kIHRoZSBi
cm9rZW4gc2VjdG9ycy4KPgo+IDE5NzcgY2FsbGVkLCB0aGV5J2QgbGlrZSB0aGVpciBub24tc2Vs
Zi1jb3JyZWN0aW5nIEhEIGNvbnRyb2xsZXIgaW1wbGVtZW50YXRpb25zIGJhY2suCj4KPiBGcm9t
IGEgcmVhbC13b3JsZCBwZXJzcGVjdGl2ZSB0aGVyZSBpcyBaRVJPIChtb3JlIGxpa2UgbmVnYXRp
dmUpIHV0aWxpdHkgdG8gdGhpcyBleGVyY2lzZS4gQ29udHJvbGxlcnMgcmVtYXAgYmxvY2tzIGFs
bCBvbiB0aGVpciBvd24gYW5kIHRoZSBzby1jYWxsZWQgZ2VvbWV0cnkgaXMgZW50aXJlbHkgZmlj
dGl0aW91cyBhbnl3YXkuIEZyb20gYSBzY3JpcHQvcHJvZ3JhbSAiYmVjYXVzZSBJIHdhbnQgdG8i
IHBlcnNwZWN0aXZlIHlvdSBjb3VsZCBsZWF2ZSBMVk0gZW50aXJlbHkgb3V0IG9mIGl0IGFuZCBq
dXN0IHVzZSBhIGZpbGUgd2l0aCBhcmJpdHJhcnkgb2Zmc2V0cyBzY3JpYmJsZWQgd2l0aCBhICJi
YWQiIHNpZ25hdHVyZS4KCgpUaGUgZGlza3Mgc2hvdWxkIGJlIGFibGUgdG8gcmVtYXAgc2VjdG9y
cyBhbGwgb24gdGhlaXIgb3duLiAgRmV3Cihub25lPykgb2YgdGhlIHNhdGEvc2FzIG5vbi1yYWlk
IGNvbnRyb2xsZXJzIEkga25vdyBvZiBkbyBhbnkgZGlzawpsZXZlbCByZW1hcHBpbmcuICBTb21l
IG9mIHRoZSBoYXJkd2FyZSByYWlkIG9uZXMgbWF5LiAgIEFzIGltcGxlbWVudGVkCnRoZSBkZWNp
c2lvbiB0byByZW1hcCAoaW4gdGhlIGRpc2spIHNlZW1zIHRvIG5vdCBhbHdheXMgd29yawpjb3Jy
ZWN0bHkuICBJIGhhdmUgYSBudW1iZXIgb2YgZGlza3Mgb3ZlciBzZXZlcmFsIGdlbmVyYXRpb25z
IHRoYXQKd2lsbCByZWZ1c2UgdG8gcmUtbWFwIHdoYXQgaXMgYSBjbGVhcmx5IGJhZCBzZWN0b3Ig
KHJlLXdyaXRlcyB0byBhCmdpdmVuIHNlY3RvciBzdWNjZWVkLCBhbmQgdGhlbiBpbW1lZGlhdGUg
cmUtcmVhZHMgZmFpbCBhbmQgb24gYW5vdGhlcgpyZS13cml0ZSBzdWNjZWVkIGFnYWluIGFuZCBp
bW1lZGlhdGVseSBmYWlsIG9uIHJlLXJlYWQsIGJ1dCBkbyBub3QgZ2V0CnJlbWFwcGVkLgoKU28g
Z2l2ZW4gdGhpcywgaWYgb25lIGRvZXMgbm90IHdhbnQgdG8gYmUgcmVwbGFjaW5nIHRoZSBnaXZl
biBkaXNrcwp0aGVyZSBpcyByb29tIGZvciBzb2Z0d2FyZSBsZXZlbCByZW1hcHMgc3RpbGwgdG8g
dXNlIHRoZSBzaWduaWZpY2FudApudW1iZXIgb2YgZGlza3Mgd2l0aCBsaW1pdGVkIGJhZCBzZWN0
b3JzIG9uIHRoZW0uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8v
bGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExW
TSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

