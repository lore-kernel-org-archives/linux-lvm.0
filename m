Return-Path: <SRS0=ABhf=HB=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C267C433E0
	for <linux-lvm@archiver.kernel.org>; Sat, 30 Jan 2021 16:15:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B899064E08
	for <linux-lvm@archiver.kernel.org>; Sat, 30 Jan 2021 16:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B899064E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-1c-9chj_NtKul-HFWWZ7SQ-1; Sat, 30 Jan 2021 11:15:47 -0500
X-MC-Unique: 1c-9chj_NtKul-HFWWZ7SQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 186FB107ACE3;
	Sat, 30 Jan 2021 16:15:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 913195D9CC;
	Sat, 30 Jan 2021 16:15:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B00F180954D;
	Sat, 30 Jan 2021 16:15:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10UGFDKl016483 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 30 Jan 2021 11:15:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9F8B8DAF18; Sat, 30 Jan 2021 16:15:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A8EEDA699
	for <linux-lvm@redhat.com>; Sat, 30 Jan 2021 16:15:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE2FB101A531
	for <linux-lvm@redhat.com>; Sat, 30 Jan 2021 16:15:10 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-343-u3TsKJ1mOzy2PoofDjU7uA-1; Sat, 30 Jan 2021 11:15:08 -0500
X-MC-Unique: u3TsKJ1mOzy2PoofDjU7uA-1
Received: by mail-pj1-f41.google.com with SMTP id p15so7375848pjv.3
	for <linux-lvm@redhat.com>; Sat, 30 Jan 2021 08:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:reply-to:from:subject:message-id:date
	:user-agent:mime-version:content-transfer-encoding:content-language;
	bh=Wp7sISddE4DEkI9+PWPfbwWdULWY4GZ4tXu5LUtcnZ0=;
	b=VRcobpacykFJNr4uyh88BA79HF2behnpMk8fyH6R9CSmYn40yM8+eNZRXGAUeEYvOD
	SOWL+OZHSw+9D9mi9bp1+HjfkLotDwwesHiqxfxsH8z+RRNAIMBX9xP+gkt0SjpvRP0Z
	eMbuIFmdvGol09iHEiNDcJrQFgXR1kQ4IOXte4J1NXl0txJVNVpMJyWzHb/TGRZBPjY7
	Y7GpNFrJUEt0L2ffizem7k2IS8xj4ZWpghVD8tA4zvmS8zSXdnv61X61ctmgKngMXZt8
	el+CPEsMZVRIPkNd4Ai8X0D+P7p3iq6m3ipwP0gjKECM7rjNZ5d2FJAY1W1HUpPUi5za
	nn5g==
X-Gm-Message-State: AOAM532NzMRuuip5r2+Ggi8fNL2XKY1JvNnMuvdYxUDO6DE/9ue0UZk0
	7iEKBno0bYSg/HlGvdh7OPHuhIw1C7o=
X-Google-Smtp-Source: ABdhPJx6fB7vEqFSVB9feh4V42a2HJwW4ivTwxuB5Ll1DZhPZMkreeECXDmUVMwtsDlX0C1chLYKSw==
X-Received: by 2002:a17:902:eb04:b029:e1:4ad:64da with SMTP id
	l4-20020a170902eb04b02900e104ad64damr10406993plb.73.1612023306838;
	Sat, 30 Jan 2021 08:15:06 -0800 (PST)
Received: from [192.168.1.2] (75-164-166-38.ptld.qwest.net. [75.164.166.38])
	by smtp.googlemail.com with ESMTPSA id
	u31sm12831184pgl.9.2021.01.30.08.15.06 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 30 Jan 2021 08:15:06 -0800 (PST)
To: linux-lvm@redhat.com
From: "John L. Poole" <jlpoole56@gmail.com>
Message-ID: <cb4d46f7-2c0c-330d-51bf-48c3b706b2d2@gmail.com>
Date: Sat, 30 Jan 2021 08:14:27 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.1
MIME-Version: 1.0
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
Subject: [linux-lvm] 2.03 Volume readable by 2.02?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SSBhbSBoYXZpbmcgcHJvYmxlbXMgd2l0aCBhIGtlcm5lbCBhbmQvb3IgaW5pdGlhbCByYW0gZmls
ZSBzeXN0ZW0gCmJvb3RpbmcgdXAgaW4gYSBYZW4gZW52aXJvbm1lbnQuCgpUaGUgZ3Vlc3Qgdmly
dHVhbCBtYWNoaW5lJ3Mgcm9vdCBmaWxlIHN5c3RlbSBpcyBvbiBhbiBsdm0gdm9sdW1lIGNyZWF0
ZWQgCmluIERlYmlhbi7CoCBEb20wIGlzIERlYmlhbi4KbHZtIG9uIERlYmlhbiBpczogMi4wMy4w
MigyKS4KClRoZSBndWVzdCB2aXJ0dWFsIG1hY2hpbmUgaXMgaW4gR2VudG9vIGFuZCBJIGhhdmUg
bHZtwqAgMi4wMi4xODctcjIgCmluc3RhbGxlZCB0aGVyZWluLsKgIEkgYnVpbHQgbXkKa2VybmVs
IGFuZCBpbml0cmFtZnMgYWdhaW5zdCB0aGUgMi4wMiB2ZXJzaW9uIG9mIGx2bS4KCk15IHF1ZXN0
aW9uOiBzaG91bGQgdG9vbHMgb2YgbHZtIHYuIDIuMDIuMTg3IGJlIGFibGUgdG8gcmVhZCBhbmQg
YWNjZXNzIAphIHZvbHVtZSBjcmVhdGVkIGJ5IDIuMDMuMDI/CgpEb2VzIHRoZSB2ZXJzaW9uIGNo
YW5nZSBiZXR3ZWVuIDIuMDIgYW5kIDIuMDMgbWVhbiB0aGF0IHRoZSBmaWxlIHN5c3RlbSAKY3Jl
YXRlZCBieSAyLjAzIHRvb2xzCm1heSBub3QgYmUgcmVhZGFibGUgb3IgYWNjZXNzaWJsZSBieSAy
LjAyIHRvb2xzIGFuZCBsaWJyYXJpZXM/wqAgSSdtIApkb3VidGluZyBpdCwgYnV0IGFza2luZy4K
CkdlbnRvbydzIGhpZ2hlc3QgdmVyc2lvbiBvZiBsdm0gaXMgMi4wMi4xODctcjI7IEdlbnRvbyBk
ZXZlbG9wZXJzIGhhdmUgCmx2bSAyLjAzIG1hc2tlZCB3aXRoIHRoZSBub3RlOgoKIMKgwqDCoMKg
IFsyLjAzXSBOZWVkcyBMT1RTIG9mIHRlc3RpbmcsIGJyb2tlIGJvb3Qgb24gbXkgbGFwdG9wCiDC
oMKgwqDCoCBpbiBlYXJseSBhdHRlbXB0cywgbWF5YmUgbmVlZHMgbWF0Y2hpbmcgZ2Vua2VybmVs
IHdvcms/Cgpzb3VyY2U6IGh0dHBzOi8vcGFja2FnZXMuZ2VudG9vLm9yZy9wYWNrYWdlcy9zeXMt
ZnMvbHZtMgoKVGhhbmsgeW91LAoKSm9obiBQb29sZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1A
cmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
bHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dU
Ty8=

