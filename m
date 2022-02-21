Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB1EC433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 21 Feb 2022 17:40:53 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-cIhVSbAgMhSr4esZwo6U-Q-1; Mon, 21 Feb 2022 12:40:50 -0500
X-MC-Unique: cIhVSbAgMhSr4esZwo6U-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62209801B0D;
	Mon, 21 Feb 2022 17:40:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E00877CB4;
	Mon, 21 Feb 2022 17:40:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C2E01809CAA;
	Mon, 21 Feb 2022 17:40:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21LHagcY006179 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 21 Feb 2022 12:36:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E9967492CA8; Mon, 21 Feb 2022 17:36:41 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4FB3492CA4
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2022 17:36:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8588833968
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2022 17:36:41 +0000 (UTC)
Received: from forward500o.mail.yandex.net (forward500o.mail.yandex.net
	[37.140.190.195]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-148-pJI4FpA1PeumMQfCF0EHKw-1; Mon, 21 Feb 2022 12:36:39 -0500
X-MC-Unique: pJI4FpA1PeumMQfCF0EHKw-1
Received: from iva1-e45c762da66b.qloud-c.yandex.net
	(iva1-e45c762da66b.qloud-c.yandex.net
	[IPv6:2a02:6b8:c0c:9285:0:640:e45c:762d])
	by forward500o.mail.yandex.net (Yandex) with ESMTP id B1D6B9417C1;
	Mon, 21 Feb 2022 20:36:37 +0300 (MSK)
Received: from iva2-0a73a57cc944.qloud-c.yandex.net
	(iva2-0a73a57cc944.qloud-c.yandex.net
	[2a02:6b8:c0c:6985:0:640:a73:a57c])
	by iva1-e45c762da66b.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
	PsoBb8c4nU-abducJu5; Mon, 21 Feb 2022 20:36:37 +0300
X-Yandex-Fwd: 2
Received: by iva2-0a73a57cc944.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
	id lYT7VbOst4-abHuNc6J; Mon, 21 Feb 2022 20:36:37 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
Message-ID: <de77c4550787b0e9430d7e3cf0035c176df17722.camel@yandex.ru>
From: Konstantin Kharlamov <hi-angel@yandex.ru>
To: David Teigland <teigland@redhat.com>
Date: Mon, 21 Feb 2022 20:35:07 +0300
In-Reply-To: <20220221164947.GA18428@redhat.com>
References: <3e96860d112e86ee55fba0e5fffbf1ee433905e6.camel@yandex.ru>
	<20220221164947.GA18428@redhat.com>
User-Agent: Evolution 3.42.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 21LHagcY006179
X-loop: linux-lvm@redhat.com
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Frequent crashes when accessing dev_name(dev) on an
 empty list
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIyLTAyLTIxIGF0IDEwOjQ5IC0wNjAwLCBEYXZpZCBUZWlnbGFuZCB3cm90ZToK
PiBPbiBNb24sIEZlYiAyMSwgMjAyMiBhdCAwNDo0NTo1MVBNICswMzAwLCBLb25zdGFudGluIEto
YXJsYW1vdiB3cm90ZToKPiA+IFNvLCB3aGF0IGhhcHBlbmVkIHdhcyB0aGF0IGRldl9uYW1lKGRl
dikgd2FzIGV4dHJhY3RpbmcgYSBgZGV2LT5hbGlhc2VzYAo+ID4gZWxlbWVudAo+ID4gLCBob3dl
dmVyIGBkZXYtPmFsaWFzZXNgIHdhcyBlbXB0eSwgdGh1cyB0aGUgZXh0cmFjdGVkIGVsZW1lbnQg
d2FzIGEganVuay4KPiA+IAo+ID4gQWx0aG91Z2ggd2UgZW5jb3VudGVyZWQgdGhlc2UgY3Jhc2hl
cyBvbiBhbiBvbGRlciAyLjAzLjA3IHZlcnNpb24sIGhvd2V2ZXIKPiA+IHRoZQo+ID4gcGF0Y2gg
YXBwbGllcyB0byBsYXRlc3QgbWFzdGVyIGFzIHdlbGwsIHRodXMgdGhlIGJ1Z3MgYXJlIHN0aWxs
IHJlbGV2YW50LAo+ID4gd2hpY2gKPiA+IGlzIG9kZC4gVGhpcyBtYWtlcyBtZSB3b25kZXJpbmcs
IGlzIHRoaXMgYSBrbm93biBwcm9ibGVtLCBjb3VsZCBJIHBvc3NpYmx5Cj4gPiBvdmVybG9va2Vk
IHNvbWV0aGluZywgZm9yIGV4YW1wbGUgdGhhdCBkZXYtPmFsaWFzZXMgc2hvdWxkIG5ldmVyIGJl
IGVtcHR5LAo+ID4gYW5kCj4gPiB0aHVzIHRoZSBmaXgganVzdCB3b3JrcyBhcm91bmQgYW5vdGhl
ciBwcm9ibGVtPyBBbnkgdGhvdWdodHM/Cj4gCj4gSXQncyBmYW1pbGlhciwgYnV0IEkgdGhvdWdo
dCBpdCB3YXMgZml4ZWQuwqAgSSBkb24ndCByZW1lbWJlciB0aGUgZGV0YWlscywKPiBzbyB3ZSds
bCBoYXZlIHRvIGxvb2sgYXQgaXQgYWdhaW4uwqAgSXQncyByZWxhdGVkIHRvIGEgZGV2aWNlIGJl
aW5nIHJlbW92ZWQKPiBmcm9tIHRoZSBzeXN0ZW0gd2hpbGUgdGhlIGNvbW1hbmQgaXMgcnVubmlu
Zywgd2hpY2ggd2UgbmVlZCB0byBhZGQgdGVzdHMKPiBmb3IuCgpPa2F5LCB0aGFuayB5b3UsIHNv
IEkgZ3Vlc3MgdGhlIGNvbmNsdXNpb24gaXMgdGhhdCBiZWZvcmUgYW55dGhpbmcgZWxzZSB3ZSBu
ZWVkIHRvIHJlcHJvZHVjZSBpdCB3aXRoIHRoZSBsYXRlc3QgdmVyc2lvbi4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBs
aXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAu
b3JnL0hPV1RPL0xWTS1IT1dUTy8=

