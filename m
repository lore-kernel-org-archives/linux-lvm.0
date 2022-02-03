Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E50C433EF
	for <linux-lvm@archiver.kernel.org>; Thu,  3 Feb 2022 12:28:59 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-4hifhpi0OYS0VoC_Sg45Aw-1; Thu, 03 Feb 2022 07:28:56 -0500
X-MC-Unique: 4hifhpi0OYS0VoC_Sg45Aw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD2C61091DBE;
	Thu,  3 Feb 2022 12:28:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC455E2DF;
	Thu,  3 Feb 2022 12:28:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D84E4BB7C;
	Thu,  3 Feb 2022 12:28:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 213CSgdA017714 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 3 Feb 2022 07:28:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0123B142B94F; Thu,  3 Feb 2022 12:28:42 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F064B142B94E
	for <linux-lvm@redhat.com>; Thu,  3 Feb 2022 12:28:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D79B33803508
	for <linux-lvm@redhat.com>; Thu,  3 Feb 2022 12:28:41 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
	[209.85.218.46]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-444-WCLCvZuRPqSyGF5ppAFxRg-1; Thu, 03 Feb 2022 07:28:40 -0500
X-MC-Unique: WCLCvZuRPqSyGF5ppAFxRg-1
Received: by mail-ej1-f46.google.com with SMTP id a8so8255132ejc.8
	for <linux-lvm@redhat.com>; Thu, 03 Feb 2022 04:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:from:in-reply-to
	:content-transfer-encoding;
	bh=C5WCZJi2qXaVP+BJVGWtqXNQ31xkFKk75svM7c0P4GY=;
	b=SL3fVM/cm6IMZjK1j5UC56wB5kOS/1c8Cu7SU2PRW5JEuIuvuc4W2wf2MH45Nm/rbk
	s5UR0QAqhmc+23TnJzDG1FtrYbyEm0SbjR32RsIq03imwgdUi4CsQ5xVm5r0tKN/Idkn
	wy0KJqXgSMMWIKQ78SH+qn+Z8crMcSzSFl3vJAMiVCc+e9BmngKf8WchmzpzJS9nlkrz
	mZ0+/Vb22uMxvJ2CrqU6uuS7YGne8/rp+KI6PkqH7EK9u2YuUal+En/iDbyW/QyeBoNQ
	2yEFionN3e+dukmc46X7YJuzn9wSyK1HvaoIh9c4UQAiyh2UceU7zSgQu1+0332z11eG
	h/gw==
X-Gm-Message-State: AOAM532XPgbpXjJmajltrxEBmfvsgMHoNt7VfFL5lxwNuKomMkaaifAU
	kZ74wXScekqHLvoLV6CM8PCrqzSCnizqvw==
