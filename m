Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6280C7EE26
	for <linux-lvm@archiver.kernel.org>; Mon, 22 May 2023 16:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684772631;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ry35V41NkgQN6+fhwwGWZMDnOSK9m6NCyPKn82fD/A8=;
	b=LUO+W0G/PQ1N4ydlZFa1mDgahn94KYbQ4B2TUW2UrNA4mTi0YfORE2MzFFn09AhcuXwk2e
	t7XcOQ3n2cBps5Fe99Q101saawK/1sd95yJw0DB0AMSZ5wCPMsqrkJwe4sM9LqIsLXvzIv
	tLYEJ4EYsLSHcwJUzX9tLLmMSwsns60=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-UZyGMX8wN5SSASuWrN-KmQ-1; Mon, 22 May 2023 12:23:48 -0400
X-MC-Unique: UZyGMX8wN5SSASuWrN-KmQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CFD1811E78;
	Mon, 22 May 2023 16:23:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA05540D1B60;
	Mon, 22 May 2023 16:23:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8FE4719465A8;
	Mon, 22 May 2023 16:23:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3A0671946595
 for <linux-lvm@listman.corp.redhat.com>; Mon, 22 May 2023 16:23:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1C5EE400F17; Mon, 22 May 2023 16:23:35 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13C09401026
 for <linux-lvm@redhat.com>; Mon, 22 May 2023 16:23:35 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E703529DD981
 for <linux-lvm@redhat.com>; Mon, 22 May 2023 16:23:34 +0000 (UTC)
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-7-KfigU8IPM1OgqksvUe8OaA-1; Mon,
 22 May 2023 12:23:32 -0400
X-MC-Unique: KfigU8IPM1OgqksvUe8OaA-1
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 65D2E1209A5; Mon, 22 May 2023 12:23:32 -0400 (EDT)
References: <60e1a6cf-0384-5f6b-299b-a40c60a0b1a4@vetterlein.com>
 <87lehgmpra.fsf@vps.thesusis.net>
 <80ca21db-ca89-83a3-e1fb-f2a407d6b0e2@vetterlein.com>
