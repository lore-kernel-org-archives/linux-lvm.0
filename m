Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C6DC433F5
	for <linux-lvm@archiver.kernel.org>; Fri,  8 Apr 2022 15:37:42 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-zNuRp5JDO-ugvEKVW8iDMQ-1; Fri, 08 Apr 2022 11:37:38 -0400
X-MC-Unique: zNuRp5JDO-ugvEKVW8iDMQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A62803C11CF1;
	Fri,  8 Apr 2022 15:37:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C43631410F3B;
	Fri,  8 Apr 2022 15:37:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8D9371940347;
	Fri,  8 Apr 2022 15:37:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3FEFB1940341
 for <linux-lvm@listman.corp.redhat.com>; Fri,  8 Apr 2022 15:37:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0BADCC2812B; Fri,  8 Apr 2022 15:37:30 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 079DBC28122
 for <linux-lvm@redhat.com>; Fri,  8 Apr 2022 15:37:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E27F9811E84
 for <linux-lvm@redhat.com>; Fri,  8 Apr 2022 15:37:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-XJLro9SdMd-XTUgPmFfbKQ-1; Fri, 08 Apr 2022 11:37:26 -0400
X-MC-Unique: XJLro9SdMd-XTUgPmFfbKQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E01DD61F55;
 Fri,  8 Apr 2022 15:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD502C385A3;
 Fri,  8 Apr 2022 15:32:08 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6c3cc169
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 8 Apr 2022 15:32:06 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-lvm@redhat.com, David Teigland <teigland@redhat.com>,
 Zdenek Kabelac <zkabelac@redhat.com>
Date: Fri,  8 Apr 2022 17:30:54 +0200
Message-Id: <20220408153054.76806-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [linux-lvm] [PATCH] misc: use getrandom(GRND_INSECURE) instead of
 /dev/urandom when possible
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Z2V0cmFuZG9tKEdSTkRfSU5TRUNVUkUpIGlzIHRoZSBzYW1lIGFzIC9kZXYvdXJhbmRvbSwgZXhj
ZXB0OgoKLSBJdCB3b24ndCBsZWF2ZSBhIHdhcm5pbmcgaW4gZG1lc2cgaWYgdXNlZCBhdCBlYXJs
eSBib290IHRpbWUsIHdoaWNoIGlzCiAgYSBjb21tb24gb2NjdXJhbmNlOwoKLSBJdCB3b24ndCBp
bnRyb2R1Y2UgYSB0aW55IGRlbGF5IGF0IGVhcmx5IGJvb3Qgb24gbmV3ZXIga2VybmVscyB3aGVu
CiAgL2Rldi91cmFuZG9tIHRyaWVzIHRvIG9wcG9ydHVuaXN0aWNhbGx5IGNyZWF0ZSBqaXR0ZXIg
ZW50cm9weTsKCi0gSXQgb25seSByZXF1aXJlcyAxIHN5c2NhbGwsIHJhdGhlciB0aGFuIDMuCgpP
dGhlciB0aGFuIHRoYXQsIGl0IHJldHVybnMgdGhlIHNhbWUgInF1YWxpdHkiIG9mIHJhbmRvbW5l
c3MgYXMKL2Rldi91cmFuZG9tLCBhbmQgbmV2ZXIgYmxvY2tzLgoKSXQncyBvbmx5IGF2YWlsYWJs
ZSBvbiBrZXJuZWxzIOKJpTUuNiwgc28gd2UgdHJ5IHRvIHVzZSBpdCwgY2FjaGUgdGhlCnJlc3Vs
dCBvZiB0aGF0IGF0dGVtcHQsIGFuZCBmYWxsIGJhY2sgdG8gL2Rldi91cmFuZG9tIGlmIGl0IGRp
ZG4ndCB3b3JrCm91dC4KLS0tCiBsaWIvbWlzYy9sdm0td3JhcHBlcnMuYyB8IDEwICsrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL21p
c2MvbHZtLXdyYXBwZXJzLmMgYi9saWIvbWlzYy9sdm0td3JhcHBlcnMuYwppbmRleCAyZTBjZmQ1
MTQuLjEyMzlmMTA4NSAxMDA2NDQKLS0tIGEvbGliL21pc2MvbHZtLXdyYXBwZXJzLmMKKysrIGIv
bGliL21pc2MvbHZtLXdyYXBwZXJzLmMKQEAgLTE2LDYgKzE2LDcgQEAKIAogI2luY2x1ZGUgPHVu
aXN0ZC5oPgogI2luY2x1ZGUgPGZjbnRsLmg+CisjaW5jbHVkZSA8c3lzL3JhbmRvbS5oPgogCiAj
aWZkZWYgVURFVl9TWU5DX1NVUFBPUlQKICNpbmNsdWRlIDxsaWJ1ZGV2Lmg+CkBAIC0xMTEsOCAr
MTEyLDE3IEBAIGludCBsdm1fZ2V0cGFnZXNpemUodm9pZCkKIAogaW50IHJlYWRfdXJhbmRvbSh2
b2lkICpidWYsIHNpemVfdCBsZW4pCiB7CisJc3RhdGljIGludCBoYXZlX2dldHJhbmRvbSA9IC0x
OwogCWludCBmZDsKIAorCWlmIChoYXZlX2dldHJhbmRvbSkgeworCQlib29sIHN1Y2Nlc3MgPSBn
ZXRyYW5kb20oYnVmLCBsZW4sIEdSTkRfSU5TRUNVUkUpID09IGxlbjsKKwkJaWYgKGhhdmVfZ2V0
cmFuZG9tID09IC0xKQorCQkJaGF2ZV9nZXRyYW5kb20gPSBzdWNjZXNzOworCQlpZiAoc3VjY2Vz
cykKKwkJCXJldHVybiAxOworCX0KKwogCS8qIEZJWE1FOiB3ZSBzaG91bGQgc3RhdCBoZXJlLCBh
bmQgaGFuZGxlIG90aGVyIGNhc2VzICovCiAJLyogRklYTUU6IHVzZSBjb21tb24gX2lvKCkgcm91
dGluZSdzIG9wZW4vcmVhZC9jbG9zZSAqLwogCWlmICgoZmQgPSBvcGVuKCIvZGV2L3VyYW5kb20i
LCBPX1JET05MWSkpIDwgMCkgewotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUBy
ZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1I
T1dUTy8K

