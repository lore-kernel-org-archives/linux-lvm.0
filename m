Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05092C433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 31 May 2022 11:27:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-dCH-pl2ZOMGzCFFi7HeiAw-1; Tue, 31 May 2022 07:27:41 -0400
X-MC-Unique: dCH-pl2ZOMGzCFFi7HeiAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8EED1C068C0;
	Tue, 31 May 2022 11:27:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0A8B1121314;
	Tue, 31 May 2022 11:27:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8225C1947061;
	Tue, 31 May 2022 11:27:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D7CA2194705C
 for <linux-lvm@listman.corp.redhat.com>; Tue, 31 May 2022 11:27:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B91F8492CA3; Tue, 31 May 2022 11:27:28 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4F15492CA2
 for <linux-lvm@redhat.com>; Tue, 31 May 2022 11:27:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CAAC101AA47
 for <linux-lvm@redhat.com>; Tue, 31 May 2022 11:27:28 +0000 (UTC)
Received: from smtp01.syseleven.net (smtp01.syseleven.net [77.247.83.123])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-tet82_SDNP-0sPQXyl6axg-1; Tue, 31 May 2022 07:27:26 -0400
X-MC-Unique: tet82_SDNP-0sPQXyl6axg-1
Received: from 127.0.0.1 (localhost [127.0.0.1])
 by smtp01.syseleven.net (Postfix) with ESMTPSA id EF6B057E2CD4
 for <linux-lvm@redhat.com>; Tue, 31 May 2022 13:27:21 +0200 (CEST)
Message-ID: <d4ebebc7-994c-9ae1-8b82-8c45ff8be6e0@syseleven.de>
Date: Tue, 31 May 2022 13:27:21 +0200
MIME-Version: 1.0
To: linux-lvm@redhat.com
References: <4ea715cc-3a58-bb47-af41-f40e630f93f3@syseleven.de>
 <25234.19124.329350.465135@quad.stoffel.home>
 <e86ef2bc-84f5-188c-cde4-5848a1c95648@syseleven.de>
 <YpTPwJbsmG9Dr4X2@itl-email>
From: Olaf Seibert <o.seibert@syseleven.de>
In-Reply-To: <YpTPwJbsmG9Dr4X2@itl-email>
X-Virus-Scanned: clamav-milter 0.100.3 at milter01.syseleven.net
X-Virus-Status: Clean
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [linux-lvm] raid10 with missing redundancy,
 but health status claims it is ok.
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMzAuMDUuMjIgMTY6MDcsIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToKPiBDYW4geW91IHRy
eSB0byBsaXZlLW1pZ3JhdGUgdGhlIFZNcyBvZmYgb2YgdGhpcyBub2RlPyAgSWYgbm90LCBjYW4g
eW91Cj4gYW5ub3VuY2UgYSBtYWludGVuYW5jZSB3aW5kb3cgYW5kIHBvd2VyIG9mZiB0aGUgVk1z
IHNvIHlvdSBjYW4gdGFrZSBhCj4gYmxvY2stbGV2ZWwgYmFja3VwPwoKQWxhcywgdGhpcyAodHlw
ZSBvZikgY29tcHV0ZSBub2RlIGlzIGRlc2lnbmVkIHNwZWNpZmljYWxseSB0byB1c2UgbG9jYWwK
c3RvcmFnZSBpbnN0ZWFkIG9mIChzaGFyZWQpIG5ldHdvcmsgc3RvcmFnZS4gVGhpcyBwcmV2ZW50
cyBsaXZlIG1pZ3JhdGlvbi4KSWYgbGl2ZSBtaWdyYXRpb24gd2VyZSBwb3NzaWJsZSAoYW5kIGl0
IHdvdWxkIGluY2x1ZGUgbWlncmF0aW5nIHRoZQpkaXNrIHN0b3JhZ2UpLCB0aGVuIHRoaXMgd291
bGQgbW9yZSBvciBsZXNzIGF1dG9tYXRpY2FsbHkgc29sdmUKdGhlIHByb2JsZW06IG9uIHRoZSBu
ZXcgbm9kZSB0aGUgTFYgd291bGQgYmUgYSBmcmVzaCBvbmUKYW5kIHRodXMgbmljZWx5IG1pcnJv
cmVkLgoKTWF5YmUgc29tZWJvZHkgY291bGQgYWRkIHN1cHBvcnQgZm9yIHNvbWV0aGluZyBsaWtl
IHRoYXQgdG8gT3BlblN0YWNrLApidXQgcmlnaHQgbm93IGl0IGNhbid0IGRvIGl0LgoKQ2hlZXJz
LAotT2xhZi4KCi0tIApTeXNFbGV2ZW4gR21iSApCb3hoYWdlbmVyIFN0cmHDn2UgODAKMTAyNDUg
QmVybGluCgpUICs0OSAzMCAyMzMgMjAxMiAwCkYgKzQ5IDMwIDYxNiA3NTU1IDAKCmh0dHA6Ly93
d3cuc3lzZWxldmVuLmRlCmh0dHA6Ly93d3cuZmFjZWJvb2suY29tL1N5c0VsZXZlbgpodHRwczov
L3d3dy5pbnN0YWdyYW0uY29tL3N5c2VsZXZlbi8KCkFrdHVlbGxlciBTeXN0ZW0tU3RhdHVzIGlt
bWVyIHVudGVyOgpodHRwOi8vd3d3LnR3aXR0ZXIuY29tL3N5c2VsZXZlbgoKRmlybWVuc2l0ejog
QmVybGluClJlZ2lzdGVyZ2VyaWNodDogQUcgQmVybGluIENoYXJsb3R0ZW5idXJnLCBIUkIgMTA4
NTcxIEIKR2VzY2jDpGZ0c2bDvGhyZXI6IE1hcmMgS29ydGhhdXMsIEplbnMgSWhsZW5mZWxkLCBB
bmRyZWFzIEhlcm1hbm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6
Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUg
TFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

