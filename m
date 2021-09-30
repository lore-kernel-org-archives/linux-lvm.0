Return-Path: <SRS0=XKGo=OU=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FDAC433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 11:29:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FA49615E0
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 11:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FA49615E0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633001392;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qps2oW2D4bOCT8TJOIGXZCzF7JP5tgjKN8ueFrp7a4I=;
	b=PrlXWyzV97Y/LPJWh4qgvutu/06zJcus3xjbtyrUwk9+CbSMFnZ9AT9I/WXO3QtoefvBGz
	mfxgJnDTpH5KhIpAPPp8VK9gF0Fo3imW82w0ptnDdMiWpHmQK+qz961uivBLlT/OTfZBgn
	+qqXbjqZFyrjPpfiHifPXuO6c3ExM3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-3a2K5PeKPtSYM02OuQuvlQ-1; Thu, 30 Sep 2021 07:29:50 -0400
X-MC-Unique: 3a2K5PeKPtSYM02OuQuvlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06A39100C668;
	Thu, 30 Sep 2021 11:29:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DC571972D;
	Thu, 30 Sep 2021 11:29:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3268E1803B30;
	Thu, 30 Sep 2021 11:29:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18UBTSot021933 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 30 Sep 2021 07:29:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F2DF20A8C11; Thu, 30 Sep 2021 11:29:28 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19B9A20A8C0E
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 11:29:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DF501161A62
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 11:29:12 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
	[209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-179-sc2OfpzLMm-aIGeTAsJAyg-1; Thu, 30 Sep 2021 07:29:11 -0400
X-MC-Unique: sc2OfpzLMm-aIGeTAsJAyg-1
Received: by mail-ed1-f69.google.com with SMTP id
	d11-20020a50cd4b000000b003da63711a8aso5891631edj.20
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 04:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:content-language:to
	:cc:references:from:subject:in-reply-to:content-transfer-encoding;
	bh=ogeb1+nJLJhlOH8vTE+S85YDQxMJWxXZs4Phh34HKUE=;
	b=sfTNjOjTLtOidobIBgjO63R4VIF9XH4Q1V1S0KK/lDMbslLnoD+HXZadcMzwINZV79
	XlLyjWWU2S/Ac+BLluuQ0X80oOFfCd1+Spe3OMbRSw+IZXCQQRZpZayF5Z23+FA0LtET
	zEQlmQtbwUI5RCTMP2oady15mDav1qhLp/qGCPeLjCWBrlSWqne1+lqSXqJ5M/M5fKkr
	qO3PBKFF5SWCF23XegWPXqAC3FlPb7N9L+cKLC1/MQARxSGfoLRSJpLcwrUOL5wCIypj
	gPJMKC8CkFQqhJsrP9hHHACV5TgXzUDvRQPUYtAbAx1iQgiS0FOJy8h6Cw981Jo47ASO
	rF+Q==
X-Gm-Message-State: AOAM533MN9d83dYMrYmZkuQFZV+vSQMaiWyq5jNHUq5emYj+I6WClOlm
	R1u+uM5RNOzpxoQ65y/iNZ609Q0N0cR3udGN2otEbZEEId49TbFmzedkj4eWm5KEq/7UeYSj4fA
	HdWker9yyh9dMAngV
X-Received: by 2002:a50:d989:: with SMTP id w9mr6733644edj.99.1633001349869;
	Thu, 30 Sep 2021 04:29:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybpECcvE1lA9HHuVzqZJYTCiq0aDAICFIadAUBrrOI1xrZqlb60goC0jgehH7eDMiwaO6FQA==
X-Received: by 2002:a50:d989:: with SMTP id w9mr6733619edj.99.1633001349683;
	Thu, 30 Sep 2021 04:29:09 -0700 (PDT)
Received: from [192.168.0.5] ([85.13.73.241])
	by smtp.gmail.com with ESMTPSA id z8sm1279476ejd.94.2021.09.30.04.29.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 30 Sep 2021 04:29:09 -0700 (PDT)
Message-ID: <b379a1cb-25fe-24b7-cc4b-40800057ed7d@redhat.com>
Date: Thu, 30 Sep 2021 13:29:07 +0200
MIME-Version: 1.0
To: Martin Wilck <martin.wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>
References: <20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
	<20210928174246.GF3087@octiron.msp.redhat.com>
	<20210929220653.p45cvgzdhlbnp4gy@alatyr-rpi.brq.redhat.com>
	<e8459ca73b148e9ba20cbde0041f6e5f4093699d.camel@suse.com>
From: Peter Rajnoha <prajnoha@redhat.com>
In-Reply-To: <e8459ca73b148e9ba20cbde0041f6e5f4093699d.camel@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>
Subject: Re: [linux-lvm] Discussion: performance issue on event activation
 mode
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

T24gOS8zMC8yMSAwOTo1MSwgTWFydGluIFdpbGNrIHdyb3RlOgo+IE9uIFRodSwgMjAyMS0wOS0z
MCBhdCAwMDowNiArMDIwMCwgUGV0ZXIgUmFqbm9oYSB3cm90ZToKPj4gT24gVHVlIDI4IFNlcCAy
MDIxIDEyOjQyLCBCZW5qYW1pbiBNYXJ6aW5za2kgd3JvdGU6Cj4+PiBPbiBUdWUsIFNlcCAyOCwg
MjAyMSBhdCAwMzoxNjowOFBNICswMDAwLCBNYXJ0aW4gV2lsY2sgd3JvdGU6Cj4+Pj4gSSBoYXZl
IHBvbmRlcmVkIHRoaXMgcXVpdGUgYSBiaXQsIGJ1dCBJIGNhbid0IHNheSBJIGhhdmUgYQo+Pj4+
IGNvbmNyZXRlCj4+Pj4gcGxhbi4KPj4+Pgo+Pj4+IFRvIGF2b2lkIGRlcGVuZGluZyBvbiAidWRl
diBzZXR0bGUiLCBtdWx0aXBhdGhkIG5lZWRzIHRvCj4+Pj4gcGFydGlhbGx5Cj4+Pj4gcmV2ZXJ0
IHRvIHVkZXYtaW5kZXBlbmRlbnQgZGV2aWNlIGRldGVjdGlvbi4gQXQgbGVhc3QgZHVyaW5nCj4+
Pj4gaW5pdGlhbAo+Pj4+IHN0YXJ0dXAsIHdlIG1heSBlbmNvdW50ZXIgbXVsdGlwYXRoIG1hcHMg
d2l0aCBtZW1iZXJzIHRoYXQgZG9uJ3QKPj4+PiBleGlzdAo+Pj4+IGluIHRoZSB1ZGV2IGRiLCBh
bmQgd2UgbmVlZCB0byBkZWFsIHdpdGggdGhpcyBzaXR1YXRpb24KPj4+PiBncmFjZWZ1bGx5LiBX
ZQo+Pj4+IGN1cnJlbnRseSBkb24ndCwgYW5kIGl0J3MgYSB0b3VnaCBwcm9ibGVtIHRvIHNvbHZl
IGNsZWFubHkuIE5vdAo+Pj4+IHJlbHlpbmcKPj4+PiBvbiB1ZGV2IG9wZW5zIHVwIGEgUGFuZG9y
YSdzIGJveCB3cnQgV1dJRCBkZXRlcm1pbmF0aW9uLCBmb3IKPj4+PiBleGFtcGxlLgo+Pj4+IEFu
eSBzdWNoIGNoYW5nZSB3b3VsZCB3aXRob3V0IGRvdWJ0IGNhcnJ5IGEgbGFyZ2UgcmlzayBvZgo+
Pj4+IHJlZ3Jlc3Npb25zCj4+Pj4gaW4gc29tZSBzY2VuYXJpb3MsIHdoaWNoIHdlIHdvdWxkbid0
IHdhbnQgdG8gaGFwcGVuIGluIG91ciBsYXJnZQo+Pj4+IGN1c3RvbWVyJ3MgZGF0YSBjZW50ZXJz
Lgo+Pj4KPj4+IEknbSBub3QgYWN0dWFsbHkgc3VyZSB0aGF0IGl0J3MgYXMgYmFkIGFzIGFsbCB0
aGF0LiBXZSBqdXN0IG1heQo+Pj4gbmVlZCBhCj4+PiB3YXkgZm9yIG11bHRpcGF0aGQgdG8gZGV0
ZWN0IGlmIHRoZSBjb2xkcGx1ZyBoYXMgaGFwcGVuZWQuwqAgSSdtCj4+PiBzdXJlIGlmCj4+PiB3
ZSBzYXkgd2UgbmVlZCBpdCB0byByZW1vdmUgdGhlIHVkZXYgc2V0dGxlLCB3ZSBjYW4gZ2V0IHNv
bWUgbWV0aG9kCj4+PiB0bwo+Pj4gY2hlY2sgdGhpcy4gUGVyaGFwcyB0aGVyZSBpcyBvbmUgYWxy
ZWFkeSwgdGhhdCBJIGRvbid0IGtub3cgYWJvdXQuCj4+PiBJZgo+Pgo+PiBUaGUgY29sZHBsdWcg
ZXZlbnRzIGFyZSBzeW50aGVzaXplZCBhbmQgYXMgc3VjaCwgdGhleSBhbGwgbm93IGNvbnRhaW4K
Pj4gU1lOVEhfVVVJRD08VVVJRD4ga2V5LXZhbHVlIHBhaXIgd2l0aCBrZXJuZWw+PTQuMTM6Cj4+
Cj4+ICAgCj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMt
dWV2ZW50Cj4+Cj4+IEkndmUgYWxyZWFkeSB0cmllZCB0byBwcm9wb3NlZSBhIHBhdGNoIGZvciBz
eXN0ZW1kL3VkZXYgdGhhdCB3b3VsZAo+PiBtYXJrCj4+IGFsbCB1ZXZlbnRzIGNvbWluZyBmcm9t
IHRoZSB0cmlnZ2VyIChpbmNsdWRpbmcgdGhlIG9uZSB1c2VkIGF0IGJvb3QKPj4gZm9yCj4+IGNv
bGRwbHVnKSB3aXRoIGFuIGV4dHJhIGtleS12YWx1ZSBwYWlyIHRoYXQgd2UgY291bGQgZWFzaWx5
IG1hdGNoIGluCj4+IHJ1bGVzLAo+PiBidXQgdGhhdCB3YXMgbm90IGFjY2VwdGVkLiBTbyByaWdo
dCBub3csIHdlIGNvdWxkIGRldGVjdCB0aGF0Cj4+IHN5bnRoZXNpemVkIHVldmVudCBoYXBwZW5l
ZCwgdGhvdWdoIHdlIGNhbid0IGJlIHN1cmUgaXQgd2FzIHRoZQo+PiBhY3R1YWwKPj4gdWRldiB0
cmlnZ2VyIGF0IGJvb3QuIEZvciB0aGF0LCB3ZSdkIG5lZWQgdGhlIGV4dHJhIG1hcmtzLiBJIGNh
biBnaXZlCj4+IGl0Cj4+IGFub3RoZXIgdHJ5IHRob3VnaCwgbWF5YmUgaWYgdGhlcmUgYXJlIG1v
cmUgcGVvcGxlIGFza2luZyBmb3IgdGhpcwo+PiBmdW5jdGlvbmFsaXR5LCB3ZSdsbCBiZSBhdCBi
ZXR0ZXIgcG9zaXRpb24gZm9yIHRoaXMgdG8gYmUgYWNjZXB0ZWQuCj4gCj4gVGhhdCB3b3VsZCBh
bGxvdyB1cyB0byBkaXNjZXJuIHN5bnRoZXRpYyBldmVudHMsIGJ1dCBJJ20gdW5zdXJlIGhvdwo+
IHRoaXMgd2hhdCBoZWxwIHVzLiBIZXJlLCB3aGF0IG1hdHRlcnMgaXMgdG8gZmlndXJlIG91dCB3
aGVuIHdlIGRvbid0Cj4gZXhwZWN0IGFueSBtb3JlIG9mIHRoZW0gdG8gYXJyaXZlLgo+IAoKSSB0
aGluayB0aGlzIHdvdWxkIHJlcXVpcmUgZGlmZmVyZW50IGFwcHJvYWNoIG9uIHN5c3RlbWQvdWRl
diBzaWRlLiBDdXJyZW50bHksIAoidWRldmFkbSB0cmlnZ2VyIC0tc2V0bGxlIiB1c2VzIGRpZmZl
cmVudCBVVUlEIGZvciBlYWNoIHN5bnRoZXNpemVkIHVldmVudCdzIApTWU5USF9VVUlELiBUaGlz
IGlzIGFjdHVhbGx5IG5vdCBleGFjdGx5IGhvdyBpdCB3YXMgbWVhbnQgdG8gYmUgdXNlZC4gSW5z
dGVhZCwgCnRoZSBTWU5USF9VVUlEIHdhcyBhbHNvIG1lYW50IHRvIGJlIHVzZWQgYXMgZm9ybSBv
ZiBncm91cGluZyAtIHNvIGluIGNhc2Ugb2YgCiJ1ZGV2YWRtIHRyaWdnZXIiLCB0aGVyZSBzaG91
bGQgYmUgYSBzaW5nbGUgVVVJRCB1c2VkIHRvIGdyb3VwIGFsbCB0aGUgCmdlbmVyYXRlZCB1ZXZl
bnRzIGJhc2VkIG9uIHRoYXQgVVVJRC4gVGhlbiwgdGhpcyBsb2dpYyBjb3VsZCBiZSBlbmhhbmNl
ZCBpbiBhIAp3YXkgdGhhdCB0aGVyZSB3b3VsZCBiZSBkaWZmZXJlbnQgU1lOVEhfVVVJRCB1c2Vk
IGZvciBlYWNoIHN1YnN5c3RlbSAoZS5nLiAKYmxvY2spLCBoZW5jZSB3ZSBjb3VsZCB3YWl0IGZv
ciBlYWNoIHN1YnN5c3RlbSdzIGRldmljZXMgc2VwYXJhdGVseSwgbm90IGJlaW5nIApkcmFnZ2Vk
IGJ5IHdhaXRpbmcgZm9yIGFueXRoaW5nIGVsc2UuCgpTbyB0aGVuIHdlIGNvdWxkIGhhdmUgc2Vy
dmljZXMgbGlrZToKICAgc3lzdGVtZC11ZGV2LXNldHRsZS1ibG9jay5zZXJ2aWNlCiAgIHN5c3Rl
bWQtdWRldi1zZXR0bGUtb3RoZXJzdWJzeXN0ZW0uc2VydmljZQogICAuLi4KCkFuZCB0aGVuIHBs
YWNlIG91ciBzZXJ2aWNlcyBhZnRlciB0aGF0LiBXZSdkIG5lZWQgdG8gZWxhYm9yYXRlIGEgYml0
IGlmIG1vcmUgCmZpbmUgZ3JhaW5lZCBzZXBhcmF0aW9uIHdvdWxkIGJlIG5lZWRlZCBvciBub3Qu
Li4KCklmIHdlIHNlZSB0aGlzIHVkZXYgc2V0dGxlIGFzIHRoZSBrZXkgcG9pbnQsIHRoZW4gSSB0
aGluayB3ZSBzaG91bGQgcHJvYmFibHkgCmNvbmNlbnRyYXRlIG9uIGVuaGFuY2luZyBzeXN0ZW1k
L3VkZXYgdG8gcHJvdmlkZSB0aGlzIGZ1bmN0aW9uYWxpdHkgKGFuZCAKcHJpbWFyaWx5IHRoZSB1
ZGV2YWRtIHRyaWdnZXIgZnVuY3Rpb25hbGl0eSBhbmQgd2FpdGluZyBmb3IgcmVsYXRlZCAKc3lu
dGhlc2l6ZWQgZXZlbnRzKS4gSSB0aGluayB0aGUgaW5mcmFzdHJ1Y3R1cmUgdG8gYWNjb21wbGlz
aCB0aGlzIGlzIGFscmVhZHkgCnRoZXJlLiBJdCBqdXN0IG5lZWRzIHN1aXRhYmxlIHVzZXItc3Bh
Y2UgY2hhbmdlcyAodGhlIHVkZXZhZG0gdHJpZ2dlcikuCgo+IEkgZ3Vlc3MgaXQgd291bGQgYmUg
cG9zc2libGUgdG8gY29tcGFyZSB0aGUgbGlzdCBvZiAoaW50ZXJlc3RpbmcpCj4gZGV2aWNlcyBp
biBzeXNmcyB3aXRoIHRoZSBsaXN0IG9mIGRldmljZXMgaW4gdGhlIHVkZXYgZGIuIEZvcgo+IG11
bHRpcGF0aGQsIHdlIGNvdWxkCj4gCj4gICAtIHNjYW4gc2V0IFUgb2YgdWRldiBkZXZpY2VzIG9u
IHN0YXJ0dXAKPiAgIC0gc2NhbiBzZXQgUyBvZiBzeXNmcyBkZXZpY2VzIG9uIHN0YXJ0dXAKCldl
bGwsIEkgdGhpbmsgdGhhdCdzIGV4YWN0bHkgdGhlIGZ1bmN0aW9uYWxpdHkgdGhhdCBjb3VsZCBi
ZSBwcm92aWRlZCBieSB0aGUgCnNldHRsZSBzZXBhcmF0aW9uIGFzIGRlc2NyaWJlZCBhYm92ZS4u
LiBBbmQgdGhlbiBldmVyeWJvZHkgY291bGQgYmVuZWZpdCBmcm9tIAp0aGlzLgoKPiAgIC0gbGlz
dGVuIGZvciB1ZXZlbnRzIGZvciB1cGRhdGluZyBib3RoIFMgYW5kIFUKPiAgIC0gYWZ0ZXIgZWFj
aCB1ZXZlbnQsIGNoZWNrIGlmIHRoZSBkaWZmZXJlbmNlIHNldCBvZiBTIGFuZCBVIGlzIGVtdHB5
Cj4gICAtIGlmIHllcywgY29sZHBsdWcgaGFzIGZpbmlzaGVkCj4gICAtIG90aGVyd2lzZSwgY29u
dGludWUgd2FpdGluZywgcG9zc2libHkgdW50aWwgc29tZSB0aW1lb3V0IGV4cGlyZXMuCj4gCj4g
SXQncyBtb3JlIGRpZmZpY3VsdCBmb3IgTFZNIGJlY2F1c2UgeW91IGhhdmUgbm8gZGFlbW9uIG1h
aW50YWluaW5nCj4gc3RhdGUuCj4gCj4gTWFydGluCj4gCj4gCj4gCj4gCj4gCj4+Cj4gCgoKLS0g
ClBldGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1h
bi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ct
VE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8=

