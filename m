Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8D6C32771
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Aug 2022 15:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660750012;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CSmoovohEqjsRI44icsGgGdIw0jZS3DEI/8JiBb9HAk=;
	b=NMV22ck4h4Jy3jC9HlDoA3QBimDdbIGQADTNDefkHs9VLfbF048GHEzIPVjykAmgtSJHRf
	EyRH47u13RNrL355blQeFNaZjG0ki1Qm0MrLkzoxR4rkaDeV+w/vLjKS48Bj2H6gJjRi9p
	j9RMb9peFvcG+gpv+u7Z2txNvFXa8DM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-p0VlXXJ6P6KYZm9tp-dBXQ-1; Wed, 17 Aug 2022 11:26:50 -0400
X-MC-Unique: p0VlXXJ6P6KYZm9tp-dBXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B838880A0BF;
	Wed, 17 Aug 2022 15:26:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB50AC15BB8;
	Wed, 17 Aug 2022 15:26:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6BE38193F516;
	Wed, 17 Aug 2022 15:26:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4CE901946A40
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 15:26:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 40130492CA6; Wed, 17 Aug 2022 15:26:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C126492CA5
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 15:26:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 254F61824600
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 15:26:14 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-504-hDgQWTOXPZOPHDW7sgE7FQ-1; Wed, 17 Aug 2022 11:26:12 -0400
X-MC-Unique: hDgQWTOXPZOPHDW7sgE7FQ-1
Received: by mail-ed1-f47.google.com with SMTP id t5so17937696edc.11;
 Wed, 17 Aug 2022 08:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=TCNwwi8yEohIcTHsuXtEdJkJE8LV6g3vHsziFRveeFg=;
 b=HiCa5/woJ5CvEGspZfQ/D8dxEpNoNgpUpzhlXGYCQWLs9DmYovkv2vLkrclM1KGpbq
 k4yUd4yPfh+UYLvFGlSJxOknTcbPYOfLb/TJPVl13hynUOvfiXp/Zi6JhLAqnaR9W8o/
 7MALvmY4mfw3kZlMDfIS2fWScGa0Hnvqjr/lHxEPb/C3N5ZkHvOdA4ep9jhFHhd6oqJe
 XycJmZggnexdSd3DxjIIaHiZCPs4kaqcRCicSXi/4ZpMv4v1hAR0LtXP8UYVosTFVMhu
 KHPYGm9VvGkorsJBeC8N92zMDMSyexOGi5nIdhUBHtf0zTASCb0Qg6JN0ei5Z+YlBOQo
 uZ6A==
X-Gm-Message-State: ACgBeo2FCUKsNIchZsQCD4BHiRy8BVWiiCt2cIQ0IVVF+GZ7FGZoA2jI
 gYIACiRelhE37zFOnB14DJG4z64ZHCEdtA==
X-Google-Smtp-Source: AA6agR41ty7ddXJMk58gu5qO/qH4TgVP16Z/NGcHeE60SHeT2fhlwqxKU8shOmJ0c2I2GocLbh9Jiw==
X-Received: by 2002:a05:6402:2904:b0:445:f3a8:a917 with SMTP id
 ee4-20020a056402290400b00445f3a8a917mr1030324edb.183.1660749969429; 
 Wed, 17 Aug 2022 08:26:09 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 y15-20020aa7cccf000000b0043e581c30eesm10856669edt.31.2022.08.17.08.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 08:26:09 -0700 (PDT)
Message-ID: <6be41a4e-9764-03ba-7231-911c733ffecd@gmail.com>
Date: Wed, 17 Aug 2022 17:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
To: Martin Wilck <martin.wilck@suse.com>, Heming Zhao <heming.zhao@suse.com>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
 <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
 <20220817084343.33la7o6fdh5txul4@c73>
 <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
 <20220817104732.jhu3ug6ahep3rnpq@c73>
 <b36cd2879a9ccaf25d0bb0389291e331adcc68c6.camel@suse.com>
 <727dcd28-99a2-739b-debd-a921e477e0d3@gmail.com>
 <4e0551e18a28ff602fae6e419dc746145e5962d3.camel@suse.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <4e0551e18a28ff602fae6e419dc746145e5962d3.camel@suse.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [linux-lvm] lvmpolld causes high cpu load issue
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
Cc: "teigland@redhat.com" <teigland@redhat.com>,
 "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDE3LiAwOC4gMjIgdiAxNTo0MSBNYXJ0aW4gV2lsY2sgbmFwc2FsKGEpOgo+IE9uIFdlZCwg
