Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00A0C4332F
	for <linux-lvm@archiver.kernel.org>; Wed,  4 Jan 2023 14:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672841383;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rf4jxh6igsjAEIEFsSKvL2wU2z6UWdzzp4TFARwa2Bk=;
	b=jJh5KTiMcncqQwftY0YbaBHsKMYCnKsdMfwejlKpV9CYbsa/vccfNfbbggXXP5H5uu2kzP
	swTl0iTpy+3AJsGhvorjNMzGqbXaJHdO5DGmx3DNDE6H/BBSwVlyJR4DNmNAc2sEQwwrjp
	5paBW4c6C846VCoZZMfpjxVvy4nltQ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-j888mHwINqi0RGoACVCpcg-1; Wed, 04 Jan 2023 09:09:40 -0500
X-MC-Unique: j888mHwINqi0RGoACVCpcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7DF7801779;
	Wed,  4 Jan 2023 14:09:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6755B40C2064;
	Wed,  4 Jan 2023 14:09:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 36281194658D;
	Wed,  4 Jan 2023 14:09:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4FE291946589
 for <linux-lvm@listman.corp.redhat.com>; Wed,  4 Jan 2023 14:09:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3108D492D8B; Wed,  4 Jan 2023 14:09:34 +0000 (UTC)
Received: from [10.40.194.152] (ovpn-194-152.brq.redhat.com [10.40.194.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A72849BB6A;
 Wed,  4 Jan 2023 14:09:33 +0000 (UTC)
Message-ID: <930cea69-8e7a-d0df-a48c-93e7a668be2f@redhat.com>
Date: Wed, 4 Jan 2023 15:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Zhiyong Ye <yezhiyong@bytedance.com>
References: <eed877f5-53f5-101b-44ab-a61f1328e62f@bytedance.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <eed877f5-53f5-101b-44ab-a61f1328e62f@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [linux-lvm] The feasibility of implementing an alternative
 snapshot approach
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDA0LiAwMS4gMjMgdiA5OjAwIFpoaXlvbmcgWWUgbmFwc2FsKGEpOgo+IERlYXIgYWxsLAo+
IAo+IFRoZSBjdXJyZW50IHN0YW5kYXJkIGx2IGltcGxlbWVudGF0aW9uIG9mIHNuYXBzaG90cyBp
cyBDT1cgKENvcHktb24td3JpdGUpLCAKPiB3aGljaCBjcmVhdGVzIHNuYXBzaG90cyB2ZXJ5IHF1
aWNrbHkuIEhvd2V2ZXIsIHRoZSBmaXJzdCB3cml0ZSBwZXJmb3JtYW5jZSBvZiAKPiB0aGUgb3Jp
Z2luYWwgbHYgd2lsbCBiZSBwb29yIGFmdGVyIGNyZWF0aW5nIGEgc25hcHNob3QgYmVjYXVzZSBv
ZiBDT1cuIAo+IE1vcmVvdmVyLCB0aGUgbW9yZSBzbmFwc2hvdHMgdGhlcmUgYXJlLCB0aGUgd29y
c2UgdGhlIHBlcmZvcm1hbmNlIG9mIHRoZSAKPiBvcmlnaW5hbCBsdiB3aWxsIGJlLgo+IAo+IEkg
dGVzdGVkIHRoZSByYW5kb20gcmVhZC93cml0ZSBwZXJmb3JtYW5jZSB3aGVuIHRoZSBvcmlnaW5h
bCBsdiB3YXMgY3JlYXRlZCAKPiB3aXRoIGRpZmZlcmVudCBudW1iZXIgb2Ygc25hcHNob3RzLiBU
aGUgZGF0YSBpcyBzaG93biBiZWxvdzoKPiBOdW1iZXIgb2Ygc25hcHNob3RzwqAgUmFuZHJlYWQo
aW9wcynCoCBSYW5kd3JpdGUoaW9wcykKPiAgwqDCoMKgwqDCoMKgwqAgMMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAyMTk4OcKgwqDCoMKgwqDCoMKgwqDCoMKgIDIyMDM0Cj4gIMKgwqDC
oMKgwqDCoMKgIDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTAwNDjCoMKgwqDCoMKg
wqDCoMKgwqDCoCAxMDA0MQo+ICDCoMKgwqDCoMKgwqDCoCAywqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDY3NzDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDY3NzMKPiAgwqDCoMKgwqDCoMKg
wqAgM8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA1Mzc1wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA1Mzc4Cj4gCj4gVGhlcmUgYXJlIHNjZW5hcmlvcyB3aGVyZSB0aGUgcGVyZm9ybWFuY2Ug
b2YgdGhlIG9yaWdpbmFsIGx2IGlzIG1vcmUgCj4gZGVtYW5kaW5nLCBhbmQgdGhlIHNwZWVkIG9m
IHNuYXBzaG90IGNyZWF0aW9uIGlzIG5vdCBhcyBzdHJvbmcgYSByZXF1aXJlbWVudC4gCj4gQmVj
YXVzZSBpdCBpcyB0aGUgb3JpZ2luYWwgbHYgdGhhdCB3aWxsIGFjdHVhbGx5IGJlIHVzZWQsIGFu
ZCB0aGUgc25hcHNob3QgaXMgCj4gb25seSBhIHNlY29uZGFyeSBmdW5jdGlvbi4gVGhlcmVmb3Jl
IHNuYXBzaG90cyB1c2luZyB0aGUgQ09XIGFwcHJvYWNoIHdpbGwgbm90IAo+IG1lZXQgdGhlIG5l
ZWRzIG9mIHRoaXMgc2NlbmFyaW8uCj4gCj4gVGhlcmVmb3JlLCBpcyBpdCBmZWFzaWJsZSB0byBp
bXBsZW1lbnQgYW5vdGhlciB3YXkgb2YgdGFraW5nIHNuYXBzaG90cz8gTGV0J3MgCj4gc2F5IHRo
ZSBmaXJzdCBzbmFwc2hvdCBpcyBjcmVhdGVkIGFzIGEgZnVsbCBzbmFwc2hvdCwgYW5kIGFsbCBz
dWJzZXF1ZW50IAo+IHNuYXBzaG90cyBhcmUgYmFzZWQgb24gaW5jcmVtZW50YWwgZGF0YSBmcm9t
IHRoZSBwcmV2aW91cyBzbmFwc2hvdC4KCkhpCgpIYXZlIHlvdSBwbGF5ZWQgd2l0aCB0aGluIHBy
b3Zpc2lvbmluZyAtIGFzIHRoYXQncyB0aGUgYW5zd2VyIHRvIHRoZSBzbG93IApzbmFwc2hvdHMu
CgpSZWdhcmRzCgpaZGVuZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0
cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0
aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

