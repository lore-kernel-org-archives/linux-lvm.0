Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A5DC433F5
	for <linux-lvm@archiver.kernel.org>; Wed, 22 Dec 2021 10:41:05 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-KcmkkojYNSeCRAJppTkcng-1; Wed, 22 Dec 2021 05:41:02 -0500
X-MC-Unique: KcmkkojYNSeCRAJppTkcng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6E411018727;
	Wed, 22 Dec 2021 10:40:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA7C66ABA8;
	Wed, 22 Dec 2021 10:40:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4F001809CB9;
	Wed, 22 Dec 2021 10:40:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BMAeV32001343 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 05:40:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AA6CA4035783; Wed, 22 Dec 2021 10:40:31 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A640040149AA
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2021 10:40:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DDC0811E76
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2021 10:40:31 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-595-GzRFQMSmOD6-bBwvOyL38g-1; Wed, 22 Dec 2021 05:40:29 -0500
X-MC-Unique: GzRFQMSmOD6-bBwvOyL38g-1
Received: by mail-ed1-f53.google.com with SMTP id x15so6965053edv.1
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2021 02:40:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=spXe3v/joaQKnn/5G6wv+V4TsJA8Yu96B1PCG4bO+n8=;
	b=5eT93s4UDGgnb4E4wBL0qeZ2VitFm6qiDiwhcaAB1GeCGQxOuMOnOuj5ZmTSD52tkQ
	FxlDa0fOdb7gDZbaiChNIIiyvSZs6eFB1ja6ylSl5KFBdTBPNTXFQOpSnwDw2MMCM6zw
	QygtuCvYmEYmBQqkidO8FELacvCASNs0scIenFGHY8kzei/52gudzNDel34w2T0ZuTqL
	j9JDLrYp6BqgicKvT9jfrABZvyt3xamY0NaM66mOMEdDls6/bcK/2LrPTTrIAm1MvQ72
	PCN3qsM6PQ8w7UVzw+NqnX8M4zrpEtexqqEEvKFfWCtYZd/GNoCPls8/jjJ+r/tjYmMl
	ReGg==
X-Gm-Message-State: AOAM530kRc52V/y6g/4OVtwzQBhqEB1niDFZQw5ylNp8UBoqo2x4OV7Q
	UM1ptDqleO8zgTU44ukxIp8hg3R7MtoR9Q==
X-Google-Smtp-Source: ABdhPJxYMt3RZVkh1SVq4Fcozbj8LKr54ETqfFd7DDQ0iU4DM5asK97lZ+q/F4jT7g3H5WRHDZo20A==
X-Received: by 2002:a17:907:169e:: with SMTP id
	hc30mr1889074ejc.433.1640169628668; 
	Wed, 22 Dec 2021 02:40:28 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id g10sm599254eja.80.2021.12.22.02.40.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 22 Dec 2021 02:40:28 -0800 (PST)
Message-ID: <df9f1896-0ba7-9fa4-f4f4-df34bd4ffd39@gmail.com>
Date: Wed, 22 Dec 2021 11:40:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.3.0
To: =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>
References: <0026c26e-a5e0-272d-e5d6-739466cbd6b2@gmail.com>
	<89C3404F-E604-45DA-AEFD-200DCC89631D@gmail.com>
	<a9188fbf-5859-4406-7075-4a116bdc036f@gmail.com>
	<CACrcyfJW0UyEPmx6AXk_+X0N7hjR0ms2SLtXwaEtsafVUUvedA@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CACrcyfJW0UyEPmx6AXk_+X0N7hjR0ms2SLtXwaEtsafVUUvedA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDIxLiAxMi4gMjEgdiAxNzoxMiBUb21hcyBEYWxlYmrDtnJrIG5hcHNhbChhKToKPiBUaGFu
