Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2963EB64DD
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Aug 2023 12:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691585587;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W8wdpZjT/2WRUNb66SpOLPOyrK+XKZqEdE3ZE/Bkyfk=;
	b=SLIl9TxbS/ypytDo6AmsALm1hNFGVH+QABp7KFTzslUw5Try31pSJYFBaMaBDje+Z/Hb+3
	InDeSWpetpVcKIemK5ompwaFN5i0/WGijKw/tiLxDXjg6rrvtX0+DyOGN1fPf4dhPo2MnE
	oT2qCnHgujs383YbGXxsueBX6j5YYco=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-vfe36NlCN9StsT1htcCDAQ-1; Wed, 09 Aug 2023 08:53:04 -0400
X-MC-Unique: vfe36NlCN9StsT1htcCDAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 931D0381495F;
	Wed,  9 Aug 2023 12:53:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 324BF40C6F4E;
	Wed,  9 Aug 2023 12:52:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E6CFD1946595;
	Wed,  9 Aug 2023 12:52:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 59F991946589
 for <linux-lvm@listman.corp.redhat.com>; Wed,  9 Aug 2023 12:27:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 390E840C2077; Wed,  9 Aug 2023 12:27:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 319EA40C2076
 for <linux-lvm@redhat.com>; Wed,  9 Aug 2023 12:27:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 162EB185A78F
 for <linux-lvm@redhat.com>; Wed,  9 Aug 2023 12:27:57 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-GQSBMmcuNUahG2k-CEoWlQ-1; Wed, 09 Aug 2023 08:27:55 -0400
X-MC-Unique: GQSBMmcuNUahG2k-CEoWlQ-1
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-99bf9252eddso998480266b.3
 for <linux-lvm@redhat.com>; Wed, 09 Aug 2023 05:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691584073; x=1692188873;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hPmRDDTnrMDfO/BVDa4x82b5lx1cJ/DoSeWl3i5Qd7I=;
 b=grQ6Q73QGW0uOlZ+TNBn6Im3sEjfYfA/RkDu405BxHHK77TWJJuJaBf0mTNv5S9CUy
 gklKMt1a6hX2sTS3IRIDbYShJf5P6vh8fX6/3Ekufhg5IePsNMGem+JT7nNhVkmuRFqZ
 v0DDTXVA/fMQTpoWZZ3VW3WUePil4qcYtSnYwdw6rYtLHuIkExgSFAlReJuhX1i+K9sS
 ueothFgeChOhWS73fXdzbDU4ZL2/18epJMDNQfhn+TVgLih0CCLkhEMkYcfTQwsiG2LZ
 t2gH06R/GDTu3OukYa6b7cb8Z5y6VHzgTFPQWyQ6YIKupcuclhkEZO9i9VPaZpLmANLu
 6KGA==
X-Gm-Message-State: AOJu0YykbiY+gKHAj3AJV+HhDW7863r3AnMUgpr3HCC/Wx6gopDYLW5L
 phjd7eD3eEvNV34dAmMFUpoio+Pig1o=
X-Google-Smtp-Source: AGHT+IHrVMC+jcNK14Vv8Zv6+DeyMvXiYS1F84SZa65p99ynvtqa/dpo2YJq18HC/X4VghhrV+zOnA==
X-Received: by 2002:a17:906:2d4:b0:99b:66eb:2162 with SMTP id
 20-20020a17090602d400b0099b66eb2162mr2120788ejk.5.1691584073231; 
 Wed, 09 Aug 2023 05:27:53 -0700 (PDT)
Received: from [192.168.0.177] ([94.142.239.37])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a170906080500b00992ea405a79sm7936493ejd.166.2023.08.09.05.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 05:27:52 -0700 (PDT)
Message-ID: <accecfd1-d329-9306-94b0-cef460c9d1e7@gmail.com>
Date: Wed, 9 Aug 2023 14:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: LVM general discussion and development <linux-lvm@redhat.com>,
 =?UTF-8?B?56iL5pm65pif?= <zhixing@nj.iscas.ac.cn>
