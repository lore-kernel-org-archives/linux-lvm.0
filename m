Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955E2C433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 21 Dec 2021 15:31:25 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-NSJcY62sPJyxtn8rvYDN5Q-1; Tue, 21 Dec 2021 10:31:22 -0500
X-MC-Unique: NSJcY62sPJyxtn8rvYDN5Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1372801B0B;
	Tue, 21 Dec 2021 15:31:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BF4E519A0;
	Tue, 21 Dec 2021 15:31:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 348681809CBA;
	Tue, 21 Dec 2021 15:31:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BLFUuND014185 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 21 Dec 2021 10:30:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 395A52166B1E; Tue, 21 Dec 2021 15:30:56 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 338232166B4C
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 15:30:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 151BE85A5A8
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 15:30:53 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-225-5MLpIupcO22P9Inwe8IcwA-1; Tue, 21 Dec 2021 10:30:51 -0500
X-MC-Unique: 5MLpIupcO22P9Inwe8IcwA-1
Received: by mail-ed1-f54.google.com with SMTP id y13so53453309edd.13
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 07:30:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=8t37zBbjsdlmVunWPepy/0GzGwgIj8VC/cUi5XHQf0Y=;
	b=dxwCFP7AVJEQLCgsgDewSC5RTVGuYfgD2lItTD1d9GGkfQMfLhjp6RDskr/c3HvChP
	IWyegQEIittdT4wKystuz5NQXQ7Jpn1WvzspODJo0XGL5BCnhKFtKcDUND0gpsgrXqx1
	mJ1NHGReb6ZYhDmS3askw/YezEqW3EamDRbtbQ3GamL+PG6aRAFGJ5F5ktD7yPuhF/IR
	s/4zX1p7vIWmi32tDa0/vBka5qGc5x/YuJm3BJUXFayDF88sGtZtgXDljUisOaTIyqJt
	MjUKXD1TN39bov1Qdfcyw9jgcCodUNP8nu0eC84P3ymvbQvUD4LRHNkkfsfOWqC/MdMo
	dvVg==
X-Gm-Message-State: AOAM532dKZZ5K835xFSj46cLYst+geh8iHaO+ae7PkcRYArUYlB6IvzS
	0Zxp8iitoJW/2RjkEjXxrl4=
X-Google-Smtp-Source: ABdhPJzZ8UoIZSvxtli6Nn6CF/pLteLpqPxaCgvYgFb4DHTc9KQo6VUWJ63bDW2c0P/oFG85kQTVKA==
X-Received: by 2002:aa7:d541:: with SMTP id u1mr3820578edr.205.1640100650171; 
	Tue, 21 Dec 2021 07:30:50 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id
	cs12sm6742265ejc.15.2021.12.21.07.30.49
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 21 Dec 2021 07:30:49 -0800 (PST)
Message-ID: <a9188fbf-5859-4406-7075-4a116bdc036f@gmail.com>
Date: Tue, 21 Dec 2021 16:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.3.0
To: =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>
References: <0026c26e-a5e0-272d-e5d6-739466cbd6b2@gmail.com>
	<89C3404F-E604-45DA-AEFD-200DCC89631D@gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <89C3404F-E604-45DA-AEFD-200DCC89631D@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] how to convert a disk containing a snapshot to a
	snapshot lv?
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

