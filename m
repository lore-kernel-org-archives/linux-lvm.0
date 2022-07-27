Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6718CC04A68
	for <linux-lvm@archiver.kernel.org>; Wed, 27 Jul 2022 19:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658951821;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZSOB4Y+lDhcYUwhII/NhZmIuXJt80uN3ea6xK5ieSHY=;
	b=Mq4xHFe6kkc2mGps9aBjFW6SlP37J+PX+EZsUpXs2ylWqveqdIFcG3HJk/nq65hodrrbwf
	66QfDmlM66oucf4zezSK5NEnAPje/7W3Y9Pol8rFJUh0pC9l/LH7QPLFyCynNLvS1F9cF6
	jN49NaD2cwRmOAO+fW5JqaglD3rCzRA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-ReyUTnZvNPeA74Lrv2AdUg-1; Wed, 27 Jul 2022 15:56:59 -0400
X-MC-Unique: ReyUTnZvNPeA74Lrv2AdUg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C1B385A581;
	Wed, 27 Jul 2022 19:56:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0C6E492CA2;
	Wed, 27 Jul 2022 19:56:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 661261945DAC;
	Wed, 27 Jul 2022 19:56:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7FF921945DA7
 for <linux-lvm@listman.corp.redhat.com>; Wed, 27 Jul 2022 19:56:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 61B2A2166B29; Wed, 27 Jul 2022 19:56:32 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D5162166B26
 for <linux-lvm@redhat.com>; Wed, 27 Jul 2022 19:56:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41B35811E76
 for <linux-lvm@redhat.com>; Wed, 27 Jul 2022 19:56:32 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-oK4hO_8jNj64wzAgQyzdXA-1; Wed, 27 Jul 2022 15:56:30 -0400
X-MC-Unique: oK4hO_8jNj64wzAgQyzdXA-1
Received: by mail-ej1-f50.google.com with SMTP id bp15so33394963ejb.6
 for <linux-lvm@redhat.com>; Wed, 27 Jul 2022 12:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UOQJ+8qpo0+cuS0fh5D1devHAiy2YB6RjLu73ffnlK0=;
 b=0wEl18FJL8Ev09M2T1J25xhPGZMJzkU14YrPXNaM7f2Sn5Z7IdRLJREF077uqqyUrT
 Nm7pM08rqUXE1c7Czi1Kcf7ifWIvxpIaR71P2AEF0r42G4QudT+Q6FrV6HAS1ulC3Lu3
 PD6KW4Fy+njl0lyhb5jKsQCSoUmkb8VCzZp2IGQotWLS31JcUnWxDv4kylVztADp4cM4
 mUWpi8grJQBAtwbyiezbGDggaVnBhGS5bcOvGh0fMoar3ufeJkzbWbMDfy277ojbBoIa
 8aZ4+BHSsS4h7W+qyDqC63HfJFN1+Ho07Qp3H1yJ84tDO3z0MVhpPvWdlcFj85mhicBU
 wFQg==
X-Gm-Message-State: AJIora+ns/LFY7h3i6VJSnbN7ZtzFqVAxvMWpMAvLL5gAxEmux9JYgdo
 B/xNxk2fS5+yni6AU9t/T9gHYeawrRZgnA==
X-Google-Smtp-Source: AGRyM1vOnxBdPgW/BQd8bwMcgReuIMftJOJXfP4mW8t+B/indqCV2WTpbnrwl+WNOPO+5JSP6faFBg==
X-Received: by 2002:a17:906:d54d:b0:72f:9b43:a4bf with SMTP id
 cr13-20020a170906d54d00b0072f9b43a4bfmr19089925ejc.200.1658951788880; 
 Wed, 27 Jul 2022 12:56:28 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 ku7-20020a170907788700b007052b183d51sm7941846ejc.132.2022.07.27.12.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 12:56:28 -0700 (PDT)
