Return-Path: <SRS0=pEn1=OS=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179F9C433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 28 Sep 2021 18:47:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 990E160F9D
	for <linux-lvm@archiver.kernel.org>; Tue, 28 Sep 2021 18:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 990E160F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-dzDGhsfDMeuZUeI6MkmsAw-1; Tue, 28 Sep 2021 14:47:47 -0400
X-MC-Unique: dzDGhsfDMeuZUeI6MkmsAw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE7D284A5E3;
	Tue, 28 Sep 2021 18:47:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0834918432;
	Tue, 28 Sep 2021 18:47:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94AE11800B9E;
	Tue, 28 Sep 2021 18:47:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18SIlOSs032438 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 28 Sep 2021 14:47:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7261D176C7; Tue, 28 Sep 2021 18:47:24 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CC762960
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2021 18:47:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54B18899ECF
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2021 18:47:24 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-555-xHjVgrOEMWuWohjUIx0tZQ-1; Tue, 28 Sep 2021 14:47:22 -0400
X-MC-Unique: xHjVgrOEMWuWohjUIx0tZQ-1
Received: by mail-qt1-f173.google.com with SMTP id d8so20849731qtd.5
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2021 11:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xcyxOMDiQ+UECnzXRRJzUK41wjTmqQJ5ennGV/vC70c=;
	b=E8u+bQJGXxU8t17AVgwetC2I3HDeSt/W3DNXCTjhwB1+Yh+gJsnqbv4MT/XlHYH8cB
	pAD5HwNDDYvsWVwGTS9QZjXrKNN4WDoCfmseTRC6S7MT+yC6NRSWHigCAdLPKet9UmES
	83k94ad0xQtiNKd/KNUSCalz1xynzQhR5UR4SRLKdNTR2eTGD7L3einKmeoiWUzd2Pu+
	lHLOhQ5WvnZ4i9BVs07rAkf7GO//9X1gAOBEUt5/X5A1QPwj+Hq6tq7OpQvufTqvl2fT
	+fAvU+VGOfVp/CmC82EN0O3cStzPTdBxbJ0bGf4BvZj0yVmNbubX1fijBPSUhuk4jVmD
	qvRQ==
X-Gm-Message-State: AOAM5311Oo8pPga7qGH8xArcnI1HeHdt4utgCjJjz7JkwzQgS8ephATi
	V+UUomYMR9hKGgh3HMVGJe2OVV8Btnv1qAIFbuelliVA
X-Google-Smtp-Source: ABdhPJyuPgK0uIsCDhH4FCOgQotPj2gQ171xOIJIdjyzWxWNu7+1qxb9qVqUUg1xbRQHom9yVtqLv2jRtKIFsnQopmo=
X-Received: by 2002:ac8:7397:: with SMTP id t23mr7485988qtp.63.1632854837862; 
	Tue, 28 Sep 2021 11:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAFrGbuU63mCLDc47aiY6PuEf4C1B=CL3Dh1=GB+p_rRWkV8S4g@mail.gmail.com>
	<CAFrGbuWKxbB=2Q6QygfN5mLh1MU7ztwXOouiRF2ynP-BcjhfXA@mail.gmail.com>
	<bd2ffcd6-e067-8152-fd2f-6d5036cb2ec6@redhat.com>
	<CAAMCDecFLoJ6ait9uUP0nQkYXZnMoPNre6v_1uBj=tGE_APtvg@mail.gmail.com>
	<CAFrGbuVR70RB8x=JYNK=qTtCc_UGnrhtXLNjDZuwai1MAF-eCg@mail.gmail.com>
In-Reply-To: <CAFrGbuVR70RB8x=JYNK=qTtCc_UGnrhtXLNjDZuwai1MAF-eCg@mail.gmail.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Tue, 28 Sep 2021 13:47:06 -0500
Message-ID: <CAAMCDedDF3XR8u8-zcUoZnSKkjxaAGJOB8Z=vdxgXjfazintcA@mail.gmail.com>
To: alessandro macuz <alessandro.macuz@gmail.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18SIlOSs032438
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] " Failed to find physical volume <ZFS block device"
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

