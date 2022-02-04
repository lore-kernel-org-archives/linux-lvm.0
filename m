Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B04CC433EF
	for <linux-lvm@archiver.kernel.org>; Fri,  4 Feb 2022 10:20:40 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-vLHqO017NbWLpYaJCfRnOw-1; Fri, 04 Feb 2022 05:20:35 -0500
X-MC-Unique: vLHqO017NbWLpYaJCfRnOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCE8251081;
	Fri,  4 Feb 2022 10:20:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75670106C0CA;
	Fri,  4 Feb 2022 10:20:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 993F41809CB8;
	Fri,  4 Feb 2022 10:20:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 214AGnex014102 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 4 Feb 2022 05:16:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C90B479D2; Fri,  4 Feb 2022 10:16:49 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2B187AC1
	for <linux-lvm@redhat.com>; Fri,  4 Feb 2022 10:16:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23C44800B29
	for <linux-lvm@redhat.com>; Fri,  4 Feb 2022 10:16:42 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
	[209.85.218.53]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-454-c0yqveeVPb2Ec86vKLaFuA-1; Fri, 04 Feb 2022 05:16:40 -0500
X-MC-Unique: c0yqveeVPb2Ec86vKLaFuA-1
Received: by mail-ej1-f53.google.com with SMTP id ah7so17783801ejc.4
	for <linux-lvm@redhat.com>; Fri, 04 Feb 2022 02:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=hAA4ui+1dR5WYiaJptiJj/IS4uksPRgFGgE2UR4C6Qo=;
	b=BnKbj8gdy7KXmkp14BG5t+8x5Kl3xW4dYxHYuUBKrUF/JYBJoM8oQgM9C+4GAKHgKB
	OwKeiX4/m4AnVsB+vkhgIXXfzkU5kaXVTHyniszYAfU0XUMZWCq4XQufn+LPAaL73NZr
	FsyebNwO7DzuAmuzYDvwRZ/xK6GfvLW924uW8G4b3d2vYi4wonKHpcPL7w0O3o49pzSt
	SCJwgAvf6TTjHY2yDBuB29S3MK4j/2fIkIIkOEFyegfsHtX2xDdUs7F2Dyp4Fxkj+DU/
	9ghqt0AMRrZRPlBlYMDUwg3TcKOOquWuNAsofEl0TjcJtbucUZ/AqxFpoj8w/BWwdhvc
	2HRA==
X-Gm-Message-State: AOAM533YG/eDJp0C88qnnFu4StvhT89aqM6mvL2CUq1Vk+Odoi7e1Epw
	t1T/RYxytUaC6W/CIu0fwk5DwOOxgggsDA==