a3MgZm9yIGV4cGxhaW5pbmcgYWxsIHRoYXQgZGV0YWlscyBhYm91dCBob3cgYSBzbmFwc2hvdCBp
cyBmb3JtYXR0ZWTCoG9uIAo+IHRoZSBDT1cgZGV2aWNlLgo+IEkgYWxyZWFkeSBrbm93IHRoYXQg
cGFydC4KPiAKCldlbGwgeW91ciBtZXNzYWdpbmcgaXMgdGhlbiBzb21ld2hhdCBjb25mdXNpbmcu
Cgo+IEkgYW0gbW9yZSBpbnRlcmVzdGVkIGluIGhvdyB0aGUgZGlzayBjb250YWluaW5nIHRoZSBD
T1cgZGF0YSBjYW4gYmUgbWVyZ2VkIAo+IGJhY2sgdG8gYW4gTFYgdm9sdW1lLgo+IFRoZSBzZWNv
bmQgcGFydCBvbmx5IG1lbnRpb25lZCB0aGF0IGl0IGlzIHBvc3NpYmxlLCBidXQgbm90IHdoaWNo
IHN0ZXBzIGFyZSAKPiBpbnZvbHZlZC4KPiAKPiBBcyBkb2N1bWVudGVkIGluIHRoZSBtYW51YWwu
Cj4gVG8gc3BsaXQgYSBzbmFwc2hvdCBmcm9tIGl0cyBvcmlnaW4gKG91ciB3b3JkcyBkZXRhY2gp
IG9uZSBjYW4gdXNlOgo+IGx2Y29udmVydCAtLXNwbGl0c25hcHNob3TCoHZnL3MxCj4gUmlnaHQ/
Cj4gCj4gVG8gcmV2ZXJzZSB0aGF0IHByb2Nlc3MsIGFjY29yZGluZyB0byB0aGUgbWFudWFsOyBv
bmUgY2FuIHVzZToKPiBsdmNvbnZlcnQgLXMgdmcvczEKPiBSaWdodD8KPiAKPiBCdXQgYXMgSSBt
ZW50aW9uZWQgYmVmb3JlLCB0aGlzIHJlcXVpcmVzIHRoYXQgdGhlIHZnL3MxIGV4aXN0cyBhcyBh
biBvYmplY3QgaW4gCj4gdGhlIExWTSBtZXRhZGF0YS4KPiBXaGF0wqBpZiB5b3UgYXJlIG9uIGEg
bmV3IHNlcnZlciwgdGhhdCBkb2VzIG5vdCBoYXZlIHZnL3MxPwo+IEhvdyB0byBjcmVhdGUgdGhh
dCBvYmplY3Qgb3Igd2hhdGV2ZXIgeW91IGxpa2UgdG8gY2FsbCB0aGlzIG9uIHRoZSBzZXJ2ZXI/
Cj4gVGhlIG9ubHkgd2F5IEkgZ290IGl0IGlzIHRvIHVzZSB0aGUKPiB2Z2V4dGVuZAo+IGx2Y3Jl
YXRlCj4gbHZjb252ZXJ0IC0tc3BsaXRzbmFwc2hvdAo+IAo+IEFuZCBub3cgcmVhdHRhY2ggaXQs
IHNvIHRoYXQgdGhlIGFjdHVhbCBtZXJnZSBjYW4gaGFwcGVuLgo+IFRoZSBvYmplY3Qgc2hvdWxk
IGV4aXN0IG5vdywgc28gdGhhdCB0aGUgY29tbWFuZDogbHZjb252ZXJ0IC1zIHZnL3MxIGNhbiB3
b3JrCj4gCgpUaGVyZSBpcyBubyBwcm9ibGVtIHdpdGggcmVhdHRhY2hpbmcgZXhpc3RpbmcgQ09X
IHRvIGFueSBvdGhlciBMViAtCml0J3MgcGxhaW4gICdsdmNvbnZlcnQgIC1zIC1abiAtYyB4eHgg
dmcvb3JpZ2luICAgdmcvc25hcGNvdycKCnRoaXMgd2lsbCByZWpvaW4gZm9ybWVyIG9yaWdpbiB3
aXRoIGZvcm1lciBDT1cgdm9sdW1lIGFuZCBhdm9pZHMgJ3plcm9pbmcnIAptZXRhZGF0YSBzdG9y
ZWQgb24gQ09XLgoKCkJ1dCB0byBoYXZlIHRoaXMgdXNhYmxlIC0gdGhlcmUgbXVzdCBoYXZlIGJl
ZW4gTk8gd3JpdGUgYWNjZXNzIHRvIHRoZSBvcmlnaW4gCmJldHdlZW4gdGhlIG1vbWVudCB5b3Vy
IHNuYXBzaG90IHdhcyAnc3BsaXQnIGFuZCAncmVhdHRhY2hlZCcKYW5kIGl0J3MgZG9jdW1lbnRl
ZCBpbiAgJ21hbiBsdmNvbnZlcnQnCgoKPiBPciBob3cgY2FuIHRoZSBvYmplY3QgdmcvczEgYmUg
Y3JlYXRlZCBzbyB0aGF0IGl0IGNhbiBiZSByZWZlcmVuY2VkIHRvIGJ5IHRoZSAKPiBsdmNvbnZl
cnQgY29tbWFuZD8KPiBUaGUgZGlzayBpcyBmb3JtYXRlZMKgYXMgYSBDT1cgZGV2aWNlLCBhbmQg
Y29udGFpbnMgYWxsIG9mIHRoZSBkYXRhLgo+IFNvIGhvdyBoYXJkIGNhbiBpdCBiZSB0byBqdXN0
IHJlYXR0YWNoIHRoYXQgdm9sdW1lIHRvIGFuIGVtcHR5IG9yIGV4aXN0aW5nIExWIAo+IHZvbHVt
ZSBvbiB0aGUgc2VydmVyPwoKVGhlcmUgaXMgbm8gcHJvYmxlbSB3aXRoIHRoaXMgLSBob3dldmVy
IHlvdXIgIHByb3ZpZGVkIGNhc2UganVzdCBzaG93biB5b3UgCmhhdmUgdmVyeSBzbWFsbCBhbW91
bnQgb2YgZGF0YSBzdG9yZWQgaW4gc25hcHNob3QuCgpTbyB3aGlsZSBzbmFwc2hvdCBoYXMgbGFy
Z2Ugc2l6ZSAtIGl0J3MgYmVlbiBtb3N0bHkgdW5vY2N1cGllZCB3aXRoIGRhdGEgLSBzbyAKYW55
IG1lcmdlIGludG8gICdjbGVhbicgb3JpZ2luIGlzIGtpbmQgb2YgbWVhbmluZ2xlc3MgaW4gdGhp
cyBwYXJ0aWN1bGFyIGNhc2UuCgoKPiBJZiBpdCB3b3JrcyBvbiBzYW1lIHNlcnZlciwgd2h5IGNh
bid0IGl0IHdvcmsgb24gYW55IG90aGVyIG5ldyBzZXJ2ZXJzLCBhcyB0aGUgCj4gQ09XIGRldmlj
ZSBjb250YWlucyBBTEwgdGhlIGRhdGEgbmVlZGVkICh3ZSBtYWtlIHN1cmUgaXQgY29udGFpbnMg
YWxsIHRoZSBkYXRhKQo+IAo+IElmIHlvdSB3YW50IHRvIGdpdmUgaXQgYSB0cnksIGp1c3QgY3Jl
YXRlIGEgc25hcHNob3Qgb24gYSBzcGVjaWZpYyBkZXZpY2UKPiBBbmQgY2hhbmdlIGFsbCB0aGUg
YmxvY2tzIG9uIHRoZSBvcmlnaW4sIHRoZXJlIHlvdSBhcmUsIHlvdSBub3cgaGF2ZSBhIGNvdyAK
PiBkZXZpY2UgY29udGFpbmluZyBhbGwgZGF0YSBuZWVkZWQuCj4gSG93IHRvIG1vdmUgdGhpcyBz
bmFwc2hvdCBkZXZpY2UgdG8gYW5vdGhlciBzZXJ2ZXIsIHJlYXR0YWNoIGl0IHRvIGFuIGVtcHR5
IGx2IAo+IHZvbHVtZSBhcyBhIHNuYXBzaG90LgoKSSdtIGF3YXJlIGhvdyB0aGlzIHdvcmtzIC0g
YmVpbmcgbHZtMiBkZXZlbG9wZXIuLi4KCkknbSBqdXN0IHRyeWluZyB0byBleHBsYWluIHRoZXJl
IGlzIGJldHRlciBhbmQgc2ltcGxlciB3YXkgaG93IHRvIHJlYWNoIHlvdXIgCmdvYWwuCgpTaW1w
bHkgdGFrZSBhICd0aW1lIGNvbnNpc3RlbnQnIHNuYXBzaG90IG9mIHlvdXIgb3JpZ2luLgooU28g
aXQgZG9lcyBub3QgY2hhbmdlIHdoaWxlIHlvdSB0YWtlIGEgJ2RkJyBjb3B5KQoKVGFrZSBhICdE
RCcgY29weSBvZiBzdWNoIHN0YWJsZSBzbmFwc2hvdCB0byBhIG5ldyBMVi4KQW5kIHJlc3RvcmUg
dGhpcyAnY29waWVkJyBMViBvbiB5b3VyIDJuZC4gc2VydmVyLgoKSSBzaW1wbHkgZG9uJ3QgZm9s
bG93IHdoeSB3b3VsZCB5b3Ugd2FudCB0byBjb21wbGljYXRlIGFsbCBvZiB0aGlzIHdpdGggCnNu
YXBzaG90IG1lcmdpbmcgLSBtYWtlcyBubyBzZW5zZSBhbmQganVzdCBjYXVzZSBhIG1hc3NpdmUg
c2xvd2Rvd24uLi4uCgoKUmVnYXJkcwoKWmRlbmVrCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUBy
ZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1I
T1dUTy8=

