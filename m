Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA11C433F5
	for <linux-lvm@archiver.kernel.org>; Sun, 30 Jan 2022 22:12:07 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-1BfRdXaFNum3G3TuG4NIDg-1; Sun, 30 Jan 2022 17:12:02 -0500
X-MC-Unique: 1BfRdXaFNum3G3TuG4NIDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07F6A1083F61;
	Sun, 30 Jan 2022 22:11:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8A635ED33;
	Sun, 30 Jan 2022 22:11:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 424DA4BB7C;
	Sun, 30 Jan 2022 22:11:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20UMBZIT004748 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 30 Jan 2022 17:11:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BB2BC53CF; Sun, 30 Jan 2022 22:11:35 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B639E53C8
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 22:11:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97FB285A5A8
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 22:11:32 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-656-4OBkwGbcNwiPM-J94658FQ-1; Sun, 30 Jan 2022 17:11:30 -0500
X-MC-Unique: 4OBkwGbcNwiPM-J94658FQ-1
Received: from elissa.gathman.org ([IPv6:2001:470:8:809::1d4b])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 20ULdPVQ007001
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 30 Jan 2022 16:39:25 -0500
Message-ID: <30ba3f0683afb9c3b60d96ac0019ced4ce9bb5b8.camel@gathman.org>
From: "Stuart D. Gathman" <stuart@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek
	Kabelac <zdenek.kabelac@gmail.com>
