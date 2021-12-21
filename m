Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE86EC433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 21 Dec 2021 14:44:41 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-6fwpdquVN_SBvKn29Un1Wg-1; Tue, 21 Dec 2021 09:44:38 -0500
X-MC-Unique: 6fwpdquVN_SBvKn29Un1Wg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16F9F64141;
	Tue, 21 Dec 2021 14:44:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D83B5BE3C;
	Tue, 21 Dec 2021 14:44:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A22D44BB7C;
	Tue, 21 Dec 2021 14:44:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BLEiLGD009036 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 21 Dec 2021 09:44:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 68FD5C23DB3; Tue, 21 Dec 2021 14:44:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 649D1C23DB4
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 14:44:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BCF11C1CD43
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 14:44:21 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-458-eN42ff71PtKsQXL2eiichA-1; Tue, 21 Dec 2021 09:44:19 -0500
X-MC-Unique: eN42ff71PtKsQXL2eiichA-1
Received: by mail-lf1-f47.google.com with SMTP id k37so29900822lfv.3
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 06:44:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version
	:subject:date:message-id:references:cc:in-reply-to:to;
	bh=klZ0geA3mJGD0gpsPbO47uP1MRqWzwYd3nmL5iUTCsc=;
	b=eFgZCIXwUtWbVJ8Q/a0bqQZxPB24IRXoFnXasGW+Rkxky9kpot+5aVpGnzV353+3iy
	d82DZiwTRT/NFs5wl41EqiJTuUI07mSx55LJPOWBFxU6xWVWr5I0Dqv61FRNIDtUD2RY
	cjOXy+uWhFsRUzgJTku/m/xjBBmcOoZfZJC9FK/LmnlqgUSHwMqQawxos1oE3xNVpjth
	3Bwl5ieKsaskHZgGcDsWTtLr7obSbP7WXB9RzjULWcBO1KAyrYXTpW5EnK/nCXo7H1Pu
	/Uysz7NPZmAxUHBteaot93XMcjuk56YITozg+XVqd8Gb956X4LSo2+dJAdgg6FIW/Rrl
	fWEw==
X-Gm-Message-State: AOAM533lfoqqfOToa4LvXIgUIee9xxPEzQoBixu8QhPelz6B0uMXWC1Y
	wpHwTy7CXMKwvCCOF5guVIPmyIeBSszZYQ==
X-Google-Smtp-Source: ABdhPJzdxVuS74rechWIn6nF0B2iH25KaNWdChTXYZFUl7276YFiNzIVVG3MazgByn/hOI24bIsIvA==
X-Received: by 2002:a05:6512:3502:: with SMTP id
	h2mr3281618lfs.551.1640097857495; 
	Tue, 21 Dec 2021 06:44:17 -0800 (PST)
Received: from smtpclient.apple ([2a02:aa1:1628:62d6:4c67:1778:b00d:96ba])
	by smtp.gmail.com with ESMTPSA id i19sm536155lfu.37.2021.12.21.06.44.16
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 21 Dec 2021 06:44:17 -0800 (PST)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 21 Dec 2021 15:44:16 +0100
Message-Id: <89C3404F-E604-45DA-AEFD-200DCC89631D@gmail.com>
References: <0026c26e-a5e0-272d-e5d6-739466cbd6b2@gmail.com>
In-Reply-To: <0026c26e-a5e0-272d-e5d6-739466cbd6b2@gmail.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BLEiLGD009036
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