X-Google-Smtp-Source: ABdhPJwz4YG5qMCSB0PpI3n4nrPjXgBaLsqIBxT5+LvUCc36Nok0GYMH6rM8997OxETND+gaV59XXA==
X-Received: by 2002:a17:906:7712:: with SMTP id
	q18mr1824415ejm.434.1643969798991; 
	Fri, 04 Feb 2022 02:16:38 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id a14sm627673edx.96.2022.02.04.02.16.37
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 04 Feb 2022 02:16:38 -0800 (PST)
Message-ID: <6f2c4009-b7f1-2693-5017-6c418f891ccb@gmail.com>
Date: Fri, 4 Feb 2022 11:16:36 +0100
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
	<a2786ae3-5339-782f-ae31-5411a7b84bcd@gmail.com>
	<Yfxs2c88Nim9feN/@itl-email>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <Yfxs2c88Nim9feN/@itl-email>
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
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDA0LiAwMi4gMjIgdiAxOjAxIERlbWkgTWFyaWUgT2Jlbm91ciBuYXBzYWwoYSk6Cj4gT24g
VGh1LCBGZWIgMDMsIDIwMjIgYXQgMDE6Mjg6MzdQTSArMDEwMCwgWmRlbmVrIEthYmVsYWMgd3Jv
dGU6Cj4+IERuZSAwMy4gMDIuIDIyIHYgNTo0OCBEZW1pIE1hcmllIE9iZW5vdXIgbmFwc2FsKGEp
Ogo+Pj4gT24gTW9uLCBKYW4gMzEsIDIwMjIgYXQgMTA6Mjk6MDRQTSArMDEwMCwgTWFyaWFuIENz
b250b3Mgd3JvdGU6Cj4+Pj4gT24gU3VuLCBKYW4gMzAsIDIwMjIgYXQgMTE6MTcgUE0gRGVtaSBN
YXJpZSBPYmVub3VyIDwKPj4+PiBkZW1pQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+
Pj4+Cj4+Pj4+IE9uIFN1biwgSmFuIDMwLCAyMDIyIGF0IDA0OjM5OjMwUE0gLTA1MDAsIFN0dWFy
dCBELiBHYXRobWFuIHdyb3RlOgoKPj4gSWYgdGhleSBuZWVkIHRvIHVzZSBjb250YWluZXJpemVk
IHNvZnR3YXJlIHRoZXkgc2hvdWxkIHVzZSBjb250YWluZXJzIGxpa2UKPj4gaS5lLiBEb2NrZXIg
LSBpZiB0aGV5IG5lZWQgZnVsbCB2aXJ0dWFsIHNlY3VyZSBtYWNoaW5lIC0gaXQgY2VydGFpbmx5
IGhhcwo+PiBpdCdzIHByaWNlIChtYWlubHkgd2F5IGhpZ2hlciBtZW1vcnkgY29uc3VtcHRpb24p
Cj4+IEkndmUgc29tZSBkb3VidHMgdGhlcmUgaXMgc29tZSByZWFsIGdvb2QgcmVhc29uIHRvIGhh
dmUgcXVpY2tseSBjcmVhdGVkIFZNcwo+PiBhcyB0aGV5IHN1cmVseSBhcmUgc3VwcG9zZWQgdG8g
YmUgYSBsb25nIHRpbWUgbGl2aW5nIGVudGl0aWVzCj4+IChob3Vycy9kYXlzLi4uKQo+IAo+IFNp
bXBseSBwdXQsIFF1YmVzIE9TIGxpdGVyYWxseSBkb2VzIG5vdCBoYXZlIGEgY2hvaWNlLiAgUXVi
ZXMgT1MgaXMKPiBpbnRlbmRlZCB0byBwcm90ZWN0IGFnYWluc3QgdmVyeSBoaWdoLWxldmVsIGF0
dGFja2VycyB3aG8gYXJlIGxpa2VseSB0bwoKSSdkIHNheSB5b3UgYXJlIHB1dHRpbmcgeW91ciBl
ZmZvcnQgaW50byB3cm9uZyBwbGFjZSB0aGVuLgpBS0EgeW91IGVmZm9ydCBwbGFjZWQgaW4gb3B0
aW1pemluZyBnaXZlbiBjaGFuZyBpcyBubyB3aGVyZSBuZWFyIHRvIHVzaW5nIAp0aGluZ3MgcHJv
cGVybHkuLi4KCj4+IFZNcyBhbmQgY29udGFpbmVycyBoYXZlIGl0cyBzdHJlbmd0aCBhbmQgd2Vh
a25lc3Nlcy4uCj4+IE5vdCBzdXJlIHdoeSBzb21lIG1hbnkgcGVvcGxlIHRyeSB0byBwcmV0ZW5k
IFZNcyBjYW4gYmUgYXMgZWZmaWNpZW50IGFzCj4+IGNvbnRhaW5lcnMgb3IgY29udGFpbmVycyBh
cyBzZWN1cmUgYXMgVk1zLiBKdXN0IGFsd2F5cyBwaWNrIHRoZSByaWdodAo+PiB0b29sLi4uCj4g
Cj4gUXViZXMgT1MgbmVlZHMgc2VjdXJlICphbmQqIGZhc3QuICBUbyBxdW90ZSB0aGUgc2VMNCBt
aWNyb2tlcm5lbOKAmXMKPiBtYW50cmEsIOKAnFNlY3VyaXR5IGlzIG5vIGV4Y3VzZSBmb3IgcG9v
ciBwZXJmb3JtYW5jZSHigJ0uCgpBbmQgd2hvIGV2ZXIgdGVsbHMgeW91IGhlIGNhbiBnZXQgdGhl
IHNhbWUgcGVyZm9ybWFuY2UgZm9yIFZNIGFzIHdpdGggCmNvbnRhaW5lciBoYXMgbm8gaWRlYSBo
b3cgT1Mgd29ya3MuLi4KClNlY3VyaXR5IHNpbXBseSAqSVMqIGV4cGVuc2l2ZSAoZXNwZWNpYWxs
eSB3aXRoIEludGVsIENQVXMgOykpCgpFZHVjYXRlZCB1c2VyIG5lZWRzIHRvIHBpY2sgdGhlIGxl
dmVsIGhlIHdhbnRzIHRvIHBheSBmb3IgaXQuCgpSZWdhcmRzCgpaZGVuZWsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxp
c3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5v
cmcvSE9XVE8vTFZNLUhPV1RPLw==