User-agent: mu4e 1.7.12; emacs 27.1
From: Phillip Susi <phill@thesusis.net>
To: graeme vetterlein <graeme.lvm@vetterlein.com>
Date: Mon, 22 May 2023 12:01:39 -0400
In-reply-to: <80ca21db-ca89-83a3-e1fb-f2a407d6b0e2@vetterlein.com>
Message-ID: <87y1lgfi7v.fsf@vps.thesusis.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: thesusis.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpncmFlbWUgdmV0dGVybGVpbiA8Z3JhZW1lLmx2bUB2ZXR0ZXJsZWluLmNvbT4gd3JpdGVzOg0K
DQo+IEkgd2FzIGFibGUgdG8gInJlcGxhY2UiIDEgYnJva2VuIDJUQiAxIHdvcmtpbmcgMlRCIGRy
aXZlIHdpdGggYSBuZXcNCj4gNFRCIGRyaXZlDQo+IHdpdGhvdXQgYW55IGZpbGVzeXN0ZW0gY3Jl
YXRpb24sIGNvcHlpbmcgZXRjLCBqdXN0IHVzaW5nIExWTSBjb21tYW5kczoNCg0KPiDCoMKgwqAg
dW1vdW50IC9kZXYvbWFwcGVyL1NBTVNVTkdfMlRCLWRhdGENCj4gwqDCoMKgIHVtb3VudCAvZGV2
L21hcHBlci9TQU1TVU5HXzJUQi12aW1hZ2UNCj4gwqDCoMKgIGx2Y2hhbmdlIC1hbsKgIFNBTVNV
TkdfMlRCL2RhdGENCj4gwqDCoMKgIGx2Y2hhbmdlIC1hbsKgIFNBTVNVTkdfMlRCL3ZpbWFnZQ0K
PiDCoMKgwqAgdmdtZXJnZcKgIEJBUlJBQ1VEQV80VEIgU0FNU1VOR18yVEIgwqDCoMKgIC0tIEkg
YmVsaWV2ZSB0aGlzIHB1dHMNCj4gZXZlcnl0aGluZyBpbnRvIEJBUlJBQ1VEQV80VEIgKG9kZGx5
IHJpZ2h0IHRvIGxlZnQpDQo+IMKgwqDCoCBwdm1vdmUgL2Rldi9zZGMxwqDCoMKgIMKgwqDCoMKg
IMKgwqDCoCAtLSBNb3ZlcyBldmVyeXRoaW5nIG9mZiBzZGMxDQo+IMKgwqDCoCB2Z3JlZHVjZSBC
QVJSQUNVREFfNFRCIC9kZXYvc2RjMcKgwqDCoCAtLSBOb3RoaW5nIHNob3VsZCBiZSBpbiBzZGMx
LA0KPiBzbyBkcm9wIGl0IGZyb20gdGhlIGdyb3VwDQoNCklmIHRoZXkgd2VyZSBpbiB0aGUgc2Ft
ZSB2ZywgeW91IHdvdWxkbid0IGV2ZW4gaGF2ZSB0byB1bW91bnQgdGhlDQpmaWxlc3lzdGVtLg0K
DQo+IDE5LDAwMCBob3VycywgSSBnZXQgYSBwb3B1cCB3YXJuaW5ncyBhbG1vc3QgZXZlcnkgZGF5
IG5vdy4gU21hcnQgc2hvd3MNCj4gaXQgaGFzIE5PDQo+IHJlYWxsb2NhdGVkIHNlY3RvcnMuDQoN
CldoYXQgInBvcCB1cCB3YXJuaW5nPz8gIFdoYXQgZG9lcyBzbWFydGN0bCAtSCBzYXkgYWJvdXQg
dGhlIGRyaXZlPyAgSQ0KZG9uJ3Qgc2VlIGFueXRoaW5nIGJlbG93IHRoYXQgaW5kY2ljYXRlcyB0
aGVyZSBpcyBhbnl0aGluZyB3cm9uZyB3aXRoDQp0aGUgZHJpdmUgYXQgYWxsLg0KDQo+IFNNQVJU
IEF0dHJpYnV0ZXMgRGF0YSBTdHJ1Y3R1cmUgcmV2aXNpb24gbnVtYmVyOiAxNg0KPiBWZW5kb3Ig
U3BlY2lmaWMgU01BUlQgQXR0cmlidXRlcyB3aXRoIFRocmVzaG9sZHM6DQo+IElEIyBBVFRSSUJV
VEVfTkFNRcKgwqDCoMKgwqDCoMKgwqDCoCBGTEFHwqDCoMKgwqAgVkFMVUUgV09SU1QgVEhSRVNI
IFRZUEUgVVBEQVRFRMKgDQo+IFdIRU5fRkFJTEVEIFJBV19WQUxVRQ0KPiDCoCAxIFJhd19SZWFk
X0Vycm9yX1JhdGXCoMKgwqDCoCAweDAwMGLCoMKgIDEwMMKgwqAgMTAwwqDCoCAwMTbCoMKgwqAg
UHJlLWZhaWwNCj4gQWx3YXlzwqDCoMKgwqDCoMKgIC3CoMKgwqDCoMKgwqAgMA0KPiDCoCAyIFRo
cm91Z2hwdXRfUGVyZm9ybWFuY2XCoCAweDAwMDXCoMKgIDE0MMKgwqAgMTQwwqDCoCAwNTTCoMKg
wqAgUHJlLWZhaWwNCj4gT2ZmbGluZcKgwqDCoMKgwqAgLcKgwqDCoMKgwqDCoCA2OQ0KPiDCoCAz
IFNwaW5fVXBfVGltZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwMDA3wqDCoCAxMjfCoMKgIDEy
N8KgwqAgMDI0wqDCoMKgIFByZS1mYWlsDQo+IEFsd2F5c8KgwqDCoMKgwqDCoCAtwqDCoMKgwqDC
oMKgIDI5NiAoQXZlcmFnZSAyOTkpDQo+IMKgIDQgU3RhcnRfU3RvcF9Db3VudMKgwqDCoMKgwqDC
oMKgIDB4MDAxMsKgwqAgMTAwwqDCoCAxMDDCoMKgIDAwMMKgwqDCoCBPbGRfYWdlDQo+IEFsd2F5
c8KgwqDCoMKgwqDCoCAtwqDCoMKgwqDCoMKgIDM1NTQNCj4gwqAgNSBSZWFsbG9jYXRlZF9TZWN0
b3JfQ3TCoMKgIDB4MDAzM8KgwqAgMTAwwqDCoCAxMDDCoMKgIDAwNcKgwqDCoCBQcmUtZmFpbA0K
PiBBbHdheXPCoMKgwqDCoMKgwqAgLcKgwqDCoMKgwqDCoCAwDQo+IMKgIDcgU2Vla19FcnJvcl9S
YXRlwqDCoMKgwqDCoMKgwqDCoCAweDAwMGLCoMKgIDEwMMKgwqAgMTAwwqDCoCAwNjfCoMKgwqAg
UHJlLWZhaWwNCj4gQWx3YXlzwqDCoMKgwqDCoMKgIC3CoMKgwqDCoMKgwqAgMA0KPiDCoCA4IFNl
ZWtfVGltZV9QZXJmb3JtYW5jZcKgwqAgMHgwMDA1wqDCoCAxMjTCoMKgIDEyNMKgwqAgMDIwwqDC
oMKgIFByZS1mYWlsDQo+IE9mZmxpbmXCoMKgwqDCoMKgIC3CoMKgwqDCoMKgwqAgMzMNCj4gwqAg
OSBQb3dlcl9Pbl9Ib3Vyc8KgwqDCoMKgwqDCoMKgwqDCoCAweDAwMTLCoMKgIDA5OMKgwqAgMDk4
wqDCoCAwMDDCoMKgwqAgT2xkX2FnZQ0KPiBBbHdheXPCoMKgwqDCoMKgwqAgLcKgwqDCoMKgwqDC
oCAxOTA4MA0KPiDCoDEwIFNwaW5fUmV0cnlfQ291bnTCoMKgwqDCoMKgwqDCoCAweDAwMTPCoMKg
IDEwMMKgwqAgMTAwwqDCoCAwNjDCoMKgwqAgUHJlLWZhaWwNCj4gQWx3YXlzwqDCoMKgwqDCoMKg
IC3CoMKgwqDCoMKgwqAgMA0KPiDCoDEyIFBvd2VyX0N5Y2xlX0NvdW50wqDCoMKgwqDCoMKgIDB4
MDAzMsKgwqAgMTAwwqDCoCAxMDDCoMKgIDAwMMKgwqDCoCBPbGRfYWdlDQo+IEFsd2F5c8KgwqDC
oMKgwqDCoCAtwqDCoMKgwqDCoMKgIDI5NTkNCj4gMTkyIFBvd2VyLU9mZl9SZXRyYWN0X0NvdW50
IDB4MDAzMsKgwqAgMDk3wqDCoCAwOTfCoMKgIDAwMMKgwqDCoCBPbGRfYWdlDQo+IEFsd2F5c8Kg
wqDCoMKgwqDCoCAtwqDCoMKgwqDCoMKgIDM2MTYNCj4gMTkzIExvYWRfQ3ljbGVfQ291bnTCoMKg
wqDCoMKgwqDCoCAweDAwMTLCoMKgIDA5N8KgwqAgMDk3wqDCoCAwMDDCoMKgwqAgT2xkX2FnZQ0K
PiBBbHdheXPCoMKgwqDCoMKgwqAgLcKgwqDCoMKgwqDCoCAzNjE2DQo+IDE5NCBUZW1wZXJhdHVy
ZV9DZWxzaXVzwqDCoMKgwqAgMHgwMDAywqDCoCAyNTDCoMKgIDI1MMKgwqAgMDAwwqDCoMKgIE9s
ZF9hZ2UNCj4gQWx3YXlzwqDCoMKgwqDCoMKgIC3CoMKgwqDCoMKgwqAgMjQgKE1pbi9NYXggMTMv
NDUpDQo+IDE5NiBSZWFsbG9jYXRlZF9FdmVudF9Db3VudCAweDAwMzLCoMKgIDEwMMKgwqAgMTAw
wqDCoCAwMDDCoMKgwqAgT2xkX2FnZQ0KPiBBbHdheXPCoMKgwqDCoMKgwqAgLcKgwqDCoMKgwqDC
oCAwDQo+IDE5NyBDdXJyZW50X1BlbmRpbmdfU2VjdG9ywqAgMHgwMDIywqDCoCAxMDDCoMKgIDEw
MMKgwqAgMDAwwqDCoMKgIE9sZF9hZ2UNCj4gQWx3YXlzwqDCoMKgwqDCoMKgIC3CoMKgwqDCoMKg
wqAgMA0KPiAxOTggT2ZmbGluZV9VbmNvcnJlY3RhYmxlwqDCoCAweDAwMDjCoMKgIDEwMMKgwqAg
MTAwwqDCoCAwMDDCoMKgwqAgT2xkX2FnZQ0KPiBPZmZsaW5lwqDCoMKgwqDCoCAtwqDCoMKgwqDC
oMKgIDANCj4gMTk5IFVETUFfQ1JDX0Vycm9yX0NvdW50wqDCoMKgIDB4MDAwYcKgwqAgMjAwwqDC
oCAyMDDCoMKgIDAwMMKgwqDCoCBPbGRfYWdlDQo+IEFsd2F5c8KgwqDCoMKgwqDCoCAtwqDCoMKg
wqDCoMKgIDU3DQo+DQo+DQo+IE5vdywgSSBrbm93IGl0J3MgcG9zc2libGUgdGhhdCB0aGVzZSBD
UkMgZXJyb3JzIGFyZSBlLmcuICdjYWJsZSByZWxhdGVkJyBidXQNCj4gSSd2ZSBzd2FwcGVkIHRo
ZSBjYWJsZSBhbmQgbW92ZWQgU0FUQSBwb3J0cyB0byBubyBlZmZlY3QuIEluIHRoZSBlbmQgSQ0K
PiBkZWNpZGVkDQo+IDEwIHllYXJzIHdhcyBlbm91Z2ggYW5kIGJvdWdodCBhIG5ldyBkcml2ZS4N
Cg0KWWVzLCB0aG9zZSBhcmUganVzdCBlcnJvcnMgZ29pbmcgb3ZlciB0aGUgU0FUQSBsaW5rLiAg
VGhleSB3b3VsZCBoYXZlDQpiZWVuIHJldHJpZWQgYW5kIHlvdSBuZXZlciBub3RpY2VkLiAgVGhl
IHF1ZXN0aW9uIGlzIHdoZXRoZXIgeW91IHNlZSBhbnkNCmVycm9ycyBpbiBkbWVzZyBvciB5b3Vy
IGtlcm5lbCBsb2dzLCBvciByZXBvcnRlZCBmcm9tIGJhZGJsb2Nrcy4gIE9yIHlvdQ0KbWlnaHQg
YXNrIHNtYXJ0Y3RsIHRvIGhhdmUgdGhlIGRyaXZlIHJ1biBpdHMgb3duIGludGVybmFsIHRlc3Qg
d2l0aA0Kc21hcnRjdGwgLXQgbG9uZy4gIFRoZSBhZHZhbnRhZ2Ugb2YgdGhpcyBvdmVyIGJhZGJs
b2NrcyBpcyB0aGF0IGl0DQpkb2Vzbid0IGhhdmUgdG8gd2FzdGUgcmVzb3VyY2VzIGFjdHVhbGx5
IHNlbmRpbmcgdGhlIGRhdGEgdG8gdGhlIENQVQ0KanVzdCB0byB0ZXN0IGlmIGl0IGNhbiByZWFk
IHRoZSBkaXNrLiAgWW91IGNhbiB0aGVuIGNoZWNrIHRoZSBkcml2ZSdzDQpsb2cgd2l0aCBzbWFy
dGN0bCAtbCBzZWxmdGVzdCB0byBzZWUgaWYgaXQgZm91bmQgYW55IGVycm9ycy4NCg0KPiBBbnkg
aGludHM/IGx2bTIgY29tbWFuZHM/IEkgY2FuIFJURk0gYnV0IGEgcG9pbnRpbmcgZmluZ2VyIHdv
dWxkIGhlbHAuDQoNCllvdSBjYW4gYnlwYXNzIExWTSBhbmQgZGlyZWN0bHkgbWFuaXB1bGF0ZSB0
aGUgZGV2aWNlIG1hcHBlciB3aXRoIHRoZQ0KZG1zZXR1cCBjb21tYW5kLiAgRG9pbmcgdGhpcywg
eW91IGNhbiBkbyB2YXJpb3VzIG90aGVyIHRoaW5ncyBzdWNoIGFzDQppbnNlcnQgYSBmYWtlICJi
YWQgc2VjdG9yIiBmb3IgdGVzdGluZyBwdXJwb3NlcywgYnV0IHlvdSB3aWxsIGhhdmUgdG8NCnNl
dCB1cCBhIHNjcmlwdCBpbiB5b3VyIGluaXRyYW1mcyB0byBjb25maWd1cmUgdGhlIHRhYmxlIG9u
IGV2ZXJ5IGJvb3QuDQoNCj4gRGViaWFuLiBJJ20gdGhpbmtpbmcgSSdsbCBwcm9iYWJseSB1c2Ug
TFZNMiBhbmQgcmFpZCBzdHJpcGluZyAoc28gSQ0KPiB3aWxsIGhhdmUgVkcNCj4gd2l0aCBtYW55
IFBWIGluIHRoZW0gOi0pICkNCg0KVGhhdCdzIG9uZSB3YXkgdG8gZ28sIGJ1dCBpZiB5b3UgYXJl
IGN1cnJlbnRseSBrZWVwaW5nIHRoZW0gYXMgc2VwYXJhdGUNCmZpbGVzeXN0ZW1zLCB5b3UgbWln
aHQgYmUgaW50ZXJlc3RlZCBpbiBsb29raW5nIHVwIHNuYXByYWlkLiAgSXQgbGV0cw0KeW91IGNy
ZWF0ZSBwYXJpdHkgdG8gYmUgYWJsZSB0byByZWNvdmVyIGZyb20gZmlsZSBvciBkaXNrIGxvc3Mg
bGlrZQ0KcmFpZDUvNiwgYnV0IG5vdCBpbiByZWFsIHRpbWUuICBJdCdzIGhhbmR5IGZvciBzZXZl
cmFsIGRpc2tzIHRoYXQNCmNvbnRhaW4gZmlsZXMgdGhhdCBhcmUgcmFyZWx5IHdyaXR0ZW4gdG8g
c3VjaCBhcyBtZWRpYSBmaWxlcy4gIFlvdSBjYW4NCmtlZXAgeW91ciBtZWRpYSBkaXNrcyBpbiBz
dGFuZGJ5IG1vZGUgZXhjZXB0IGZvciB0aGUgb25lIGRpc2sgdGhhdA0KY29udGFpbnMgdGhlIGZp
bGUgeW91IHdhbnQgdG8gcGxheSByaWdodCBub3csIHJhdGhlciB0aGFuIGhhdmluZyB0byB3YWtl
DQphbGwgb2YgdGhlIGRpc2tzIHVwIGFzIHdpdGggcmFpZDUvNi4gIFlvdSBjYW4gYWxzbyBrZWVw
IHlvdXIgcGFyaXR5DQpkaXNrKHMpIG9mZmxpbmUgYW5kIGRyb3AgdGhlbSBpbiBhbiBlU0FUQSBk
b2NrIGp1c3QgdG8gdXBkYXRlIHRoZSBwYXJpdHkNCndoZW4geW91IGRvIG1vZGlmeSB0aGUgZmls
ZXMgb24gdGhlIGRhdGEgZGlza3MuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5j
b20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0K
cmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

