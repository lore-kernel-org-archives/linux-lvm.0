Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E24C433EF
	for <linux-lvm@archiver.kernel.org>; Sun, 30 Jan 2022 17:57:10 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-8-pY3u1eMym0yyLweQdXWQ-1; Sun, 30 Jan 2022 12:57:05 -0500
X-MC-Unique: 8-pY3u1eMym0yyLweQdXWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A8511006AA0;
	Sun, 30 Jan 2022 17:57:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B14E7A3F9;
	Sun, 30 Jan 2022 17:56:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E13D24BB7C;
	Sun, 30 Jan 2022 17:56:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20UHumJl021176 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 30 Jan 2022 12:56:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1D589401E2D; Sun, 30 Jan 2022 17:56:48 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1947A401E2C
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 17:56:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF7692B699E1
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 17:56:47 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-133-fZykvcMuN56BZiY1SwyXRg-1; Sun, 30 Jan 2022 12:56:46 -0500
X-MC-Unique: fZykvcMuN56BZiY1SwyXRg-1
Received: by mail-ed1-f41.google.com with SMTP id b13so22543498edn.0
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 09:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=dbq1OTCJuTI8dzGgy726aFW/UoVRGRo8pc4sNOo/3TE=;
	b=XchRk9SeS0EuyiymCDBF4QBr/qlKomfwKhgWTh3/ebwZP/SrFOljJB28m2DZHLYXzu
	61SbPCuQkeWtHOKKwgCzDvtkW4s5GCrIrYNcqvT+EHpGYb0hzaymGCWFYSMCySHh9AnB
	71wTsFA5DatIz+WgKOolk+OZZNF9PVov+rSin9P6wGne/Zc0/RfM1YlNgVspIIRT7G5I
	V4byv9zdnGrCYIyspitrQvvQnuA1MNz/zzxt/hOP6/xvaDEXPcqfchmVI+oUiL61n8fW
	mW2x1KSE2Qh9tvOgIW3xgD8PEjCv8x30WLoG63/Wq9HbTgAYYMwb+j813DZIxAeFsT2E
	YMsQ==
X-Gm-Message-State: AOAM533hwrBZHFWh5ScrHdKFqjILwq+OXCxr23V5eyaIkwqiZ9fiGHgo
	YUMTYanCEeuYcALcalMQmEhnBLmQpPdKtQ==
X-Google-Smtp-Source: ABdhPJytL06Cf5llVAzQ+a4g55ofq1SKXDK+fiR0O5oN32FTP88bXk6drhdjVoTUrxmdUQf6BljuLA==
X-Received: by 2002:a05:6402:5147:: with SMTP id
	n7mr17338629edd.2.1643565404876; 
	Sun, 30 Jan 2022 09:56:44 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id
	d6sm14148872eds.25.2022.01.30.09.56.44
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 30 Jan 2022 09:56:44 -0800 (PST)
Message-ID: <57a77ded-703d-d8a6-a919-2a68ba4cf97f@gmail.com>
Date: Sun, 30 Jan 2022 18:56:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.4.0
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YfWM+8w1TonBXNsP@itl-email>
	<9156ffae-650d-198d-5c7a-32f84dbcb332@gmail.com>
	<YfWfAAGK8L1iy7LU@itl-email>
	<83468eda-6697-5f15-d949-e23611cded84@gmail.com>
	<YfXoBour6CGZt9NH@itl-email>
	<b66e90ec-28ed-3962-ac99-69f8e1b01936@gmail.com>
	<YfbLMQ7a6D479vz6@itl-email>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <YfbLMQ7a6D479vz6@itl-email>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Running thin_trim before activating a thin pool
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