X-Google-Smtp-Source: ABdhPJzErn8JUjISAz8A1qvfQpKROX8sGp1CwoR0ICX7X7847h6bvMUt8hshRSXHl8snZMt8isaf1A==
X-Received: by 2002:a17:907:6284:: with SMTP id
	nd4mr2296201ejc.477.1643891318747; 
	Thu, 03 Feb 2022 04:28:38 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id
	k6sm22662596edx.41.2022.02.03.04.28.37
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 03 Feb 2022 04:28:38 -0800 (PST)
Message-ID: <a2786ae3-5339-782f-ae31-5411a7b84bcd@gmail.com>
Date: Thu, 3 Feb 2022 13:28:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.4.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
	<YfbApm+9ac6iBbbg@itl-email>
	<30ba3f0683afb9c3b60d96ac0019ced4ce9bb5b8.camel@gathman.org>
	<YfcN6KHxLe3/krTX@itl-email>
	<CAJNi=XrO3+N63W1zxVhP0_y7CrHB=mmKpA2_MrVRSRX_e2u53A@mail.gmail.com>
	<YftesLAiW8xoFxqq@itl-email>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <YftesLAiW8xoFxqq@itl-email>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] LVM performance vs direct dm-thin
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDAzLiAwMi4gMjIgdiA1OjQ4IERlbWkgTWFyaWUgT2Jlbm91ciBuYXBzYWwoYSk6Cj4gT24g
TW9uLCBKYW4gMzEsIDIwMjIgYXQgMTA6Mjk6MDRQTSArMDEwMCwgTWFyaWFuIENzb250b3Mgd3Jv
dGU6Cj4+IE9uIFN1biwgSmFuIDMwLCAyMDIyIGF0IDExOjE3IFBNIERlbWkgTWFyaWUgT2Jlbm91
ciA8Cj4+IGRlbWlAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6Cj4+Cj4+PiBPbiBTdW4s
IEphbiAzMCwgMjAyMiBhdCAwNDozOTozMFBNIC0wNTAwLCBTdHVhcnQgRC4gR2F0aG1hbiB3cm90
ZToKPj4+PiBZb3VyIFZNIHVzYWdlIGlzIGRpZmZlcmVudCBmcm9tIG91cnMgLSB5b3Ugc2VlbSB0
byBuZWVkIHRvIGNsb25lIGFuZAo+Pj4+IGFjdGl2YXRlIGEgVk0gcXVpY2tseSAobGlrZSBhIHZw
cyBwcm92aWRlciBtaWdodCBuZWVkIHRvIGRvKS4gIFdlCj4+Pj4gZ2VuZXJhbGx5IGhhdmUgdG8g
YnV5IG1vcmUgUkFNIHRvIGFkZCBhIG5ldyBWTSA6LSksIHNvIHBlcmZvcm1hbmNlIG9mCj4+Pj4g
Y3JlYXRpbmcgYSBuZXcgTFYgaXMgdGhlIGxlYXN0IG9mIG91ciB3b3JyaWVzLgo+Pj4KPj4+IFRv
IHB1dCBpdCBtaWxkbHksIHllcyA6KS4gIElkZWFsbHkgd2UgY291bGQgZ2V0IFZNIGJvb3QgdGlt
ZSBkb3duIHRvCj4+PiAxMDBtcyBvciBsb3dlci4KPj4+Cj4+Cj4+IE91dCBvZiBjdXJpb3NpdHks
IGlzIHNuYXBzaG90IGNyZWF0aW9uIHRoZSBtYWluIGN1bHByaXQgdG8gYm9vdCBhIFZNIGluCj4+
IHVuZGVyIDEwMG1zPyBEb2VzIFF1YmVzIE9TIHVzZSB0d2Vha2VkIGxpbnV4IGRpc3RyaWJ1dGlv
bnMsIHRvIGFjaGlldmUgdGhlCj4+IGRlc2lyZWQgYm9vdCB0aW1lPwo+IAo+IFRoZSBnb2FsIGlz
IDEwMG1zIGZyb20gdXNlciBhY3Rpb24gdW50aWwgUElEIDEgc3RhcnRzIGluIHRoZSBndWVzdC4K
PiBBZnRlciB0aGF0LCBpdOKAmXMgdGhlIGpvYiBvZiB3aGF0ZXZlciBkaXN0cm8gdGhlIGd1ZXN0
IGlzIHJ1bm5pbmcuCj4gU3RvcmFnZSBtYW5hZ2VtZW50IGlzIG9uZSBhcmVhIHRoYXQgbmVlZHMg
dG8gYmUgb3B0aW1pemVkIHRvIGFjaGlldmUKPiB0aGlzLCB0aG91Z2ggaXQgaXMgbm90IHRoZSBv
bmx5IG9uZS4KCkknbSB3b25kZXJpbmcgZnJvbSB3aGVyZSB0aG9zZSAxMDBtcyBjYW1lIGZyb20/
CgpVc2VycyBvZnRlbiBtaXN0YWtlbmx5IHRhcmdldCBmb3Igd3JvbmcgdGVjaG5vbG9naWVzIGZv
ciB0aGVpciB0YXNrcy4KCklmIHRoZXkgbmVlZCB0byB1c2UgY29udGFpbmVyaXplZCBzb2Z0d2Fy
ZSB0aGV5IHNob3VsZCB1c2UgY29udGFpbmVycyBsaWtlIAppLmUuIERvY2tlciAtIGlmIHRoZXkg
bmVlZCBmdWxsIHZpcnR1YWwgc2VjdXJlIG1hY2hpbmUgLSBpdCBjZXJ0YWlubHkgaGFzIGl0J3Mg
CnByaWNlIChtYWlubHkgd2F5IGhpZ2hlciBtZW1vcnkgY29uc3VtcHRpb24pCkkndmUgc29tZSBk
b3VidHMgdGhlcmUgaXMgc29tZSByZWFsIGdvb2QgcmVhc29uIHRvIGhhdmUgcXVpY2tseSBjcmVh
dGVkIFZNcyBhcyAKdGhleSBzdXJlbHkgYXJlIHN1cHBvc2VkIHRvIGJlIGEgbG9uZyB0aW1lIGxp
dmluZyBlbnRpdGllcyAgKGhvdXJzL2RheXMuLi4pCgpTbyB1bmxlc3MgeW91IHdhbnQgdG8gY3Jl
YXRlIHNvbWV0aGluZyBmb3IgbWFya2V0aW5nIHB1cnBvc2VzIGFrYSAtIG15IHRhYmxlIAppcyBi
aWdnZXIgdGhlbiB5b3VycyAtIEkgZG9uJ3Qgc2VlIHRoZSBwb2ludC4KCkZvciBxdWljayBpbnN0
YW5jaWVzIG9mIHNvZnR3YXJlIGFwcHMgSSdkIGFsd2F5cyByZWNvbW1lbmQgY29udGFpbmVycyAt
IHdoaWNoIAphcmUgdmFzdGx5IG1vcmUgZWZmaWNpZW50IGFuZCBzY2FsYWJsZS4KClZNcyBhbmQg
Y29udGFpbmVycyBoYXZlIGl0cyBzdHJlbmd0aCBhbmQgd2Vha25lc3Nlcy4uCk5vdCBzdXJlIHdo
eSBzb21lIG1hbnkgcGVvcGxlIHRyeSB0byBwcmV0ZW5kIFZNcyBjYW4gYmUgYXMgZWZmaWNpZW50
IGFzIApjb250YWluZXJzIG9yIGNvbnRhaW5lcnMgYXMgc2VjdXJlIGFzIFZNcy4gSnVzdCBhbHdh
eXMgcGljayB0aGUgcmlnaHQgdG9vbC4uLgoKCj4+IEJhY2sgdG8gYnVzaW5lc3MuIFBlcmhhcHMg
SSBtaXNzZWQgYW4gYW5zd2VyIHRvIHRoaXMgcXVlc3Rpb246IEFyZSB0aGUKPj4gUXViZXMgT1Mg
Vk1zIHRocm93IGF3YXk/ICBUaHJvdyBhd2F5IGluIHRoZSBzZW5zZSBsaWtlIG1hbnkgY29udGFp
bmVycyBhcmUKPj4gLSBpdCdzIGp1c3QgYSBydW50aW1lIHdoaWNoIGNhbiBiZSAiZWFzaWx5IiBy
ZWNvbnN0cnVjdGVkLiBJZiBzbywgeW91IGNhbgo+PiBpZ25vcmUgdGhlIHNhZmV0eSBiZWx0cyBh
bmQgdHJ5IHRvIHNxdWVlemUgbW9yZSBwZXJmb3JtYW5jZSBieSBzYWNyaWZpY2luZwo+PiAobWV0
YSlkYXRhIGludGVncml0eS4KPiAKPiBXaHkgZG9lcyBhIHRyYWRlLW9mZiBuZWVkIHRvIGJlIG1h
ZGUgaGVyZT8gIE1vcmUgc3BlY2lmaWNhbGx5LCB3aHkgaXMgaXQKPiBub3QgcG9zc2libGUgdG8g
YmUgcmVhc29uYWJseSBmYXN0IChhIGZldyBtcykgQU5EIHNhZmU/CgpTZWN1cml0eSwgc2FmZXR5
IGFuZCBkZXRlcm1pbmlzbSBhbHdheXMgdGFrZXMgYXdheSBlZmZpY2llbmN5LgoKVGhlIGhpZ2hl
ciBhbW91bnQgb2YgcmFuZG9tbmVzcyB5b3UgY2FuIGxpdmUgd2l0aCwgdGhlIGZhc3RlciBwcm9j
ZXNzaW5nIHlvdSAKY2FuIGFjaGlldmUgLSB5b3UganVzdCBuZWVkIHRvIGNyb3NzIHlvdSBmaW5n
ZXJzIDopCihpLmUuIGRyb3AgdHJhbnNhY3Rpb24gc3luY2hvcm5pc2F0aW9uIDopKQoKUXVpdGUg
ZnJhbmtseSAtIGlmIHlvdSBhcmUgb3JjaGVzdHJhdGluZyBtb3N0bHkgc2FtZSBWTXMsIGl0IHdv
dWxkIGJlIG1vcmUgCmVmZmljaWVudCwgdG8ganVzdCBzbmFwc2hvdCB0aGVtIHdpdGggYWxyZWFk
eSBydW5uaW5nIG1lbW9yeSBlbnZpcm9ubWVudCAtCnNvIGluc3RlYWQgb2YgYm9vdGluZyBWTSBh
bHdheXMgZnJvbSAnc2NyYXRjaCcsIHlvdSByZXN0b3JlL3Jlc3VtZSB0aG9zZSBWTXMgCmF0IHNv
bWUgYWxyZWFkeSBydW5uaW5nIHBvaW50IC0gZnJvbSB3aGljaCBpdCBjb3VsZCBzdGFydCBkZXZp
YXRlLgpXaHkgd2FzdGluZyBDUFUmdGltZSBvbiBwcm9jZXNzaW5nIG92ZXIgYW5kIG92ZXIgc2Ft
ZSBib290Li4uLgpUaGVyZSB5b3Ugc2hvdWxkIGh1bnQgeW91ciBtaWxpc2Vjb25kcy4uLgoKClJl
Z2FyZHMKClpkZW5lawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczov
L2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBM
Vk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

