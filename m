Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3654C3DA7D
	for <linux-lvm@archiver.kernel.org>; Thu,  5 Jan 2023 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672904799;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rT17PpKlBB5wPQaRkJZXydQ5oDxrB7NA5qjvVH9rqLU=;
	b=a4iUpk/h7nMrZB2J5l3Z/KhOHAeo5ISLyAFBMFwKBaB6z98vwfoaBllvc3Upe9i5jb+d7D
	C6uG6SdNA3aMue9l7sSZFOApVC5YlinCbX6ESPwGK2qVg1l8JkgMeEWaPZMAV8mTStTMDV
	0B0dp4IV8brVSD0pXmYkLiiWGr9VoCQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-Uvlg-RYhMcCjs-hGBtNyiQ-1; Thu, 05 Jan 2023 02:46:36 -0500
X-MC-Unique: Uvlg-RYhMcCjs-hGBtNyiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F3E38027FE;
	Thu,  5 Jan 2023 07:46:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1995553AA;
	Thu,  5 Jan 2023 07:46:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E04BA1946594;
	Thu,  5 Jan 2023 07:46:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 30654194658C
 for <linux-lvm@listman.corp.redhat.com>; Wed,  4 Jan 2023 16:12:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0E5D649BB6A; Wed,  4 Jan 2023 16:12:36 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0620C492D8B
 for <linux-lvm@redhat.com>; Wed,  4 Jan 2023 16:12:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE920858F09
 for <linux-lvm@redhat.com>; Wed,  4 Jan 2023 16:12:35 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-5NbbXfk8MKufZjDWHyDy1w-1; Wed, 04 Jan 2023 11:12:34 -0500
X-MC-Unique: 5NbbXfk8MKufZjDWHyDy1w-1
Received: by mail-pj1-f49.google.com with SMTP id
 c2-20020a17090a020200b00226c762ed23so292503pjc.5
 for <linux-lvm@redhat.com>; Wed, 04 Jan 2023 08:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=f6Q/tN81vqKrAeeN6DCFz1qGJbDj4dxGdKi3Jgc5yq0=;
 b=8LU+Yxc2eEjVN1d9wcWqd+T0QW9qD9cPETwGvpr3sPc5kjzCSQy1ilGyPbcCmUobo5
 N41Hg+jniusVqTV3VinE3F626ZKbojD7BaNNg1vYLoCZkaaYaiAfP01+p0qctr84mIzj
 TmBsqGoQFKIQjl3mWOJX9iXDkbp9gSa5O6I8Ae+/aeJYJcLnR0tp5hLDXf+0EMtHmtIl
 dQAD+s1IPw3++PCCtB33GjCDqHGH4ajRwt4aRa9tY1u01AyLUQr+7ptgtFliPBh+1l4t
 SMGWjVaIB/8Y2gMTLziv6i+5PN3gZyPahs4/K3qYcjKTaoD8Yfy1Pcp9Ks3UW4KSDlA3
 uS1w==
X-Gm-Message-State: AFqh2kqzsDF8nQvuYTYtFYUHoaMm1TR7HNUoOW+Lr86+ZxEuTYQ/49+2
 Up7HuQNhb3uiW/RxxoghuHzreamyUPkrM3t1
X-Google-Smtp-Source: AMrXdXsGLXCe4U1UwdlF8Kcj7SbLe8rDz70lnmYkW06g/EHj47DNyf9TUC+LdiqB/7GSkJZpxekrwQ==
X-Received: by 2002:a17:902:e74d:b0:189:6d2f:4bcd with SMTP id
 p13-20020a170902e74d00b001896d2f4bcdmr63898210plf.0.1672848753236; 
 Wed, 04 Jan 2023 08:12:33 -0800 (PST)
Received: from [10.4.126.217] ([139.177.225.231])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a170902b71100b001929568afe9sm14952895pls.306.2023.01.04.08.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 08:12:32 -0800 (PST)
Message-ID: <d2c5bef2-a418-049e-1ff8-160375881e90@bytedance.com>
Date: Thu, 5 Jan 2023 00:12:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
To: Zdenek Kabelac <zkabelac@redhat.com>,
 LVM general discussion and development <linux-lvm@redhat.com>
References: <eed877f5-53f5-101b-44ab-a61f1328e62f@bytedance.com>
 <930cea69-8e7a-d0df-a48c-93e7a668be2f@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <930cea69-8e7a-d0df-a48c-93e7a668be2f@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Thu, 05 Jan 2023 07:46:30 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGkgWmRlbmVrLAoKVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LgoKU25hcHNob3RzIG9mIHRoaW5s