RG5lIDIxLiAxMi4gMjEgdiAxNTo0NCBUb21hcyBEYWxlYmrDtnJrIG5hcHNhbChhKToKPiBoaQo+
IAo+IEkgdGhpbmsgSSBkaWRu4oCZdCBleHBsYWluIHRoaXMgY2xlYXIgZW5vdWdoCj4gQWxsdGhl
IGx2bSBkYXRhIGlzIHByZXNlbnQgaW4gdGhlIHNuYXBzaG90IHRoYXQgSSBwcm92aXNpb24gZnJv
bSBvdXIgYmFja3VwIHN5c3RlbQo+IEkgY2FuIGd1YXJhbnRlZSB0aGF0IQo+IAo+IElmIEkganVz
dCBtb3VudCB0aGF0IHNuYXBzaG90IGZyb20gb3VyIGJhY2t1cCBzeXN0ZW0sIGl0IHdvcmtzIHBl
cmZlY3RseSB3ZWxsCj4gCj4gc28gd2UgZG9u4oCZdCBuZWVkIHRoZSBvcmlnaW4gdm9sdW1lcyBp
biBvdGhlciB3YXkgdGhhbiBjb3B5aW5nIGJhY2sgdG8gaXQKPiB3ZSBqdXN0IG5lZWQgdG8gcmVh
bmltYXRlIGl0IGFzIGEgY293IHZvbHVtZQo+IG1lbnRpb25pbmcgdGhhdCBhbGwgZGF0YSBoYXMg
YmVlbiBjaGFuZ2VkCj4gdGhlIGNvdyBpcyBqdXN0IHJlZmVyZW5jaW5nIHRvIHRoZSBvcmlnaW4g
bG9jYXRpb24sIHNvIG5vIHByb2JsZW0gdGhlcmUKPiBBbGwgb3VyIGRhdGEgaXMgaW4gdGhlIGNv
dyB2b2x1bWUsIG5vdCBqdXN0IHRoZSBjaGFuZ2VzCj4gCj4ganVzdCB0byBjb21wYXJlCj4gaWYg
eW91IGNoYW5nZSBqdXN0IDEgYnl0ZSBvbiBldmVyeSBjaHVua3NpemUgaW4gdGhlIG9yaWdpbiB2
b2x1bWUsIHRoYW4gdGhlIHNuYXBzaG90IHdpbGwgY29udGFpbiBhbGwgZGF0YSwgcGx1cyBzb21l
IG1ldGEgZGF0YSBldGMuCj4gVGhhdCBpcyB3aGF0IEkgdGFsayBhYm91dCBoZXJlLgo+IFNvIGhv
dyBkbyBJIHJldGFjaCB0aGlzIHZvbHVtZSB0byBhIG5ldyBzZXJ2ZXI/Cj4gCj4gYXMgdGhlIG9u
bHkgYXJndW1lbnQgYWNjZXB0YWJsZSBhcmd1bWVudCBieSB0aGUgbHZjb252ZXJ0IGlzIHZnL3Mx
ID8KPiAKPiBUaGF0IGFzc3VtZXMgdGhhdCB2Zy9zMSBpcyBwcmVzZW50Cj4gc28gaG93IHRvIG1h
a2UgaXQgcHJlc2VudD8KCkhpCgpBcyBzYWlkIGluIG15IHByZXZpb3VzIHBvc3QgLSB0aGUgJ2Zv
cm1hdCcgb2YgZGF0YSBzdG9yZWQgb24gQ09XIHN0b3JhZ2UgCih3aGljaCBpcyB0aGUgJ3JlYWwn
IG1lYW5pbmcgb2Ygc25hcHNob3QgTFYpIGRvZXMgTk9UIGluIGFueSB3YXkgcmVzZW1ibGVzIHRo
ZSAKJ25vcm1hbCcgTFYuCgpTbyB0aGUgQ09XIExWIGNvdWxkIGJlIHJlYWxseSBPTkxZIHVzZSB0
b2dldGhlciB3aXRoICdzbmFwc2hvdCcgdGFyZ2V0LgoKVGhlIGVhc2llc3Qgd2F5IGhvdyB0byAn
Y29weScgdGhpcyBzbmFwc2hvdCB0byBub3JtYWwgTFYgaXMgbGlrZSB0aGlzOgoKCmx2Y3JlYXRl
IC1MIHNpemUgIC1uIG5ld0xWICB2ZwoKZGQgaWY9L2Rldi92Zy9zbmFwc2hvdExWICBvZj0vZGV2
L3ZnL25ld0xWICBicz01MTJLCgoKKHNvIHdpdGggJ0REJyB5b3UgY29weSBkYXRhIGluICdjb3Jy
ZWN0JyBmb3JtYXQpCgpZb3UgY2Fubm90IGNvbnZlcnQgc25hcHNob3QgTFYgdG8gJ25vcm1hbCcg
TFYgaW4gYW55IG90aGVyIHdheSB0aGVuIHRvIG1lcmdlIAp0aGlzIHNuYXBzaG90IExWIGludG8g
eW91ciBvcmlnaW4gTFYgIChzbyBvcmlnaW4gaXMgZ29uZSkKKGx2Y29udmVydCAtLW1lcmdlLi4u
LikKCllvdSBjYW4gYWxzbyAgJ3NwbGl0JyBzbmFwc2hvdCBDT1cgTFYgYW5kICdyZWF0dGFjaCcg
c3VjaCBzbmFwc2hvdCB0byBvdGhlciBMViAKLSBidXQgdGhpcyByZXF1aXJlcyByYXRoZXIgZ29v
ZCBrbm93bGVkZ2UgYWJvdXQgd2hvbGUgZnVuY3Rpb25pbmcgb2YgdGhpcyAKc25hcHNob3R0aW5n
IC0gc28geW91IGtub3cgd2hhdCBjYW4geW91IGRvIGFuZCB3aGF0IGNhbiB5b3UgZXhwZWN0LiBC
dXQgSSdkIApsaWtlbHkgcmVjb21tZW5kICAnZGQnLgpZb3UgY2Fubm90IHVzZSAnc3BsaXR0ZWQn
IENPVyBMViBmb3IgaS5lLiBmaWxlc3lzdGVtIC0gYXMgaXQgY29udGFpbnMgJ21peGVkJyAKc25h
cHNob3QgbWV0YWRhdGEgYW5kIHNuYXBzaG90IGJsb2Nrcy4KCk9sZCBzbmFwc2hvdCBtZWFuaW5n
IHdhcyAtIHRvIHRha2UgJ3RpbWUgY29uc2lzdGVudCcgc25hcHNob3Qgb2YgTFYgd2hpY2ggdGhl
biAKeW91IGNhbiB1c2UgZm9yIGkuZS4gdGFraW5nIGJhY2t1cC4uLi4KClJlZ2FyZHMKClpkZW5l
awoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
bHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0
IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

