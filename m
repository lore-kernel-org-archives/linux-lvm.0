Return-Path: <SRS0=qRy5=PX=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC68C433EF
	for <linux-lvm@archiver.kernel.org>; Thu,  4 Nov 2021 07:23:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3FBF61139
	for <linux-lvm@archiver.kernel.org>; Thu,  4 Nov 2021 07:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3FBF61139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ajs124.de
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-jERSEWZxNB25j0JqlgLqCg-1; Thu, 04 Nov 2021 03:23:30 -0400
X-MC-Unique: jERSEWZxNB25j0JqlgLqCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C717C1006AA2;
	Thu,  4 Nov 2021 07:23:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFA4B101E589;
	Thu,  4 Nov 2021 07:23:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAFAB1832DD2;
	Thu,  4 Nov 2021 07:23:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A3EhtHX001139 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 3 Nov 2021 10:43:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5FB7340CFD10; Wed,  3 Nov 2021 14:43:55 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B0BB40CFD11
	for <linux-lvm@redhat.com>; Wed,  3 Nov 2021 14:43:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E4AC811E93
	for <linux-lvm@redhat.com>; Wed,  3 Nov 2021 14:43:55 +0000 (UTC)
Received: from mx1.helsinki.tools (mx1.helsinki.tools [116.202.14.156])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-27-nY6cFpjOOdS9TOIdg_vd9w-1; Wed, 03 Nov 2021 10:43:52 -0400
X-MC-Unique: nY6cFpjOOdS9TOIdg_vd9w-1
Date: Wed, 3 Nov 2021 15:25:58 +0100
From: Andreas =?UTF-8?B?U2NocsOkZ2xl?= <linux-lvm@ajs124.de>
To: Adam Puleo <adam.puleo@icloud.com>
Message-ID: <20211103152558.7670fa10@desk>
In-Reply-To: <1495660C-B6EF-4315-8599-F79F7B6CCF73@icloud.com>
References: <1495660C-B6EF-4315-8599-F79F7B6CCF73@icloud.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1A3EhtHX001139
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 04 Nov 2021 03:23:10 -0400
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Replace Drive in RAID6
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyIE5vdiAyMDIxIDIyOjU2OjE4IC0wNzAwCkFkYW0gUHVsZW8gPGFkYW0ucHVsZW9A
aWNsb3VkLmNvbT4gd3JvdGU6Cgo+IEhlbGxvLAo+IAo+IE9uZSBvZiBteSBkcml2ZXMgZmFpbGVk
IGluIG15IFJBSUQ2IGFuZCBJ4oCZbSB0cnlpbmcgdG8gcmVwbGFjZSBpdCB3aXRob3V0IHN1Y2Nl
c3MuCj4gCj4gSeKAmW0gdHJ5aW5nIHRvIHJlYnVpbGQgdGhlIGZhaWxlZCBkcml2ZSAoL2Rldi9z
ZGEpOiBsdmNoYW5nZSAtLXJlYnVpbGQgL2Rldi9zZGEgdmdfZGF0YQo+IAo+IEJ1dCBJ4oCZbSBy
ZWNlaXZpbmcgdGhlIGVycm9yOiB2Z19kYXRhL2x2X2RhdGEgbXVzdCBiZSBhY3RpdmUgdG8gcGVy
Zm9ybSB0aGlzIG9wZXJhdGlvbi4KPiAKPiBJIGhhdmUgdHJpZWQgdG8gYWN0aXZhdGUgdGhlIGxv
Z2ljYWwgdm9sdW1lIHdpdGhvdXQgc3VjY2Vzcy4KPiAKPiBIb3cgZG8gSSBnbyBhYm91dCBhY3Rp
dmF0aW5nIHRoZSB2b2x1bWUgc28gdGhhdCBJIGNhbiByZWJ1aWxkIHRoZSBmYWlsZWQgZHJpdmU/
Cj4gCj4gVGhhbmtzLAo+IC1BZGFtCj4gCj4gIyBsdnMgLWEgLW8gbmFtZSxzZWd0eXBlLGRldmlj
ZXMKPiAgIExWICAgICAgICAgICAgICAgICAgICAgICBUeXBlICAgRGV2aWNlcyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCj4gICBsdl9kYXRhICAgICAgICAgICAgICAgICAgcmFp
ZDYgIGx2X2RhdGFfcmltYWdlXzAoMCksbHZfZGF0YV9yaW1hZ2VfMSgwKSxsdl9kYXRhX3JpbWFn
ZV8yKDApLGx2X2RhdGFfcmltYWdlXzMoMCksbHZfZGF0YV9yaW1hZ2VfNCgwKQo+ICAgW2x2X2Rh
dGFfcmltYWdlXzBdICAgICAgIGVycm9yICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKPiAgIFtsdl9kYXRhX3JpbWFnZV8xXSAgICAgICBsaW5lYXIgL2Rldi9zZGMx
KDEpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gICBbbHZfZGF0YV9yaW1hZ2VfMl0g
ICAgICAgbGluZWFyIC9kZXYvc2RiMSgxKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+
ICAgW2x2X2RhdGFfcmltYWdlXzNdICAgICAgIGxpbmVhciAvZGV2L3NkZjEoMSkgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAKPiAgIFtsdl9kYXRhX3JpbWFnZV80XSAgICAgICBsaW5lYXIg
L2Rldi9zZGUxKDIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gICBbbHZfZGF0YV9y
bWV0YV8wXSAgICAgICAgZXJyb3IgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAo+ICAgW2x2X2RhdGFfcm1ldGFfMV0gICAgICAgIGxpbmVhciAvZGV2L3NkYzEoMCkg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiAgIFtsdl9kYXRhX3JtZXRhXzJdICAgICAg
ICBsaW5lYXIgL2Rldi9zZGIxKDApICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gICBb
bHZfZGF0YV9ybWV0YV8zXSAgICAgICAgbGluZWFyIC9kZXYvc2RmMSgwKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAo+ICAgW2x2X2RhdGFfcm1ldGFfNF0gICAgICAgIGxpbmVhciAvZGV2
L3NkZTEoMCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiAKPiAjIGx2cyAtYQo+ICAg
TFYgICAgICAgICAgICAgICAgICAgICAgIFZHICAgICAgICAgICAgQXR0ciAgICAgICBMU2l6ZSAg
IFBvb2wgT3JpZ2luIERhdGElICBNZXRhJSAgTW92ZSBMb2cgQ3B5JVN5bmMgQ29udmVydAo+ICAg
bHZfZGF0YSAgICAgICAgICAgICAgICAgIHZnX2RhdGEgICAgICAgcndpLS0tci0tLSA5OTAuMDBn
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAg
W2x2X2RhdGFfcmltYWdlXzBdICAgICAgIHZnX2RhdGEgICAgICAgdndpLWEtci1yLSAzMzAuMDBn
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAg
W2x2X2RhdGFfcmltYWdlXzFdICAgICAgIHZnX2RhdGEgICAgICAgSXdpLWEtci1yLSAzMzAuMDBn
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAg
W2x2X2RhdGFfcmltYWdlXzJdICAgICAgIHZnX2RhdGEgICAgICAgSXdpLWEtci1yLSAzMzAuMDBn
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAg
W2x2X2RhdGFfcmltYWdlXzNdICAgICAgIHZnX2RhdGEgICAgICAgSXdpLWEtci1yLSAzMzAuMDBn
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAg
W2x2X2RhdGFfcmltYWdlXzRdICAgICAgIHZnX2RhdGEgICAgICAgSXdpLWEtci1yLSAzMzAuMDBn
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAg
W2x2X2RhdGFfcm1ldGFfMF0gICAgICAgIHZnX2RhdGEgICAgICAgZXdpLWEtci1yLSAgIDQuMDBt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAg
W2x2X2RhdGFfcm1ldGFfMV0gICAgICAgIHZnX2RhdGEgICAgICAgZXdpLWEtci1yLSAgIDQuMDBt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAg
W2x2X2RhdGFfcm1ldGFfMl0gICAgICAgIHZnX2RhdGEgICAgICAgZXdpLWEtci1yLSAgIDQuMDBt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAg
W2x2X2RhdGFfcm1ldGFfM10gICAgICAgIHZnX2RhdGEgICAgICAgZXdpLWEtci1yLSAgIDQuMDBt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAg
W2x2X2RhdGFfcm1ldGFfNF0gICAgICAgIHZnX2RhdGEgICAgICAgZXdpLWEtci1yLSAgIDQuMDBt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+IAo+
IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
bGludXgtbHZtIG1haWxpbmcgbGlzdAo+IGxpbnV4LWx2bUByZWRoYXQuY29tCj4gaHR0cHM6Ly9s
aXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KPiByZWFkIHRoZSBM
Vk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCgpIZWxsbyBBZGFt
LAoKaG93IGV4YWN0bHkgaGF2ZSB5b3UgdHJpZWQgdG8gYWN0aXZhdGUgdGhlIExWIHNvIGZhcj8K
Cmx2Y2hhbmdlIHdpdGggLS1hY3RpdmF0aW9ubW9kZSBkZWdyYWRlZCBzaG91bGQgd29yaywgbm8/
CgpBbHNvLCBhcmUgeW91IHN1cmUgdGhhdCAtLXJlYnVpbGQgaXMgdGhlIGNvcnJlY3Qgb3BlcmF0
aW9uPwoKbWFuIDcgbHZtcmFpZCBzdWdnZXN0IHlvdSBtaWdodCB3YW50IC0tcmVwYWlyIG9yIC0t
cmVwbGFjZSBpbnN0ZWFkLgoKQmVzdCBSZWdhcmRzCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1A
cmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0t
SE9XVE8v

