Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D92C433FE
	for <linux-lvm@archiver.kernel.org>; Fri,  1 Apr 2022 14:55:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-bs4gdjkaO8SFL2BvZ2sTJQ-1; Fri, 01 Apr 2022 10:55:56 -0400
X-MC-Unique: bs4gdjkaO8SFL2BvZ2sTJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EBD718E5347;
	Fri,  1 Apr 2022 14:55:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BD8F40CFD0A;
	Fri,  1 Apr 2022 14:55:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 37AFA1949761;
	Fri,  1 Apr 2022 14:55:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B3DC91947BBE
 for <linux-lvm@listman.corp.redhat.com>; Fri,  1 Apr 2022 14:55:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4E1D240E80E6; Fri,  1 Apr 2022 14:55:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49DBF40E80E1
 for <linux-lvm@redhat.com>; Fri,  1 Apr 2022 14:55:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3271A811E75
 for <linux-lvm@redhat.com>; Fri,  1 Apr 2022 14:55:46 +0000 (UTC)
Received: from forward501p.mail.yandex.net (forward501p.mail.yandex.net
 [77.88.28.111]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-tgYqTPlFNcO1PtU9EfDN2A-1; Fri, 01 Apr 2022 10:55:44 -0400
X-MC-Unique: tgYqTPlFNcO1PtU9EfDN2A-1
Received: from myt6-b15a496b05fb.qloud-c.yandex.net
 (myt6-b15a496b05fb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:2228:0:640:b15a:496b])
 by forward501p.mail.yandex.net (Yandex) with ESMTP id E8A046212B2E
 for <linux-lvm@redhat.com>; Fri,  1 Apr 2022 17:48:28 +0300 (MSK)
Received: from myt5-ca5ec8faf378.qloud-c.yandex.net
 (myt5-ca5ec8faf378.qloud-c.yandex.net [2a02:6b8:c12:2514:0:640:ca5e:c8fa])
 by myt6-b15a496b05fb.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 qCzqOx5d9l-mSf00nxs; Fri, 01 Apr 2022 17:48:28 +0300
