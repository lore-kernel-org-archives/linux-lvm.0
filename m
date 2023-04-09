Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E3FC77B70
	for <linux-lvm@archiver.kernel.org>; Sun,  9 Apr 2023 15:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681053491;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h3BzIdHaljZDFgn0A3TjetN8UrETz9GePcmVS4DeTjg=;
	b=MMKg4kvdK7iNlihghhpOyGTzY+eFrshnUJU6CEEHLvbeQGvTGXegTvl+wQrg5ER30qDif8
	srUAnqvB6QV59QJL4fW2G6wPFDmHjOyQPb3+LTT9ts+j1CWvGvEF7koHBWhMau1Zr+31Ek
	Nd76XRQFZ9Ymst4aBANKs/luOjacCrs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-BInjnjbdNRWQjxL02yvUOw-1; Sun, 09 Apr 2023 11:18:08 -0400
X-MC-Unique: BInjnjbdNRWQjxL02yvUOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4145B85C069;
	Sun,  9 Apr 2023 15:18:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 372C940C20FA;
	Sun,  9 Apr 2023 15:18:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EDB521946589;
	Sun,  9 Apr 2023 15:17:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7199A1946586
 for <linux-lvm@listman.corp.redhat.com>; Sun,  9 Apr 2023 15:17:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 524EF40C83A9; Sun,  9 Apr 2023 15:17:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AA6C40C20FA
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 15:17:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 128C63802BA4
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 15:17:58 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-ib4eK6vEOCuDpWGHN5EKeA-1; Sun,
 09 Apr 2023 11:17:56 -0400
