Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED82C7EE23
	for <linux-lvm@archiver.kernel.org>; Mon, 22 May 2023 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684764527;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3GmNKnGaOdc80NU8Bt7usYGwFZ61y9F9A/AJSORkLho=;
	b=JvI74dT3wLodo4dKMogy4LbMq6geMUTfFsXWUKTPJ0eZWRrouQOI72TQlswB5xQL2zDDiy
	1POZ+YN0Bmj0L0S9t57SNQ8vjF7sxknfHNWrCiuy24FeispOpM5qOEpXvBPDVDEb9j+BDR
	2Y3so2zWdSd2dwwfWI4CoQcrnXeJEU8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-yS9uCqrJNiiP_Myu9SgQIQ-1; Mon, 22 May 2023 10:08:46 -0400
X-MC-Unique: yS9uCqrJNiiP_Myu9SgQIQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1587280BC4B;
	Mon, 22 May 2023 14:08:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3D597B7C;
	Mon, 22 May 2023 14:08:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E6C1319465B7;
	Mon, 22 May 2023 14:08:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 38C3019465B3
 for <linux-lvm@listman.corp.redhat.com>; Mon, 22 May 2023 14:08:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1AF437B7C; Mon, 22 May 2023 14:08:34 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13D1E7C52
 for <linux-lvm@redhat.com>; Mon, 22 May 2023 14:08:34 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED9F38027F5
 for <linux-lvm@redhat.com>; Mon, 22 May 2023 14:08:33 +0000 (UTC)
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-224-PRL3vCSBNJquMFKQ9Zs71Q-1; Mon,
 22 May 2023 10:08:32 -0400
X-MC-Unique: PRL3vCSBNJquMFKQ9Zs71Q-1
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 23DD212091E; Mon, 22 May 2023 09:58:49 -0400 (EDT)
References: <60e1a6cf-0384-5f6b-299b-a40c60a0b1a4@vetterlein.com>
User-agent: mu4e 1.7.12; emacs 27.1
From: Phillip Susi <phill@thesusis.net>
To: graeme vetterlein <graeme.lvm@vetterlein.com>
Date: Mon, 22 May 2023 09:49:32 -0400
In-reply-to: <60e1a6cf-0384-5f6b-299b-a40c60a0b1a4@vetterlein.com>
Message-ID: <87lehgmpra.fsf@vps.thesusis.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [linux-lvm] badblocks
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
Cc: linux-lvm@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: thesusis.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CmdyYWVtZSB2ZXR0ZXJsZWluIDxncmFlbWUubHZtQHZldHRlcmxlaW4uY29tPiB3cml0ZXM6Cgo+
IEkgaGF2ZSBhIGRlc2t0b3AgTGludXggYm94IChEZWJpYW4gU2lkKSB3aXRoIGEgY2x1dGNoIG9m
IGRpc2tzIGluIGl0Cj4gKDQgb3IgNSnCoCBhbmQgaGF2ZSBtb3N0bHkgZGVmaW5lZCBlYWNoIGRp
c2sgYXMgYSB2b2x1bWUgZ3JvdXAuCgpXaHk/ICBUaGUgcHJ1cG9zZSBvZiBhIFZHIGlzIHRvIGhv
bGQgbXVsdGlwbGUgUFZzLgoKPiBOb3cgYSBrZXkgcG9pbnQgaXMgKnNvbWUgb2YgdGhlIGRpc2tz
IGFyZSBOQVMgZ3JhZGUgZGlza3MuKiBUaGlzIG1lYW5zCj4gdGhleSBkbyBOT1QgcmVhbGxvY2F0
ZSBiYWQgc2VjdG9ycyBzaWxlbnRseS4gVGhleSByZXBvcnQgSU8gZXJyb3JzIGFuZCAKPiBsZWF2
ZSBpdCB0byB0aGUgT1MgKGkuZS4gdGhlIG9sZCBmYXNoaW9uIHdheSBvZiBkb2luZyB0aGlzKQoK
QXJlIHlvdSBzdXJlIHRoYXQgeW91IGFyZSBub3QgY29uZnVzaW5nIHRoZSBFUkMgZmVhdHVyZSBo
ZXJlPyAgVGhhdCBsZXRzCnRoZSBkcml2ZSBnaXZlIHVwIGluIGEgcmVhc29uYWJsZSBhbW91bnQg
b2YgdGltZSBhbmQgcmVwb3J0IHRoZSAocmVhZCkKZXJyb3IgcmF0aGVyIHRoYW4ga2VlcCB0cnlp
bmcuICBNb3N0IG9mdGVuIHRoZXJlIGlzIG5vdGhpbmcgd3Jvbmcgd2l0aAp0aGUgZGlzayBwaHlz
aWNhbGx5IGFuZCB3cml0aW5nIHRvIHRoZSBzZWN0b3Igd2lsbCBzdWNjZWVkLiAgSWYgaXQKZG9l
c24ndCwgdGhlbiB0aGUgZHJpdmUgd2lsbCByZW1hcCBpdC4KCj4gVGhlbiAqdGhlIHBlbm55IGRy
b3BwZWQhKiBUaGUgb25seSBjb21wb25lbnQgdGhhdCBoYXMgYSB2aWV3IG9uIHRoZQo+IHJlYWwg
cGh5c2ljYWwgZGlzayBpcyBsdm0yIGFuZCBpbiBwYXJ0aWN1bGFyIHRoZSBQViAuLi5zbyBpZiBh
bnlib2R5Cj4gY2FuIG1hcmsoYW5kIGF2b2lkKSBiYWRibG9ja3MgaXQncyB0aGUgUFYuLi5zbyBJ
IHNob3VsZCBiZSBsb29raW5nIGZvciAKPiBzb21ldGhpbmcgYWtpbiB0byB0aGUgLWNjIG9wdGlv
biBvZiBmc2NrICwgYXBwbGllZCB0byBhIFBWIGNvbW1hbmQ/CgpUaGVvcmV0aWNhbGx5IHllcywg
eW91IGNhbiBjcmVhdGUgYSBtYXBwaW5nIHRvIHJlbG9jYXRlIHRoZSBibG9jawplbHNld2hlcmUs
IGJ1dCB0aGVyZSBhcmUgbm8gdG9vbHMgdGhhdCBJIGFtIGF3YXJlIG9mIHRvIGhlbHAgd2l0aCB0
aGlzLgpBZ2FpbiwgYXJlIHlvdSBzdXJlIHRoZXJlIGlzIGFjdHVhbGx5IHNvbWV0aGluZyB3cm9u
ZyB3aXRoIHRoZSBkaXNrPwpUcnkgd3JpdGluZyB0byB0aGUgImJhZCBibG9jayIgYW5kIHNlZSB3
aGF0IGhhcHBlbnMuICBFdmVyeSB0aW1lIEkgaGF2ZQpkb25lIHRoaXMgaW4gdGhlIGxhc3QgMjAg
eWVhcnMsIHRoZSBwcm9ibGVtIGp1c3QgZ29lcyBhd2F5LiAgVXN1YWxseQp3aXRob3V0IGV2ZW4g
dHJpZ2dlcmluZyBhIHJlYWxsb2NhdGlvbi4gIFRoaXMgaXMgYmVjYXVzZSB0aGUgZGF0YSBqdXN0
CmdvdCBhIGxpdHRsZSBzY3JhbWJsZWQgZXZlbiB0aG91Z2ggdGhlcmUgaXMgbm90aGluZyB3cm9u
ZyB3aXRoIHRoZQptZWRpdW0uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0
dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQg
dGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