MjAyMi0wOC0xNyBhdCAxNDo1NCArMDIwMCwgWmRlbmVrIEthYmVsYWMgd3JvdGU6Cj4+IERuZSAx
Ny4gMDguIDIyIHYgMTQ6MzkgTWFydGluIFdpbGNrIG5hcHNhbChhKToKPj4KPj4KPj4gTGV0J3Mg
bWFrZSBjbGVhciB3ZSBhcmUgdmVyeSB3ZWxsIGF3YXJlIG9mIGFsbCB0aGUgY29uc3RyYWlucwo+
PiBhc3NvY2lhdGVkIHdpdGgKPj4gdWRldiBydWxlIGxvZ2ljwqAgKGFuZCB3ZSB0cmllZCBxdWl0
ZSBoYXJkIHRvIG1pbmltaXplIGltcGFjdCAtCj4+IGhvd2V2ZXIgdWRldmQKPj4gZGV2ZWxvcGVy
cyBraW5kIG9mICdtaXN1bmRlcnN0b29kJ8KgIGhvdyBiYWRseSB0aGV5IHdpbGwgYmUgaW1wYWN0
aW5nCj4+IHN5c3RlbSdzCj4+IHBlcmZvcm1hbmNlIHdpdGggdGhlIGV4aXN0aW5nIHdhdGNoIHJ1
bGUgbG9naWMgLSBhbmQgdGhlIHN0b3J5IGtpbmQKPj4gb2YKPj4gJ2NvbnRpbnVlcycgd2l0aMKg
ICdzeXN0ZW1kJ3MnICYgZEJ1cyBzZXJ2aWNlcyB1bmZvcnR1bmF0ZWxseS4uLgo+IAo+IEkgZGlt
bHkgcmVtZW1iZXIgeW91IGRpc2xpa2UgdWRldiA7LSkKCldlbGwgaXQncyBub3QgJ2EgZGlzbGlr
ZScgZnJvbSBteSBzaWRlIC0gYnV0IHRoZSBhcmNoaXRlY3R1cmUgYWxvbmUgaXMganVzdCAKbWlz
c2luZyBpbiBtYW55IGFyZWFzLi4uCgpEYXZlIGlzIGEgY29tcGxldGUgZGlzbGlrZXIgb2YgdWRl
diAmIHN5c3RlbWQgYWxsIHRvZ2V0aGVyIDopLi4uLgoKCj4gCj4gSSBsaWtlIHRoZSBnZW5lcmFs
IGlkZWEgb2YgdGhlIHVkZXYgd2F0Y2guIEl0IGlzIHRoZSBtYWdpYyB0aGF0IGNhdXNlcwo+IG5l
d2x5IGNyZWF0ZWQgcGFydGl0aW9ucyB0byBtYWdpY2FsbHkgYXBwZWFyIGluIHRoZSBzeXN0ZW0s
IHdoaWNoIGlzCgpUcmFnZWR5IG9mIGRlc2lnbiBjb21lcyBmcm9tIHRoZSBwbGFpbiBmYWN0IHRo
YXQgdGhlcmUgYXJlIG9ubHkgJ3ZlcnkgCm9jY2FzaW9uYWwnIGNvbnN1bWVycyBvZiBhbGwgdGhl
c2UgJ2NvbGxlY3RlZCcgZGF0YSAtIGJ1dCBnYXRoZXJpbmcgYWxsIHRoZSAKaW5mbyBhbmQga2Vl
cGluZyBhbGwgb2YgaXQgJ3VwLXRvLWRhdGUnIGlzIGdldHRpbmcgdmVyeSB2ZXJ5IGV4cGVuc2l2
ZSBhbmQgY2FuIApiYXNpY2FsbHkgJ25ldXRyYWxpemUnIGEgbG90IG9mIHlvdXIgQ1BVIGlmIHlv
dSBoYXZlIHRvbyBtYW55IHJlc291cmNlcyB0byAKd2F0Y2ggYW5kIGtlZXAgdXBkYXRlLi4uLi4K
Cgo+IHZlcnkgY29udmVuaWVudCBmb3IgdXNlcnMgYW5kIHdvdWxkbid0IHdvcmsgb3RoZXJ3aXNl
LiBJIGNhbiBzZWUgdGhhdAo+IGl0IG1pZ2h0IGJlIGluYXBwcm9wcmlhdGUgZm9yIExWTSBQVnMu
IFdlIGNhbiBkaXNjdXNzIGNoYW5naW5nIHRoZQo+IHJ1bGVzIHN1Y2ggdGhhdCB0aGUgd2F0Y2gg
aXMgZGlzYWJsZWQgZm9yIExWTSBkZXZpY2VzIChib3RoIFBWIGFuZCBMVikuCgpJdCdzIHJlYWxs
eSBub3QgZml4YWJsZSBhcyBpcyAtIHNpbmNlIG9mIHRoZSBjb21wbGV0ZSBsYWNrIG9mICdlcnJv
cicgaGFuZGxpbmcgCm9mIGRldmljZSBpbiB1ZGV2IERCIChpLmUuIGR1cGxpY2F0ZSBkZXZpY2Vz
Li4uLiwgdmFyaW91cyBmcm96ZW4gZGV2aWNlcy4uLikKClRoZXJlIGlzIG9uIGdvaW5nICAnU0lE
JyBwcm9qZWN0IC0gdGhhdCBtaWdodCBwdXNoIHRoZSBsb2dpYyBzb21ld2hhdCBmdXJ0aGVyLCAK
YnV0IGV4aXN0aW5nICdkZXZpY2UnIHN1cHBvcnQgbG9naWMgYXMgaXMgdG9kYXkgaXMgdW5mb3J0
dW5hdGUgJ3RyYWNlJyBvZiBob3cgCnRoZSBkZXNpZ24gc2hvdWxkIG5vdCBoYXZlIGJlZW4gbWFk
ZSAtIGFuZCBzaW5jZSBhbGwgJ29yaWdpbmFsJyBwcm9ncmFtbWVycyAKbGVmdCB0aGUgcHJvamVj
dCBsb25nIHRpbWUgYWdvIC0gaXQncyBub24tdHJpdmlhbCB0byBwdXNoIHRoaW5ncyBmb3J3YXJk
LgoKPiBJIGRvbid0IGNsYWltIHRvIG92ZXJsb29rIGFsbCBwb3NzaWJsZSBzaWRlIGVmZmVjdHMs
IGJ1dCBpdCBtaWdodCBiZQo+IHdvcnRoIGEgdHJ5LiBJdCB3b3VsZCBtZWFuIHRoYXQgbmV3bHkg
Y3JlYXRlZCBMVnMsIExWIHNpemUgY2hhbmdlcyBldGMuCj4gd291bGQgbm90IGJlIHZpc2libGUg
aW4gdGhlIHN5c3RlbSBpbW1lZGlhdGVseS4gSSBzdXBwb3NlIHlvdSBjb3VsZAo+IHdvcmsgYXJv
dW5kIHRoYXQgaW4gdGhlIExWTSB0b29scyBieSB0cmlnZ2VyaW5nIGNoYW5nZSBldmVudHMgYWZ0
ZXIKPiBvcGVyYXRpb25zIGxpa2UgbHZjcmVhdGUuCgpXZSBqdXN0IGhvcGUgdGhlIFNJRCB3aWxs
IG1ha2Ugc29tZSBwcm9ncmVzcyAoYWx0aG91Z2ggcHJvYmFibHkgc21hbGwgb25lIGF0IAp0aGUg
YmVnaW5uaW5nKS4KCgo+PiBIb3dldmVyIGxldCdzIGZvY3VzIG9uICdwdm1vdmUnIGFzIGl0IGlz
IHBvdGVudGlhbGx5IHZlcnkgbGVuZ3RoeQo+PiBvcGVyYXRpb24gLQo+PiBzbyBpdCdzIG5vdCBm
ZWFzaWJsZSB0byBrZWVwIHRoZcKgIFZHIGxvY2tlZC9ibG9ja2VkwqAgYWNyb3NzIGFuCj4+IG9w
ZXJhdGlvbiB3aGljaAo+PiBtaWdodCB0YWtlIGV2ZW4gZGF5cyB3aXRoIHNsb3dlciBzdG9yYWdl
IGFuZCBiaWcgbW92ZWQgc2l6ZXMgKHdyaXRlCj4+IGFjY2Vzcy9sb2NrIGRpc2FibGVzIGFsbCBy
ZWFkZXJzLi4uKQo+IAo+IFNvIHRoZXNlIGNsb3NlLWFmdGVyLXdyaXRlIG9wZXJhdGlvbnMgYXJl
IGNhdXNlZCBieSBsb2NraW5nL3VubG9ja2luZwo+IHRoZSBQVnM/Cj4gCj4gTm90ZTogV2Ugd2Vy
ZSBvYnNlcnZpbmcgdGhhdCB3YXRjaCBldmVudHMgd2VyZSB0cmlnZ2VyZWQgZXZlcnkgMzBzLCBm
b3IKPiBldmVyeSBQViwgc2ltdWx0YW5lb3VzbHkuIChASGVtaW5nIGNvcnJlY3QgbWUgaWYgSSdt
biB3cm9uZyBoZXJlKS4KClRoYXQncyB3aHkgd2Ugd291bGQgbGlrZSB0byBzZWUgJ21ldGFkYXRh
JyBhbmQgYWxzbyBjaGVjayBpZiB0aGUgaXNzdWUgaXMgCmFwcGVhcmluZyBvbiB0aGUgbGF0ZXN0
IHZlcnNpb24gb2YgbHZtMi4KCgpaZGVuZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhh
dC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1s
dm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RP
Lwo=

