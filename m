Return-Path: <SRS0=W8c5=HE=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96689C433E0
	for <linux-lvm@archiver.kernel.org>; Tue,  2 Feb 2021 04:14:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D37A64E95
	for <linux-lvm@archiver.kernel.org>; Tue,  2 Feb 2021 04:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D37A64E95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-GTZsQlfGNum4KyBLCLs1Tw-1; Mon, 01 Feb 2021 23:13:58 -0500
X-MC-Unique: GTZsQlfGNum4KyBLCLs1Tw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDA9918C43CD;
	Tue,  2 Feb 2021 04:13:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A014210013BD;
	Tue,  2 Feb 2021 04:13:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20E9E180954D;
	Tue,  2 Feb 2021 04:13:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1124DTtR028312 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 1 Feb 2021 23:13:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C363880547; Tue,  2 Feb 2021 04:13:29 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE4DF80549
	for <linux-lvm@redhat.com>; Tue,  2 Feb 2021 04:13:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B0EA801223
	for <linux-lvm@redhat.com>; Tue,  2 Feb 2021 04:13:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-494-QBPQ-nOqMCC_Jirkn10lAA-1; Mon, 01 Feb 2021 23:13:25 -0500
X-MC-Unique: QBPQ-nOqMCC_Jirkn10lAA-1
Received: by mail-pl1-f175.google.com with SMTP id e12so2516976pls.4
	for <linux-lvm@redhat.com>; Mon, 01 Feb 2021 20:13:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:reply-to:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Iym3/rGDza0s7V+hdoxOGp0MH9ropAA50WMNEwzBLzU=;
	b=KOs4TzUgWJI7aYSlYMkrPqNo2e+66OzCaHDnzD8QrpChu/V7CWNmcLzAEf68gWubHa
	uFqys0rJHDE3M/9023ivu3JBV5rALsdFy3zYPr0qmmJTrKyspztVfFe/Kr2gS4Ghsf9L
	yLr/lLdSVW4QBk4CFwf8PfTvmo5XfKGkAFWnzORqI2vVAgKyu/Hq9RfXzg+K/99s95B5
	PpRKQq/9xSb9BPa33LsoN1NsJYmed/iHeRnFMK8ZRK/TDaDkBuR2ylOG3RyC9dXSFdMm
	C2m/gKhWZCS7Ga54Rw1t2cyeKyo387XEqZcER32OOgc/VB3g88cZbvOhXseFU8Qnw+9Y
	6Oxw==
X-Gm-Message-State: AOAM533/yOjyZHPQDCG9/EpYaWJ41dBFr/GNdZG3LewrWGn5Mtnwqnx+
	mSQ2AWfjI5y4Jjqd28x1o5B8g+IVcFoMUQ==
X-Google-Smtp-Source: ABdhPJzgH7JL9kkn7jIpxCembLDlRIdjc429EMrg56fZw8Cx8Z3HR4hCtANG/PjC7haUcSobVix//g==
X-Received: by 2002:a17:902:eccf:b029:de:72a2:f1f8 with SMTP id
	a15-20020a170902eccfb02900de72a2f1f8mr21052610plh.17.1612239203609;
	Mon, 01 Feb 2021 20:13:23 -0800 (PST)
Received: from [192.168.1.2] (75-164-166-38.ptld.qwest.net. [75.164.166.38])
	by smtp.googlemail.com with ESMTPSA id
	x26sm20372628pfi.176.2021.02.01.20.13.22
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 01 Feb 2021 20:13:22 -0800 (PST)
To: John Stoffel <john@stoffel.org>,
	LVM general discussion and development <linux-lvm@redhat.com>
References: <cb4d46f7-2c0c-330d-51bf-48c3b706b2d2@gmail.com>
	<24599.16785.592980.828790@quad.stoffel.home>
