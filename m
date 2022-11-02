Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13862C4332F
	for <linux-lvm@archiver.kernel.org>; Thu,  3 Nov 2022 07:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667462278;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UeNJP580BB+38fg7jyYy99abJvIzW515U1+CXS1n/eE=;
	b=S8K+H9J5R+WbksSP60OFIhgkwuWob3eaulMaF7EWDPkQKKDDi1BXhJxreEz2+K02iOvSll
	qPGXDNRNo8fqapOhzgZgeWN1yGvVCSOCuNOALvDjbpbWjiiSNaLsXPeA5JKR/JO6Juk26Z
	4jQxBoNEncEBBvBfMHTfIcMjJqUKliE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-mN57PqclNRmP00ZK3pwhXw-1; Thu, 03 Nov 2022 03:57:51 -0400
X-MC-Unique: mN57PqclNRmP00ZK3pwhXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4118F877CA0;
	Thu,  3 Nov 2022 07:57:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24F864EA49;
	Thu,  3 Nov 2022 07:56:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1577B1946A46;
	Thu,  3 Nov 2022 07:56:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DFCE01946594
 for <linux-lvm@listman.corp.redhat.com>; Wed,  2 Nov 2022 09:32:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D16DD492B33; Wed,  2 Nov 2022 09:32:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C937C492B32
 for <linux-lvm@redhat.com>; Wed,  2 Nov 2022 09:31:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07FE71C0754A
 for <linux-lvm@redhat.com>; Wed,  2 Nov 2022 09:31:58 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-427-HIwZ6rFUMSi3rZ-LauiwgA-1; Wed, 02 Nov 2022 05:31:56 -0400
X-MC-Unique: HIwZ6rFUMSi3rZ-LauiwgA-1
Received: by mail-pg1-f171.google.com with SMTP id 78so15720571pgb.13
 for <linux-lvm@redhat.com>; Wed, 02 Nov 2022 02:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AO95kiWN8lzWSd1UjwWl9Jf/KAjcfRg6IFRdtcdAcdo=;
 b=527vSY6s4WuOhrAwdw4p9Gx5gTtM2hWL2DWHgaGGoMTFx6lG1p902hi71oJS3bh/Fw
 j2SlCbnY0Y1vAaqTXTfUV71LbT5bZU0ftwo9NK25hlX3ZQnCs7G9HK356y/CyK6Q07Du
 L/Xo3Lk+Ym9ysQSHHG1sGB/WzKKXq4lwxIo9bOfZo6NjmZweoK341j2VOeoYZVtMt3X5
 m0oK73HvHw6IpP+0XqynMDT7DxYxss/R2DscTsFiFz+8+l6Vgd9+tgTXF9wFdxkhNF5L
 yCr8ZeQr4ifJXQ7c9mtNf/C3E4cHkjZPi/UgJ95EuRWWkAuS6kIeK7pNdmRo/clL3Wo8
 DCWQ==
X-Gm-Message-State: ACrzQf1cG6xCppXSaXKxC8yzV/kkXOwIm4rpJp3vL6pqnu3ioCC+g0h+
 e1Hw8BchjTI0cx9aVOajIiY85g==
X-Google-Smtp-Source: AMsMyM6iYBDUTUb9cURcituCVHHrA1XSdRkApHzND8+oxoY/W6FA/FJIB9DQZZe8AWTz9yVIpnhyzQ==
X-Received: by 2002:a65:6cc4:0:b0:412:35fa:5bce with SMTP id
 g4-20020a656cc4000000b0041235fa5bcemr20635161pgw.466.1667381515259; 
 Wed, 02 Nov 2022 02:31:55 -0700 (PDT)
Received: from [10.87.56.20] ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id
 a10-20020aa78e8a000000b0056281da3bcbsm8267745pfr.149.2022.11.02.02.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:31:54 -0700 (PDT)
Message-ID: <9452f78b-1396-efea-1040-05213cfb1a20@bytedance.com>
Date: Wed, 2 Nov 2022 17:31:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
To: Stuart D Gathman <stuart@gathman.org>,
 LVM general discussion and development <linux-lvm@redhat.com>
References: <4b031c4d-b83a-cc92-fabf-cc9cefb4e491@bytedance.com>
 <20221101144230.GA11193@redhat.com>
 <f7403695-5d43-cfea-31b9-70a58b93a0c0@gathman.org>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <f7403695-5d43-cfea-31b9-70a58b93a0c0@gathman.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGkgR2F0aG1hbiwKClRoYW5rIHlvdSBzbyBtdWNoIGZvciBzaGFyaW5nIHlvdXIgdXNhZ2Ugc2Nl
