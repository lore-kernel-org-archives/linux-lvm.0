Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77106EE49A8
	for <linux-lvm@archiver.kernel.org>; Sat, 19 Aug 2023 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692458762;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FZ/nxQU81JIu6DMMdiMenEAp5gUYfy/53VFrXiAkjzU=;
	b=TRgSKZHTaBOHBq1/ePkw1wwsulVO05MMx78HU+BPD+VBtW7P3wVPArnS5wyfEkLFKhzvFA
	1ZgZHgzsnIa0tNdtK9z0ua3fV53lPerSdIXOGdhiYDzWMEyxGfKJASwswca9ngerlEQBzC
	1/NlB4YaeE/zzFq5FzWFhhamjLo1vno=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-EHWwMI9yPb-PUoi1oE0GTQ-1; Sat, 19 Aug 2023 11:25:58 -0400
X-MC-Unique: EHWwMI9yPb-PUoi1oE0GTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 582CD101A52E;
	Sat, 19 Aug 2023 15:25:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3ED2D6B2AF;
	Sat, 19 Aug 2023 15:25:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F37291946589;
	Sat, 19 Aug 2023 15:25:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 79E6B1946587
 for <linux-lvm@listman.corp.redhat.com>; Sat, 19 Aug 2023 15:25:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 62EC26B2AD; Sat, 19 Aug 2023 15:25:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AA526B2AC
 for <linux-lvm@redhat.com>; Sat, 19 Aug 2023 15:25:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 125A63C025CB
 for <linux-lvm@redhat.com>; Sat, 19 Aug 2023 15:25:45 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-421-WUoyZPy3MaK8qf7mhfyoiA-1; Sat,
 19 Aug 2023 11:25:43 -0400
