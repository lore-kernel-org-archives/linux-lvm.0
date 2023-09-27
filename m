Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183B2E810BA
	for <linux-lvm@archiver.kernel.org>; Wed, 27 Sep 2023 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695809235;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wnzCAk9257hOMo3Ct9qEnlzrDlhSlX0WxQFS33VJkgM=;
	b=gb2mdKKSiX+bNMT5wGm2PWhWJ80UVTP0MZ5LjRVIgcucPylaMubUOv+uPM0AT+fXCmGbh9
	++YHSkQwORNdxQosFFqM1zRhNcRJp4dX50wFeTvRa7ty3JZLYK42UPTUzh3+5HkFcKhDLJ
	6P48giRxCcLwBEbPq3JxOFhPDLx4Ldo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-L7Px3XRsMOyelYR83G8N0w-1; Wed, 27 Sep 2023 06:07:11 -0400
X-MC-Unique: L7Px3XRsMOyelYR83G8N0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 432088007A4;
	Wed, 27 Sep 2023 10:07:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2093814026F4;
	Wed, 27 Sep 2023 10:07:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D6C3C194658D;
	Wed, 27 Sep 2023 10:07:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 144801946588
 for <linux-lvm@listman.corp.redhat.com>; Wed, 27 Sep 2023 09:58:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D0A15176C3; Wed, 27 Sep 2023 09:58:56 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C820C176E4
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 09:58:56 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A31911C068D4
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 09:58:56 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-AZQxuQ46OsKYOPQsjl8rMA-1; Wed, 27 Sep 2023 05:58:54 -0400
X-MC-Unique: AZQxuQ46OsKYOPQsjl8rMA-1
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5033918c09eso17099242e87.2
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 02:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695808733; x=1696413533;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UZqToMFDgebJ68x365PdEnfh4N2Yxnc+uYD/laqAho4=;
 b=QBE2OKx0NiOmMeZf9ZchIy58t1LeAFTBqxaVCSkGISOyugaFce0AFvPT8s5gY7g/Vl
 qbxio4yGpFc9Gw1Ef1QmikHoRall++MxyIvU/bLlx2HQWr6khuB6/n45JsxTYALZbJBG
 ldX/C4YIbRpdV6LN9lJ2oNLHVH29dos1U0b840npkfhrj0ipFmLtEk6v0LGvmy9AoROW
 w/F4It4hxMk5h2lNDLFQwiRQ3wtGJcS4BznbmbQEBP7VMdufy77he1GutZFrky2bjquF
 dX9hj92Bz/q5Nh20VBCnsiVUtTXfVihvBo9A0nNko/AA+C0jZ6ljoazvicqw5/BO/uw5
 S/xg==
X-Gm-Message-State: AOJu0YxaHO/XVoppdYI8eXgZXmGPIj083YN6Oai5fOZP22COVCoiTjvf
 7/tOuzuoq1tX2azaefwrgSAG5FNe9sivYA==
X-Google-Smtp-Source: AGHT+IFYbWYPYLXzjpme/MilCCKXf3qGteBr8+XG6v6JVSYa9u6XwizNc/AARCf+hcPFMdeuTkXYXg==
X-Received: by 2002:a05:6512:3f5:b0:503:3808:389a with SMTP id
 n21-20020a05651203f500b005033808389amr1094721lfq.11.1695808732459; 
 Wed, 27 Sep 2023 02:58:52 -0700 (PDT)