RG5lIDMwLiAwMS4gMjIgdiAxODozMCBEZW1pIE1hcmllIE9iZW5vdXIgbmFwc2FsKGEpOgo+IE9u
IFN1biwgSmFuIDMwLCAyMDIyIGF0IDEyOjE4OjMyUE0gKzAxMDAsIFpkZW5layBLYWJlbGFjIHdy
b3RlOgo+PiBEbmUgMzAuIDAxLiAyMiB2IDI6MjAgRGVtaSBNYXJpZSBPYmVub3VyIG5hcHNhbChh
KToKPj4+IE9uIFNhdCwgSmFuIDI5LCAyMDIyIGF0IDEwOjQwOjM0UE0gKzAxMDAsIFpkZW5layBL
YWJlbGFjIHdyb3RlOgo+Pj4+IERuZSAyOS4gMDEuIDIyIHYgMjE6MDkgRGVtaSBNYXJpZSBPYmVu
b3VyIG5hcHNhbChhKToKPj4+Pj4gT24gU2F0LCBKYW4gMjksIDIwMjIgYXQgMDg6NDI6MjFQTSAr
MDEwMCwgWmRlbmVrIEthYmVsYWMgd3JvdGU6Cj4+Pj4+PiBEbmUgMjkuIDAxLiAyMiB2IDE5OjUy
IERlbWkgTWFyaWUgT2Jlbm91ciBuYXBzYWwoYSk6Cgo+PiBEaXNjYXJkIG9mIHRoaW5zIGl0c2Vs
ZiBpcyBBRkFJQyBwcmV0dHkgZmFzdCAtIHVubGVzcyB5b3UgaGF2ZSBtYXNzaXZlbHkKPj4gc2l6
ZWQgdGhpbiBkZXZpY2VzIHdpdGggbWFueSBHaUIgb2YgbWV0YWRhdGEgLSBvYnZpb3VzbHkgeW91
IGNhbm5vdCBwcm9jZXNzCj4+IHRoaXMgYW1vdW50IG9mIG1ldGFkYXRhIGluIG5hbm9zZWNvbmRz
IChhbmQgdGhlcmUgYXJlIHByZXBhcmVkIGtlcm5lbAo+PiBwYXRjaGVzIHRvIG1ha2UgaXQgZXZl
biBmYXN0ZXIpCj4gCj4gV291bGQgeW91IGJlIHdpbGxpbmcgYW5kIGFibGUgdG8gc2hhcmUgdGhv
c2UgcGF0Y2hlcz8KClRoZW4gYXJlIGFsd2F5cyBsYW5kaW5nIGluIHVwc3RyZWFtIGtlcm5lbCBv
bmNlIHRoZXkgYXJlIGFsbCB2YWxpZGF0ZWQgJiAKdGVzdGVkIChyZWNlbnQga2VybmVsIGFscmVh
ZHkgaGFzIG1hbnkgc3BlZWQgZW5oYW5jZW1lbnRzKS4KCj4gCj4+IFdoYXQgaXMgdGhlIHByb2Js
ZW0gaXMgdGhlIHNwZWVkIG9mIGRpc2NhcmQgb2YgcGh5c2ljYWwgZGV2aWNlcy4KPj4gWW91IGNv
dWxkIGFjdHVhbGx5IHRyeSB0byBmZWVsIGRpZmZlcmVuY2Ugd2l0aDoKPj4gbHZjaGFuZ2UgLS1k
aXNjYXJkcyBwYXNzZG93bnxub3Bhc3Nkb3duIHRoaW5wb29sCj4gCj4gSW4gUXViZXMgT1MgSSBi
ZWxpZXZlIHdlIGRvIG5lZWQgdGhlIGRpc2NhcmRzIHRvIGJlIHBhc3NlZCBkb3duCj4gZXZlbnR1
YWxseSwgYnV0IEkgZG91YnQgaXQgbmVlZHMgdG8gYmUgc3luY2hyb25vdXMuICBCZWluZyBhYmxl
IHRvIHJ1bgo+IHRoZSBlcXVpdmFsZW50IG9mIGBmc3RyaW0gLWF2YCBwZXJpb2RpY2FsbHkgd291
bGQgYmUgYW1hemluZy4gIEnigJltCj4gQ0PigJlpbmcgTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpIChRdWJlcyBPUyBwcm9qZWN0IGxlYWQpIGluIGNhc2UgaGUKPiBoYXMgc29tZXRoaW5nIHRv
IHNheS4KCllvdSBjb3VsZCBlYXNpbHkgcnVuIGluIHBhcmFsbGVsIGluZGl2aWR1YWwgYmxrZGlz
Y2FyZHMgZm9yIHlvdXIgdGhpbiBMVnMuLi4uCkZvciBtb3N0IG1vZGVybiBkcml2ZXMgdGhvdWdo
dCBpdCdzIHNvbWV3aGF0IHdhc3RlIG9mIHRpbWUuLi4KClRob3NlIHRyaW1taW5nIHRvb2xzIHNo
b3VsZCBiZSB1c2VkIHdoZW4gdGhleSBhcmUgc29sdmluZyBzb21lIHJlYWwgcHJvYmxlbXMsIApy
dW5uaW5nIHRoZW0ganVzdCBmb3IgZnVuIGlzIGp1c3QgZW5lcmd5ICYgcGVyZm9ybWFuY2Ugd2Fz
dGUuLi4uCgo+IAo+PiBBbHNvIGl0J3MgdmVyeSBpbXBvcnRhbnQgdG8ga2VlcCBtZXRhZGF0YSBv
biBmYXN0IHN0b3JhZ2UgZGV2aWNlIChTU0QvTlZNZSkhCj4+IEtlZXBpbmcgbWV0YWRhdGEgb24g
c2FtZSBoZGQgc3BpbmRsZSBhcyBkYXRhIGlzIGFsd2F5cyBnb2luZyB0byBmZWVsIHNsb3cKPj4g
KGluIGZhY3QgaXQncyBxdWl0ZSBwb2ludGxlc3MgdG8gdGFsayBhYm91dCBwZXJmb3JtYW5jZSBh
bmQgdXNlIGhkZC4uLikKPiAKPiBUaGF0IGV4cGxhaW5zIHdoeSBJIGhhZCBzdWNoIGEgaG9ycmli
bGUgZXhwZXJpZW5jZSB3aXRoIG15IGluaXRpYWwKPiAoc3BsaXQgYmV0d2VlbiBOVk1lIGFuZCBI
REQpIGluc3RhbGwuICBJIHdvdWxkIG5vdCBiZSBzdXJwcmlzZWQgaWYgc29tZQo+IG9yIGFsbCBv
ZiB0aGUgbWV0YWRhdGEgdm9sdW1lIHdvdW5kIHVwIG9uIHRoZSBzcGlubmluZyBkaXNrLgoKV2l0
aCBsdm0yIHVzZXIgY2FuIGFsd2F5cyAncHZtb3ZlJyAgYW55IExWIHRvIGFueSBkZXNpcmVkIFBW
LgpUaGVyZSBpcyBub3QgeWV0IGFueSAnc21hcnQnIGxvZ2ljIHRvIGRvIGl0IGF1dG9tYXRpY2Fs
bHkuCgo+Pj4gYWRkIHN1cHBvcnQgZm9yIGVmZmljaWVudCBzbmFwc2hvdHMgb2YgZGF0YSBzdG9y
ZWQgb24gYSBWRE8gdm9sdW1lLCBhbmQKPj4+IHRvIGhhdmUgbXVsdGlwbGUgdm9sdW1lcyBvbiB0
b3Agb2YgYSBzaW5nbGUgVkRPIHZvbHVtZS4gIEZ1cnRoZXJtb3JlLAo+Pgo+PiBXZSBob3BlIHdl
IHdpbGwgYWRkIHNvbWUgZGlyZWN0ICdzbmFwc2hvdCcgc3VwcG9ydCB0byBWRE8gc28gdXNlcnMg
d2lsbCBub3QKPj4gbmVlZCB0byBjb21iaW5lIGJvdGggdGVjaG5vbG9naWVzIHRvZ2V0aGVyLgo+
IAo+IERvZXMgdGhhdCBpbmNsdWRlIHN1cHBvcnQgZm9yIHNwbGl0dGluZyBhIFZETyB2b2x1bWUg
aW50byBtdWx0aXBsZSwKPiBpbmRpdmlkdWFsbHktc25hcHNob3R0YWJsZSB2b2x1bWVzLCB0aGUg
d2F5IHRoaW4gd29ya3M/CgpZZXMgLSB0aGF0J3MgdGhlIHBsYW4gLSB0byBoYXZlIG11bHRpcGxl
IFZETyBMViBpbiBhIHNpbmdsZSBWRE9Qb29sLgoKUmVnYXJkcwoKWmRlbmVrCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBs
aXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAu
b3JnL0hPV1RPL0xWTS1IT1dUTy8=