X-MC-Unique: WUoyZPy3MaK8qf7mhfyoiA-1
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.179.90] ([81.173.181.202]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7xaR-1pcp2C404R-014iW7 for
 <linux-lvm@redhat.com>; Sat, 19 Aug 2023 17:20:40 +0200
Message-ID: <fa206f6a-2675-95c9-d6fe-7ef8466a0dd5@web.de>
Date: Sat, 19 Aug 2023 17:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.1
To: LVM general discussion and development <linux-lvm@redhat.com>
From: Roland <devzero@web.de>
X-Provags-ID: V03:K1:0WHREMfJpEdOUhMy1AxtG2uF5Idk+sI2lj6goNS5OdutTwuPsdg
 Sjv4hH12R88E0p5PVxel/AbImV4s48UP54pZgY/8u1ZIAxyhrk1HM7QF36l6CLa/qPKv8t6
 4pOpPg0JWXhHFw7nx3jCg4TBsuGovFEAueF4kSe4c6p5bNo+EJOKy0H4hMP7SJRu/wg28P0
 FXoz5qLqrwBMOnKr+8ERw==
UI-OutboundReport: notjunk:1;M01:P0:xQ1BLSF5e1g=;sebQZom1C169SzavhStXCVLlSUz
 gGNiRjxsQBH9s2PQFobcvFAxpPdkVq3LYtyObi/NB+UiaiCbq2fVXlnQ7agVLidNZufk5/2n5
 dHTlsNODuChWFifsDb4Y9LthNn1NIAds1DcVs8CRBzCsJRw4QGtnx7jMKmpPwBWqmM3ghrCiw
 aCODydVQGEX7Hj9D/lQ2DifyEdx2+cHQYRZbYXDF4PWkxrss1MEeYzO9mgIXWWASd2jPNtwlY
 BuWFTjM86Oaznne69273xnMRwopGMQO9HFi3yoemhL+MZO/rFn0Hz5/dvz7DoLmMgLdAbqkIV
 JuBiCj0gn9jT4R13HCx7nsq6HyddyRyPCi+UY+VD3pkn3Pn86+5Qa90gHrAG3xbYq87gmcHeS
 I2zzsSO52JdnZ5TqRfrq4wHO5IQP5vJsetxLZnEKwhL61hrddPQenvpMl/0uNl7b895Q7WD4D
 AAhzvfvhpBhU1Pu9DVvgYj7Xr56WSH91P7DHNPbdaXt4gYVm7lt50TijeQnv/Nc/IMjcLH5sJ
 LheieNCQj2B0ea4zD9MZoFHDVG0IjI/vWyrcqlIyzgvrNz9v9CIqvlmCBWGWTsv+zjGkj6QBz
 kt25qmbIaOLFiwWvZRbDqCICn+x0xUtwVTbB448arLn9QPi9e5/fITeSYT7uWAj2Va10oudUa
 7KD9+tRLqPCEynkhaLyZ5ZnmbEafXsF+763w8cicEAoCpGxSCQ2M0/a+UnCxnrHLlxtcatz8S
 +lGrzYz/sUsE4bG8EQgm8NYPvcBFEx5u1q/OJy33BVM7DA+PHLycx109NUMYjwOL48d2Gxsch
 XDpxkNXMrCcZjsSSK7tVnRIOROhM0m4Hhh9OwluYJWH2Oc6FFpdb4qYOyKH7MaB/ZUql0mFZO
 XpXgs2KciaYkjim0z+GZ13cXo5YLCqAOVFtdhuBoLQuBfmbva8o3bgZA2ZJwWjb12xsPunooh
 sARULkM2LeA1i1iUIrDVWA+vE20=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [linux-lvm] indistinguishable column names ( BA Start Start Start
 Start )
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
X-Mimecast-Originator: web.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

aGVsbG8sDQoNCmRvZXMgc29tZWJvZHkga25vdyBob3cgd2UgY2FuIGhhdmUgbmF0aXZlIChpLmUu
IG5vbiB0cmFuc2xhdGVkKSBjb2x1bW4gDQpmaWVsZCBuYW1lcyBpbiBmaXJzdCBsaW5lIG9mIG91
dHB1dCBvZiBwdnMgPw0KDQppbiBpdHMgY3VycmVudCBpbXBsZW1lbnRhdGlvbiwgb3V0cHV0IGlz
IGhhcmQgdG8gcmVhZCAsIGRpZmZpY3VsdCB0byANCmRpc3Rpbmd1aXNoIGFuZCBhbHNvIG5vdCBz
Y3JpcHRhYmxlL3BhcnNlYWJsZSwgYXMgd2hpdGVzcGFjZSBpcyB1c2VkIGZvciANCmZpZWxkIHNl
cGFyYXRvciBhbmQgdGhlcmUgYXJlIGZpZWxkcyB3aGljaCBhbHNvIGNvbnRhaW4gd2hpdGVzcGFj
ZSANCnRoZW1zZWx2ZXMsYW5kIHRoZXJlIGFsc28gc2VlbXMgbm8gd2F5IHRvIGFkZCBzZXBhcmF0
b3JzIGluIGJldHdlZW4gDQoobGlrZSB3aXRoIHByaW50ZikgZm9yIHNlcGFyYXRpb24vZm9ybWF0
dGluZw0KDQojIHB2cyAtLXVuaXRzIHMgLW8rcHZfYmFfc3RhcnQsc2VnX3N0YXJ0LHNlZ19zdGFy
dF9wZSxwdnNlZ19zdGFydA0KIMKgIFBWwqDCoMKgwqDCoMKgwqDCoCBWR8KgwqDCoMKgwqDCoMKg
IEZtdMKgIEF0dHIgUFNpemXCoMKgwqDCoMKgwqDCoCBQRnJlZSBCQSBTdGFydCBTdGFydMKgwqDC
oCANClN0YXJ0IFN0YXJ0DQogwqAgL2Rldi9zZGLCoMKgIFZHcmVjeWNsZSBsdm0yIGEtLcKgIDEx
NzIwOTgyNTI4U8KgwqDCoCAwU8KgwqDCoMKgwqDCoCAwUyANCjIwOTcxNTJTwqDCoMKgwqAgMcKg
wqDCoMKgIDANCiDCoCAvZGV2L3NkYsKgwqAgVkdyZWN5Y2xlIGx2bTIgYS0twqAgMTE3MjA5ODI1
MjhTwqDCoMKgIDBTwqDCoMKgwqDCoMKgIDBTIA0KMjA5NzE1MlPCoMKgwqDCoCAxwqDCoMKgwqAg
MQ0KIMKgIC9kZXYvc2RiwqDCoCBWR3JlY3ljbGUgbHZtMiBhLS3CoCAxMTcyMDk4MjUyOFPCoMKg
wqAgMFMgMFPCoMKgwqDCoMKgwqAgMFPCoMKgwqDCoCAwwqAgNTMwOQ0KIMKgIC9kZXYvc2RiwqDC
oCBWR3JlY3ljbGUgbHZtMiBhLS3CoCAxMTcyMDk4MjUyOFPCoMKgwqAgMFMgMFPCoMKgwqDCoMKg
wqAgMFPCoMKgwqDCoCAwwqAgNTU4Nw0KIMKgIC9kZXYvc2RiwqDCoCBWR3JlY3ljbGUgbHZtMiBh
LS3CoCAxMTcyMDk4MjUyOFPCoMKgwqAgMFMgMFPCoMKgwqDCoMKgwqAgMFPCoMKgwqDCoCAwwqAg
NTU4OA0KDQppIG1lYW4gbGlrZSB0aGlzOg0KDQojIHB2cyAtLXVuaXRzIHMgLW8rcHZfYmFfc3Rh
cnQsc2VnX3N0YXJ0LHNlZ19zdGFydF9wZSxwdnNlZ19zdGFydA0KIMKgIFBWwqDCoMKgwqDCoMKg
wqDCoCBWR8KgwqDCoMKgwqDCoMKgIEZtdMKgIEF0dHIgUFNpemXCoMKgwqDCoMKgwqDCoCBQRnJl
ZSBwdl9iYV9zdGFydCANCnNlZ19zdGFydCBzZWdfc3RhcnRfcGUgcHZzZWdfc3RhcnQNCiDCoCAv
ZGV2L3NkYsKgwqAgVkdyZWN5Y2xlIGx2bTIgYS0twqAgMTE3MjA5ODI1MjhTwqDCoMKgIDBTwqDC
oMKgwqDCoMKgIMKgwqAgMFMgDQoyMDk3MTUyU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMcKgwqDC
oMKgwqDCoMKgwqDCoMKgIDANCiDCoCAvZGV2L3NkYsKgwqAgVkdyZWN5Y2xlIGx2bTIgYS0twqAg
MTE3MjA5ODI1MjhTwqDCoMKgIDBTwqDCoMKgwqDCoMKgwqDCoMKgIDBTIA0KMjA5NzE1MlPCoMKg
wqAgwqAgwqAgwqAgwqAgMcKgwqDCoMKgwqDCoMKgwqDCoMKgIDENCiDCoCAvZGV2L3NkYsKgwqAg
VkdyZWN5Y2xlIGx2bTIgYS0twqAgMTE3MjA5ODI1MjhTwqDCoMKgIDBTIDBTwqDCoMKgwqDCoMKg
wqAgMFPCoMKgwqAgwqAgwqAgDQogwqAgwqAgMCDCoCDCoCDCoMKgIDUzMDkNCiDCoCAvZGV2L3Nk
YsKgwqAgVkdyZWN5Y2xlIGx2bTIgYS0twqAgMTE3MjA5ODI1MjhTwqDCoMKgIDBTIDBTwqDCoMKg
wqDCoMKgwqAgMFPCoMKgwqAgwqAgwqAgDQogwqAgwqAgMMKgwqDCoMKgwqDCoMKgIDU1ODcNCiDC
oCAvZGV2L3NkYsKgwqAgVkdyZWN5Y2xlIGx2bTIgYS0twqAgMTE3MjA5ODI1MjhTwqDCoMKgIDBT
IDBTwqDCoMKgwqDCoMKgwqAgDQowU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMMKgwqDCoMKgwqDC
oMKgIDU1ODgNCg0KZnVydGhlcm1vcmUsIGl0J3MgYSBsaXR0bGUgYml0IHdlaXJkIHRoYXQgc29t
ZSBjb2x1bW5zIGJlaW5nIHByaW50ZWQgYnkgDQpkZWZhdWx0IHdoZW4gdXNpbmcgLW8sIGlzIHRo
ZXJlIGFuIGVhc2llciB3YXkgdG8gcmVtb3ZlIHRob3NlIGJlc2lkZXMgDQpleHBsaWN0bHkgcmVt
b3ZpbmcgdGhlbSBvbmUgYnkgb25lIHdpdGggc2V2ZXJhbCAtbyBvcHRpb25zID8gDQoiLW8tb3B0
MSwtb3B0MiwuLi4iIGRvZXNuJ3Qgd29yaw0KDQojIHB2cyAtLXVuaXRzIHMgLW8rcHZfYmFfc3Rh
cnQsc2VnX3N0YXJ0LHB2c2VnX3N0YXJ0LHNlZ19zdGFydF9wZSANCi1vLXZnX25hbWUgLW8tcHZf
bmFtZSAtby1wdl9mbXQgLW8tYXR0ciAtbyAtcHZfc2l6ZSAtbyAtcHZfZnJlZQ0KIMKgIEJBIFN0
YXJ0IFN0YXJ0wqDCoMKgIFN0YXJ0IFN0YXJ0DQogwqDCoMKgwqDCoMKgwqAgMFMgMjA5NzE1MlPC
oMKgwqDCoCAwwqDCoMKgwqAgMQ0KIMKgwqDCoMKgwqDCoMKgIDBTIDIwOTcxNTJTwqDCoMKgwqAg
McKgwqDCoMKgIDENCiDCoMKgwqDCoMKgwqDCoCAwU8KgwqDCoMKgwqDCoCAwU8KgIDUzMDnCoMKg
wqDCoCAwDQogwqDCoMKgwqDCoMKgwqAgMFPCoMKgwqDCoMKgwqAgMFPCoCA1NTg3wqDCoMKgwqAg
MA0KIMKgwqDCoMKgwqDCoMKgIDBTwqDCoMKgwqDCoMKgIDBTwqAgNTU4OMKgwqDCoMKgIDANCg0K
cm9sYW5kDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0
bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhP
Vy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