Date: Sun, 30 Jan 2022 16:39:30 -0500
In-Reply-To: <YfbApm+9ac6iBbbg@itl-email>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
	<YfbApm+9ac6iBbbg@itl-email>
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.gathman.org id
	20ULdPVQ007001
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20UMBZIT004748
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] LVM performance vs direct dm-thin
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDIyLTAxLTMwIGF0IDExOjQ1IC0wNTAwLCBEZW1pIE1hcmllIE9iZW5vdXIgd3Jv
dGU6Cj4gT24gU3VuLCBKYW4gMzAsIDIwMjIgYXQgMTE6NTI6NTJBTSArMDEwMCwgWmRlbmVrIEth
YmVsYWMgd3JvdGU6Cj4gPiAKPiAKPiA+IFNpbmNlIHlvdSBtZW50aW9uZWQgWkZTIC0geW91IG1p
Z2h0IHdhbnQgZm9jdXMgb24gdXNpbmcgJ1pGUy1vbmx5Jwo+ID4gc29sdXRpb24uCj4gPiBDb21i
aW5pbmfCoCBaRlMgb3IgQnRyZnMgd2l0aCBsdm0yIGlzIGFsd2F5cyBnb2luZyB0byBiZSBhIHBh
aW5mdWwKPiA+IHdheSBhcwo+ID4gdGhvc2UgZmlsZXN5c3RlbXMgaGF2ZSB0aGVpciBvd24gdm9s
dW1lIG1hbmFnZW1lbnQuCj4gCj4gQWJzb2x1dGVseSHCoCBUaGF0IHNhaWQsIEkgZG8gd29uZGVy
IHdoYXQgeW91ciB0aG91Z2h0cyBvbiB1c2luZyBsb29wCj4gZGV2aWNlcyBmb3IgVk0gc3RvcmFn
ZSBhcmUuwqAgSSBrbm93IHRoZXkgYXJlIHNsb3dlciB0aGFuIHRoaW4KPiB2b2x1bWVzLAo+IGJ1
dCB0aGV5IGFyZSBhbHNvIG11Y2ggZWFzaWVyIHRvIG1hbmFnZSwgc2luY2UgdGhleSBhcmUganVz
dCBvcmRpbmFyeQo+IGRpc2sgZmlsZXMuwqAgQW55IGZpbGVzeXN0ZW0gd2l0aCByZWZsaW5rIGNh
biBwcm92aWRlIHRoZSBuZWVkZWQKPiBjb3B5LW9uLXdyaXRlIHN1cHBvcnQuCgpJIHVzZSBsb29w
IGRldmljZXMgZm9yIHRlc3QgY2FzZXMgLSBlc3BlY2lhbGx5IHdpdGggc2ltdWxhdGVkIElPCmVy
cm9ycy4gIERldnMgcmVhbGx5IGFwcHJlY2lhdGUgaGF2aW5nIGFuIGVhc3kgcmVwcm9kdWNlciBm
b3IKZGF0YWJhc2UvZmlsZXN5c3RlbSBidWdzICh3aGljaCBvZnRlbiBpbnZvbHZlIGhhbmRsaW5n
IG9mIElPIGVycm9ycykuIApCdXQgbm90IGZvciBwcm9kdWN0aW9uIFZNcy4KCkkgdXNlIExWTSBh
cyBmbGV4aWJsZSBwYXJ0aXRpb25zIChpLmUuIG9ubHkgY2xhc3NpYyBMVnMsIG5vIHRoaW4gcG9v
bCkuCkNsYXNzaWMgTFZzIHBlcmZvcm0gbGlrZSBwYXJ0aXRpb25zLCBsaXRlcmFsbHkgdXNpbmcg
dGhlIHNhbWUgZHJpdmVyCihkZXZpY2UgbWFwcGVyKSB3aXRoIGEgc21hbGwgbnVtYmVyIG9mIGV4
dGVudHMsIGFuZCBhcmUgaWYgYW55dGhpbmcKbW9yZSByZWNvdmVyYWJsZSB0aGFuIHBhcnRpdGlv
biB0YWJsZXMuICBXZSB1c2VkIHRvIHB1dCBMVk0gb24gYmFyZQpkcml2ZXMgKGxpa2UgQUlYIGRp
ZCkgLSB3aG8gbmVlZHMgYSBwYXJ0aXRpb24gdGFibGU/ICBCdXQgb24gV2ludGVsLAp5b3UgbmVl
ZCBhIHBhcnRpdGlvbiB0YWJsZSBmb3IgRUZJIGFuZCBzbyB0aGF0IGFsaWVuIG9wZXJhdGluZyBz
eXN0ZW1zCmtub3cgdGhlcmUgaXMgc29tZXRoaW5nIGFscmVhZHkgb24gYSBkaXNrLgoKWW91ciBW
TSB1c2FnZSBpcyBkaWZmZXJlbnQgZnJvbSBvdXJzIC0geW91IHNlZW0gdG8gbmVlZCB0byBjbG9u
ZSBhbmQKYWN0aXZhdGUgYSBWTSBxdWlja2x5IChsaWtlIGEgdnBzIHByb3ZpZGVyIG1pZ2h0IG5l
ZWQgdG8gZG8pLiAgV2UKZ2VuZXJhbGx5IGhhdmUgdG8gYnV5IG1vcmUgUkFNIHRvIGFkZCBhIG5l
dyBWTSA6LSksIHNvIHBlcmZvcm1hbmNlIG9mCmNyZWF0aW5nIGEgbmV3IExWIGlzIHRoZSBsZWFz
dCBvZiBvdXIgd29ycmllcy4KClNpbmNlIHdlIHVzZSBMVnMgbGlrZSBwYXJ0aXRpb25zIC0gbWl4
aW5nIHdpdGggYnRyZnMgaXMgbm90IGFuIGlzc3VlLiAKSnVzdCB1c2UgdGhlIExWcyBsaWtlIHBh
cnRpdGlvbnMuICBJIGhhdmVuJ3QgdHJpZWQgWkZTIG9uIGxpbnV4IC0gaXQKbWF5IGhhdmUgTFZN
IGxpa2UgZmVhdHVyZXMgdGhhdCBjb3VsZCBmaWdodCB3aXRoIExWTS4gIFpGUyB3b3VsZCBiZSBt
eQpmaXJzdCBjaG9pY2Ugb24gYSBCU0QgYm94LgoKV2UgZG8gbm90IHVzZSBMVk0gcmFpZCAtIGJ1
dCBlaXRoZXIgcnVuIG1kcmFpZCB1bmRlcm5lYXRoLCBvciBsZXQgYnRyZnMKZG8gaXQncyBkYXRh
IGR1cGxpY2F0aW9uIHRoaW5nIHdpdGggTFZzIG9uIGRpZmZlcmVudCBzcGluZGxlcy4KCgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0g
bWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0
cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8=