diBhcmUgaW5kZWVkIG1vcmUgZWZmaWNpZW50IGNvbXBhcmVkIHRvIHN0YW5kYXJkIGx2LCAKdGhp
cyBpcyBiZWNhdXNlIGRhdGEgYmxvY2tzIGNhbiBiZSBzaGFyZWQgYmV0d2VlbiBzbmFwc2hvdCBh
bmQgb3JpZ2luYWwgCnRoaW5sdi4gQnV0IHRoZXJlIGlzIGFsc28gYSBwZXJmb3JtYW5jZSBsb3Nz
IGFmdGVyIHRoaW5sdiBjcmVhdGVzIGEgCnNuYXBzaG90LiBUaGlzIGlzIGJlY2F1c2UgdGhlIGZp
cnN0IHdyaXRlIHRvIHRoZSBzbmFwc2hvdHRlZCB0aGlubHYgCnJlcXVpcmVzIG5vdCBvbmx5IGFs
bG9jYXRpbmcgYSBuZXcgY2h1bmsgYnV0IGFsc28gY29weWluZyB0aGUgb2xkIGRhdGEuCgpIZXJl
IGFyZSBzb21lIHBlcmZvcm1hbmNlIGRhdGEgYW5kIGEgZGlzY3Vzc2lvbiBvZiB0aGUgdGhpbmx2
IHNuYXBzaG90OgoKaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vYXJjaGl2ZXMvbGludXgtbHZt
LzIwMjItSnVuZS8wMjYyMDAuaHRtbAoKUmVnYXJkcywKClpoaXlvbmcKCuWcqCAxLzQvMjMgMTA6
MDkgUE0sIFpkZW5layBLYWJlbGFjIOWGmemBkzoKPiBEbmUgMDQuIDAxLiAyMyB2IDk6MDAgWmhp
eW9uZyBZZSBuYXBzYWwoYSk6Cj4+IERlYXIgYWxsLAo+Pgo+PiBUaGUgY3VycmVudCBzdGFuZGFy
ZCBsdiBpbXBsZW1lbnRhdGlvbiBvZiBzbmFwc2hvdHMgaXMgQ09XIAo+PiAoQ29weS1vbi13cml0
ZSksIHdoaWNoIGNyZWF0ZXMgc25hcHNob3RzIHZlcnkgcXVpY2tseS4gSG93ZXZlciwgdGhlIAo+
PiBmaXJzdCB3cml0ZSBwZXJmb3JtYW5jZSBvZiB0aGUgb3JpZ2luYWwgbHYgd2lsbCBiZSBwb29y
IGFmdGVyIGNyZWF0aW5nIAo+PiBhIHNuYXBzaG90IGJlY2F1c2Ugb2YgQ09XLiBNb3Jlb3Zlciwg
dGhlIG1vcmUgc25hcHNob3RzIHRoZXJlIGFyZSwgdGhlIAo+PiB3b3JzZSB0aGUgcGVyZm9ybWFu
Y2Ugb2YgdGhlIG9yaWdpbmFsIGx2IHdpbGwgYmUuCj4+Cj4+IEkgdGVzdGVkIHRoZSByYW5kb20g
cmVhZC93cml0ZSBwZXJmb3JtYW5jZSB3aGVuIHRoZSBvcmlnaW5hbCBsdiB3YXMgCj4+IGNyZWF0
ZWQgd2l0aCBkaWZmZXJlbnQgbnVtYmVyIG9mIHNuYXBzaG90cy4gVGhlIGRhdGEgaXMgc2hvd24g
YmVsb3c6Cj4+IE51bWJlciBvZiBzbmFwc2hvdHPCoCBSYW5kcmVhZChpb3BzKcKgIFJhbmR3cml0
ZShpb3BzKQo+PiDCoMKgwqDCoMKgwqDCoMKgIDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMjE5ODnCoMKgwqDCoMKgwqDCoMKgwqDCoCAyMjAzNAo+PiDCoMKgwqDCoMKgwqDCoMKgIDHC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTAwNDjCoMKgwqDCoMKgwqDCoMKgwqDCoCAx
MDA0MQo+PiDCoMKgwqDCoMKgwqDCoMKgIDLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Njc3MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNjc3Mwo+PiDCoMKgwqDCoMKgwqDCoMKgIDPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNTM3NcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNTM3
OAo+Pgo+PiBUaGVyZSBhcmUgc2NlbmFyaW9zIHdoZXJlIHRoZSBwZXJmb3JtYW5jZSBvZiB0aGUg
b3JpZ2luYWwgbHYgaXMgbW9yZSAKPj4gZGVtYW5kaW5nLCBhbmQgdGhlIHNwZWVkIG9mIHNuYXBz
aG90IGNyZWF0aW9uIGlzIG5vdCBhcyBzdHJvbmcgYSAKPj4gcmVxdWlyZW1lbnQuIEJlY2F1c2Ug
aXQgaXMgdGhlIG9yaWdpbmFsIGx2IHRoYXQgd2lsbCBhY3R1YWxseSBiZSB1c2VkLCAKPj4gYW5k
IHRoZSBzbmFwc2hvdCBpcyBvbmx5IGEgc2Vjb25kYXJ5IGZ1bmN0aW9uLiBUaGVyZWZvcmUgc25h
cHNob3RzIAo+PiB1c2luZyB0aGUgQ09XIGFwcHJvYWNoIHdpbGwgbm90IG1lZXQgdGhlIG5lZWRz
IG9mIHRoaXMgc2NlbmFyaW8uCj4+Cj4+IFRoZXJlZm9yZSwgaXMgaXQgZmVhc2libGUgdG8gaW1w
bGVtZW50IGFub3RoZXIgd2F5IG9mIHRha2luZyAKPj4gc25hcHNob3RzPyBMZXQncyBzYXkgdGhl
IGZpcnN0IHNuYXBzaG90IGlzIGNyZWF0ZWQgYXMgYSBmdWxsIHNuYXBzaG90LCAKPj4gYW5kIGFs
bCBzdWJzZXF1ZW50IHNuYXBzaG90cyBhcmUgYmFzZWQgb24gaW5jcmVtZW50YWwgZGF0YSBmcm9t
IHRoZSAKPj4gcHJldmlvdXMgc25hcHNob3QuCj4gCj4gSGkKPiAKPiBIYXZlIHlvdSBwbGF5ZWQg
d2l0aCB0aGluIHByb3Zpc2lvbmluZyAtIGFzIHRoYXQncyB0aGUgYW5zd2VyIHRvIHRoZSAKPiBz
bG93IHNuYXBzaG90cy4KPiAKPiBSZWdhcmRzCj4gCj4gWmRlbmVrCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0
CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3Jn
L0hPV1RPL0xWTS1IT1dUTy8K

