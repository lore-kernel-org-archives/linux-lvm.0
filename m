Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB677C00144
	for <linux-lvm@archiver.kernel.org>; Mon,  1 Aug 2022 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659375254;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PhWo3C3K3cC6zZK/wC9bG/SvA8m8opXXx3Es/NkLjM0=;
	b=bKgYvHG5fmPn6Q4w7oI55jekR5iXaKlPg4mSz0x3lo1IIVspnqKG8oGXuU3FbeHt5BMoyt
	uVWtszodjEcU2dSVXvMoSzzuZ6xdHgJ2kw2KHOeexa4V9ZXDB+aDng+KdpQALUfdHyoiVi
	gmHVRBpO67BsQMUs/8X5wTyFFpTVeLs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-a65FFRojPu6Vn9oJKy2K8Q-1; Mon, 01 Aug 2022 13:34:13 -0400
X-MC-Unique: a65FFRojPu6Vn9oJKy2K8Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7F04802D1C;
	Mon,  1 Aug 2022 17:34:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0462403166;
	Mon,  1 Aug 2022 17:34:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AE6621946A48;
	Mon,  1 Aug 2022 17:34:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 359061946A40
 for <linux-lvm@listman.corp.redhat.com>; Mon,  1 Aug 2022 17:34:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1065940C1288; Mon,  1 Aug 2022 17:34:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C8CF403D0D0
 for <linux-lvm@redhat.com>; Mon,  1 Aug 2022 17:34:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E91B6823F0D
 for <linux-lvm@redhat.com>; Mon,  1 Aug 2022 17:34:08 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-BBR_rVKQOl2mEJd3m53aZw-1; Mon, 01 Aug 2022 13:34:07 -0400
X-MC-Unique: BBR_rVKQOl2mEJd3m53aZw-1
Received: by mail-ed1-f46.google.com with SMTP id z18so14666834edb.10
 for <linux-lvm@redhat.com>; Mon, 01 Aug 2022 10:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:reply-to:references:in-reply-to
 :content-transfer-encoding;
 bh=A8FHN1WvY1caycpNWw6fY1qieILlTKd+QVxB5T/Skcs=;
 b=HwGzTVPMaUEcBB8M908s6u3syGDJA5x9Com0RcENSdWM1fzMNyKBes4EdlYmS8er1E
 Ga/YVbh3nz0dcwL3U7hKgkwhz7Zdo3xcdKUEpETcbVl+mxuXVaJJJwgD3xhHap3LdvbB
 WpIf66wkpFL1XxELepWjXzphqP2JnbOqZx6WtuIFJY4J2sC9mcxACedv434TZy0I2TiP
 LuFvjae8dnpNl3yWM+bybKUOBkqD4p6XLmUc4FJx0Nj/0OoOLawH+Na49elPOG09oonk
 NkDEsqfQqy9atyhPtC83S6KOa91STiL87MPTojidFWJRd8QVQjqjf4ubKEg6BpyAFlSx
 nmqg==
X-Gm-Message-State: AJIora+dmPPJBsyEjEX4AUo54jNzUXYQeG2fPNgpu4n4+UZ8BHkcqFS5
 UXeP4Ec8WZo/zbQ4Gn+nLY/2gAha9hSQdA==
X-Google-Smtp-Source: AGRyM1uw07Q5Sd93Ugc72PwKGPeHrQHmkwt/mRG7mOBdFVW8V6FJLbTFcFRRc9VYXLqt15uu0/PmGw==
X-Received: by 2002:a05:6402:50c9:b0:43c:163a:4d5f with SMTP id
 h9-20020a05640250c900b0043c163a4d5fmr16819809edb.386.1659375245894; 
 Mon, 01 Aug 2022 10:34:05 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 fw16-20020a170907501000b007306d3c338dsm2057282ejc.164.2022.08.01.10.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 10:34:05 -0700 (PDT)