QSBwb3NzaWJpbGl0eSBJIGp1c3QgZGVidWdnZWQgZm9yIGEgbm9uLWJvb3Rpbmcgc3lzdGVtLgoK
SWYgdGhlcmUgaXMgYSBwYXJ0aXRpb24gdGFibGUgb24gdGhlIHVuZGVybHlpbmcgZGV2aWNlIHRo
ZW4gdGhhdApkZXZpY2UgaXMgbm90IGRldGVjdGVkIGFzIGFuIExWTTEvMiBtZW1iZXIgaW4gYXQg
bGVhc3Qgb25lIHZlcnNpb24gb2YKdWRldmQsIGFuZCB3b24ndCBiZSBzZWVuIG5vciB0dXJuZWQg
b24gYXV0b21hdGljYWxseSBieSB0aGUKc3lzdGVtZC11ZGV2IGNvZGUuCgpsdm0gdmdjaGFuZ2Ug
LWF5IHdvcmtlZCB0byBlbmFibGUgaXQgKGVtZXJnZW5jeSBtb2RlLCBpdCB3YXMgdGhlIHJvb3QK
cHYtLW5vIHVkZXZkIGludm9sdmVtZW50KSBhbmQgZXZlbnR1YWxseSBJIGZvdW5kIHRoZSBwYXJ0
aXRpb24gdGFibGUKYW5kIHJlbW92ZWQgaXQgYW5kIHRoZSBtYWNoaW5lIHdvdWxkIHRoZW4gYm9v
dCB3aXRob3V0IG5lZWRpbmcgYQptYW51YWwgaW50ZXJ2ZW50aW9uLgoKZGQgaWY9L2Rldi96ZXJv
IG9mPWRldmljZSBicz01MTIgY291bnQ9MSB3YXMgdXNlZCBvbmNlIHdlIGRldGVybWluZWQKdGhl
cmUgd2FzIGEgcGFydGl0aW9uIHNpZ25hdHVyZSBzdGlsbCBsZWZ0IChhZnRlciBwYXJ0aXRpb24g
ZGVsZXRpb24Kd2l0aCBmZGlzaywgc3RpbGwgaGFkIGEgaGVhZGVyKSwgZXhhbWluZWQgd2l0aCBk
ZCBpZj0vZGV2L2RldmljZQpicz01MTIgY291bnQ9MSB8IHh4ZCBmb3VuZCA0IG5vbi16ZXJvIGJ5
dGVzIGluIHRoZSBibG9jay4KCk9uIFN1biwgU2VwIDI2LCAyMDIxIGF0IDk6MjIgQU0gYWxlc3Nh
bmRybyBtYWN1ego8YWxlc3NhbmRyby5tYWN1ekBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhhbmtz
IFJvZ2VyLCBaZGVuZWssCj4KPiBJIGhhdmUgbXkgWlZPTCBvbiBteSBOQVMgZXhwb3NlZCBhcyBM
VU5zLiBUaGUgaW5pdGlhdG9yIHdlcmUgc3dpdGNoZWQgb2ZmIGFuZCBmb3IgdW5rbm93biByZWFz
b24gSSBmb3VuZCBteSBOQVMgc3dpdGNoZWQgb2ZmIGFzIHdlbGwuCj4gSXQgaGFkIHJ1biBmb3Ig
bG9uZyBhbmQgSSBmZWFyZWQgdGhlIHdvcnN0IChDUFUvbW90aGVyYm9hcmQvZXRjKS4gSW5zdGVh
ZCBvbmNlIHBvd2VyZWQgdXAgZXZlcnl0aGluZyBzdGFydGVkIHRvIHdvcmsgYWdhaW4gYnV0IHRo
ZSBMVU5zIHRoYXQgc2VlbWVkIHRvIGplb3BhcmRpemVkLgo+IEkgaGF2ZSBtYW55IFpWT0xzIHVz
ZWQgYnkgRVNYaSBpbiB3aGljaCBJIGhhdmUgRVZFLU5HIHdobyB1c2VzIExWTSBhbmQgc3VjaCBa
Vk9McyBoYXZlIHRoZSBzYW1lIHNpemUgc28gSSB3YW50ZWQgdG8gaW5zcGVjdCB0aGVtIHRvIGNo
ZWNrIHRoZSBob3N0bmFtZS4KPgo+IE5vdyBzb21lIExVTnMgc3RhcnRlZCB0byB3b3JrIG5vcm1h
bGx5LCBzb21lIG90aGVycyBzdGlsbCBiZWhhdmUgd2VpcmRseS4gSSB3aWxsIHJ1biBwdnMgb24g
dGhlbSB3aXRoIGV4dHJhIGRlYnVncyB0byBzZWUgd2hhdCdzIGdvaW5nIG9uLgo+Cj4gTWFueSB0
aGFua3MsCj4KPiBBbGV4Cj4KPiBMZSBqZXUuIDIzIHNlcHQuIDIwMjEgw6AgMjM6NDgsIFJvZ2Vy
IEhlZmxpbiA8cm9nZXJoZWZsaW5AZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4+Cj4+IElmIHlvdSBo
YXZlIGx2bWV0YWQgcnVubmluZyBhbmQgaW4gdXNlIHRoZW4gdGhlIGx2bSBjb21tYW5kcyBhc2sg
aXQKPj4gd2hhdCB0aGUgc3lzdGVtIGhhcyBvbiBpdC4KPj4KPj4gSSBoYXZlIHNlZW4gb24gcmFu
ZG9tIGJvb3RzIGZhaXJseSBzZXBhcmF0ZWQgc3lzdGVtcyAocmhlbDcgdmVyc2lvbnMsCj4+IGFu
ZCBtYW55IHllYXJzIG5ld2VyIGZlZG9yYSBzeXN0ZW1zKSBhdCByYW5kb20gZmFpbCB0byBmaW5k
IG9uZSBvcgo+PiBtb3JlIHB2LnMKPj4KPj4gSSBoYXZlIGRpc2FibGVkIGl0IGF0IGhvbWUsIGFu
ZCBpbiBteSBkYXkgam9iIHdlIGhhdmUgYWxzbyBkaXNhYmxlZAo+PiAoYWNyb3NzIDIwaysgc3lz
dGVtcykgYXMgd2UgY29uZmlybWVkIGl0IGhhZCBpbmNvbnNpc3RlbmN5IGlzc3Vlcwo+PiBzZXZl
cmFsIHRpbWVzIG9uIGEgdmFyaWV0eSBvZiBvdXIgbmV3ZXN0IGluc3RhbGxzLgo+Pgo+PiBTdG9w
cGluZyBsdm1ldGFkIGFuZC9vciByZXN0YXJ0aW5nIGl0IHdvdWxkIGdlbmVyYWxseSBmaXggaXQu
ICAgIEJ1dAo+PiBpdCB3YXMgYSBzb3VyY2Ugb2YgZW5vdWdoIHJhbmRvbSBpc3N1ZXMob2Z0ZW4g
ZmFpbHVyZSB0byBtb3VudCBvbiBhCj4+IGJvb3QsIHNvIG9mdGVuIGlzc3VlcyB0aGF0IHJlc3Vs
dGVkIGluIHBhZ2Utb3V0cyB0byBkZWJ1ZykgIGFuZCBkaWQKPj4gbm90IHNwZWVkIHRoaW5ncyB1
cCBtdWNoIGVub3VnaCB0byBiZSB3b3J0aCBpdCBldmVuIG9uIGRldmljZXMgd2l0aAo+PiA+MjAw
MCBTQU4gdm9sdW1lcy4KPj4KPj4gT24gVGh1LCBTZXAgMjMsIDIwMjEgYXQgODo1MiBBTSBaZGVu
ZWsgS2FiZWxhYyA8emthYmVsYWNAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+ID4KPj4gPiBEbmUgMjIu
IDA5LiAyMSB2IDE4OjQ4IGFsZXNzYW5kcm8gbWFjdXogbmFwc2FsKGEpOgo+PiA+ID4gZmRpc2sg
Y29ycmVjdGx5IGlkZW50aWZpZXMgdGhlIGV4dGVuZGVkIHBhcnRpdGlvbiBhcyA4ZS4KPj4gPiA+
IEkgd29uZGVyIHdoaWNoIGtpbmQgb2YgZGF0YSBsdm1kaXNrc2NhbiBhbmQgcHZzIHVzZSBpbiBv
cmRlciB0byBsaXN0IExWTQo+PiA+ID4gcGh5c2ljYWwgdm9sdW1lcy4KPj4gPiA+IERvZXMgUFZT
IGNoZWNrIHNvbWUgc3BlY2lmaWMgbWV0YWRhdGEgd2l0aGluIHRoZSBwYXJ0aXRpb24gd2l0aG91
dCBqdXN0Cj4+ID4gPiByZWx5aW5nIG9uIHRoZSB0eXBlIG9mIHBhcnRpdGlvbiBkaXNwbGF5ZWQg
YnkgZmRpc2s/Cj4+ID4gPgo+PiA+ID4KPj4gPgo+PiA+IEhpCj4+ID4KPj4gPiBZZXMgLSBQVnMg
ZG8gaGF2ZSBoZWFkZXIgc2lnbmF0dXJlIGtlZXBpbmcgaW5mb3JtYXRpb24gYWJvdXQgUFYgYXR0
cmlidXRlcwo+PiA+IGFuZCBhbHNvIGhhcyB0aGUgc3RvcmFnZSBhcmVhIHRvIGtlZXAgbHZtMiBt
ZXRhZGF0YS4KPj4gPgo+PiA+IFBhcnRpdGlvbiBmbGFncyBrbm93biB0byBmZGlzayBhcmUgaXJy
ZWxldmFudC4KPj4gPgo+PiA+Cj4+ID4gUmVnYXJkcwo+PiA+Cj4+ID4gWmRlbmVrCj4+ID4KPj4g
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiA+IGxp
bnV4LWx2bSBtYWlsaW5nIGxpc3QKPj4gPiBsaW51eC1sdm1AcmVkaGF0LmNvbQo+PiA+IGh0dHBz
Oi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCj4+ID4gcmVh
ZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo+PiA+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
bHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0
IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