Message-ID: <8097ecbe-75dc-876a-a029-5ce4f0a24c72@gmail.com>
Date: Wed, 27 Jul 2022 21:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Ken Bass <daytooner@gmail.com>
References: <CAH5g025eDd60jvU+_d7DLaPdsmK0TsNjB-jkewKg5FSNJMEmJw@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAH5g025eDd60jvU+_d7DLaPdsmK0TsNjB-jkewKg5FSNJMEmJw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [linux-lvm] Problem with partially activate logical volume
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDI1LiAwNy4gMjIgdiAxNjo0OCBLZW4gQmFzcyBuYXBzYWwoYSk6Cj4gKGZ3aXc6IEkgYW0g
bmV3IHRvIHRoaXMgbGlzdCwgc28gcGxlYXNlIGJlYXIgd2l0aCBtZS4pCj4gCj4gQmFja2dyb3Vu
ZDogSSBoYXZlIGEgdmVyeSBsYXJnZSAoMjBUQikgbG9naWNhbCB2b2x1bWUgY29uc2lzdGluZyBv
ZiAzIGRyaXZlcy4gCj4gT25lIG9mIHRob3NlIGRyaXZlcyB1bmV4cGVjdGVkbG95IGRpZWQgKGlz
bid0IHRoYXQgYWx3YXlzIHRoZSBjYXNlIDotKSkuIFRoZSAKPiBkcml2ZSB0aGF0IGZhaWxlZCBo
YXBwZW5lZCB0byBiZSB0aGUgbGFzdCBQVi4gU28gSSBhbSBhc3N1bWluZyB0aGF0IHRoZXJlIGlz
IAo+IHN0aWxsIDIvMyBvZiB0aGUgZGF0YSBzdGlsbCBpbnRhY3QgYW5kLCB0byBzb21lIGV4dGVu
dCwgcmVjb3ZlcmFibGUuIEFsdGhvdWdoLCAKPiBhcHBhcmVudGx5IHRoZSBleHQ0IGZzIGlzIG5v
dCByZWNvZ25pc2VkLgo+IAo+IEkgYWN0aXZhdGVkIHRoZSBMViBwYXJ0aWFsbHkgKHZpYSAtUCku
IEJ1dCBydW5uaW5nIGFueSB1dGlsaXR5IG9uIHRoYXQgKGVnOiAKPiBkdW1wZTJmcywgZTJmc2Nr
LCAuLi4pIEkgZ2V0IG1hbnkgb2YgdGhlc2XCoCBpbiBkbWVzZzoKPiAKPiAiQnVmZmVyIEkvTyBl
cnJvciBvbiBkZXYgZG0tMCwgbG9naWNhbCBibG9jayB4eHh4eHh4LCBhc3luYyBwYWdlIHJlYWQu
IsKgIFRoZSAKPiB0aGluZyBpcywgdGhlIHh4eHh4eHggYmxvY2sgaXMgb24gdGhlIG1pc3Npbmcg
ZHJpdmUvcHYuCj4gCj4gSSBoYXZlIGFsc28gdHJpZWQgc29tZSByZWNvdmVyeSBzb2Z0d2FyZSwg
YnV0IGV2ZW50dWFsbHkgZ2V0IHRoZXNlIHNhbWUgCj4gbWVzc2FnZXMsIGFuZCB0aGUgZGF0YSBy
ZWNvdmVyZWQgaXMgbm90IHJlYWxseSB1c2VmdWwuCj4gCj4gUGxlYXNlIGhlbHAhIEhvdyBjYW4g
SSBnZXQgcGFzc2VkIHRoYXQgZG1lc2cgZXJyb3IsIGFuZCBtb3ZlIG9uLiAxNFRCIAo+IHJlY292
ZXJlZCBpcyBiZXR0ZXIgdGhhbiAwLgoKCkxvb3Npbmcgc3VjaCBhIGxhcmdlIHBvcnRpb24gb2Yg
ZGV2aWNlIGlzIGFsd2F5cyBnb2luZyB0byBiZSBhIEJJRyBwcm9ibGVtLgpGaWxlc3lzdGVtIHNw
cmVhZHMgbWV0YWRhdGEgYWxsIG92ZXIgdGhlIHBsYWNlIC0gIEV4dFggaXMgc29tZXdoYXQgYmV0
dGVyIHRoZW4gCkJUcmVlIGJhc2VkIEZTIGxpa2UgIFhGUyxCVFJGUyBhbmQgbWF5IGdpdmUgeW91
IGxvdCBvZiB5b3VyIGRhdGEgYmFjay4KCkJ1dCB0aGF0J3Mgd2h5IHBlb3BsZSBzaG91bGQgbmV2
ZXIgdW5kZXJlc3RpbWF0ZSBob3cgaW1wb3J0YW50IGlzIHRvIGtlZXAgCnJlYXNvbmFibGUgZnJl
c2ggYmFja3VwcyBvZiB0aGVpciBkYXRhIC0gb3RoZXJ3aXNlIHNvb25lciBvciBsYXRlciB0aGVy
ZSBjb21lcyAKbGVzc29uIGxpa2UgdGhpcyBvbmUuCgpXaGF0IHlvdSBjb3VsZCB0cnkgaXMgdG8g
J2FkZCcgbmV3IFBWIHRvIFZHIGFuZCB1c2Ugc3BhY2UgZm9yIHRha2luZyBzbmFwc2hvdCAKb2Yg
eW91ciBMViB5b3Ugd2FudCB0byByZXBhaXIgLSBidXQgdGhpcyBpcyBzb21ld2hhdCBjb21wbGlj
YXRlZCBhcyB5b3UgbmVlZCAKdG8gJ2ZpeCcgVkcgZmlyc3QgLSB3aGljaCB3b3VsZCBpZGVhbGx5
IG5lZWQgdG8gaGF2ZSBzb21lIHNpemUgb2Ygc3RvcmFnZSB5b3UgCmp1c3QgbG9zdCAtIGJ1dCB0
aGlzIGdpdmVzIHlvdSB0aGVuIGZhaXJseSBlYXN5IHdheSBmb3J3YXJkLgoob25lIHdheSB0byBk
byB0aGlzIGlzIHRvIHVzZSBldmVuICd2aXJ0dWFsJyBzdG9yYWdlIG92ZXIgdGhlIGxvb3AgYmFj
ayBkZXZpY2UgCi0gYnV0IHRoYXQncyBmb3IgbGlrZWx5IHNraWxsZWQgYWRtaW4uKQoKTHZtMiBw
YXJ0aWFsIGFjdGl2YXRpb24gaXMgZGVzaWduZWQgdG8gYmUgdXNlZCBpbiBhIHdheSB0byBBQ1RJ
VkFURSBMViAtIGFuZCAKY29weSB0aGUgY29udGVudCB0byBiZXR0ZXIvc2FmZS9zZWN1cmUgbG9j
YXRpb24gYW5kIHRoZXJlIHN0YXJ0IHRvIHJlY292ZXIgdGhlIApzdG9yYWdlLgoKUmVwYWlyaW5n
IHN0b3JhZ2UgaW4tcGxhY2UgaXMgdXN1YWxseSBzdHJhaWdodCByb2FkIHRvIGhlbGwgLSBhcyB0
aGVyZSBjb3VsZCAKYmUgbnVtZXJvdXMgd2F5IG9mIHJlY292ZXJ5IHRvIHRyeSAtIGJ1dCBpZiB5
b3VyIDFzdC4gdHJ5IGFjdHVhbGx5IGRlc3Ryb3lzIApkYXRhIGV2ZW4gbW9yZSwgeW91IGNhbid0
IHJldHJ5IHdpdGggZGlmZmVyZW50IHN0cmF0ZWd5LgoKU28gZGVwZW5kaW5nIG9uIGhvdyBtdWNo
IG1vbmV5IGFuZCB0aW1lIHlvdSB3YW50IHRvIHB1dCBpbnRvIHJlY292ZXJ5IG9mIHlvdXIgCmRh
dGEgdGhlcmUgYXJlIHNldmVyYWwgZGlmZmVyZW50IHN0cmF0ZWdpZXMgcG9zc2libGUgIC0gY29u
c2lkZXJpbmcgc3RvcmFnZSAKc3BhY2UgaXMgcmVsYXRpdmVseSAnY2hlYXAnIGlmIHlvdXIgYXJl
IGRhdGEgYXJlIHJlYWxseSBpbXBvcnRhbnQuCgpSZWdhcmRzCgpaZGVuZWsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxp
c3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5v
cmcvSE9XVE8vTFZNLUhPV1RPLwo=