Message-ID: <17c7871a-0849-bd03-40b6-146e338e364e@gmail.com>
Date: Mon, 1 Aug 2022 19:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Thomas Deutschmann <whissi@whissi.de>
References: <000101d8a432$08688fe0$1939afa0$@whissi.de>
 <d73e7506-a754-55d0-734f-084ffda1d6f2@gmail.com>
In-Reply-To: <d73e7506-a754-55d0-734f-084ffda1d6f2@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [linux-lvm] lvcreate hangs forever during snapshot creation
 when suspending volume
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDAxLiAwOC4gMjIgdiAxOToyOSBaZGVuZWsgS2FiZWxhYyBuYXBzYWwoYSk6Cj4gRG5lIDMw
LiAwNy4gMjIgdiAxODozMyBUaG9tYXMgRGV1dHNjaG1hbm4gbmFwc2FsKGEpOgo+PiBIaSwKPj4K
Pj4gd2hpbGUgdHJ5aW5nIHRvIGJhY2t1cCBhIERlbGwgUjc1MjUgc3lzdGVtIHJ1bm5pbmcKPj4g
RGViaWFuIGJvb2t3b3JtL3Rlc3RpbmcgdXNpbmcgTFZNIHNuYXBzaG90cyBJIG5vdGljZWQgdGhh
dCB0aGUgc3lzdGVtCj4+IHdpbGwgJ2ZyZWV6ZScgc29tZXRpbWVzIChub3QgYWxsIHRoZSB0aW1l
cykgd2hlbiBjcmVhdGluZyB0aGUgc25hcHNob3QuCj4+IFRvIHJlY292ZXIgZnJvbSB0aGlzLCBh
IHBvd2VyIGN5Y2xlIGlzIHJlcXVpcmVkLgo+Pgo+PiBJcyB0aGlzIGEgcHJvYmxlbSBjYXVzZWQg
YnkgTFZNIG9yIGEga2VybmVsIGlzc3VlPwo+Pgo+PiBUaGUgY29tbWFuZCBJIHJ1bjoKPj4KPj4g
wqDCoCAvdXNyL3NiaW4vbHZjcmVhdGUgXAo+PiDCoMKgIC12dnZ2diBcCj4+IMKgwqAgLS1zaXpl
IDEwMEcgXAo+PiDCoMKgIC0tc25hcHNob3QgL2Rldi9tYXBwZXIvZGV2RGF0YVN0b3JlMS12b2xN
YWNoaW5lcyBcCj4+IMKgwqAgLS1uYW1lIHZvbE1hY2hpbmVzX3NuYXAKPj4KPj4gVGhlIGxhc3Qg
NCBsaW5lczoKPj4+IFtTYXQgSnVsIDMwIDE2OjMxOjM0IDIwMjJdIGRlYnVnZnM6IERpcmVjdG9y
eSAnZG0tNCcgd2l0aCBwYXJlbnQgJ2Jsb2NrJyAKPj4+IGFscmVhZHkgcHJlc2VudCEKPj4+IFtT
YXQgSnVsIDMwIDE2OjMxOjM0IDIwMjJdIGRlYnVnZnM6IERpcmVjdG9yeSAnZG0tNycgd2l0aCBw
YXJlbnQgJ2Jsb2NrJyAKPj4+IGFscmVhZHkgcHJlc2VudCEKPj4+IFtTYXQgSnVsIDMwIDE2OjM0
OjU1IDIwMjJdIElORk86IHRhc2sgbWFyaWFkYmQ6MTYwNyBibG9ja2VkIGZvciBtb3JlIHRoYW4g
Cj4+PiAxMjAgc2Vjb25kcy4KPj4+IFtTYXQgSnVsIDMwIDE2OjM0OjU1IDIwMjJdwqDCoMKgwqDC
oMKgIE5vdCB0YWludGVkIDUuMTguMC0yLWFtZDY0ICMxIERlYmlhbiA1LjE4LjUtMQo+Pj4gW1Nh
dCBKdWwgMzAgMTY6MzQ6NTUgMjAyMl0gImVjaG8gMCA+IAo+Pj4gL3Byb2Mvc3lzL2tlcm5lbC9o
dW5nX3Rhc2tfdGltZW91dF9zZWNzIiBkaXNhYmxlcyB0aGlzIG1lc3NhZ2UuCj4+PiBbU2F0IEp1
bCAzMCAxNjozNDo1NSAyMDIyXSB0YXNrOm1hcmlhZGJkwqDCoMKgwqDCoMKgwqAgc3RhdGU6RCBz
dGFjazrCoMKgwqAgMCBwaWQ6IAo+Pj4gMTYwNyBwcGlkOsKgIDEyODkgZmxhZ3M6MHgwMDAwMDAw
MAo+Pj4gW1NhdCBKdWwgMzAgMTY6MzQ6NTUgMjAyMl0gQ2FsbCBUcmFjZToKPj4+IFtTYXQgSnVs
IDMwIDE2OjM0OjU1IDIwMjJdwqAgPFRBU0s+Cj4+PiBbU2F0IEp1bCAzMCAxNjozNDo1NSAyMDIy
XcKgIF9fc2NoZWR1bGUrMHgzMGIvMHg5ZTAKPj4+IFtTYXQgSnVsIDMwIDE2OjM0OjU1IDIwMjJd
wqAgc2NoZWR1bGUrMHg0ZS8weGIwCj4+PiBbU2F0IEp1bCAzMCAxNjozNDo1NSAyMDIyXcKgIHBl
cmNwdV9yd3NlbV93YWl0KzB4MTEyLzB4MTMwCj4+PiBbU2F0IEp1bCAzMCAxNjozNDo1NSAyMDIy
XcKgID8gX19wZXJjcHVfcndzZW1fdHJ5bG9jay5wYXJ0LjArMHg3MC8weDcwCj4+PiBbU2F0IEp1
bCAzMCAxNjozNDo1NSAyMDIyXcKgIF9fcGVyY3B1X2Rvd25fcmVhZCsweDVlLzB4ODAKPj4+IFtT
YXQgSnVsIDMwIDE2OjM0OjU1IDIwMjJdwqAgaW9fd3JpdGUrMHgyZTkvMHgzMDAKPj4+IFtTYXQg
SnVsIDMwIDE2OjM0OjU1IDIwMjJdwqAgPyBfcmF3X3NwaW5fbG9jaysweDEzLzB4MzAKPj4+IFtT
YXQgSnVsIDMwIDE2OjM0OjU1IDIwMjJdwqAgPyBuZXdpZGxlX2JhbGFuY2UrMHgyNmEvMHg0MDAK
Pj4+IFtTYXQgSnVsIDMwIDE2OjM0OjU1IDIwMjJdwqAgPyBmZ2V0KzB4N2MvMHhiMAo+Pj4gW1Nh
dCBKdWwgMzAgMTY6MzQ6NTUgMjAyMl3CoCBpb19pc3N1ZV9zcWUrMHg0N2MvMHgyNTUwCj4+PiBb
U2F0IEp1bCAzMCAxNjozNDo1NSAyMDIyXcKgID8gc2VsZWN0X3Rhc2tfcnFfZmFpcisweDE3NC8w
eDEyNDAKPj4+IFtTYXQgSnVsIDMwIDE2OjM0OjU1IDIwMjJdwqAgPyBocnRpbWVyX3RyeV90b19j
YW5jZWwrMHg3OC8weDExMAo+Pj4gW1NhdCBKdWwgMzAgMTY6MzQ6NTUgMjAyMl3CoCBpb19zdWJt
aXRfc3FlcysweDNjZS8weDFhYTAKPj4+IFtTYXQgSnVsIDMwIDE2OjM0OjU1IDIwMjJdwqAgPyBf
cmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUrMHgyMy8weDQwCj4+PiBbU2F0IEp1bCAzMCAxNjoz
NDo1NSAyMDIyXcKgID8gd2FrZV91cF9xKzB4NGEvMHg5MAo+Pj4gW1NhdCBKdWwgMzAgMTY6MzQ6
NTUgMjAyMl3CoCA/IF9fZG9fc3lzX2lvX3VyaW5nX2VudGVyKzB4NTY1LzB4YTYwCj4+PiBbU2F0
IEp1bCAzMCAxNjozNDo1NSAyMDIyXcKgIF9fZG9fc3lzX2lvX3VyaW5nX2VudGVyKzB4NTY1LzB4
YTYwCj4+PiBbU2F0IEp1bCAzMCAxNjozNDo1NSAyMDIyXcKgIGRvX3N5c2NhbGxfNjQrMHgzYi8w
eGMwCj4+PiBbU2F0IEp1bCAzMCAxNjozNDo1NSAyMDIyXcKgIGVudHJ5X1NZU0NBTExfNjRfYWZ0
ZXJfaHdmcmFtZSsweDQ0LzB4YWUKPj4+IFtTYXQgSnVsIDMwIDE2OjM0OjU1IDIwMjJdIFJJUDog
MDAzMzoweDdmMDViOTAyMjliOQo+Pj4gW1NhdCBKdWwgMzAgMTY6MzQ6NTUgMjAyMl0gUlNQOiAw
MDJiOjAwMDA3ZWZmOGU5ZWZhMzggRUZMQUdTOiAwMDAwMDIxNiAKPj4+IE9SSUdfUkFYOiAwMDAw
MDAwMDAwMDAwMWFhCj4+PiBbU2F0IEp1bCAzMCAxNjozNDo1NSAyMDIyXSBSQVg6IGZmZmZmZmZm
ZmZmZmZmZGEgUkJYOiAwMDAwNTYxYzQyNGYxZDE4IFJDWDogCj4+PiAwMDAwN2YwNWI5MDIyOWI5
Cj4+PiBbU2F0IEp1bCAzMCAxNjozNDo1NSAyMDIyXSBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJ
OiAwMDAwMDAwMDAwMDAwMDAxIFJESTogCj4+PiAwMDAwMDAwMDAwMDAwMDA5Cj4+PiBbU2F0IEp1
bCAzMCAxNjozNDo1NSAyMDIyXSBSQlA6IDAwMDA3ZWZmOGU5ZWZhOTAgUjA4OiAwMDAwMDAwMDAw
MDAwMDAwIFIwOTogCj4+PiAwMDAwMDAwMDAwMDAwMDA4Cj4+PiBbU2F0IEp1bCAzMCAxNjozNDo1
NSAyMDIyXSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAwMDAwMjE2IFIxMjog
Cj4+PiAwMDAwNTYxYzQyNTAwOTM4Cj4+PiBbU2F0IEp1bCAzMCAxNjozNDo1NSAyMDIyXSBSMTM6
IDAwMDA3ZjA1Yjk4MjFjMDAgUjE0OiAwMDAwNTYxYzQyNTAwOWUwIFIxNTogCj4+PiAwMDAwNTYx
YzQyNGYxZDE4Cj4+PiBbU2F0IEp1bCAzMCAxNjozNDo1NSAyMDIyXcKgIDwvVEFTSz4KPj4+IFtT
YXQgSnVsIDMwIDE2OjM0OjU1IDIwMjJdIElORk86IHRhc2sgbWFyaWFkYmQ6OTk1NSBibG9ja2Vk
IGZvciBtb3JlIHRoYW4gCj4+PiAxMjAgc2Vjb25kcy4KPj4+IFtTYXQgSnVsIDMwIDE2OjM0OjU1
IDIwMjJdwqDCoMKgwqDCoMKgIE5vdCB0YWludGVkIDUuMTguMC0yLWFtZDY0ICMxIERlYmlhbiA1
LjE4LjUtMQo+Pj4gW1NhdCBKdWwgMzAgMTY6MzQ6NTUgMjAyMl0gImVjaG8gMCA+IAo+Pj4gL3By
b2Mvc3lzL2tlcm5lbC9odW5nX3Rhc2tfdGltZW91dF9zZWNzIiBkaXNhYmxlcyB0aGlzIG1lc3Nh
Z2UuCj4+PiBbU2F0IEp1bCAzMCAxNjozNDo1NSAyMDIyXSB0YXNrOm1hcmlhZGJkwqDCoMKgwqDC
oMKgwqAgc3RhdGU6RCBzdGFjazrCoMKgwqAgMCBwaWQ6IAo+Pj4gOTk1NSBwcGlkOsKgIDEyODkg
ZmxhZ3M6MHgwMDAwMDAwMAo+Pj4gW1NhdCBKdWwgMzAgMTY6MzQ6NTUgMjAyMl0gQ2FsbCBUcmFj
ZToKPj4+IFtTYXQgSnVsIDMwIDE2OjM0OjU1IDIwMjJdwqAgPFRBU0s+Cj4+PiBbLi4uXQo+Pgo+
PiBUaGUgbWVzc2FnZSAibWFyaWFkYmQ6MTYwNyBibG9ja2VkIGZvciBtb3JlIHRoYW4gMTIwIHNl
Y29uZHMiIHdpbGwgcmVwZWF0Lgo+Pgo+PiBNYXJpYURCIGl0c2VsZiBpcyBydW5uaW5nIGluIGEg
c3lzdGVtZC1uc3Bhd24gY29udGFpbmVyLiBUaGUgY29udGFpbmVyCj4+IHN0b3JhZ2UgaXMgbG9j
YXRlZCBvbiB0aGUgdm9sdW1lIGZvciB3aGljaCBzbmFwc2hvdCBjcmVhdGlvbiB3aWxsIGhhbmcu
Cj4gCj4gCj4gSGkKPiAKPiAKPiBMdm0yIGlzICpOT1QqIHN1cHBvcnRlZCB0byBiZSB1c2VkIHdp
dGhpbiBjb250YWluZXJzIQo+IAo+IFRoaXMgcmVxdWlyZXMgc29tZSB2ZXJ5IHNwZWNpZmljICdz
eXN0ZW0nIG1vZGlmaWNhdGlvbiBhbmQgaXRzIGluIG92ZXJhbCB2ZXJ5IAo+IHByb2JsZW1hdGlj
IC0gc28gcnVsZSAjMSBpcyAtIGFsd2F5cyBydW4gbHZtMiBjb21tYW5kIG9uIHlvdXIgaG9zdGlu
ZyBtYWNoaW5lLgo+IAo+IAo+IE5vdyAtIHlvdSBzdWdnZXN0cyB5b3UgYXJlIGFibGUgdG8gcmVw
cm9kdWNlIHRoaXMgaXNzdWUgYWxzbyBvbiB5b3VyIGJhcmUgCj4gbWV0YWwgaHcgLSBpbiB0aGlz
IGNhc2UgcnVuIHRoZXNlIDMgY29tbWFuZHPCoCBiZWZvcmXCoCAnbHZjcmVhdGUnCj4gCj4gCj4g
IyBkbXNldHVwIHRhYmxlCj4gIyBkbXNldHVwIGluZm8gLWMKPiAjIGRtc2V0dXAgbHMgLS10cmVl
Cj4gCj4gIyBsdmNyZWF0ZSAuLi4uCj4gCj4gSWYgaXQgYmxvY2tzIHRha2UgYWdhaW4gdGhlc2U6
Cj4gIyBkbXNldHVwIHRhYmxlCj4gIyBkbXNldHVwIGluZm8gLWMKPiAjIGRtc2V0dXAgbHMgLS10
cmVlCj4gCj4gCj4gWW91ICdsdmNyZWF0ZSAtdnZ2difCoCAmICdkbWVzZycgdHJhY2Ugc2ltcGx5
IHN1Z2dlc3QgdGhhdCBzeXN0ZW0gaXMgd2FpdGluZyB0byAKPiBmdWxmaWxswqAgJ2ZzZnJlZXpl
J8KgIG9wZXJhdGlvbiAtIGl0J3MgdW5jbGVhciB3aHkgaXQgY2Fubm90IGJlIGZpbmlzaGVkIC0g
Cj4gbWF5YmUgc29tZSBwcm9ibGVtIHdpdGggeW91ciAncmFpZCcgYXJyYXkgPz8KPiAKPiBTbyBm
YXIgSSBkbyBub3Qgc2VlIGFueSBidWcgb24gbHZtMiBzaWRlIC0gYWxsIHdvcmtzIGZyb20gbHZt
MiBzaWRlIGFzIAo+IGV4cGVjdGVkIC0gaG93ZXZlciBpdCdzIHVuY2xlYXIgd2h5IHlvdXIgJ3Jh
aWQnIGlzIHNvIHNsb3cgPwo+IAo+IE5vdGU6IHlvdSBjb3VsZCBhbHdheXMgJ2V4cGVyaW1lbnQn
IHdpdGhvdXQgbHZtMiBpbiB0aGUgcGljdHVyZSAtCj4geW91IGNhbiByYW7CoMKgICdmc2ZyZWV6
ZSAtLWZyZWV6ZXwtLXVuZnJlZXplJ8KgIHlvdXJzZWxmIC0gdG8gc2VlIHdoZXRoZXIgZXZlbiAK
PiB0aGlzIGNvbW1hbmQgaXMgYWJsZSB0byBmaW5pc2jCoCA/Cj4gCj4gTm90ZTI6IGlmIHlvdSBz
eXN0ZW0gaGFzIGxvdHMgb2YgJ2RpcnR5JyBwYWdlcyAtIGl0IG1heSBwb3RlbnRpYWxseSB0YWtl
IGEgbG90IAo+IG9mIHRpbWUgdG8gJ2ZzZnJlZXplJyBvcGVyYXRpb24gb2YgYSBmaWxlc3lzdGVt
IHNpbmNlIGFsbCAnZGlydHknIHBhZ2VzIG5lZWRzIAo+IHRvIGJlIHdyaXR0ZW4gdG8geW91ciBk
aXNrLi4KPiAKPgoKRm9yZ290IHRvIG1lbnRpb24gdHlwaWNhbCBwcm9ibGVtIHdpdGggY29udGFp
bmVyIGlzIGEgJ21pc3NpbmcgdWRldmQnIC0gCnJlc3VsdGluZyBlbmRsZXNzIHdhaXRpbmcgb24g
J2Nvb2tpZScgY29uZmlybWF0aW9uIG9uIGx2bTIgc2lkZS4KClRoaXMgY291bGQgYmUgdXN1YWxs
eSAncmVzb2x2ZWQnIGJ5IGlzc3VlaW5nOgoKJ2Rtc2V0dXAgdWRldmNvbXBsZXRlX2FsbCcKCih5
b3UgY291bGQgc2VlICdkbXNldHVwIHVkZXZjb29raWVzJyAgaW4tZmxpZ2h0IG9wZXJhdGlvbnMp
CgpCdXQgdGhhdCBzaG91bGQgbm90IGJlIGEgcHJvYmxlbSBpZiB5b3UgYXJlIHdhaXRpbmcgb24g
J2ZzZnJlZXplJy4uLi4KClJlZ2FyZHMKClpkZW5lawoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1A
cmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0t
SE9XVE8vCg==

