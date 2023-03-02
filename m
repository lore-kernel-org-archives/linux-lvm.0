Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1A8C6FA8E
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Mar 2023 20:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677790095;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EK1EkG/ySQQzsqKM4a9/GfG756/JjkCt+X8AjnPaziQ=;
	b=UfS9mpkM7ii+Tkt3tIBQYy9voSoLK8R2c74bHHUboI5e13NlnsoePntXJHklUQV+IB4DqT
	2hXu85ANIL3n9C/5T141fFdaENJCZ+wWER1ELZ+G0ZQRAiTSzXsPiJahnyfs9e9/ZkIpkZ
	SCFQTHZK3Q9BFh+zP2Dqb+KPveI3L4M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-WP2HC_gBPxOaaU37F9DuHg-1; Thu, 02 Mar 2023 15:48:14 -0500
X-MC-Unique: WP2HC_gBPxOaaU37F9DuHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5B31858F09;
	Thu,  2 Mar 2023 20:48:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A8CDC16027;
	Thu,  2 Mar 2023 20:48:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DC21319452D0;
	Thu,  2 Mar 2023 20:48:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C814819452CD
 for <linux-lvm@listman.corp.redhat.com>; Thu,  2 Mar 2023 20:47:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EFC282166B2B; Thu,  2 Mar 2023 20:47:55 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8C392166B26
 for <linux-lvm@redhat.com>; Thu,  2 Mar 2023 20:47:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB2FE29A9CA0
 for <linux-lvm@redhat.com>; Thu,  2 Mar 2023 20:47:55 +0000 (UTC)