From: "John L. Poole" <jlpoole56@gmail.com>
Message-ID: <a3c43bd8-391b-cc7f-0ead-2e29dad11b3d@gmail.com>
Date: Mon, 1 Feb 2021 20:13:18 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <24599.16785.592980.828790@quad.stoffel.home>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] 2.03 Volume readable by 2.02?
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: jlpoole56@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

VGhhbmsgeW91LCBKb2huIFN0b2ZmZWwsIGZvciB5b3VyIGtpbmQgb2ZmZXIgdG8gaGVscC7CoCBJ
IGFtIGZhY2VkCndpdGggc2V2ZXJhbCBhbHRlcm5hdGl2ZXMgYXQgdGhpcyBqdW5jdHVyZSBhbmQg
ZmVlbCB0aGF0IGVubGlzdGluZwpnZW5lcmFsIGhlbHAgd291bGQgYmUgY291bnRlci1wcm9kdWN0
aXZlLsKgIEkgZG9uJ3Qgd2FudCB5b3UgdG8Kc3BlbmQgeW91ciB0aW1lIG9uIGFuIGFwcHJvYWNo
IG9ubHkgdG8gaGF2ZSBtZSBjaGFuZ2UgdGhlIHdob2xlIHBhcmFkaWdtLAppLmUuIGluc3RhbGxp
bmcgR2VudG9vIGFzIERvbTAgKGFuZCB3cmVzdGxpbmcgd2llaCBFVUZJKSBzbyB0aGVyZSBpcwpu
byBkaXNwYXJpdHkgYmV0d2VlbiBsdm0gdmVyc2lvbnMuwqAgSSd2ZSBpbnZlc3RlZCBzZXZlcmFs
IGhvdXJzCmJ1aWxkaW5nIG91dCBteSBndWVzdCBHZW50b28sIHNvIEkgaGF0ZSB0byByaXNrIGhh
dmluZyB0byBkbyBpdApvdmVyIGFnYWluLCBvciB0cnlpbmcgdG8gYXJjaGl2ZSBhbmQgY29weSBp
dCB0byBhbiBhdHRhY2hlZCBkcml2ZSBhbmQgdGhlbgpiYWNrIGludG8gYSBwYXJ0aXRpb24gdXNp
bmcgZmRpc2sgb3IgcGFydGVkLgoKSSBhc2tlZCB0aGUgcXVlc3Rpb24gYmVsb3cgaG9waW5nIGEg
ZGV2ZWxvcGVyIGZhbWlsaWFyIHdpdGggdGhlIApzcGVjaWZpY2F0aW9ucwpvZiB0aGUgbWFwcGlu
ZyBzY2hlbWEgZm9yIGx2bSBtaWdodCBhbnN3ZXIuwqAgQXJlIHlvdSBvbmUgb2YgdGhlCmRldmVs
b3BlcnMgYXQgUmVkaGF0PwoKU2luY2UgSSBwb3N0ZWQsIEkgY2hhbmdlZCBteSBjbGllbnQncyBs
dm0gdG8gMi4wLjMuwqAgVGhpcyB1cGdyYWRlCmFuZCBuZWFyIG1hdGNoIHRvIHRoZSBob3N0ICgi
RG9tMCIpIHZlcnNpb24gb3VnaHQgdG8gbmVnYXRlIGFueQpkaXNwYXJpdHkgaXNzdWVzIGJldHdl
ZW4gdmVyc2lvbnMgLS0gSSB3b3VsZCBob3BlLgoKRXZlbiB3aXRoIG15IEdlbnRvbyBjbGllbnQg
aGF2aW5nIDIuMC4zIHRyeWluZyB0byBkaXNjb3ZlciB0aGUKbHZtIHNoYXJlcyBjcmVhdGVkIGJ5
IHRoZSBEZWJpYW4gaG9zdCBpcyBmYWlsaW5nIGF0IHRoZSBzdGFydApvZiB0aGUga2VybmVsLsKg
IEkgdGhpbmsgbXkgcHJvYmxlbSBpcyB0aGUgaW5pdHJhbWZzIGlzIG5vdApwcm9wZXJseSBtYXBw
aW5nIHRvIHRoZSBsdm0gc3lzdGVtLsKgIFRoaXMgbWF5IGJlIGEgWGVuIGlzc3VlIG9yCnNvbWV0
aGluZyBtaXNzaW5nIGluIG15IGd1ZXN0IGtlcm5lbCBhbmQvb3IgaW5pdHJhbWZzLgoKVGhlIHF1
ZXN0aW9uIEkgcG9zZWQ6CgogwqDCoCBzaG91bGQgdG9vbHMgb2YgbHZtIHYuIDIuMDIuMTg3IGJl
IGFibGUgdG8gcmVhZCBhbmQgYWNjZXNzCiDCoMKgIGEgdm9sdW1lIGNyZWF0ZWQgYnkgMi4wMy4w
Mj8KCnJhaXNlcyB0aGUgcXVlc3Rpb24gb2Ygd2hldGhlciBhIHByZXZpb3VzIHZlcnNpb24gYXQg
Mi4wMiBjYW4KcmVhZCBhIG1hcHBlZCBzeXN0ZW0gY3JlYXRlZCBieSBhIHZlcnNpb24gYXQgMi4w
My7CoCBBbiBhbnN3ZXIKY291bGQgYmUgaGVscGZ1bCBmb3Igb3RoZXJzIHdvcmtpbmcgd2l0aCBW
aXJ0dWFsIE1hY2hpbmVzIHNvIEkKaG9wZSBzb21lb25lIHdobyBtaWdodCBrbm93IHRoZSBhbnN3
ZXJzIHJlc3BvbmRzLgoKS2luZCByZWdhcmRzLAoKSm9obiBQb29sZQoKCkkgY291bGQgbm90IGZp
bmQgYSBkZXNjcmlwdGlvbiBvZiBwb3N0aW5nIGV0aXF1ZXR0ZSBmb3IgdGhpcyBmb3J1bS4KCk9u
IDEvMzEvMjAyMSAzOjQ3IFBNLCBKb2huIFN0b2ZmZWwgd3JvdGU6Cj4+Pj4+PiAiSm9obiIgPT0g
Sm9obiBMIFBvb2xlIDxqbHBvb2xlNTZAZ21haWwuY29tPiB3cml0ZXM6Cj4gSm9obj4gSSBhbSBo
YXZpbmcgcHJvYmxlbXMgd2l0aCBhIGtlcm5lbCBhbmQvb3IgaW5pdGlhbCByYW0gZmlsZQo+IEpv
aG4+IHN5c3RlbSBib290aW5nIHVwIGluIGEgWGVuIGVudmlyb25tZW50Lgo+Cj4gRG8geW91IGhh
dmUgYW55IGxvZ3Mgb2YgdGhlIGVycm9yKHMpIHdoZW4gYm9vdGluZyB1cD8KPgo+IENhbiB5b3Ug
c2hvdyB1cyB0aGUgY29uZmlndXJhdGlvbiBvZiB5b3VyIFhlbiBndWVzdCBhbmQgaXQncyBMVk0K
PiB2b2x1bWVzLCBWRyBhbmQgUFZzIGFzIHdlbGw/ICBUaGUgbW9yZSBkZXRhaWxzIHRoZSBiZXR0
ZXIuCj4KPiBJIHBlcnNvbmFsbHkgZG9uJ3QgZG8gR2VudG9vIG9yIFhlbiwgc28gSSBjYW4ndCBo
ZWxwIHRoZXJlLiAgQnV0IEkgY2FuCj4gYXNrIHlvdSB0byBwb3N0IG1vcmUgZGV0YWlscy4gIEEg
Ym9vdCBsb2cgd291bGQgYmUgdmVyeSBoZWxwZnVsLgo+Cj4KPiBKb2huPiBUaGUgZ3Vlc3Qgdmly
dHVhbCBtYWNoaW5lJ3Mgcm9vdCBmaWxlIHN5c3RlbSBpcyBvbiBhbiBsdm0gdm9sdW1lIGNyZWF0
ZWQKPiBKb2huPiBpbiBEZWJpYW4uwqAgRG9tMCBpcyBEZWJpYW4uCj4gSm9obj4gbHZtIG9uIERl
YmlhbiBpczogMi4wMy4wMigyKS4KPgo+IEpvaG4+IFRoZSBndWVzdCB2aXJ0dWFsIG1hY2hpbmUg
aXMgaW4gR2VudG9vIGFuZCBJIGhhdmUgbHZtwqAgMi4wMi4xODctcjIKPiBKb2huPiBpbnN0YWxs
ZWQgdGhlcmVpbi7CoCBJIGJ1aWx0IG15Cj4gSm9obj4ga2VybmVsIGFuZCBpbml0cmFtZnMgYWdh
aW5zdCB0aGUgMi4wMiB2ZXJzaW9uIG9mIGx2bS4KPgo+IEpvaG4+IE15IHF1ZXN0aW9uOiBzaG91
bGQgdG9vbHMgb2YgbHZtIHYuIDIuMDIuMTg3IGJlIGFibGUgdG8gcmVhZCBhbmQgYWNjZXNzCj4g
Sm9obj4gYSB2b2x1bWUgY3JlYXRlZCBieSAyLjAzLjAyPwo+Cj4gSm9obj4gRG9lcyB0aGUgdmVy
c2lvbiBjaGFuZ2UgYmV0d2VlbiAyLjAyIGFuZCAyLjAzIG1lYW4gdGhhdCB0aGUgZmlsZSBzeXN0
ZW0KPiBKb2huPiBjcmVhdGVkIGJ5IDIuMDMgdG9vbHMKPiBKb2huPiBtYXkgbm90IGJlIHJlYWRh
YmxlIG9yIGFjY2Vzc2libGUgYnkgMi4wMiB0b29scyBhbmQgbGlicmFyaWVzP8KgIEknbQo+IEpv
aG4+IGRvdWJ0aW5nIGl0LCBidXQgYXNraW5nLgo+Cj4gSm9obj4gR2VudG9vJ3MgaGlnaGVzdCB2
ZXJzaW9uIG9mIGx2bSBpcyAyLjAyLjE4Ny1yMjsgR2VudG9vIGRldmVsb3BlcnMgaGF2ZQo+IEpv
aG4+IGx2bSAyLjAzIG1hc2tlZCB3aXRoIHRoZSBub3RlOgo+Cj4gSm9obj4gIMKgwqDCoMKgIFsy
LjAzXSBOZWVkcyBMT1RTIG9mIHRlc3RpbmcsIGJyb2tlIGJvb3Qgb24gbXkgbGFwdG9wCj4gSm9o
bj4gIMKgwqDCoMKgIGluIGVhcmx5IGF0dGVtcHRzLCBtYXliZSBuZWVkcyBtYXRjaGluZyBnZW5r
ZXJuZWwgd29yaz8KPgo+IEpvaG4+IHNvdXJjZTogaHR0cHM6Ly9wYWNrYWdlcy5nZW50b28ub3Jn
L3BhY2thZ2VzL3N5cy1mcy9sdm0yCj4KPiBKb2huPiBUaGFuayB5b3UsCj4KPiBKb2huPiBKb2hu
IFBvb2xlCj4KPiBKb2huPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IEpvaG4+IGxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKPiBKb2huPiBsaW51eC1sdm1A
cmVkaGF0LmNvbQo+IEpvaG4+IGh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1sdm0KPiBKb2huPiByZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9y
Zy9IT1dUTy9MVk0tSE9XVE8vCi0tIApFbWFpbCBSaWRlcgoKSm9obiBMYXVyZW5jZSBQb29sZQox
NTY2IENvdXJ0IFNUIE5FClNhbGVtIE9SIDk3MzAxLTQyNDEKNzA3LTgxMi0xMzIzIG9mZmljZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZt
IG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDov
L3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8=