bmFyaW8sIGFuZCBJIGxlYXJuIGEgbG90IApmcm9tIHlvdXIgZXhwZXJpZW5jZS4KClJlZ2FyZHMh
CgpaaGl5b25nCgrlnKggMTEvMi8yMiAyOjA4IEFNLCBTdHVhcnQgRCBHYXRobWFuIOWGmemBkzoK
PiBaPiBPbiBUdWUsIE5vdiAwMSwgMjAyMiBhdCAwMTozNjoxN1BNICswODAwLCBaaGl5b25nIFll
IHdyb3RlOgo+Pj4gSSB3YW50IHRvIGltcGxlbWVudCBsaXZlIG1pZ3JhdGlvbiBvZiBWTXMgaW4g
dGhlIGx2bSArIGx2bWxvY2tkICsgCj4+PiBzYW5sb2NrCj4+PiBlbnZpcm9ubWVudC4gVGhlcmUg
YXJlIG11bHRpcGxlIGhvc3RzIGluIHRoZSBjbHVzdGVyIHVzaW5nIHRoZSBzYW1lIAo+Pj4gaXNj
c2kKPj4+IGNvbm5lY3Rpb24sIGFuZCB0aGUgVk1zIGFyZSBydW5uaW5nIG9uIHRoaXMgZW52aXJv
bm1lbnQgdXNpbmcgdGhpbmx2Cj4+PiB2b2x1bWVzLiBCdXQgaWYgd2FudCB0byBsaXZlIG1pZ3Jh
dGUgdGhlIHZtLCBpdCB3aWxsIGJlIGRpZmZpY3VsdCBzaW5jZQo+Pj4gdGhpbmx2IHdoaWNoIGZy
b20gdGhlIHNhbWUgdGhpbiBwb29sIGNhbiBvbmx5IGJlIGV4Y2x1c2l2ZSBhY3RpdmUgb24gb25l
Cj4+PiBob3N0Lgo+IAo+IEkganVzdCBleHBvc2UgdGhlIExWICh0aGluIG9yIG5vdCAtIEkgcHJl
ZmVyIG5vdCkgYXMgYW4gaVNDU0kgdGFyZ2V0Cj4gdGhhdCB0aGUgVk0gYm9vdHMgZnJvbS7CoCBU
aGVyZSBpcyBvbmx5IG9uZSBob3N0IHRoYXQgbWFuYWdlcyBhIHRoaW4gCj4gcG9vbCwgYW5kIHRo
YXQgaXMgYSBzaW5nbGUgcG9pbnQgb2YgZmFpbHVyZSwgYnV0IG5vIGxvY2tpbmcgaXNzdWVzLsKg
IFlvdQo+IGlzc3VlIHRoZSBMVk0gY29tbWFuZHMgb24gdGhlIGlTQ1NJIHNlcnZlciAod2hpY2gg
SSBndWVzcyB0aGV5IGNhbGwgTkFTCj4gdGhlc2UgZGF5cykuCj4gCj4gSWYgeW91IG5lZWQgYSB3
YXkgZm9yIGEgVk0gdG8gcmVxdWVzdCBlbmxhcmdpbmcgYW4gTFYgaXQgYWNjZXNzZXMsIG9yCj4g
c2ltaWxhciBpbnRlcmFjdGlvbiwgSSB3b3VsZCBtYWtlIGEgc2ltcGxlIEFQSSB3aGVyZSBlYWNo
IFZNIGdldHMgYQo+IHRva2VuIHRoYXQgZGV0ZXJtaW5lcyB3aGF0IExWcyBpdCBoYXMgYWNjZXNz
IHRvIGFuZCBob3cgbXVjaCB0b3RhbAo+IHN0b3JhZ2UgaXQgY2FuIGNvbnN1bWUuwqAgTWF5YmUg
c29tZW9uZSBoYXMgYWxyZWFkeSBkb25lIHRoYXQuCj4gSSBqdXN0IGlzc3VlIHRoZSBjb21tYW5k
cyBvbiB0aGUgTFZNL05BUy9pU0NTSSBob3N0Lgo+IAo+IEkgaGF2ZW4ndCBkb25lIHRoaXMsIGJ1
dCB0aGVyZSBjYW4gYmUgbW9yZSB0aGFuIG9uZSB0aGluIHBvb2wsIGVhY2ggb24KPiBpdCdzIG93
biBOQVMvaVNDU0kgc2VydmVyLsKgIFNvIGlmIG9uZSBzdG9yYWdlIHNlcnZlciBjcmFzaGVzLCB0
aGVuCj4gb25seSB0aGUgVk1zIGF0dGFjaGVkIHRvIGl0IGNyYXNoLsKgIFlvdSBjYW4gb25seSAo
c2ltcGx5KSBtaWdyYXRlIGEgVk0gCj4gdG8gYW5vdGhlciBWTSBob3N0IG9uIHRoZSBzYW1lIHN0
b3JhZ2Ugc2VydmVyLgo+IAo+IEJVVCwgeW91IGNhbiBtaWdyYXRlIGEgVk0gdG8gYW5vdGhlciBo
b3N0IGxlc3MgaW5zdGFudGx5IHVzaW5nIERSQkQKPiBvciBvdGhlciByZW1vdGUgbWlycm9yaW5n
IGRyaXZlci7CoCBJIGhhdmUgZG9uZSB0aGlzLsKgIFlvdSBnZXQgdGhlCj4gcmVtb3RlIExWIG1p
cnJvciBtb3N0bHkgc3luY2VkLCBzdXNwZW5kIHRoZSBWTSAodG8gYSBmaWxlIGlmIHlvdSBuZWVk
Cj4gdG8gcnN5bmMgdGhhdCB0byB0aGUgcmVtb3RlKSwgZmluaXNoIHRoZSBzeW5jIG9mIHRoZSBM
VihzKSwgcmVzdW1lIHRoZQo+IFZNIG9uIHRoZSBuZXcgc2VydmVyIC0gaW4gYW5vdGhlciBjaXR5
LsKgIEhhbmR5IHdoZW4geW91IGhhdmUgYSBmZXcgaG91cnMKPiBub3RpY2Ugb2YgYSBuYXR1cmFs
IGRpc2FzdGVyIChodXJyaWNhbmUvZmxvb2QpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVk
aGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9X
VE8vCg==