Received: from plutone.assyoma.it (cloud.assyoma.it [212.237.56.195]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-633-LmuTEJmXPDqOjIg35UwtBQ-1; Thu,
 02 Mar 2023 15:47:53 -0500
X-MC-Unique: LmuTEJmXPDqOjIg35UwtBQ-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
 by plutone.assyoma.it (Postfix) with ESMTPA id 29EB5DDE3D4C;
 Thu,  2 Mar 2023 21:47:51 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 02 Mar 2023 21:47:51 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CAAMCDed4T5wF9VEZzkmLURS7vueLYhRPVZ+kJdGTYAtkMx81Bw@mail.gmail.com>
References: <2023967259.761825.1677710640334.JavaMail.zimbra@karlsbakk.net>
 <CAAMCDeftn7gLN8s3EMFer+jJ95dRkdpR4007hDMqNNhjrbGDJA@mail.gmail.com>
 <17a0cca9c38c6eb8384275f68a2b465f@assyoma.it>
 <CAAMCDed4T5wF9VEZzkmLURS7vueLYhRPVZ+kJdGTYAtkMx81Bw@mail.gmail.com>
Message-ID: <ff490b685777158d68c3fc966bd34c9e@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [linux-lvm] lvconvert --uncache takes hours
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
Cc: Roger Heflin <rogerheflin@gmail.com>, Malin Bruland <malin.bruland@pm.me>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SWwgMjAyMy0wMy0wMiAxOTozMyBSb2dlciBIZWZsaW4gaGEgc2NyaXR0bzoKPiBPbiBUaHUsIE1h
ciAyLCAyMDIzIGF0IDExOjQ04oCvQU0gR2lvbmF0YW4gRGFudGkgPGcuZGFudGlAYXNzeW9tYS5p
dD4gCj4gd3JvdGU6Cj4gSXQgaXMgYSAxMDBHIGNhY2hlIG92ZXIgMTZUQiwgc28gZXZlbiBpZiBp
dCBmbHVzaGVzIGluIG9yZGVyIHRoZSBtYXkKPiBub3QgYmUgdGhhdCBjbG9zZSB0byBlYWNoIG90
aGVyICgxIGluIDE2MCkuCgpZZXMsIGJ1dCBkZXN0YWdpbmcgaW4gTEJBIG9yZGVyIChhbGJlaXQg
ZmFyIGFwYXJ0KSBpcyBtdWNoIGJldHRlciB0aGFuIAppbiByYW5kb20gb3JkZXIuCgo+IEFsc28g
aWYgcGllY2VzIGFyZSBkZWNpZGVkIGFuZCBhZGRlZCB0byB0aGUgY2FjaGVkIHRoZW4gdGhlIGNh
Y2hlIGlzCj4gbm90IGluIG9yZGVyIG9uIHRoZSBzc2QgYW5kIHByb3BlciBjb2FsZXNjaW5nIHdv
dWxkIHJlcXVpcmUgcmVhZGluZwo+IHRoZSBlbnRpcmUgY2FjaGUgYW5kIHNvcnRpbmcgdGhlIDMs
MDAwLDAwMCBsb2NhdGlvbiBlbnRyaWVzIGJlZm9yZQo+IHN0YXJ0aW5nIHRoZSBkZS1zdGFnZS4g
IEFuZCB0aGF0IGNvbXBsaWNhdGlvbiBvZiBhIGRlLXN0YWdlIGlzIGxpa2VseQo+IG5vdCBiZWVu
IGNvZGVkIHlldCBpZiBJIHdhcyBqdXN0IGd1ZXNzaW5nLCB0aGUgZGUtc3RhZ2Ugc3RhcnRzIGF0
IHRoZQo+IGJlZ2lubmluZyBhbmQgY29udGludWVzIHRvIHRoZSBlbmQgb2YgdGhlIGNhY2hlLgoK
SSB3b3VsZCBleHBlY3QgcmVvcmRlcmluZyBhbmQgY29hbGVzY2luZyB0byBoYXBwZW4gaW4gcmVh
c29uYWJseSBzaXplZCAKd2luZG93IChpZTogY29sbGVjdCA2NCBNQiBvZiBkYXRhLCByZW9yZGVy
IGFuZCBmbHVzaCB0aGVtKS4gQXQgdGhlIHNhbWUgCnRpbWUsIGNvbnNpZGVyaW5nIGhvdyBsdm1j
YWNoZSB3b3JrcywgeW91IGFyZSBwcm9iYWJseSByaWdodDogY2FjaGVkIApjaHVua3MgYXJlIGdv
aW5nIHRvIGJlIGZsdXNoZWQgYXMgZGlzY292ZXJlZCAocmFuZG9tIG9yZGVyKS4KCj4gRXZlbiBj
b2RlZCB0aG91Z2gsIGlmIHRoZSB5b3UgaGF2ZSBlbm91Z2ggYmxvY2tzIGNhY2hlZCBhbmQgaWYg
dGhlCj4gYmxvY2tzIHNwcmVhZCBzYXkgb25lIG9yIDIgb24gZWFjaCB0cmFjayBpdCB3b3VsZCBi
cmVhayBkb3duIHRvIGhhdmluZwo+IHRvIHdyaXRlIGEgdGlueSBiaXQgb24gZWFjaCB0cmFjayB3
aXRoIHNlZWtzIGJldHdlZW4gbW9zdGx5IGJyZWFraW5nCj4gZG93biB0byB0aGUgdGltZSByZXF1
aXJlZCB0byBzaW1wbHkgcmVhZC93cml0ZSAgdGhlIEhEIGVuZCB0byBlbmQuICBBdAo+IDE1ME1C
L3NlYyAoc2hvdWxkIGJlIGFib3V0IHRoZSBwbGF0dGVyIHNwZWVkKSB0aGF0IHdvdWxkIHRha2Ug
My41Cj4gaG91cnMuCgpXaGljaCAoYXBhcnQgYmVpbmcgYSB0b3RhbGx5IHdvcnN0IG91dGNvbWUp
IHdvdWxkIGJlIHdheSBiZXR0ZXIgdGhhbiAKd2hhdCByZXF1aXJlZCBmb3IgdG90YWxseSByYW5k
b20gSU8uCgpSZWdhcmRzLgoKLS0gCkRhbnRpIEdpb25hdGFuClN1cHBvcnRvIFRlY25pY28KQXNz
eW9tYSBTLnIubC4gLSB3d3cuYXNzeW9tYS5pdAplbWFpbDogZy5kYW50aUBhc3N5b21hLml0IC0g
aW5mb0Bhc3N5b21hLml0CkdQRyBwdWJsaWMga2V5IElEOiBGRjVGMzJBOAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlz
dApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9y
Zy9IT1dUTy9MVk0tSE9XVE8vCg==

