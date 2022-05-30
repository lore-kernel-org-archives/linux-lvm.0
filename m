Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C264BC433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 30 May 2022 08:49:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-8NMdfE1WOcubJbILHqL8dw-1; Mon, 30 May 2022 04:49:16 -0400
X-MC-Unique: 8NMdfE1WOcubJbILHqL8dw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B9AE384F803;
	Mon, 30 May 2022 08:49:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C61A492C3B;
	Mon, 30 May 2022 08:49:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 459761969F4E;
	Mon, 30 May 2022 08:49:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 278C71957E77
 for <linux-lvm@listman.corp.redhat.com>; Mon, 30 May 2022 08:49:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CBD8E40F06B; Mon, 30 May 2022 08:49:10 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7463492C3B
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 08:49:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8306E80B71A
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 08:49:10 +0000 (UTC)
Received: from smtp01.syseleven.net (smtp01.syseleven.net [77.247.83.123])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-dLRIt2TZPziFQnFDBOttcg-1; Mon, 30 May 2022 04:49:08 -0400
X-MC-Unique: dLRIt2TZPziFQnFDBOttcg-1
Received: from 127.0.0.1 (localhost [127.0.0.1])
 by smtp01.syseleven.net (Postfix) with ESMTPSA id A57AB57E2C32
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 10:49:05 +0200 (CEST)
Message-ID: <617ddb5b-3993-8d9a-fac2-32f457077c60@syseleven.de>
Date: Mon, 30 May 2022 10:49:05 +0200
MIME-Version: 1.0
To: linux-lvm@redhat.com
References: <4ea715cc-3a58-bb47-af41-f40e630f93f3@syseleven.de>
 <25234.19124.329350.465135@quad.stoffel.home>
 <e86ef2bc-84f5-188c-cde4-5848a1c95648@syseleven.de>
From: Olaf Seibert <o.seibert@syseleven.de>
In-Reply-To: <e86ef2bc-84f5-188c-cde4-5848a1c95648@syseleven.de>
X-Virus-Scanned: clamav-milter 0.100.3 at milter01.syseleven.net
X-Virus-Status: Clean
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmVwbHlpbmcgdG8gbXlzZWxmOgoKT24gMzAuMDUuMjIgMTA6MTYsIE9sYWYgU2VpYmVydCB3cm90
ZToKPiBGaXJzdCwgSm9obiwgdGhhbmtzIGZvciB5b3VyIHJlcGx5LgoKSSBjb250YWN0ZWQgdGhl
IGN1c3RvbWVyIGFuZCBpdCB0dXJuZWQgb3V0IHRoZWlyIFZNJ3MgZGlzayAodGhpcyBMVikKd2Fz
IGJyb2tlbiBhbnl3YXkuIFNvIHRoZXJlIGlzIG5vIG5lZWQgYW55IG1vcmUgdG8gdHJ5IHRvIHJl
cGFpcgppdC4uLgoKVGhhbmtzIGZvciB5b3VyIHRob3VnaHRzIGFueXdheS4KCi1PbGFmLgoKLS0g
ClN5c0VsZXZlbiBHbWJICkJveGhhZ2VuZXIgU3RyYcOfZSA4MAoxMDI0NSBCZXJsaW4KClQgKzQ5
IDMwIDIzMyAyMDEyIDAKRiArNDkgMzAgNjE2IDc1NTUgMAoKaHR0cDovL3d3dy5zeXNlbGV2ZW4u
ZGUKaHR0cDovL3d3dy5mYWNlYm9vay5jb20vU3lzRWxldmVuCmh0dHBzOi8vd3d3Lmluc3RhZ3Jh
bS5jb20vc3lzZWxldmVuLwoKQWt0dWVsbGVyIFN5c3RlbS1TdGF0dXMgaW1tZXIgdW50ZXI6Cmh0
dHA6Ly93d3cudHdpdHRlci5jb20vc3lzZWxldmVuCgpGaXJtZW5zaXR6OiBCZXJsaW4KUmVnaXN0
ZXJnZXJpY2h0OiBBRyBCZXJsaW4gQ2hhcmxvdHRlbmJ1cmcsIEhSQiAxMDg1NzEgQgpHZXNjaMOk
ZnRzZsO8aHJlcjogTWFyYyBLb3J0aGF1cywgSmVucyBJaGxlbmZlbGQsIEFuZHJlYXMgSGVybWFu
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
bHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0
IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCg==