X-MC-Unique: ib4eK6vEOCuDpWGHN5EKeA-1
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.179.201] ([89.0.109.233]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mx0Mr-1qZdUC3GNX-00y5V6 for
 <linux-lvm@redhat.com>; Sun, 09 Apr 2023 17:05:19 +0200
Message-ID: <4649980a-7af2-5b2e-47de-ce88ccb8ac6f@web.de>
Date: Sun, 9 Apr 2023 17:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
To: LVM general discussion and development <linux-lvm@redhat.com>
From: Roland <devzero@web.de>
X-Provags-ID: V03:K1:9PJtshE4iSUXvCUJ1Yav9hO5Ldso/Abn/NEsdlu0mnf+3U7Iik2
 xW6yoNbJpQwxL0ksPp6Fdl2e7j7huA1VLyfnRv+iDcB4oR2Qs3a91Ep/yVdElAK8MrX3xxu
 dg+Q4yjFoEH2Ju5nswBu+twXjyxrVVtIuycnZM+yIODXkSqi1KZH2HOKkzvEOZCUnvQgNMZ
 TZp2XONQR0qTlPbUcKYtQ==
UI-OutboundReport: notjunk:1;M01:P0:WJPJQS3HCbc=;SJiof8s6POksEkQuNbAcD6SSAjk
 L7VvlU7gsnVTHW0we0LJ2b3JNN3lS6j3GU76Tdqdl6miXEyUOVCgXjTEkC6q81PvVLg5c+6wd
 TC+TJ7XSYZpTG0SNAyaoNnKPcI1e7nEUPRm3VSLq/3ww+aoBALr5HvLhpy7XmGDN4rIxnb2SI
 Wpo0nAY3NlbF0FkepcBEQ8XaYjkAC2ZTvSNNMKV7R8+tJ+x85tY5UVlel/JQV0/X2ztWUGyBa
 F9SFGphgDnJ/xPWEEJpV5uWtocEw8NmZeQ/wFTld7mQriqFT0Aw5Cj91xkdhDDgfij+CciRvZ
 x/e+xvDzG2KqIlcBJJ8CFdXRgAVoIqyh7/ZGbbNBw5GyAER+ysp9aE6AmMM2tIRkiWr9IPpNj
 cyPUWk7Yo4FGLPJ1Cmuhctq+x8fEfdDVaLSk36Hq2yzGGFf/P4JXkTTOF1fiHbk4cMQLZt8O8
 s/qFl7TfteJusjiiLIPLq4sJ3NRf+qqVd0KqNZye8tMZnJteraSaNeTyAeRwF0emXiDDgj8fG
 MqqY/LU4CXxDaATnWK1RRZ7gubR8/1EsD28cvNGpjX5fV9+OrD5bcg0jjOWuvTEutriprtm9W
 flKRIUT52fcRjx+Rhb8UK/DIjqFVaB7A7YwBNvCaeR8GbWo9jz8ZuFbnLqpfBO3JSK0op5Wzf
 avHf7aQtIAIO8XJN+24d9Krr5jjdQ1Ctr5RgEql7lLeNxPpRyq8xXaJg7fbsrrcE1rZiHy4Wl
 /O53UQhqHO8EEH0bB285ZdE8/rOVc8FnSuykqCeohbMFS0wHynwPfwIejGOJO1xV/I99/NH57
 3FP5svFE/k0a//zMJl4bVyW+k1bKfEsoRidoeryt/xqDRSW7R1N37VI7IeRAeXkLfGC0ACvIG
 jZcT2p2zkMiIYhuRmPp0WWWZqVP1gmSze1CzbzSHBQk7CVxVbSR+5YudzKNq4rEVbhtO2hP0v
 wRsqJg==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [linux-lvm] bug? shrink lv by specifying pv extent to be removed
 does not behave as expected
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
X-Mimecast-Originator: web.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

aGksDQoNCndlIGNhbiBleHRlbmQgYSBsb2dpY2FsIHZvbHVtZSBieSBhcmJpdHJhcnkgcHYgZXh0
ZW5kcyBsaWtlIHRoaXMgOg0KDQoNCnJvb3RAczc0MDp+IyBsdnJlc2l6ZSBteXRlc3RWRy9ibG9j
a3NfYWxsb2NhdGVkIC1sICsxIC9kZXYvc2RiOjUNCiDCoCBTaXplIG9mIGxvZ2ljYWwgdm9sdW1l
IG15dGVzdFZHL2Jsb2Nrc19hbGxvY2F0ZWQgY2hhbmdlZCBmcm9tIDEuMDAgDQpNaUIgKDEgZXh0
ZW50cykgdG8gMi4wMCBNaUIgKDIgZXh0ZW50cykuDQogwqAgTG9naWNhbCB2b2x1bWUgbXl0ZXN0
VkcvYmxvY2tzX2FsbG9jYXRlZCBzdWNjZXNzZnVsbHkgcmVzaXplZC4NCg0Kcm9vdEBzNzQwOn4j
IGx2cmVzaXplIG15dGVzdFZHL2Jsb2Nrc19hbGxvY2F0ZWQgLWwgKzEgL2Rldi9zZGI6MTANCiDC
oCBTaXplIG9mIGxvZ2ljYWwgdm9sdW1lIG15dGVzdFZHL2Jsb2Nrc19hbGxvY2F0ZWQgY2hhbmdl
ZCBmcm9tIDIuMDAgDQpNaUIgKDIgZXh0ZW50cykgdG8gMy4wMCBNaUIgKDMgZXh0ZW50cykuDQog
wqAgTG9naWNhbCB2b2x1bWUgbXl0ZXN0VkcvYmxvY2tzX2FsbG9jYXRlZCBzdWNjZXNzZnVsbHkg
cmVzaXplZC4NCg0Kcm9vdEBzNzQwOn4jIGx2cmVzaXplIG15dGVzdFZHL2Jsb2Nrc19hbGxvY2F0
ZWQgLWwgKzEgL2Rldi9zZGI6MTUNCiDCoCBTaXplIG9mIGxvZ2ljYWwgdm9sdW1lIG15dGVzdFZH
L2Jsb2Nrc19hbGxvY2F0ZWQgY2hhbmdlZCBmcm9tIDMuMDAgDQpNaUIgKDMgZXh0ZW50cykgdG8g
NC4wMCBNaUIgKDQgZXh0ZW50cykuDQogwqAgTG9naWNhbCB2b2x1bWUgbXl0ZXN0VkcvYmxvY2tz
X2FsbG9jYXRlZCBzdWNjZXNzZnVsbHkgcmVzaXplZC4NCg0Kcm9vdEBzNzQwOn4jIGx2cmVzaXpl
IG15dGVzdFZHL2Jsb2Nrc19hbGxvY2F0ZWQgLWwgKzEgL2Rldi9zZGI6MjANCiDCoCBTaXplIG9m
IGxvZ2ljYWwgdm9sdW1lIG15dGVzdFZHL2Jsb2Nrc19hbGxvY2F0ZWQgY2hhbmdlZCBmcm9tIDQu
MDAgDQpNaUIgKDQgZXh0ZW50cykgdG8gNS4wMCBNaUIgKDUgZXh0ZW50cykuDQogwqAgTG9naWNh
bCB2b2x1bWUgbXl0ZXN0VkcvYmxvY2tzX2FsbG9jYXRlZCBzdWNjZXNzZnVsbHkgcmVzaXplZC4N
Cg0Kcm9vdEBzNzQwOn4jIHB2cyAtLXNlZ21lbnRzIA0KLW9sdl9uYW1lLHNlZ19zdGFydF9wZSxz
ZWdfc2l6ZV9wZSxwdnNlZ19zdGFydMKgIC1PIHB2c2VnX3N0YXJ0DQogwqAgTFbCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFN0YXJ0IFNTaXplwqAgU3RhcnQNCiDCoCBibG9ja3NfYWxsb2Nh
dGVkwqDCoMKgwqAgMMKgwqDCoMKgwqAgMcKgwqDCoMKgIDANCiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwwqDCoMKgwqDCoCA0wqDCoMKgwqAgMQ0KIMKgIGJs
b2Nrc19hbGxvY2F0ZWTCoMKgwqDCoCAxwqDCoMKgwqDCoCAxwqDCoMKgwqAgNQ0KIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDDCoMKgwqDCoMKgIDTCoMKgwqDC
oCA2DQogwqAgYmxvY2tzX2FsbG9jYXRlZMKgwqDCoMKgIDLCoMKgwqDCoMKgIDHCoMKgwqAgMTAN
CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwwqDCoMKgwqDC
oCA0wqDCoMKgIDExDQogwqAgYmxvY2tzX2FsbG9jYXRlZMKgwqDCoMKgIDPCoMKgwqDCoMKgIDHC
oMKgwqAgMTUNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAw
wqDCoMKgwqDCoCA0wqDCoMKgIDE2DQogwqAgYmxvY2tzX2FsbG9jYXRlZMKgwqDCoMKgIDTCoMKg
wqDCoMKgIDHCoMKgwqAgMjANCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAwIDQ3NjkxN8KgwqDCoCAyMQ0KDQoNCmhvdyBjYW4gaSBkbyB0aGlzIGluIHJldmVy
c2UgPw0KDQp3aGVuIGkgc3BlY2lmeSB0aGUgcGh5c2ljYWwgZXh0ZW5kIHRvIGJlIGFkZGVkLCBp
dCB3b3JrcyAtIGJ1dCB3aGVuIGlzIA0Kc3BlY2lmY3kgdGhlIHBoeXNpY2FsIGV4dGVudCB0byBi
ZSByZW1vdmVkLA0KdGhlIGxhc3Qgb25lIGlzIGJlaW5nIHJlbW92ZWQgYnV0IG5vdCB0aGUgc3Bl
Y2lmaWVkIG9uZS4NCg0Kc2VlIGhlcmUgZm9yIGV4YW1wbGUgLSBpIHdhbnRlZCB0byByZW1vdmUg
ZXh0ZW50IG51bWJlciAxMCBsaWtlIGkgZGlkIA0KYWRkIGl0LCBidXQgaW5zdGVhZCBleHRlbnQg
bnVtYmVyIDIwDQppcyBiZWluZyByZW1vdmVkDQoNCnJvb3RAczc0MDp+IyBsdnJlc2l6ZSBteXRl
c3RWRy9ibG9ja3NfYWxsb2NhdGVkIC1sIC0xIC9kZXYvc2RiOjEwDQogwqAgSWdub3JpbmcgUFZz
IG9uIGNvbW1hbmQgbGluZSB3aGVuIHJlZHVjaW5nLg0KIMKgIFdBUk5JTkc6IFJlZHVjaW5nIGFj
dGl2ZSBsb2dpY2FsIHZvbHVtZSB0byA0LjAwIE1pQi4NCiDCoCBUSElTIE1BWSBERVNUUk9ZIFlP
VVIgREFUQSAoZmlsZXN5c3RlbSBldGMuKQ0KRG8geW91IHJlYWxseSB3YW50IHRvIHJlZHVjZSBt
eXRlc3RWRy9ibG9ja3NfYWxsb2NhdGVkPyBbeS9uXTogeQ0KIMKgIFNpemUgb2YgbG9naWNhbCB2
b2x1bWUgbXl0ZXN0VkcvYmxvY2tzX2FsbG9jYXRlZCBjaGFuZ2VkIGZyb20gNS4wMCANCk1pQiAo
NSBleHRlbnRzKSB0byA0LjAwIE1pQiAoNCBleHRlbnRzKS4NCiDCoCBMb2dpY2FsIHZvbHVtZSBt
eXRlc3RWRy9ibG9ja3NfYWxsb2NhdGVkIHN1Y2Nlc3NmdWxseSByZXNpemVkLg0KDQpyb290QHM3
NDA6fiMgcHZzIC0tc2VnbWVudHMgDQotb2x2X25hbWUsc2VnX3N0YXJ0X3BlLHNlZ19zaXplX3Bl
LHB2c2VnX3N0YXJ0wqAgLU8gcHZzZWdfc3RhcnQNCiDCoCBMVsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgU3RhcnQgU1NpemXCoCBTdGFydA0KIMKgIGJsb2Nrc19hbGxvY2F0ZWTCoMKgwqDC
oCAwwqDCoMKgwqDCoCAxwqDCoMKgwqAgMA0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDDCoMKgwqDCoMKgIDTCoMKgwqDCoCAxDQogwqAgYmxvY2tzX2FsbG9j
YXRlZMKgwqDCoMKgIDHCoMKgwqDCoMKgIDHCoMKgwqDCoCA1DQogwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMMKgwqDCoMKgwqAgNMKgwqDCoMKgIDYNCiDCoCBi
bG9ja3NfYWxsb2NhdGVkwqDCoMKgwqAgMsKgwqDCoMKgwqAgMcKgwqDCoCAxMA0KIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDDCoMKgwqDCoMKgIDTCoMKgwqAg
MTENCiDCoCBibG9ja3NfYWxsb2NhdGVkwqDCoMKgwqAgM8KgwqDCoMKgwqAgMcKgwqDCoCAxNQ0K
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAgNDc2OTIywqDC
oMKgIDE2DQoNCg0KaG93IGNhbiBpIHJlbW92ZSBleHRlbnQgbnVtYmVyIDEwID8NCg0KaXMgdGhp
cyBhIGJ1ZyA/DQoNCnJlZ2FyZHMNCnJvbGFuZA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUBy
ZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1I
T1dUTy8K

