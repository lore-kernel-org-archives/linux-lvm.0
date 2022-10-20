Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEEAC4332F
	for <linux-lvm@archiver.kernel.org>; Thu, 20 Oct 2022 18:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666289971;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c5a+mVqX4o3zmaU2W62Zom+iG2S5nJVrEgOHBPS9T+A=;
	b=Dl6UuaEBKri6QxVitjp6MpzowP2UfB1mk3OxhWeGsYJjbhKiogCPEQJxtG4kry9KgFyHDX
	es7yvlm+w/EqX74h5OoIG/j1azaiWxQmtcNN8nRJ1ptfjvje91D5YQZlF9SPU4xjzs7OoS
	Z4OuwmozRrx510tLpk9fJS08CX6HVho=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-MqfI1L7LOuujqZioYi4nEw-1; Thu, 20 Oct 2022 14:19:28 -0400
X-MC-Unique: MqfI1L7LOuujqZioYi4nEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08673858F17;
	Thu, 20 Oct 2022 18:19:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 587F02024CBB;
	Thu, 20 Oct 2022 18:19:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 145FD1946597;
	Thu, 20 Oct 2022 18:19:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 203CF1946587
 for <linux-lvm@listman.corp.redhat.com>; Thu, 20 Oct 2022 18:19:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EE3A34B4010; Thu, 20 Oct 2022 18:19:18 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E71374B400F
 for <linux-lvm@redhat.com>; Thu, 20 Oct 2022 18:19:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB30129AA39D
 for <linux-lvm@redhat.com>; Thu, 20 Oct 2022 18:19:18 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-sKxJZdUIN1-eYtLK8L1UMg-1; Thu, 20 Oct 2022 14:19:17 -0400
X-MC-Unique: sKxJZdUIN1-eYtLK8L1UMg-1
Received: by mail-ej1-f52.google.com with SMTP id sc25so1418818ejc.12
 for <linux-lvm@redhat.com>; Thu, 20 Oct 2022 11:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dJ0bboQSas8jT72bPsoNioyVwojGggMtsBRXNWNfzsE=;
 b=c8BvKdEdxkYTqRrtx3sTnq3UhhaQAjxNj4rbmj8GNXc6NxCrlPKA4W3JOVfiDmB1wJ
 5JhxM777DxS4pAyM+6SdSXd+NkogePhtoz1pT1OXeyWSUk4WY5od32ZZBXAuRVGIoAeW
 CTUxnDcFYYs/QthqlOkZEOLPDLNVzo8wjyQThAv0aNlgAm3ogMaZRolKlqOrON2ZqMSc
 35QBhzaq93DU0hMe/GZECQTF8nCMi6NtH8KnPuHbNIuZB0Lq83Vj6f7U2/M9eTL1mb2J
 vHLLPTMW+pdgm7WBQkLzOAR8eto1cMBG64sQw3frwemlgrVeSM9xJB560um6q6q4jRPB
 2XRA==
X-Gm-Message-State: ACrzQf39T4sC6XcIiHMcrHj10WoANRAoAoCycs8vdp1egX28PzazeBz+
 jDgomBbuXw3lnqBDT/a9wZZV3P7NgD4=
X-Google-Smtp-Source: AMsMyM7XEcMEIRuJD5hw4GhuoFs4vY3ZYROr41OyngoWEaGaOTjvKPgLbxcH0aLOJm6YOPUO+gVy6A==
X-Received: by 2002:a17:906:58c6:b0:78d:b37f:5ce5 with SMTP id
 e6-20020a17090658c600b0078db37f5ce5mr12126311ejs.707.1666289955418; 
 Thu, 20 Oct 2022 11:19:15 -0700 (PDT)
