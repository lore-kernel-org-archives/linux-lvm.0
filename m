Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4A2C433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 21 Dec 2021 19:28:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-wPhSqt9lPJenSbTW0HECBg-1; Tue, 21 Dec 2021 14:28:06 -0500
X-MC-Unique: wPhSqt9lPJenSbTW0HECBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C3401922021;
	Tue, 21 Dec 2021 19:28:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0081778DFC;
	Tue, 21 Dec 2021 19:27:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BC1C4BB7C;
	Tue, 21 Dec 2021 19:27:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BLJRZsQ003098 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 21 Dec 2021 14:27:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E3728C080B5; Tue, 21 Dec 2021 19:27:34 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEF76C080B4
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 19:27:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C21863806721
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 19:27:34 +0000 (UTC)
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-36-JDe64QXRNSumqYLak-Z2Iw-1; Tue, 21 Dec 2021 14:27:33 -0500
X-MC-Unique: JDe64QXRNSumqYLak-Z2Iw-1
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id 868C46F3FF; Tue, 21 Dec 2021 14:27:32 -0500 (EST)
References: <0026c26e-a5e0-272d-e5d6-739466cbd6b2@gmail.com>
	<89C3404F-E604-45DA-AEFD-200DCC89631D@gmail.com>
User-agent: mu4e 1.7.0; emacs 27.1
From: Phillip Susi <phill@thesusis.net>
To: LVM general discussion and development <linux-lvm@redhat.com>
Date: Tue, 21 Dec 2021 14:23:11 -0500
In-reply-to: <89C3404F-E604-45DA-AEFD-200DCC89631D@gmail.com>
Message-ID: <87a6gtwyfv.fsf@vps.thesusis.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BLJRZsQ003098
X-loop: linux-lvm@redhat.com
Cc: Tomas, =?utf-8?Q?=C3=B6rk?= <tomas.dalebjork@gmail.com>,
	Zdenek Kabelac <zdenek.kabelac@gmail.com>
Subject: Re: [linux-lvm] how to convert a disk containing a snapshot to a
 snapshot lv?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

ClRvbWFzIERhbGViasO2cmsgPHRvbWFzLmRhbGViam9ya0BnbWFpbC5jb20+IHdyaXRlczoKCj4g
aGkKPgo+IEkgdGhpbmsgSSBkaWRu4oCZdCBleHBsYWluIHRoaXMgY2xlYXIgZW5vdWdoIAo+IEFs
bHRoZSBsdm0gZGF0YSBpcyBwcmVzZW50IGluIHRoZSBzbmFwc2hvdCB0aGF0IEkgcHJvdmlzaW9u
IGZyb20gb3VyIGJhY2t1cCBzeXN0ZW0gCj4gSSBjYW4gZ3VhcmFudGVlIHRoYXQhCj4KPiBJZiBJ
IGp1c3QgbW91bnQgdGhhdCBzbmFwc2hvdCBmcm9tIG91ciBiYWNrdXAgc3lzdGVtLCBpdCB3b3Jr
cyBwZXJmZWN0bHkgd2VsbAo+Cj4gc28gd2UgZG9u4oCZdCBuZWVkIHRoZSBvcmlnaW4gdm9sdW1l
cyBpbiBvdGhlciB3YXkgdGhhbiBjb3B5aW5nIGJhY2sgdG8gaXQKPiB3ZSBqdXN0IG5lZWQgdG8g
cmVhbmltYXRlIGl0IGFzIGEgY293IHZvbHVtZQo+IG1lbnRpb25pbmcgdGhhdCBhbGwgZGF0YSBo
YXMgYmVlbiBjaGFuZ2VkCj4gdGhlIGNvdyBpcyBqdXN0IHJlZmVyZW5jaW5nIHRvIHRoZSBvcmln
aW4gbG9jYXRpb24sIHNvIG5vIHByb2JsZW0gdGhlcmUKPiBBbGwgb3VyIGRhdGEgaXMgaW4gdGhl
IGNvdyB2b2x1bWUsIG5vdCBqdXN0IHRoZSBjaGFuZ2VzCgoKT2ssIHNvIHlvdSBoYXZlIHRocm93
biBvdXQgdGhlIHNuYXBzaG90IHJlbGF0aW9uc2hpcCB3aGVuIHlvdSBtYWRlIHlvdXIKYmFja3Vw
LCBhbmQgYmFja2VkIHVwIGJvdGggdGhlIG9yaWdpbiBhbmQgdGhlIHNuYXBzaG90IGFzIHR3byBz
ZXBhcmF0ZQpiYWNrdXBzPyAgVGh1cyB5b3VyIGJhY2t1cCByZXF1aXJlcyBtdWNoIG1vcmUgc3Bh
Y2UgdGhhbiB0aGUgb3JpZ2luYWwKc3lzdGVtIGRpZCBzaW5jZSBhbGwgb2YgdGhlIGNvbW1vbiBk
YXRhIGhhcyBub3cgYmVlbiBkdXBsaWNhdGVkIGluIGJvdGgKYmFja3Vwcy4gIE5vdyBpdCBzZWVt
cyB5b3Ugd2FudCB0byByZXN0b3JlIGJvdGggYmFja3VwcywgYnV0IE5PVCBwYXkgdGhlCnN0b3Jh
Z2UgcGVuYWx0eSBmb3IgZHVwbGljYXRpbmcgdGhlIGNvbW1vbiBwYXJ0cy4gIEkgZG9uJ3QgdGhp
bmsgdGhlcmUKaXMgcmVhbGx5IGEgZ29vZCB3YXkgb2YgZG9pbmcgdGhhdC4KCkknZCBzYXkgdGhh
dCB5b3UgY2FuIHJlc3RvcmUgdGhlIG9yaWdpbiB2b2x1bWUsIHRoZW4gY3JlYXRlIGEgc25hcHNo
b3QKb2YgdGhhdCwgdGhlbiBydW4gc29tZSBzb3J0IG9mIGJpbmFyeSBkaWZmIGJldHdlZW4gdGhl
IG9yaWdpbiBhbmQgdGhlCmJhY2t1cCBvZiB0aGUgc25hcHNob3QgYW5kIHdyaXRlIHRoYXQgZGlm
ZiB0byB0aGUgbmV3IHNuYXBzaG90LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5j
b20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0K
cmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLw==

