Return-Path: <SRS0=jKdR=JJ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MALFORMED_FREEMAIL,MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F25C433B4
	for <linux-lvm@archiver.kernel.org>; Mon, 12 Apr 2021 19:09:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E13D611CE
	for <linux-lvm@archiver.kernel.org>; Mon, 12 Apr 2021 19:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E13D611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-VI1jVDHcP5S4eAf4LpDEUw-1; Mon, 12 Apr 2021 15:09:09 -0400
X-MC-Unique: VI1jVDHcP5S4eAf4LpDEUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 694E010053EA;
	Mon, 12 Apr 2021 19:09:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7CA45C1BB;
	Mon, 12 Apr 2021 19:08:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F200A44A5A;
	Mon, 12 Apr 2021 19:08:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13CJ8dpW024756 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 15:08:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D63D220B4AB6; Mon, 12 Apr 2021 19:08:39 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFB4B20B4AA9
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2021 19:08:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B9B7802D19
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2021 19:08:37 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-152-zYYwL97VO1WDDwnAVWWruQ-1; Mon, 12 Apr 2021 15:08:35 -0400
X-MC-Unique: zYYwL97VO1WDDwnAVWWruQ-1
Received: by mail-lj1-f175.google.com with SMTP id z8so16646061ljm.12
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2021 12:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:cc:content-transfer-encoding;
	bh=2meKTjOH3Rw4iQlYIvPMLQLKFYfXaXeN+NoMoelpcQI=;
	b=tbqVTElV668TXiRKzIO5NHrkUTESxcA5WctJkVMcMOAfmyTlEw+Uw60o9MFtZTOVGB
	QtOnnEx8SEZC8DUV8/pJrSGiRgN4yi+WWymkL30ZFDrqDHXfj5q/XZISNimlpcNVdM81
	YjZkk4dIX2rYAUzZ4MJM36dik5QHUD+r10DzlEp00sy1jhyl/nSOq40rEVWtpEs3nhho
	4WLWPYDr2p5gBIf5ZHFTQ3Dik/z9LFUZYsASJK4vXqkbxDZ4l0oK57JEZfwGKIWwgSub
	Y7WFwzXmHcNMw9KzX+KirIixgn/Tw1MgfojRfMzYGyzJGsaNvoUXh1UaVcHIN66i/an7
	JwOg==
X-Gm-Message-State: AOAM5327ujST0LigE0OHRP7qrSByjqwOVawdQLF7KfnsAeW2zu/tsuwh
	4T+OvpMuh34cfVLD1i/f7EywJoyhZonL2utwx2MF/diZJnxsrw==
X-Google-Smtp-Source: ABdhPJxaSOIqkc2G1LHWbswN3muzwpjQjOpVPbnW8miWe2CK/hKmX6KxYKrUm1rSoaVqvyx9xMb9EOcgq2QJ6fVeDiY=
X-Received: by 2002:a2e:9f11:: with SMTP id u17mr2471412ljk.447.1618254513534; 
	Mon, 12 Apr 2021 12:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAP1D0fSHaWQ_PsAFYRn2WnboAgQCKOAg2jLbDoWKz0U7z8yoHA@mail.gmail.com>
	<20210412184742.GH10314@redhat.com>
In-Reply-To: <20210412184742.GH10314@redhat.com>
From: =?UTF-8?B?UMOpdGVyIFPDoXJrw7Z6aQ==?= <xmisterhu@gmail.com>
Date: Mon, 12 Apr 2021 21:08:22 +0200
Message-ID: <CAP1D0fSsNyF=3=R5ZiTNcmU-KhoxDoo6CUibAoRYRmU-00Evpg@mail.gmail.com>
Cc: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13CJ8dpW024756
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Possible bug with concurrent RAID syncs on the same
 underlying devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RGF2aWQgVGVpZ2xhbmQgPHRlaWdsYW5kQHJlZGhhdC5jb20+IGV6dCDDrXJ0YSAoaWTFkXBvbnQ6