X-Yandex-Fwd: 2
Received: by myt5-ca5ec8faf378.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 8fFBBEUUDG-mSKqERid; Fri, 01 Apr 2022 17:48:28 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <a7140ff0ce32368c3d630dfc79474bb05b4f4e47.camel@yandex.ru>
From: Konstantin Kharlamov <hi-angel@yandex.ru>
To: LVM general discussion and development <linux-lvm@redhat.com>
Date: Fri, 01 Apr 2022 17:48:28 +0300
In-Reply-To: <3e96860d112e86ee55fba0e5fffbf1ee433905e6.camel@yandex.ru>
References: <3e96860d112e86ee55fba0e5fffbf1ee433905e6.camel@yandex.ru>
User-Agent: Evolution 3.42.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [linux-lvm] Frequent crashes when accessing dev_name(dev) on an
 empty list
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VG8gY2xvc2UgdGhlIHRvcGljOiB0aGVyZSB3YXMgYSBkaXNjdXNzaW9uIG9mZi1saXN0LCBhbmQg
YSBudW1iZXIgb2YgZml4ZXMgd2VyZQptZXJnZWQuIFNvbWUgb2YgdGhlbSB3ZXJlIHRlc3RlZCBi
eSB1cyBhcyB3ZWxsICh3ZSBiYWNrcG9ydGVkIHRoZW0gdG8gb2xkZXIKTFZNKSwgYW5kIGl0J3Mg
YmVlbiBtb3JlIHRoYW4gYSBtb250aCBzaW5jZSB3aXRoIG5vIGNyYXNoZXMuIFNvIHRoZSBwcm9i
bGVtIGlzCmZpeGVkLgoKT24gTW9uLCAyMDIyLTAyLTIxIGF0IDE2OjQ1ICswMzAwLCBLb25zdGFu
dGluIEtoYXJsYW1vdiB3cm90ZToKPiBIZWxsbyEgV2UgZW5jb3VudGVyZWQgcXVpdGUgYSBmZXcg
b2Ygc3BvcmFkaWMgY3Jhc2hlcywgd2hpY2ggdXBvbiBpbnNwZWN0aW9uCj4gdHVybmVkIG91dCB0
byBiZSBjYXVzZWQgYnkgZGV2LT5hbGlhc2VzIGxpc3QgYmVpbmcgZW1wdHkuCj4gCj4gT25lIGV4
YW1wbGUgb2YgYSBmaXggKG5vdCB0ZXN0ZWQpOgo+IAo+IC0tLSBhL2xpYi9sYWJlbC9oaW50cy5j
Cj4gKysrIGIvbGliL2xhYmVsL2hpbnRzLmMKPiBAQCAtNDcxLDcgKzQ3MSw4IEBAIGludCB2YWxp
ZGF0ZV9oaW50cyhzdHJ1Y3QgY21kX2NvbnRleHQgKmNtZCwgc3RydWN0IGRtX2xpc3QKPiAqaGlu
dHMpCj4gwqDCoMKgIDQ3McKgwqDCoMKgwqDCoMKgwqAgaWYgKCEoaXRlciA9IGRldl9pdGVyX2Ny
ZWF0ZShOVUxMLCAwKSkpCj4gwqDCoMKgIDQ3MsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAwOwo+IMKgwqDCoCA0NzPCoMKgwqDCoMKgwqDCoMKgIHdoaWxlICgoZGV2ID0g
ZGV2X2l0ZXJfZ2V0KGNtZCwgaXRlcikpKSB7Cj4gNDc0wqDCoMKgIC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKCEoaGludCA9IF9maW5kX2hpbnRfbmFtZShoaW50cywgZGV2X25h
bWUoZGV2KSkpKQo+IMKgwqDCoCA0NzQrwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChkbV9saXN0X2VtcHR5KGRldi0+YWxpYXNlcykgfHwKPiDCoMKgwqAgNDc1K8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICEoaGludCA9IF9maW5kX2hpbnRfbmFtZShoaW50
cywgZGV2X25hbWUoZGV2KSkpKQo+IDQ3NSA0NzbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4gNDc2IDQ3Nwo+IDQ3NyA0NzjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBUaGUgY21kIGhhc24ndCBuZWVkZWQgdGhpcyBo
aW50J3MgZGV2IHNvIGl0J3Mgbm90Cj4gYmVlbiBzY2FubmVkLiAqLwo+IAo+IFNvLCB3aGF0IGhh
cHBlbmVkIHdhcyB0aGF0IGRldl9uYW1lKGRldikgd2FzIGV4dHJhY3RpbmcgYSBgZGV2LT5hbGlh
c2VzYAo+IGVsZW1lbnQKPiAsIGhvd2V2ZXIgYGRldi0+YWxpYXNlc2Agd2FzIGVtcHR5LCB0aHVz
IHRoZSBleHRyYWN0ZWQgZWxlbWVudCB3YXMgYSBqdW5rLgo+IAo+IEFsdGhvdWdoIHdlIGVuY291
bnRlcmVkIHRoZXNlIGNyYXNoZXMgb24gYW4gb2xkZXIgMi4wMy4wNyB2ZXJzaW9uLCBob3dldmVy
IHRoZQo+IHBhdGNoIGFwcGxpZXMgdG8gbGF0ZXN0IG1hc3RlciBhcyB3ZWxsLCB0aHVzIHRoZSBi
dWdzIGFyZSBzdGlsbCByZWxldmFudCwKPiB3aGljaAo+IGlzIG9kZC4gVGhpcyBtYWtlcyBtZSB3
b25kZXJpbmcsIGlzIHRoaXMgYSBrbm93biBwcm9ibGVtLCBjb3VsZCBJIHBvc3NpYmx5Cj4gb3Zl
cmxvb2tlZCBzb21ldGhpbmcsIGZvciBleGFtcGxlIHRoYXQgZGV2LT5hbGlhc2VzIHNob3VsZCBu
ZXZlciBiZSBlbXB0eSwgYW5kCj4gdGh1cyB0aGUgZml4IGp1c3Qgd29ya3MgYXJvdW5kIGFub3Ro
ZXIgcHJvYmxlbT8gQW55IHRob3VnaHRzPwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtbHZtIG1haWxpbmcgbGlzdAo+IGxpbnV4LWx2
bUByZWRoYXQuY29tCj4gaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1sdm0KPiByZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dU
Ty9MVk0tSE9XVE8vCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBz
Oi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhl
IExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