Received: from [192.168.0.177] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 y3-20020aa7c243000000b004611c230bd0sm558752edo.37.2022.10.20.11.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 11:19:14 -0700 (PDT)
Message-ID: <2e9e0093-d410-f875-58da-7561392abe44@gmail.com>
Date: Thu, 20 Oct 2022 20:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Erwin van Londen <erwin@erwinvanlonden.net>
References: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <91261aec-d0fd-7884-1f38-a575b4e540e2@gmail.com>
 <SI2P153MB0444EE48C7C6E92FB448262ED7249@SI2P153MB0444.APCP153.PROD.OUTLOOK.COM>
 <0e032336-8658-5686-3dfb-0e50cdcb7d91@gmail.com>
 <2cb2e4787c7b4c30b67ec0d171f5b1f3aa9a9f71.camel@erwinvanlonden.net>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <2cb2e4787c7b4c30b67ec0d171f5b1f3aa9a9f71.camel@erwinvanlonden.net>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [linux-lvm] [EXTERNAL] Re: LVM2 : performance drop even after
 deleting the snapshot
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDE3LiAxMC4gMjIgdiAxNTo0MSBFcndpbiB2YW4gTG9uZGVuIG5hcHNhbChhKToKPiAgRnJv
bSB0aGUgbG9va3Mgb2YgaXQgdGhlIGRpc2ssIGFzIHByb3Zpc2lvbmVkIG91dCBvZiBhbiBBenVy
ZSBwb29sLCBpcyBsaWtlbHkgCj4gYmFja2VkIGJ5IGFuIGVudGVycHJpc2UgcmFpZCBhcnJheS4g
V2hlbiB5b3UgcHJvdmlzaW9uIHRoZSBwb29scyB3aXRoIAo+ICDCoGRpc2NhcmRfcGFzc2Rvd24g
dGhlIHJlbW92YWwgb2YgdGhlIHNuYXBzaG90IHdpbGwgYWxzbyBiZSBwdXNoZWQgZG93biB0byB0
aGUgCj4gdW5kZXJseWluZyBoeXBlcnZpc29yIG9yIGRpc2sgYXJyYXkuIFlvdSB3b3VsZCBuZWVk
IHRvIHdhaXQgdGlsbCB0aGF0IHByb2Nlc3MgCj4gaXMgY29tcGxldGVkIGluIG9yZGVyIHRvIG1h
a2UgYW55IGNvbXBhcmlzb25zLgo+IAo+IFRoaW5Wb2xHcnAtVGhpbkRhdGFMVi10cG9vbDogMCAx
MDA2NjMyOTYwIHRoaW4tcG9vbCAxIDQ4NzgvNDE0NTE1MiAKPiA4MzI1Lzc4NjQzMjAgLSBydyBk
aXNjYXJkX3Bhc3Nkb3duIHF1ZXVlX2lmX25vX3NwYWNlIC0gMTAyNAo+IAo+IEFzIHBlciBtYW4g
cGFnZQo+IAo+IC0tZGlzY2FyZHMgcGFzc2Rvd258bm9wYXNzZG93bnxpZ25vcmUKPiBTcGVjaWZp
ZXMgaG93IHRoZSBkZXZpY2UtbWFwcGVyIHRoaW4gcG9vbCBsYXllciBpbiB0aGUga2VybmVsIHNo
b3VsZCBoYW5kbGUgCj4gZGlzY2FyZHMuIGlnbm9yZSBjYXVzZXMgdGhlIHRoaW4gcG9vbCB0byBp
Z25vcmUgZGlzY2FyZHMuIG5vcGFzc2Rvd24gY2F1c2VzIHRoZQo+IHRoaW4gcG9vbCB0byBwcm9j
ZXNzIGRpc2NhcmRzIGl0c2VsZiB0byBhbGxvdyByZXVzZSBvZiB1bm5lZWRlZCBleHRlbnRzIGlu
IHRoZSAKPiB0aGluIHBvb2wuIHBhc3Nkb3duIGNhdXNlcyB0aGUgdGhpbiBwb29sIHRvIHByb2Nl
c3MgZGlzY2FyZHMgaXRzZWxmIChsaWtlCj4gbm9wYXNzZG93bikgYW5kIHBhc3MgdGhlIGRpc2Nh
cmRzIHRvIHRoZSB1bmRlcmx5aW5nIGRldmljZS4KPiAKPiBUcnkgdGhlIHNhbWUgb3BlcmF0aW9u
IGFmdGVyIGNoYW5naW5nIHRoZSB0aGluIHZvbHVtZQo+IAo+IGx2Y2hhbmdlIC0tZGlzY2FyZHMg
bm9wYXNzZG93biBWRy9UaGluUG9vbExWCgpEaXNjYXJkIGhlcmUgaXMgbGlrZWx5IGlycmVsZXZh
bnQgLSBzaW5jZSB0aGVyZSB3aWxsIGxpa2VseSBubyBibG9ja3MgZm9yIApkaXNjYXJkaW5nLgoK
V2hlbiB0aGUgdXNlciByZW1vdmVzIHRoaW4gTFYgICh3aGljaCBoYXBwZW5zIHRvIGJlIHNoYXJp
bmcgaXRzIGJsb2NrIHdpdGggCnNvbWUgb3RoZXIgdGhpbiBMViAgKG9yaWdpbiAtPiBzbmFwc2hv
dCkpIHRoZXJlIGlzIGp1c3Qgc29tZSBtZXRhZGF0YSB1cGRhdGUgCnJlZHVjaW5nIHNoYXJpbmcg
b2YgYmxvY2tzIHdpdGggb3JpZ2luIHRoaW5MViAtIHNvIG5vdGhpbmcgdG8gYmUgZGlzY2FyZCBm
b3IgCmRhdGEgKHNpbmNlIHNuYXBzaG90IGlzIHJlbW92ZWQgYWZ0ZXIgaXRzIGNyZWF0aW9uIHdp
dGhvdXQgYW55IHVzZSAtIG9ubHkgaWYgCnRoZSBvcmlnaW4gd291bGQgYmUgbWVhbndoaWxlIGlu
IHRoaXMgc2hvcnQgcGVyaW9kIG9mIHRpbWUgY2hhbmdlZCAKZHJhbWF0aWNhbGx5IC0gdGhlbiBl
eGNsdXNpdmVseSBvd25lZCBwYXJ0cyBvZiBzdWNoIHNuYXBzaG90IG1heSBiZSBkaXNjYXJkZWQp
CgpSZWdhcmRzCgpaZGVuZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0
cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0
aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

