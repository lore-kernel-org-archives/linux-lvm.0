Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6BCC433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 20 Dec 2021 15:02:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-_ESDxHyjPNeOLJW1gbxHbw-1; Mon, 20 Dec 2021 10:01:59 -0500
X-MC-Unique: _ESDxHyjPNeOLJW1gbxHbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B41C801962;
	Mon, 20 Dec 2021 15:01:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C36591F301;
	Mon, 20 Dec 2021 15:01:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A3271809CB8;
	Mon, 20 Dec 2021 15:01:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BKF1V8m032363 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 20 Dec 2021 10:01:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 05B4E76CD; Mon, 20 Dec 2021 15:01:31 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0126976C2
	for <linux-lvm@redhat.com>; Mon, 20 Dec 2021 15:01:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0115481B55E
	for <linux-lvm@redhat.com>; Mon, 20 Dec 2021 15:01:28 +0000 (UTC)
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-132-1tCKk4EGOyuKnH3kVlD2UA-1; Mon, 20 Dec 2021 10:01:26 -0500
X-MC-Unique: 1tCKk4EGOyuKnH3kVlD2UA-1
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id 7AFC86EEF2; Mon, 20 Dec 2021 09:52:34 -0500 (EST)
References: <CACrcyf+2uz_ngeVdq48WjSg6ZaarRpVXs8TZwzpQ4hnW7D7xGg@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 27.1
From: Phillip Susi <phill@thesusis.net>
To: LVM general discussion and development <linux-lvm@redhat.com>
Date: Mon, 20 Dec 2021 09:51:45 -0500
In-reply-to: <CACrcyf+2uz_ngeVdq48WjSg6ZaarRpVXs8TZwzpQ4hnW7D7xGg@mail.gmail.com>
Message-ID: <87v8zj1g7h.fsf@vps.thesusis.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BKF1V8m032363
X-loop: linux-lvm@redhat.com
Cc: Tomas =?utf-8?Q?Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CkknbSBjb25mdXNlZC4gIFdoYXQgZXhhY3RseSBhcmUgeW91IHRyeWluZyB0byBkbyBoZXJlPyAg
SSBjYW4ndCB0aGluayBvZgphbnkgcmVhc29uIHdoeSB5b3Ugd291bGQgd2FudCB0byBjb3B5IGEg
c25hcHNob3QgbHYgdG8gYSBmaWxlIHRoZW4gdHJ5CnRvIGxvb3AgbW91bnQgaXQuCgpUb21hcyBE
YWxlYmrDtnJrIDx0b21hcy5kYWxlYmpvcmtAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEhpLAo+Cj4g
SSBhbSB0cnlpbmcgdG8gdW5kZXJzdGFuZCBob3cgdG8gY29udmVydCBhIGRpc2sgY29udGFpbmlu
ZyBzbmFwc2hvdCBkYXRhLgo+IFRoaXMgaXMgaG93IEkgdGVzdGVkIHRoaXM6Cj4gMS4gbG9jYXRl
IHRoZSBzbmFwc2hvdCB0ZXN0bHYuMjExMjE4LjIzMjI1NQo+IHJvb3RAZGViaWFuMTA6L2Rldi9t
YXBwZXIjIGx2cwo+ICAgTFYgICAgICAgICAgICAgICAgICAgVkcgICAgICAgICAgQXR0ciAgICAg
ICBMU2l6ZSAgIFBvb2wgT3JpZ2luIERhdGElCj4gIE1ldGElICBNb3ZlIExvZyBDcHklU3luYyBD
b252ZXJ0Cj4gICBob21lICAgICAgICAgICAgICAgICBkZWJpYW4xMC12ZyAtd2ktYW8tLS0tICAg
MS4wMGcKPiAgIHJvb3QgICAgICAgICAgICAgICAgIGRlYmlhbjEwLXZnIC13aS1hby0tLS0gIDwz
LjgxZwo+ICAgc3dhcF8xICAgICAgICAgICAgICAgZGViaWFuMTAtdmcgLXdpLWFvLS0tLSA5NzYu
MDBtCj4gICB0ZXN0bHYgICAgICAgICAgICAgICBkZWJpYW4xMC12ZyBvd2ktYW9zLS0tIDEwMC4w
MG0KPiAgIHRlc3Rsdi4yMTEyMTguMjMyMjU1IGRlYmlhbjEwLXZnIHN3aS1hLXMtLS0gMTA0LjAw
bSAgICAgIHRlc3RsdiAxLjQ0Cj4gcm9vdEBkZWJpYW4xMDovZGV2L21hcHBlciMKPgo+IDIuIGNv
cHkgdGhlIGx2IC0gY293IGRhdGEgdG8gYSBmaWxlCj4gIyBkZCBpZj0vZGV2L21hcHBlci9kZWJp
YW4xMC0tdmctdGVzdGx2LjIxMTIxOC4yMzIyNTUtY293IG9mPS90bXAvb3V0Cj4gYnM9MTAyNAo+
Cj4gMy4gU2V0dXAgYSBsb29wYmFjayBkaXNrIGZvciB0aGUgZmlsZQo+ICMgbG9zZXR1cCAtZlAg
L3RtcC9vdXQKPgo+IDQuIFZlcmlmeSB0aGF0IGRpc2sgZXhpc3RzCj4gcm9vdEBkZWJpYW4xMDov
ZGV2L21hcHBlciMgbG9zZXR1cCAtYQo+IC9kZXYvbG9vcDA6IFs2NTAyNV06MzkyNzQgKC90bXAv
b3V0KQo+IHJvb3RAZGViaWFuMTA6L2Rldi9tYXBwZXIjCj4KPiA1LiBUcnkgY29udmVydGluZyB0
aGUgZGlzayB1c2luZyBsdmNvbnZlcnQgY29tbWFuZAo+ICMgbHZjb252ZXJ0IC1abiAtcyBkZWJp
YW4xMC12Zy90ZXN0bHYgL3RtcC9vdXQKPiAgICIvdG1wL291dCI6IEludmFsaWQgcGF0aCBmb3Ig
TG9naWNhbCBWb2x1bWUuCj4KPiA2LiBUcnlpbmcgY3JlYXRpbmcgYSBzb2Z0bGluayBpbiAvZGV2
L21hcHBlcgo+ICMgbG4gLXMgL3RtcC9vdXQgZGViaWFuMTAtLXZnLWxvb3BiYWNrCj4KPiA3LiB2
ZXJpZnkgbGluawo+IHJvb3RAZGViaWFuMTA6L2Rldi9tYXBwZXIjIGxzIC1sYQo+IHRvdGFsIDAK
PiBkcnd4ci14ci14ICAyIHJvb3Qgcm9vdCAgICAgMjQwIERlYyAxOSAxNzo0MCAuCj4gZHJ3eHIt
eHIteCAxOCByb290IHJvb3QgICAgMzgyMCBEZWMgMTkgMTc6MjIgLi4KPiBjcnctLS0tLS0tICAx
IHJvb3Qgcm9vdCAxMCwgMjM2IERlYyAxMCAxOToxMCBjb250cm9sCj4gbHJ3eHJ3eHJ3eCAgMSBy
b290IHJvb3QgICAgICAgNyBEZWMgMTAgMTk6MTAgZGViaWFuMTAtLXZnLWhvbWUgLT4gLi4vZG0t
NQo+IGxyd3hyd3hyd3ggIDEgcm9vdCByb290ICAgICAgIDggRGVjIDE5IDE3OjQwIGRlYmlhbjEw
LS12Zy1sb29wYmFjayAtPgo+IC90bXAvb3V0Cj4gbHJ3eHJ3eHJ3eCAgMSByb290IHJvb3QgICAg
ICAgNyBEZWMgMTMgMjI6MjAgZGViaWFuMTAtLXZnLXJvb3QgLT4gLi4vZG0tMQo+IGxyd3hyd3hy
d3ggIDEgcm9vdCByb290ICAgICAgIDcgRGVjIDEwIDE5OjEwIGRlYmlhbjEwLS12Zy1zd2FwXzEg
LT4gLi4vZG0tNAo+IGxyd3hyd3hyd3ggIDEgcm9vdCByb290ICAgICAgIDcgRGVjIDE4IDIzOjIz
IGRlYmlhbjEwLS12Zy10ZXN0bHYgLT4gLi4vZG0tMAo+IGxyd3hyd3hyd3ggIDEgcm9vdCByb290
ICAgICAgIDcgRGVjIDE4IDIzOjIzCj4gZGViaWFuMTAtLXZnLXRlc3Rsdi4yMTEyMTguMjMyMjU1
IC0+IC4uL2RtLTYKPiBscnd4cnd4cnd4ICAxIHJvb3Qgcm9vdCAgICAgICA3IERlYyAxOCAyMzoy
Mwo+IGRlYmlhbjEwLS12Zy10ZXN0bHYuMjExMjE4LjIzMjI1NS1jb3cgLT4gLi4vZG0tMwo+IGxy
d3hyd3hyd3ggIDEgcm9vdCByb290ICAgICAgIDcgRGVjIDE4IDIzOjIzIGRlYmlhbjEwLS12Zy10
ZXN0bHYtcmVhbCAtPgo+IC4uL2RtLTIKPiByb290QGRlYmlhbjEwOi9kZXYvbWFwcGVyIwo+Cj4g
OC4gcmV0cnlpbmcgbHZjb252ZXJ0IGNvbW1hbmQKPiByb290QGRlYmlhbjEwOi9kZXYvbWFwcGVy
IyBsdmNvbnZlcnQgLVpuIC1zIGRlYmlhbjEwLXZnL3Rlc3Rsdgo+IC9kZXYvbWFwcGVyL2RlYmlh
bjEwLS12Zy1sb29wYmFjawo+ICAgRmFpbGVkIHRvIGZpbmQgbG9naWNhbCB2b2x1bWUgImRlYmlh
bjEwLXZnL2xvb3BiYWNrIgo+IHJvb3RAZGViaWFuMTA6L2Rldi9tYXBwZXIjCj4KPiBBcmUgdGhl
cmUgbW9yZSB0aGluZ3MgdG8gYmUgY29uc2lkZXJlZCwgc3VjaCBhcyByZWNyZWF0aW5nIHB2IGRh
dGEgb24gZGlzaz8KPgo+IFJlZ2FyZHMgVG9tYXMKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKPiBsaW51eC1s
dm1AcmVkaGF0LmNvbQo+IGh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbHZtCj4gcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9X
VE8vTFZNLUhPV1RPLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6
Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUg
TFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLw==

