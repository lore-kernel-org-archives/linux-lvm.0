Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F071C433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 31 Jan 2022 13:41:41 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-C0nwIU-0McOl68UCnwt5tg-1; Mon, 31 Jan 2022 08:41:37 -0500
X-MC-Unique: C0nwIU-0McOl68UCnwt5tg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32E4492500;
	Mon, 31 Jan 2022 13:41:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8D342B598;
	Mon, 31 Jan 2022 13:41:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C098D1809CB9;
	Mon, 31 Jan 2022 13:41:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VDfCQn031618 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 08:41:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0FF4DC07F5D; Mon, 31 Jan 2022 13:41:12 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C171C15E73
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 13:41:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E77D438011C0
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 13:41:11 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-512-vnhWcXeEP7qzpEMCkW4bTA-1; Mon, 31 Jan 2022 08:41:10 -0500
X-MC-Unique: vnhWcXeEP7qzpEMCkW4bTA-1
Received: by mail-ed1-f41.google.com with SMTP id w14so26887321edd.10
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 05:41:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=f9uyW5Oc2ameh9s89m0ufsdYV4NdBDJ7Z54nB4XoMbE=;
	b=13VvHkk5isrcybNnCbv5IZlfPPQd80nA/q2LVghInTX0jQqAUVPL+2zaztWhWWAvCy
	E73COmEb3b3t6QSJu96cZ5kqGwS6BDsO6bJc9JD9iPPXnq0WLwnkLG3IpthNJwknLbdc
	R/aMc7+4hoeLq8vZY5B5OKrwjsWXofkUSoFSOxKDv3hCclZiBwLIHhtboZ1zTQbMNsFO
	YqRgUdvH0qXg2oP/4/R9/GLwkRhbky7/jfvpWsfi7bgtFingBs0BMBC3Zr9WBN4R7hNZ
	i9SGa/fo9Y1alf0ZXBFCU7pUjzn8JwpZVBQZxsUBsLz2VSPiCAF6qLfNh9vJRl/O3Q5P
	/JBg==
X-Gm-Message-State: AOAM533RH9yWy4tsp21v3WebnJFZbVHGMudpUiDA4HQPLH+bO4fMkztF
	NtQbdNcDMZ0GnDIFGyfTiGCWQzzJtwIcmQ==
X-Google-Smtp-Source: ABdhPJyqPIBZ+HiEcmb0Q0Gy2Yoz7QBTF2XEYirgU6A31E2VL6BbQBTuWjBC4/9xc0Fo7ViTXT5TVQ==
X-Received: by 2002:a05:6402:516d:: with SMTP id
	d13mr20593238ede.333.1643636468375; 
	Mon, 31 Jan 2022 05:41:08 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id
	dn22sm1650915edb.80.2022.01.31.05.41.07
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 31 Jan 2022 05:41:07 -0800 (PST)
Message-ID: <d768d362-4081-b91b-462c-e70fe40e32ba@gmail.com>
Date: Mon, 31 Jan 2022 14:41:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.4.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Gionatan Danti <g.danti@assyoma.it>
References: <YfV9SAsGJBGMMv1b@itl-email>
	<9c35198501aae82e7a911f5418cfd7f6@assyoma.it>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <9c35198501aae82e7a911f5418cfd7f6@assyoma.it>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-lvm@redhat.com
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDMxLiAwMS4gMjIgdiAxMjowMiBHaW9uYXRhbiBEYW50aSBuYXBzYWwoYSk6Cj4gSWwgMjAy
Mi0wMS0yOSAxODo0NSBEZW1pIE1hcmllIE9iZW5vdXIgaGEgc2NyaXR0bzoKPj4gSXMgaXQgcG9z
c2libGUgdG8gY29uZmlndXJlIExWTTIgc28gdGhhdCBpdCBydW5zIHRoaW5fdHJpbSBiZWZvcmUg
aXQKPj4gYWN0aXZhdGVzIGEgdGhpbiBwb29sP8KgIFF1YmVzIE9TIGN1cnJlbnRseSBydW5zIGJs
a2Rpc2NhcmQgb24gZXZlcnkgdGhpbgo+PiB2b2x1bWUgYmVmb3JlIGRlbGV0aW5nIGl0LCB3aGlj
aCBpcyBzbG93IGFuZCB1bnJlbGlhYmxlLsKgIFdvdWxkIHJ1bm5pbmcKPj4gdGhpbl90cmltIGR1
cmluZyBzeXN0ZW0gc3RhcnR1cCBwcm92aWRlIGEgYmV0dGVyIGFsdGVybmF0aXZlPwo+IAo+IEkg
dGhpbmsgdGhhdCwgaWYgYW55dGhpbmcsIGl0IHdvdWxkIGJlIHdvcnNlOiBhIGxvbmcgZGlzY2Fy
ZCBkdXJpbmcgYm9vdCBjYW4gCj4gYmUgcHJvYmxlbWF0aWMsIGV2ZW4gbGVhZGluZyB0byB0aW1l
b3V0IG9uIHN0YXJ0aW5nIG90aGVyIHNlcnZpY2VzLgo+IEFmdGVyIGFsbCwgYmxrZGlzY2FyZCBz
aG91bGQgYmUgZmFzdGVyIHRoZW4gc29tZXRoaW5nIGRvbmUgYXQgaGlnaGVyIGxldmVsLgo+IAo+
IFRoYXQgc2FpZCwgSSBzZWVtIHRvIHJlbWVtYmVyIHRoYXQgZGVsZXRpbmcgYSBmYXQgdm9sdW1l
IHNob3VsZCBhdXRvbWF0aWNhbGx5IAo+IHRyaW0vZGlzY2FyZCBpdCBpZiBpc3N1ZV9kaXNjYXJk
PTEuIElzIHRoaXMgbm90IHRydWUgZm9yIHRoaW4gdm9sdW1lcz8KCgonaXNzdWVfZGlzY2FyZCcg
cmVsYXRlcyBvbmx5IHRvIHRoZSBpbnRlcm5hbCBsdm0yIGxvZ2ljIHdoZW4gc29tZSBleHRlbnRz
IApiZWNvbWUgZnJlZSBmb3IgcmV1c2UgKHNvIGkuZS4gYWZ0ZXIgJ2x2cmVtb3ZlL2x2cmVkdWNl
L3ZncmVtb3ZlLi4uJy4KCkhvd2V2ZXIgc2luY2Ugd2l0aCB0aGluIHZvbHVtZXMgbm8gcGh5c2lj
YWwgZXh0ZW50cyBvZiBWRyBhcmUgcmVsZWFzZWQgKGFzIHRoZSAKdGhpbiB2b2x1bWUgaXMgcmVs
ZWFzaW5nIGNodW5rcyBmcm9tIHRoZSB0aGluLXBvb2wpIC0gdGhlcmUgaXMgbm8gZGlzY2FyZCAK
aXNzdWVkIGJ5IGx2bS4KClJlZ2FyZHMKClpkZW5lawoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2
bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xW
TS1IT1dUTy8=