References: <c63bc8d.3c07c.1898fef021b.Coremail.zhixing@nj.iscas.ac.cn>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <c63bc8d.3c07c.1898fef021b.Coremail.zhixing@nj.iscas.ac.cn>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [linux-lvm] Problems encountered in compiling lvm packages
 using the musl Toolchain
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, cs
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDI2LiAwNy4gMjMgdiA0OjAyIOeoi+aZuuaYnyBuYXBzYWwoYSk6Cj4gaGnvvIxmcmllbmTv
vJoKPiAKPiBJIGVuY291bnRlcmVkIHRoZSBmb2xsb3dpbmcgcHJvYmxlbXMgd2hlbiBjb21waWxp
bmcgbHZtIHBhY2thZ2VzIHVzaW5nIHRoZSAKPiBtdXNsIFRvb2xjaGFpbjoKPiAKPiBRdWVzdGlv
biAxIO+8mgo+IAo+IHwgdmdpbXBvcnRkZXZpY2VzLmM6IEluIGZ1bmN0aW9uICd2Z2ltcG9ydGRl
dmljZXMnOgo+IHwgdmdpbXBvcnRkZXZpY2VzLmM6MTQ4OjMwOiBlcnJvcjogJ0xPQ0tfRVgnIHVu
ZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIAo+IGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuICdM
T0NLRUQnPwo+IHzCoCDCoDE0OCB8wqAgaWYgKCFsb2NrX2RldmljZXNfZmlsZShjbWQsIExPQ0tf
RVgpKSB7Cj4gfMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIF5+fn5+fn4KPiB8wqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgTE9DS0VECj4gfCB2Z2ltcG9ydGRldmljZXMuYzoxNDg6MzA6
IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgCj4gb25j
ZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCj4gCj4gQWJvdXQgTE9DS19FWCBkZWZp
bml0aW9uIGlzIGluIGZpbGUuaCwgSSBjYW4gY29tcGlsZSB0aGlzIHBhY2thZ2UgYnkgYWRkaW5n
IAo+IHRoaXMgSGVhZGVyIGZpbGUgaW4gdmdpbXBvcnRkZXZpY2VzLmM6Cj4gCj4gI2luY2x1ZGUg
PHN5cy9maWxlLmg+Cj4gCj4gQ291bGQgeW91IGFkZCB0aGlzIEhlYWRlciBmaWxlIHRvIG91ciBz
b3VyY2UgY29kZSB0byBmaXggdGhpcyBwcm9ibGVtIG9yIGRvIAo+IHlvdSBoYXZlIGEgYmV0dGVy
IHNvbHV0aW9uPwo+IAo+IAo+IExvb2tpbmcgZm9yd2FyZCB0byB5b3VyIHJlcGx5IQo+IAoKSGkK
CkNvbW1pdCBhMWExNDM5MjE1ZjU2MzM1YTA2YWU1YWM2Y2E3M2I1ZTBkNzM0NzYwIGhhcyBiZWVu
IGFkZGVkIHVwc3RyZWFtIEZlYiA3LgpTbyBwbGVhc2UgbWFrZSBzdXJlIHlvdSBhcmUgY29tcGls
aW5nIGxhdGVzdCB1cHN0cmVhbS4KCk5vdGU6IHJlY2VudGx5IHRoZSBnaXQgSEVBRCBoYXMgYmVl
biBtb3ZlZCB0byBodHRwczovL2dpdGxhYi5jb20vbHZtdGVhbS9sdm0yCmFsdGhvdWdoIHNvdXJj
ZXdhcmUgZ2l0IG1pcnJvciBzaG91bGQgYWxzbyB3b3JrLgoKUmVnYXJkcwoKWmRlbmVrCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFp
bGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDov
L3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