IDIwMjEuIMOhcHIuCjEyLiwgSCwgMjA6NDcpOgo+Cj4gT24gU2F0LCBBcHIgMTAsIDIwMjEgYXQg
MDI6MzI6NTJBTSArMDIwMCwgUMOpdGVyIFPDoXJrw7Z6aSB3cm90ZToKPiA+IEFsdGhvdWdoIHRo
aXMgaXMganVzdCBkdWUgdG8gdGhlIGluc2FuZSBhbW91bnQgb2YgaW50ZWdyaXR5IGt3b3JrZXIK
PiA+IHByb2Nlc3NlcywgYW5kIHRoZSBzeXN0ZW0gaXMgcHJldHR5IHVzYWJsZSwgSSB0aGluayBp
dCB3b3VsZCBiZSBtdWNoCj4gPiBuaWNlciB0byBvbmx5IGhhdmUgMSBzeW5jIHJ1bm5pbmcgb24g
dGhlIHNhbWUgcGh5c2ljYWwgZGV2aWNlIGF0IGEKPiA+IHRpbWUuCj4KPiBDcmVhdGUgb25lIGF0
IGEgdGltZSwgd2FpdGluZyBmb3IgaW50ZWdyaXR5IGluaXQgdG8gZmluaXNoIGJldHdlZW4gdGhl
bQo+IChzeW5jX3BlcmNlbnQgMTAwIG9uIGVhY2ggaW50ZWdyaXR5IGltYWdlIHlvdSBzZWUgaW4g
bHZzIC1hLikKPiBJIGhhdmUgc29tZSBkb3VidCB0aGF0IHRoZSBlbmQgcmVzdWx0IHdpbGwgcGVy
Zm9ybSB3ZWxsIGVub3VnaCBnaXZlbiB0aGUKPiB3YXkgeW91J3JlIHVzaW5nIHRoZSBwYXJ0aXRp
b25zLgo+IERhdmUKPgoKVGhhdCdzIHdoYXQgSSdtIGRvaW5nIHJpZ2h0IG5vdywgaXQgd291bGQg
anVzdCBiZSBtdWNoIG1vcmUgY29udmVuaWVudAp0byBoYXZlIGl0IHNldCB1cCBvbmNlIGFuZCBs
ZXQgaXQgZmluaXNoIGV2ZXJ5dGhpbmcgd2l0aG91dAppbnRlcmFjdGlvbi4KClRoaXMgaXMganVz
dCBhIGhvbWUgc2VydmVyLCBzbyBwZXJmb3JtYW5jZSBpc24ndCBjcml0aWNhbCwgYnV0IEkgZG9u
J3QKc2VlIHdoeSB0aGlzIHdvdWxkIHBlcmZvcm0gc2lnbmlmaWNhbnRseSB3b3JzZSB0aGVuIGEg
d2hvbGUtZGlzayByYWlkLgpJJ20gcGxhbm5pbmcgdG8gdXNlIHRoZSByZXN1bHRpbmcgYXJyYXlz
IHVuZGVyIDEgZmlsZXN5c3RlbSB3aXRob3V0CnN0cmlwaW5nLiBTbyBhcyBsb25nIGFzIEknbSBm
aWxsaW5nIGl0IHVwIEkgd2lsbCBiZSBoaXR0aW5nIDEgYXJyYXkgYXQKYSB0aW1lLgoKQWZ0ZXIg
aXQncyBmaWxsZWQgdXAgZnJvbSB0aGUgYmFja3VwIGFuZCBJJ20gc3RhcnRpbmcgdG8gdXNlIGl0
IGFzIGEKcmVndWxhciBmaWxlc3lzdGVtLCBjb250aW51b3VzIHJlYWRzIG9yIHdyaXRlcyBzdGls
bCBnb25uYSBoaXQgMSBhcnJheQphdCBhIHRpbWUgbW9zdCBvZiB0aW1lIHNvIGl0IHNlZW1zIGxp
a2UgdGhlIHNhbWUgYW1vdW50IG9mIHNlZWsgYW5kL29yCnBhcml0eSBjYWxjdWxhdGlvbnMgYXMg
d2l0aCB3aG9sZSBkaXNrcy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0
dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQg
dGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8=

