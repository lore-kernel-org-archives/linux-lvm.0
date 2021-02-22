Return-Path: <SRS0=nYqM=HY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13504C433DB
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 11:07:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F7B664E00
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 11:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F7B664E00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613992060;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=APE+F4nl9O2jEYfRxYskjeDO/Pqg7JDkF4+Ecrl3+5U=;
	b=UtJd7PR9JVUx0EnTy2++MqE0JvDXSttW39c4CmP7ej8rCGNQIvqT9uoCtw/QkkVf+6rfjV
	ModbMZjpP2sDmKalX8/xCBgjeZLmJaTWSingd5khHDLeDauBh48z8qwhiukJMHjHUq4TZu
	wVKfhIoFXwD/YYILDfBGYAqlubEcE7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-2cYfHfzpM4mx0rdwFde8dQ-1; Mon, 22 Feb 2021 06:07:38 -0500
X-MC-Unique: 2cYfHfzpM4mx0rdwFde8dQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE9BC107ACC7;
	Mon, 22 Feb 2021 11:07:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE16E5D9CC;
	Mon, 22 Feb 2021 11:07:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAC5118095CB;
	Mon, 22 Feb 2021 11:07:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11MB4PFh011667 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 22 Feb 2021 06:04:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6287260C13; Mon, 22 Feb 2021 11:04:25 +0000 (UTC)
Received: from [10.40.195.160] (unknown [10.40.195.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF6E160C0F;
	Mon, 22 Feb 2021 11:04:21 +0000 (UTC)
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Drew Westrick <drewwestrick@glassboard.com>
References: <klfw5jeh.707d078c-fbbf-4456-9f24-61435f1f79d3@we.are.superhuman.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: Red Hat
Message-ID: <3675eab2-9922-9ffb-4e68-a3612f661a69@redhat.com>
Date: Mon, 22 Feb 2021 12:04:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <klfw5jeh.707d078c-fbbf-4456-9f24-61435f1f79d3@we.are.superhuman.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Removing bash as a dependency
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
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDIyLiAwMi4gMjEgdiAyOjI1IERyZXcgV2VzdHJpY2sgbmFwc2FsKGEpOgo+IEFsbCwKPiAK
PiBJJ20gd29ya2luZyBvbiBhIHByb2plY3Qgd2l0aCBhIGZhaXJseSBzdHJpY3Qgbm8gR1BMdjMg
cG9saWN5LiBXaGlsZSBsdm0yIGlzIAo+IGZpbmUgc2luY2UgaXQgaXMgR1BMdjIsIHRoZSBsdm0y
IGRlcGVuZGVuY3kgb24gYmFzaCzCoHdoaWNoIGlzIEdQTHYzLCBpcyAKPiBjYXVzaW5nIGEgcHJv
YmxlbS4gSXQgYXBwZWFycyB0aGF0IGJhc2ggaXMgdXNlZCBtb3N0bHkgZm9yIHRlc3Qgc2NyaXB0
cyBhcyAKPiB3ZWxsIGFzIGx2bWR1bXAuc2ggPGh0dHA6Ly9sdm1kdW1wLnNoLz4gYW5kIGZzYWRt
LnNoIDxodHRwOi8vZnNhZG0uc2gvPi4gSWYgd2UgCj4gZG9uJ3QgbmVlZCB0byB1c2UgdGhvc2Ug
dHdvIHV0aWxpdGllcywgd291bGQgdGhlcmUgYmUgYW55IG90aGVyIG1ham9yIGlzc3VlcyAKPiB3
aXRoIHJlbW92aW5nIGJhc2ggYSBhIGRlcGVuZGVuY3kgaWYgSSB3ZXJlIHRvIGdvIGRvd24gdGhh
dCBwYXRoPwo+IAoKSGkKCkRpc3RyaWJ1dGluZyBsdm0yIHdpdGhvdXQgdGhvc2UgdG9vbHMgSU1I
TyBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZS4KCklmIHRoZXJlIGlzIGFueW9uZSB0byBjYXJlIGFu
ZCBzZWxlY3QgcGllY2VzIHdoaWNoIGFyZSBub3QgY29tbW9uIGluIHNoZWxscwphbmQgd3JpdGUg
YW4gYWx0ZXJuYXRpdmUgY29kZSBmb3IgdGhlbSBmb3Igbm9uIGJhc2ggc2hlbGxzIC0gSSdkIGJl
IGZpbmUuCgpXZSBjb3VsZCB1c2UgZXZlbnR1YWxseSBjb25maWd1cmUgdG8gYWRhcHQgdGhlbSBm
b3Igb3RoZXIgc2hlbGwgdHlwZXMuCgpSZWdhcmRzCgpaZGVuZWsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGlu
dXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9X
VE8vTFZNLUhPV1RPLw==

