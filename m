Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064F6C433FE
	for <linux-lvm@archiver.kernel.org>; Mon, 20 Dec 2021 06:57:23 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-rTE9S_txNaWZXE6kZ_AWag-1; Mon, 20 Dec 2021 01:57:19 -0500
X-MC-Unique: rTE9S_txNaWZXE6kZ_AWag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84EFC81CCB6;
	Mon, 20 Dec 2021 06:57:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E9B07E232;
	Mon, 20 Dec 2021 06:57:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94AAD1809CBA;
	Mon, 20 Dec 2021 06:56:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BJCE8i7022227 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 19 Dec 2021 07:14:09 -0500
Date: Sun, 19 Dec 2021 07:14:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C7CD74010E94; Sun, 19 Dec 2021 12:14:08 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C29234047565
	for <linux-lvm@redhat.com>; Sun, 19 Dec 2021 12:14:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FF8F29DD986
	for <linux-lvm@redhat.com>; Sun, 19 Dec 2021 12:14:08 +0000 (UTC)
Received: from server01.b4net.com (server01.b4net.com [207.191.224.12]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-191-Bw9cIBKOODmgA6A2vGzx3Q-1; Sun, 19 Dec 2021 07:14:06 -0500
X-MC-Unique: Bw9cIBKOODmgA6A2vGzx3Q-1
Received: from [::1] (port=40036 helo=localhost.localdomain)
	by server01.b4net.com with esmtpa (Exim 4.94.2)
	(envelope-from <linux-lvm@harrier.ch>)
	id 1myuir-000Ccz-JS; Sun, 19 Dec 2021 03:51:25 -0800
From: <linux-lvm@harrier.ch>
To: <linux-lvm@redhat.com>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - server01.b4net.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - harrier.ch
X-Get-Message-Sender-Via: server01.b4net.com: authenticated_id: harrier/from_h
X-Authenticated-Sender: server01.b4net.com: linux-lvm@harrier.ch
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Message-Id: <39400.121121907140600191@us-mta-191.us.mimecast.lan>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BJCE8i7022227
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 20 Dec 2021 01:56:54 -0500
Subject: [linux-lvm] =?utf-8?q?LVM=3A_Metadata_on_=2E=2E=2E_has_wrong_VG_n?=
	=?utf-8?q?ame?=
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CkcnZGF5CgoKSXNzdWU6IEhvdyBkbyBJIHJlcGFpciB0aGlzIHNpdHVhdGlvbj8KICA+c3VkbyBw
dnNjYW4KICAgTWV0YWRhdGEgb24gL2Rldi9zZGQyIGF0IDEyODAwIGhhcyB3cm9uZyBWRyBuYW1l
IOKAnGZlZG9yYTMyIHsKICAgaWQgPSDigJxnSmdaTTktbjJSZC1WN3VzLVJXYWUtY3BUNi1IODRF
LWc3ZEFza+KAnQogICBzZXFubyA9IDkKICAgZm9ybWF0ID0g4oCcbHZtMuKAnQogICBzdGF0dXMg
PSBb4oCcUkVTSVpFQUJMReKAnSwg4oCcUkVBROKAnSwg4oCcV1JJVEXigJ1dCiAgIGZsYWfigJ0g
ZXhwZWN0ZWQgZmVkb3JhLgogICBXQVJOSU5HOiBSZWFkaW5nIFZHIGZlZG9yYSBvbiAvZGV2L3Nk
ZDIgZmFpbGVkLgogICBXQVJOSU5HOiBQViAvZGV2L3NkZDIgaXMgbWFya2VkIGluIHVzZSBidXQg
bm8gVkcgd2FzIGZvdW5kIHVzaW5nIGl0LgogICBXQVJOSU5HOiBQViAvZGV2L3NkZDIgbWlnaHQg
bmVlZCByZXBhaXJpbmcuCgpCYWNrZ3JvdW5kOgogIEkgYW0gYSBzaW1wbGUgbG9uZy10aW1lIGRl
dmVsb3BlciwgYXR0ZW1wdGluZyB0byB1cGdyYWRlIEZlZG9yYSwgZmlyc3QgZXhwb3N1cmUgdG8g
TFZNLgogIEkgY2xvbmVkIG15IG9sZCBkcml2ZSB0byBhIG5ldyBvbmUsIHNhbWUgc2l6ZS4gUHJl
dHR5IG11Y2ggb3V0LW9mLXRoZS1ib3ggaW5zdGFsbGF0aW9uIC0gYSBzaW5nbGUgUFYgY29udGFp
bnMgTFZzIHJvb3QsIGhvbWUgYW5kIHN3YXAKCiAgVXBvbiBjb21wbGV0aW9uLCBJIHJlbmFtZWQg
dGhlIFZvbHVtZSBHcm91cCBvbiB0aGUgb3JpZ2luYWwgZHJpdmUgKC9kZXYvc2RkMikgd2l0aCB0
aGUgaW50ZW50IHRvIG1vdW50IGJvdGggVm9sdW1lIEdyb3VwcyBjb25jdXJyZW50bHk6CiAgID4g
c3VkbyBsdm0gdmdyZW5hbWUgR0dVb0o3LUNqOG4teVluVy1Eak83LUhISlEtbU1leS1qT2xCWHgg
ZmVkb3JhMzIKCiAgSSdtIHdvcmtpbmcgd2l0aCBhIEZlZG9yYSBMaXZlIFVTQiwgTFZNIFRPT0xT
IDIuMDMuMTEoMikgKDIwMjEtMDEtMDgpLCB3aGljaCBJIHJlYm9vdGVkIGF0IHRoaXMgcG9pbnQK
CiAgQSBQVklEIGNvbmZsaWN0IGFyb3NlLCB3aGljaCBJIHNvbHZlZCBieSBjaGFuZ2luZyB0aGUg
UFYgVVVJRCBvbiB0aGUgbmV3IGRyaXZlOgogICA+IHN1ZG8gbHZtIHB2Y2hhbmdlIC11IC9kZXYv
c2RhMgoKTm93IEkgZ2V0IG5vIGFjY2VzcyB0byB0aGUgbG9naWNhbCB2b2x1bWVzIG9uIHRoZSBv
bGQgZHJpdmUgd2l0aCB0aGUgZXJyb3IgYWJvdmUuCgpTbyBob3cgZG8gZWl0aGVyIDEpIGNvcnJl
Y3RseSBwcm9wYWdhdGUgb3IgMikgcm9sbCBiYWNrIHRoZSBWb2x1bWUgR3JvdXAgTmFtZSBjaGFu
Z2U/CgpJ4oCZdmUgZm91bmQgc29tZSByZWZlcmVuY2VzIHRvIOKAnHJlcGFpcuKAnSwgcmVjcmVh
dGluZyB0aGUgTFZNIG1ldGFkYXRhLCBidXQgYW0gaGVzaXRhbnQgYXMgSSB3b3VsZCBub3QgbGlr
ZSB0byBsb3NlIHRoZSBjb250ZW50cyBvZiB0aGUgb2xkIGRyaXZlLiAvZXRjL2x2bSBvbmx5IGhh
cyBhIGJhY2t1cCBmcm9tIHRoZSBwdmNoYW5nZSBleGVjdXRpb24gb24gdGhlIG5ldyBkaXNrLCBu
b3RoaW5nIGZyb20gdGhlIG9yaWdpbmFsIGR1ZSB0byB0aGUgcmVib290LiBJIGdvdCBpbiB0aGlz
IHNpdHVhdGlvbiB0aHJ1IFJURk0gLSBJIGRpZG7igJl0IHJlYWxpc2UgUlRXaG9sZUZNIHdhcyBy
ZXF1aXJlZC4gU3RpbGwgbG9va2luZyBmb3IgcHJvY2VkdXJlczogd2hlcmUgSSB3ZW50IHdyb25n
LCBob3cgdG8gZml4IGl0LiBOb3RoaW5nIGluIHRoZSBhcmNoaXZlcyBzZWVtcyB0byBhZGRyZXNz
IHRoaXMgZGlyZWN0bHkuCgpIYXMgYmVlbiBhZ2VzIHNpbmNlIEkgcGF0Y2hlZCBkaXNrIHNlY3Rv
cnMgYnV0IHRoYXQncyB0aGUgb25seSBvcHRpb24gSSBoYXZlIGFueSBtaW5vciBjb25maWRlbmNl
IGluIGF0IHRoaXMgcG9pbnQuIElzIHRoZXJlIGEgc2ltcGxlIHJlZmVyZW5jZSB0byBhIHByb2Nl
ZHVyZSB0aGF0IGNhbiBoZWxwIG1lIHJlY292ZXIgdGhpcz8gIAoKVGhhbmtzCgoKagoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxp
bmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90
bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