aGkKCkkgdGhpbmsgSSBkaWRu4oCZdCBleHBsYWluIHRoaXMgY2xlYXIgZW5vdWdoIApBbGx0aGUg
bHZtIGRhdGEgaXMgcHJlc2VudCBpbiB0aGUgc25hcHNob3QgdGhhdCBJIHByb3Zpc2lvbiBmcm9t
IG91ciBiYWNrdXAgc3lzdGVtIApJIGNhbiBndWFyYW50ZWUgdGhhdCEKCklmIEkganVzdCBtb3Vu
dCB0aGF0IHNuYXBzaG90IGZyb20gb3VyIGJhY2t1cCBzeXN0ZW0sIGl0IHdvcmtzIHBlcmZlY3Rs
eSB3ZWxsCgpzbyB3ZSBkb27igJl0IG5lZWQgdGhlIG9yaWdpbiB2b2x1bWVzIGluIG90aGVyIHdh
eSB0aGFuIGNvcHlpbmcgYmFjayB0byBpdAp3ZSBqdXN0IG5lZWQgdG8gcmVhbmltYXRlIGl0IGFz
IGEgY293IHZvbHVtZQptZW50aW9uaW5nIHRoYXQgYWxsIGRhdGEgaGFzIGJlZW4gY2hhbmdlZAp0
aGUgY293IGlzIGp1c3QgcmVmZXJlbmNpbmcgdG8gdGhlIG9yaWdpbiBsb2NhdGlvbiwgc28gbm8g
cHJvYmxlbSB0aGVyZQpBbGwgb3VyIGRhdGEgaXMgaW4gdGhlIGNvdyB2b2x1bWUsIG5vdCBqdXN0
IHRoZSBjaGFuZ2VzCgpqdXN0IHRvIGNvbXBhcmUgCmlmIHlvdSBjaGFuZ2UganVzdCAxIGJ5dGUg
b24gZXZlcnkgY2h1bmtzaXplIGluIHRoZSBvcmlnaW4gdm9sdW1lLCB0aGFuIHRoZSBzbmFwc2hv
dCB3aWxsIGNvbnRhaW4gYWxsIGRhdGEsIHBsdXMgc29tZSBtZXRhIGRhdGEgZXRjLgpUaGF0IGlz
IHdoYXQgSSB0YWxrIGFib3V0IGhlcmUuClNvIGhvdyBkbyBJIHJldGFjaCB0aGlzIHZvbHVtZSB0
byBhIG5ldyBzZXJ2ZXI/CgphcyB0aGUgb25seSBhcmd1bWVudCBhY2NlcHRhYmxlIGFyZ3VtZW50
IGJ5IHRoZSBsdmNvbnZlcnQgaXMgdmcvczEgPwoKVGhhdCBhc3N1bWVzIHRoYXQgdmcvczEgaXMg
cHJlc2VudCAKc28gaG93IHRvIG1ha2UgaXQgcHJlc2VudD8KClJlZ2FyZHMgVG9tYXMgCgoKClNl
bnQgZnJvbSBteSBpUGhvbmUKCj4gT24gMjEgRGVjIDIwMjEsIGF0IDE0OjQ2LCBaZGVuZWsgS2Fi
ZWxhYyA8emRlbmVrLmthYmVsYWNAZ21haWwuY29tPiB3cm90ZToKPiAKPiDvu79EbmUgMTkuIDEy
LiAyMSB2IDE3OjQzIFRvbWFzIERhbGViasO2cmsgbmFwc2FsKGEpOgo+PiBIaSwKPj4gSSBhbSB0
cnlpbmcgdG8gdW5kZXJzdGFuZCBob3cgdG8gY29udmVydCBhIGRpc2sgY29udGFpbmluZyBzbmFw
c2hvdCBkYXRhLgo+PiBUaGlzIGlzIGhvdyBJIHRlc3RlZCB0aGlzOgo+PiAxLiBsb2NhdGUgdGhl
IHNuYXBzaG90IHRlc3Rsdi4yMTEyMTguMjMyMjU1Cj4+IHJvb3RAZGViaWFuMTA6L2Rldi9tYXBw
ZXIjIGx2cwo+PiAgIExWICAgICAgICAgICAgICAgICAgIFZHICAgICAgICAgIEF0dHIgICAgICAg
TFNpemUgICBQb29sIE9yaWdpbiBEYXRhJSAgIE1ldGElICBNb3ZlIExvZyBDcHklU3luYyBDb252
ZXJ0Cj4+ICAgaG9tZSAgICAgICAgICAgICAgICAgZGViaWFuMTAtdmcgLXdpLWFvLS0tLSAgIDEu
MDBnCj4+ICAgcm9vdCAgICAgICAgICAgICAgICAgZGViaWFuMTAtdmcgLXdpLWFvLS0tLSAgPDMu
ODFnCj4+ICAgc3dhcF8xICAgICAgICAgICAgICAgZGViaWFuMTAtdmcgLXdpLWFvLS0tLSA5NzYu
MDBtCj4+ICAgdGVzdGx2ICAgICAgICAgICAgICAgZGViaWFuMTAtdmcgb3dpLWFvcy0tLSAxMDAu
MDBtCj4+IHRlc3Rsdi4yMTEyMTguMjMyMjU1IGRlYmlhbjEwLXZnIHN3aS1hLXMtLS0gMTA0LjAw
bSAgICAgIHRlc3RsdiAxLjQ0Cj4+IHJvb3RAZGViaWFuMTA6L2Rldi9tYXBwZXIjCj4gCj4gSGkK
PiAKPiBJdCBsb29rcyBsaWtlIHRoZXJlIGlzIHNvbWUgc29ydCBvZiBtaXN1bmRlcnN0YW5kaW5n
IEhPVyB0aGVzZSBzbmFwc2hvdHMgd2l0aCBsdm0yIGRvIHdvcmsuCj4gCj4gVGhlIHNuYXBzaG90
IExWIGRvZXMgTk9UIGNvbnRhaW4gd2hvbGUgY29weSBvZiB0aGUgb3JpZ2luIExWICh0aGUgb25l
IHlvdSd2ZSB0YWtlIGl0cyBzbmFwc2hvdCkKPiAKPiBTbyB3aGlsZSAnbHZzJyBpcyBwcmVzZW50
aW5nIHlvdSB0aGUgc2l6ZSBvZiBzbmFwc2hvdCAtIGl0J3Mgbm90IGEgJ3JlZ3VsYXInIHZvbHVt
ZSBiZWhpbmQgdGhlIHNjZW5lLiBJbnN0ZWFkIGl0J3MgYSBzZXQgb2YgZGlmZmVyZW50aWF0aW5n
IGJsb2NrcyBmcm9tIHlvdXIgb3JpZ2luIHN0b3JlZCBpbiBhIHdheSB0aGUgY2FtZSBpbiB1c2Uu
Cj4gCj4gU28gd2hpbGUgeW91ciBzbmFwc2hvdCBsb29rcyBpdCBoYXMgc2l6ZSAxMDRNaWIgYW5k
IG9yaWdpbiAxMDBNaUIgLSBpdCBtZWFucwo+IHRoZXJlIGlzIGp1c3QgYWxsb2NhdGVkIG1heCBw
b3NzaWJsZSBzaXplIG9mIHNuYXBzaG90IHRvIHN0b3JlIGFsbCBkaWZmZXJlbnQgY2h1bmsgKyBz
b21lIGV4dHJhIG1ldGFkYXRhLiAgQnV0IEFUTSBvbmx5IDEuNDQlIG9mIHRoaXMgc3BhY2UgaXMg
YWN0dWFsbHkgdXNlZCB0byBob2xkIGFsbCB0aGVzZSBibG9jayAoQUtBIH4xLjVNaUIgb3IgcmVh
bCBzdG9yYWdlIHdhcyB1c2VkIHNvIGZhcikKPiAKPiBUaGVyZSBpcyBiYXNpY2FsbHkgTk8gV0FZ
IHRvIHVzZSB0aGlzICdDT1cnIHN0b3JhZ2UgYXJlYSB3aXRob3V0IGl0cyBvcmlnaW5hbCB2b2x1
bWUuCj4gCj4gSWYgeW91IHdhbnQgdG8gdXNlIHN1Y2ggJ3NuYXBzaG90JyBlbHNld2hlcmUgeW91
IHNpbXBseSBuZWVkIHRvICpkZCogc3VjaCBMViAtIHdoaWNoIGlzIHByZXNlbnRlZCAodmlhIG1h
Z2ljIHdvcmxkIG9mIERNIHRhcmdldHMpIHRvIHVzZXItc3BhY2UgdG8gYXBwZWFyIGxpa2UgeW91
ciBvcmlnaW5hbCBMViBpbiB0aGUgbW9tZW50IG9mIHNuYXBzaG90Lgo+IAo+IEJ1dCB0aGUgYWN0
dWFsICdyYXcnIGNvbnRlbnQgc3RvcmVkIGluIGRpc2sgaXMgaW4gJ2ludGVybmFsJyBmb3JtIC0g
bm90IHJlYWxseSB1c2FibGUgb3V0c2lkZSAoYWx0aG91Z2ggdGhlIGZvcm1hdCBpcyBub3QgcmVh
bGx5IGEgY29tcGxpY2F0ZWQgb25lKQo+IAo+IE5vdGUgLSB0aGVzZSBzbyBjYWxsZWQgJ3RoaWNr
JyBzbmFwc2hvdCBvciAnb2xkJyBzbmFwc2hvdCBhcmUgbm93IGJldHRlciBoYW5kbGVkIHZpYSB0
aGluLXByb3Zpc2lvbmluZyAtIGdpdmluZyBtdWNoIGJldHRlciBwZXJmb3JtYW5jZSAtIGVzcGVj
aWFsbHkgaWYgeW91IHBsYW4gdG8ga2VlcCBzbmFwc2hvdCBmb3IgbG9uZyB0ZXJtIG9yIGhhdmUg
aXQgaW4gYmlnZ2VyIHNpemUuCj4gCj4gSG9wZWZ1bGx5IGl0IG5vdyBtYWtlcyBpdCB3YXkgbW9y
ZSBjbGVhci4KPiAKPiBSZWdhcmRzCj4gCj4gWmRlbmVrCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1s
dm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9M
Vk0tSE9XVE8v

