Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E37BC433FE
	for <linux-lvm@archiver.kernel.org>; Thu,  3 Nov 2022 07:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667462232;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mvKwpTxmabr8APEHjBNW3U8W05cus477o5pXHgFAIYc=;
	b=ENtxg1Py5xNl4g+Q4TifvjRdc53bR9ZGpDKMcPFyxjQjhYy+aMqjlWCjSsyKGXjwEeQTIG
	nxD5Qt48FbQDwajfQuIesCm0OJdd1jBvLzyEjwdIEcI9paDqrMVqba1yJ9PIZwVA46KZRn
	qlOF5jc4dFsEAQcxrRJpZkvB7rITJ2U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-4j7mYqXSNk2vd7_F1iGtuA-1; Thu, 03 Nov 2022 03:57:09 -0400
X-MC-Unique: 4j7mYqXSNk2vd7_F1iGtuA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A5F3C0F681;
	Thu,  3 Nov 2022 07:57:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 622734A927B;
	Thu,  3 Nov 2022 07:57:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 947401947061;
	Thu,  3 Nov 2022 07:56:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F3B261946594
 for <linux-lvm@listman.corp.redhat.com>; Wed,  2 Nov 2022 09:18:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B0DB4492B32; Wed,  2 Nov 2022 09:18:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8A72492B09
 for <linux-lvm@redhat.com>; Wed,  2 Nov 2022 09:18:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50BC629324A4
 for <linux-lvm@redhat.com>; Wed,  2 Nov 2022 09:18:21 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-jYpHpKBfOoGwfp0kGY2IBA-2; Wed, 02 Nov 2022 05:18:19 -0400
X-MC-Unique: jYpHpKBfOoGwfp0kGY2IBA-2
Received: by mail-pl1-f178.google.com with SMTP id p3so15989344pld.10
 for <linux-lvm@redhat.com>; Wed, 02 Nov 2022 02:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FKLPYZGf2U1hV2RM7V2eP6LAESl5+dLXTLyZLBR6Yx4=;
 b=gdk+ydVmnczox2EsXYzDEq8TujohVALGxUzaQcSflzA2t3J4JyR61KSwqLxbWaT3rt
 k/BuAa5c4TBvd6vLgYdtpow4D/E290JGtIsiRoBueZKYsk6o9NofiQfpIIb8ZmTUKXO3
 A/GzKm2qcY+Es4fb07P/yFFfZIzQNN5BllEDKYCd6ho4SM1/CAf4Xfkp1vaU3wD4xKOh
 t8Nx9URID4JIRzrXxs+3wNH2r6WVmUgBKiKE7zflhkzZIRZOtf0IE0pDwYEMkKL/zYSl
 mROgkv9YiitxPHqOIf1N2dBZhKM9Z+dlVXkBb6OCHjtPTUXbmR5iIhc4TWeLF+h7sQMu
 xvxw==
X-Gm-Message-State: ACrzQf35Vosw58B5d4I/tchCEN33qFwVdOCQJWqyexxzgObyKdEdvzGQ
 pMhBeGoOZtODtwpTT+VSaheVLw==
X-Google-Smtp-Source: AMsMyM7VY7zd1GRAQ/TRdPz7bLl1uKW7LOTyeBa0xetjkxyyamKGcVvqCFFbu98u3ejeWx8BwzXg2Q==
X-Received: by 2002:a17:902:b089:b0:178:54cf:d692 with SMTP id
 p9-20020a170902b08900b0017854cfd692mr23761314plr.1.1667380699359; 
 Wed, 02 Nov 2022 02:18:19 -0700 (PDT)
Received: from [10.87.56.20] ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a17090a348a00b0020d9df9610bsm1011057pjb.19.2022.11.02.02.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:18:18 -0700 (PDT)
Message-ID: <70f38528-1cfd-be50-d919-f301c78b9daa@bytedance.com>
Date: Wed, 2 Nov 2022 17:18:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 LVM general discussion and development <linux-lvm@redhat.com>
References: <4b031c4d-b83a-cc92-fabf-cc9cefb4e491@bytedance.com>
 <20221101144230.GA11193@redhat.com>
 <bd522c48-03df-1130-54af-bee8a58440f0@bytedance.com>
 <20221101175756.GB11193@redhat.com> <Y2FiO90/LQ/Pi3SN@itl-email>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <Y2FiO90/LQ/Pi3SN@itl-email>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Thu, 03 Nov 2022 07:56:52 +0000
Subject: Re: [linux-lvm] How to implement live migration of VMs in thinlv
 after using lvmlockd
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
Cc: damon.devops@gmail.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CkhpIERlbWksCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkhCgpVc2luZyB0aGluIHByb3Zpc2lv
bmluZyBvbiB0aGUgc3RvcmFnZSBzZXJ2ZXIgKFNBTikgc2lkZSB3b3VsZCBtYWtlIHRoZSAKcHJv
YmxlbSBtdWNoIGVhc2llciwgYnV0IG15IHNjZW5hcmlvIGlzIHRvIHN1cHBvcnQgZGlmZmVyZW50
IHR5cGVzIG9mIApTQU4sIHdoaWNoIG1lYW5zIHRoYXQgdGhlIFNBTiBtYXkgbm90IHN1cHBvcnQg
dGhpcyBmZWF0dXJlLgoK5ZyoIDExLzIvMjIgMjoxNSBBTSwgRGVtaSBNYXJpZSBPYmVub3VyIOWG
memBkzoKPiBPbiBUdWUsIE5vdiAwMSwgMjAyMiBhdCAxMjo1Nzo1NlBNIC0wNTAwLCBEYXZpZCBU
ZWlnbGFuZCB3cm90ZToKPj4gT24gV2VkLCBOb3YgMDIsIDIwMjIgYXQgMDE6MDI6MjdBTSArMDgw
MCwgWmhpeW9uZyBZZSB3cm90ZToKPj4+IEhpIERhdmUsCj4+Pgo+Pj4gVGhhbmsgeW91IGZvciB5
b3VyIHJlcGx5IQo+Pj4KPj4+IERvZXMgdGhpcyBtZWFuIHRoYXQgdGhlcmUgaXMgbm8gd2F5IHRv
IGxpdmUgbWlncmF0ZSBWTXMgd2hlbiB1c2luZyBsdm1sb2NrZD8KPj4KPj4gWW91IGNvdWxkIGJ5
IHVzaW5nIGxpbmVhciBMVnMsIG92aXJ0IGRvZXMgdGhpcyB1c2luZyBzYW5sb2NrIGRpcmVjdGx5
LAo+PiBzaW5jZSBsdm1sb2NrZCBhcnJpdmVkIGxhdGVyLgo+IAo+IEFub3RoZXIgYXBwcm9hY2gg
d291bGQgYmUgdG8gdXNlIHRoaW4gcHJvdmlzaW9uaW5nIG9uIHRoZSBTQU4gaW5zdGVhZCBvZgo+
IGF0IHRoZSBMVk0gbGV2ZWwuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0
dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQg
dGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