Received: from [10.43.17.103] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 dz12-20020a0564021d4c00b0052fdc837d93sm4697514edb.47.2023.09.27.02.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 02:58:52 -0700 (PDT)
Message-ID: <90d9a21d-f748-4ca1-b327-6c38f4440298@gmail.com>
Date: Wed, 27 Sep 2023 11:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Jean-Marc Saffroy <saffroy+redhat@gmail.com>
References: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
 <6e0faedf-f450-4454-a86b-6448a1b4747b@gmail.com>
 <CAM5YWZfL8zf9=re+VU2MiAQcYvXodqDV-08Zu5RkKUMfkDJ7Tg@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAM5YWZfL8zf9=re+VU2MiAQcYvXodqDV-08Zu5RkKUMfkDJ7Tg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [linux-lvm] Can I combine LUKS and LVM to achieve encryption
 and snapshots?
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, cs
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDI3LiAwOS4gMjMgdiAxOjEwIEplYW4tTWFyYyBTYWZmcm95IG5hcHNhbChhKToKPiBIaSwK
PiAKPiBPbiBUdWUsIFNlcCAyNiwgMjAyMyBhdCAxMDowMOKAr1BNIFpkZW5layBLYWJlbGFjCj4g
PHpkZW5lay5rYWJlbGFjQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IFllcCB0eXBpY2FsIHVzYWdlIGlz
IHRvIGVuY3J5cHQgdW5kZXJseWluZyBQViAtIGFuZCB0aGVuIGNyZWF0ZSBMVnMgYW5kIGl0cwo+
PiBzbmFwc2hvdHMgb24gZW5jcnlwdGVkIGRldmljZS4KPiAKPiBTdXJlLCBJJ2QgZG8gdGhhdCBp
biBvdGhlciBjaXJjdW1zdGFuY2VzLgo+IAo+IEJ1dCBpbiBteSBjYXNlIGl0IHdvdWxkIGp1c3Qg
YmUgYSB3YXN0ZTogSSBhbSByZXBsYWNpbmcgc2V2ZXJhbCBkaXNrcwo+IG9uIGEgZGVza3RvcCBj
b21wdXRlciB3aXRoIGEgc2luZ2xlIDJUQiBOVk1FIFNTRCBmb3IgZXZlcnl0aGluZy4gT25seQo+
IC9ob21lIG5lZWRzIHRvIGJlIGVuY3J5cHRlZCwgYW5kIGl0J3MgdGlueSwgbGlrZSAxMDAtMjAw
R0IuIEdvaW5nCj4gdGhyb3VnaCBlbmNyeXB0aW9uIGZvciBtb3N0IGFwcGxpY2F0aW9uIEkvT3Mg
d291bGQgdXNlIENQVSB0aW1lIGFuZAo+IGluY3JlYXNlIGxhdGVuY3kgd2l0aCBubyBiZW5lZml0
Lgo+IAo+IFNvIEkgcHJlZmVyIHRvIG1hbmFnZSBhdmFpbGFibGUgcmF3ICh1bi1lbmNyeXB0ZWQp
IHNwYWNlIHdpdGggTFZNLgo+IAo+IE5vdywgSSBhbHNvIG5lZWQgdG8gZG8gYmFja3VwcyBvZiAv
aG9tZSwgYW5kIHRoYXQncyB3aHkgSSB3YW50Cj4gc25hcHNob3RzLiBCdXQgdGhhdCBmaXJzdCBs
YXllciBvZiBMVk0gd291bGQgb25seSBzaG93IGEgc25hcHNob3Qgb2YKPiBhbiBlbmNyeXB0ZWQg
dm9sdW1lLCBhbmQgdGhlIGJhY2t1cCBqb2Igc2hvdWxkbid0IGhhdmUgdGhlIHBhc3NwaHJhc2UK
PiB0byBkZWNyeXB0IHRoZSB2b2x1bWUuCj4gCj4gV2hpY2ggaXMgd2h5IEknbSB0cnlpbmcgdG8g
ZmluZCBhIHdheSBvZiBkb2luZyBzbmFwaG90cyBvZiBhbiAib3BlbmVkIgo+IExVS1Mgdm9sdW1l
OiB0aGlzIHdheSwgdGhlIGJhY2t1cCBqb2IgY2FuIGRvIGl0cyBqb2Igd2l0aG91dCByZXF1aXJp
bmcKPiBhIHBhc3NwaHJhc2UuCgp3ZWxsIHRoYXQncyB3aGVyZSB5b3Ugd2lsbCBjb25zaWRlcmFi
bHkgJ2NvbXBsaWNhdGUnIHlvdXIgbGlmZSA6KQpBcyB5b3Ugd291bGQgbmVlZCB0byAnb3JjaGVz
dHJhY2UnIHRoaXMgeW91cnNlbGYgd2l0aCAnZG1zZXR1cCcgdXNhZ2UuCgpydW5uaW5nICdkbXNl
dHVwIHN1c3BlbmQnIG9uIHlvdXIgaG9tZSBkZXZpY2UsCnRoYXQgdGFraW5nIGEgc25hcHNob3Qg
b2YgeW91ciB1bmRlcmx5aW5nICBMVi4KCkhlcmUgdGhlIHVzYWdlIG9mICd0aGluLXBvb2wnIHdv
dWxkIHBvc3NpYmx5IGhlbHAgYSBsaXR0bGUgYml0IC0gYXMgeW91IGdldCBhIApjb250cm9sIG92
ZXIgd2hlbiBhIHNuYXBzaG90IExWIGFwcGVhcnMgaW4geW91ciBzeXN0ZW0uCgpPbmNlIHlvdSBo
YXZlIHRoZSBzbmFwc2hvdCBjcmVhdGVkIHlvdSAncmVzdW1lJyAgdGhlIHRvcC1sZXZlbApkZWNy
eXB0ZWQgdm9sdW1lLgoKVGhlbiBpZiB5b3Ugd2FudCB0byBhY2Nlc3MgeW91ciBzbmFwc2hvdCAt
IHlvdSBjcmVhdGUgYW5vdGhlciAnY3J5cHRvJyBkZXZpY2UgCi0gdW5sb2NrIGl0IGFnYWluIHdp
dGggeW91ciBrZXkgLSBhbmQgaXQgc2hvdWxkIHdvcmsuCgpCdXQgdGhlIGxldmVsIG9mIGNvbXBs
ZXhpdHkgaGVyZSBpcyByYXRoZXIgIGhpZ2ggLSB0aGlzIGl0IG1pZ2h0IGJlIGFjdHVhbGx5Cndh
eSBlYXNpZXIgdG8ganVzdCAncGFydGl0aW9uJyB5b3VyIGRldmljZSBmb3IgICdlbmNyeXB0ZWQn
ICBhbmQgdW5lY3J5cHRlZCcgCnBhcnRzIGFuZCB1c2UgMiBQVnMgZm9yIDIgVkdzLi4uLgoKPiBC
dXQgbXkgdGVzdHMgZG9uJ3QgdGVsbCBtZSBpZiB0aGVyZSBhcmUgb3RoZXIgcGVvcGxlIGRvaW5n
IHNpbWlsYXIKPiB0aGluZ3Mgb24gcHJvZHVjdGlvbiBzeXN0ZW1zLCBvciBpZiB0aGV5IGFyZSBo
YXBweSB3aXRoIHRoZSByZXN1bHRzLgo+IFVudXN1YWwgc2V0dXBzIHRlbmQgdG8gZXhoaWJpdCB1
bnVzdWFsIGJ1Z3MsIGFuZCBJIGFtIG5vdCBzdXBlciBmb25kCj4gb2YgYnVncyBpbiBteSBzdG9y
YWdlIHN5c3RlbXMuIDotKQoKWWVwIC0gcGVvcGxlIHByZWZlciBzaW1wbGUgcm9jayBzb2xpZCBz
b2x1dGlvbnMuLi4uClRoYXQncyB3aHkgdGhlIGFib3ZlIGRlc2NyaWJlIHNjZW5hcmlvcyBpcyBu
b3QgcmVhbGx5IHVzZWQuLi4uCkFzIHNvbHZpbmcgdGhlbiBhbGwgaW5kaXZpZHVhbCBlcnJvcnMg
dGhhdCBtYXkgYXBwZWFyIGlzIGZhciBmcm9tIGJlaW5nIHNpbXBsZS4KCgo+IEp1c3QgdGhlIG9u
ZSAvaG9tZSBpbiBteSBjYXNlLCBzbyBubyB3b3JzZSB0aGFuIHByb21wdGluZyBmb3IgdGhlCj4g
cGFzc3BocmFzZSBmb3IgYW4gZW50aXJlIGRpc2suCgpFdmVyeSBhY2Nlc3MgdG8gYSBzbmFwc2hv
dCBuZWVkcyB0aGVuIGEgbmV3IHNlcGFyYXRlICAndW5sb2NrJy4uCgo+PiBTcGVha2luZyBhYm91
dCBzbmFwc2hvdHMgLSB5b3Ugc2hvdWxkIGNvbnNpZGVyIHN3aXRjaGluZyB0byAndGhpbi1wb29s
cycgIGZvcgo+PiBmYXIgYmV0dGVyIHBlcmZvcm1hbmNlLi4uCj4gCj4gSSBvbmx5IG5lZWQgc25h
cHNob3RzIGZvciBiYWNrdXBzOiBvbmNlIGEgZGF5LCBjcmVhdGUgYSBzbmFwc2hvdCwKPiBtb3Vu
dCBpdCwgZG8gYSBmaWxlLWxldmVsIGluY3JlbWVudGFsIGJhY2t1cCwgdW5tb3VudCBpdCwgZGVs
ZXRlIGl0Lgo+IAo+IFdvdWxkIHRoZSB0aGluLXBvb2xzIG1ha2UgYSBkaWZmZXJlbmNlIGluIHRo
aXMgY2FzZT8KCldlbGwgdGhlcmUgYXJlIG1hbnkgd2F5cyBob3cgdG8gc2tpbiBhIGNhdC4uLgpJ
LmUuIGNoZWNrICBibGstYXJjaGl2ZSAgaHR0cHM6Ly9naXRodWIuY29tL2p0aG9ybmJlci9ibGst
YXJjaGl2ZQoKUmVnYXJkcwoKWmRlbmVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQu
Y29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZt
CnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

