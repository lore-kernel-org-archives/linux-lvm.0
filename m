Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A5EC77B6E
	for <linux-lvm@archiver.kernel.org>; Sun,  9 Apr 2023 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681061605;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BMiwyV0mIkl9oFr3S/Tg1j1U73S9IarVFn/6Kn74uO0=;
	b=EBOc1KOsggpWPXK0zMbg5KqaHKq3CXrc0+FatxfNzdsOMeafPP3iswS4S5+PmJTeaeJONP
	GINsXerBmqK97yQ1VmM0zBhybxgsC6CDrXGqHqGl8RHld94WCaCWzjXUTewpgwD7bJ85vz
	zA3fQDexi8EFzZI5SefWLPz6AKEP++A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-tisw1qw6OYaC8ppfBh0voQ-1; Sun, 09 Apr 2023 13:33:23 -0400
X-MC-Unique: tisw1qw6OYaC8ppfBh0voQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DAFE101A531;
	Sun,  9 Apr 2023 17:33:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C09D492B00;
	Sun,  9 Apr 2023 17:33:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1C472194658C;
	Sun,  9 Apr 2023 17:33:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 16CC71946586
 for <linux-lvm@listman.corp.redhat.com>; Sun,  9 Apr 2023 17:33:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DC064492C1B; Sun,  9 Apr 2023 17:33:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D49F6492C14
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 17:33:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9CB9800B23
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 17:33:13 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-4-HUIAmjO26XtPQv_PgNmg-1; Sun, 09 Apr 2023 13:33:11 -0400
X-MC-Unique: 4-HUIAmjO26XtPQv_PgNmg-1
Received: by mail-vs1-f44.google.com with SMTP id dg15so29127511vsb.13
 for <linux-lvm@redhat.com>; Sun, 09 Apr 2023 10:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681061591;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yzp6huiWN7wp/AynHf8U+2sRQcHpLMgRuGWiO1Op2i0=;
 b=OBbR11C4FIgS/k+ZU10U5Qm7eOT1307dE+lnm2+RG2/d10gjpe6pru7xJRgu2qhgCN
 tBHckaCP1tBYBbToGauSDyuTJ8shJ5L/bJ6hZJod0kWRJA5E8zms1cdW8RXzMZH2px60
 7qatJnGT/e+SQT/A5Aj+7a23PPDbb1d45cMryQoe1+65PYdm132rTbkbf132jHmkQT+F
 6lrpswtQXf5+WZ9XLBJWQRpZDvwnc+tkf+S/etCj850AfCQQ6OEuDaf79Admd3oj/U8s
 vv+uLL2dejr2WQTW7ez7lHX5vQtaud3d3XlM+lbBZfaRiSonmk9dGkiID6CAhQHy7D88
 nwag==
X-Gm-Message-State: AAQBX9dEkI/O+/R/jv4hC/eBtE7itdx17VfURS7a6NGxiIKCKzcviMeB
 0ThCuamAMxNZjvaB+sP8KuBUPq0Ypfd2N+F2VqNi2TuG
X-Google-Smtp-Source: AKy350aaVtaXo/aQPLG3ledsyzhkXjTA10dvHLFM3KTcO1onRLRiaJYoVUvyQTqd4EpJfK3ACA5XpaTrK0tQAhY6GEA=
X-Received: by 2002:a67:d38e:0:b0:425:d39f:3882 with SMTP id
 b14-20020a67d38e000000b00425d39f3882mr3152028vsj.3.1681061591029; Sun, 09 Apr
 2023 10:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <4649980a-7af2-5b2e-47de-ce88ccb8ac6f@web.de>
In-Reply-To: <4649980a-7af2-5b2e-47de-ce88ccb8ac6f@web.de>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Sun, 9 Apr 2023 12:32:59 -0500
Message-ID: <CAAMCDefZC-J7Nc0H45e_EmqkRDr8ZjpOn-JvNWyBzExh8TaCsg@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [linux-lvm] bug? shrink lv by specifying pv extent to be
 removed does not behave as expected
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCBBcHIgOSwgMjAyMyBhdCAxMDoxOOKAr0FNIFJvbGFuZCA8ZGV2emVyb0B3ZWIuZGU+
IHdyb3RlOgo+Cj4gaGksCj4KPiB3ZSBjYW4gZXh0ZW5kIGEgbG9naWNhbCB2b2x1bWUgYnkgYXJi
aXRyYXJ5IHB2IGV4dGVuZHMgbGlrZSB0aGlzIDoKPgo+Cj4gcm9vdEBzNzQwOn4jIGx2cmVzaXpl
IG15dGVzdFZHL2Jsb2Nrc19hbGxvY2F0ZWQgLWwgKzEgL2Rldi9zZGI6NQo+ICAgIFNpemUgb2Yg
bG9naWNhbCB2b2x1bWUgbXl0ZXN0VkcvYmxvY2tzX2FsbG9jYXRlZCBjaGFuZ2VkIGZyb20gMS4w
MAo+IE1pQiAoMSBleHRlbnRzKSB0byAyLjAwIE1pQiAoMiBleHRlbnRzKS4KPiAgICBMb2dpY2Fs
IHZvbHVtZSBteXRlc3RWRy9ibG9ja3NfYWxsb2NhdGVkIHN1Y2Nlc3NmdWxseSByZXNpemVkLgo+
Cj4gcm9vdEBzNzQwOn4jIGx2cmVzaXplIG15dGVzdFZHL2Jsb2Nrc19hbGxvY2F0ZWQgLWwgKzEg
L2Rldi9zZGI6MTAKPiAgICBTaXplIG9mIGxvZ2ljYWwgdm9sdW1lIG15dGVzdFZHL2Jsb2Nrc19h
bGxvY2F0ZWQgY2hhbmdlZCBmcm9tIDIuMDAKPiBNaUIgKDIgZXh0ZW50cykgdG8gMy4wMCBNaUIg
KDMgZXh0ZW50cykuCj4gICAgTG9naWNhbCB2b2x1bWUgbXl0ZXN0VkcvYmxvY2tzX2FsbG9jYXRl
ZCBzdWNjZXNzZnVsbHkgcmVzaXplZC4KPgo+IHJvb3RAczc0MDp+IyBsdnJlc2l6ZSBteXRlc3RW
Ry9ibG9ja3NfYWxsb2NhdGVkIC1sICsxIC9kZXYvc2RiOjE1Cj4gICAgU2l6ZSBvZiBsb2dpY2Fs
IHZvbHVtZSBteXRlc3RWRy9ibG9ja3NfYWxsb2NhdGVkIGNoYW5nZWQgZnJvbSAzLjAwCj4gTWlC
ICgzIGV4dGVudHMpIHRvIDQuMDAgTWlCICg0IGV4dGVudHMpLgo+ICAgIExvZ2ljYWwgdm9sdW1l
IG15dGVzdFZHL2Jsb2Nrc19hbGxvY2F0ZWQgc3VjY2Vzc2Z1bGx5IHJlc2l6ZWQuCj4KPiByb290
QHM3NDA6fiMgbHZyZXNpemUgbXl0ZXN0VkcvYmxvY2tzX2FsbG9jYXRlZCAtbCArMSAvZGV2L3Nk
YjoyMAo+ICAgIFNpemUgb2YgbG9naWNhbCB2b2x1bWUgbXl0ZXN0VkcvYmxvY2tzX2FsbG9jYXRl
ZCBjaGFuZ2VkIGZyb20gNC4wMAo+IE1pQiAoNCBleHRlbnRzKSB0byA1LjAwIE1pQiAoNSBleHRl
bnRzKS4KPiAgICBMb2dpY2FsIHZvbHVtZSBteXRlc3RWRy9ibG9ja3NfYWxsb2NhdGVkIHN1Y2Nl
c3NmdWxseSByZXNpemVkLgo+Cj4gcm9vdEBzNzQwOn4jIHB2cyAtLXNlZ21lbnRzCj4gLW9sdl9u
YW1lLHNlZ19zdGFydF9wZSxzZWdfc2l6ZV9wZSxwdnNlZ19zdGFydCAgLU8gcHZzZWdfc3RhcnQK
PiAgICBMViAgICAgICAgICAgICAgIFN0YXJ0IFNTaXplICBTdGFydAo+ICAgIGJsb2Nrc19hbGxv
Y2F0ZWQgICAgIDAgICAgICAxICAgICAwCj4gICAgICAgICAgICAgICAgICAgICAgICAgMCAgICAg
IDQgICAgIDEKPiAgICBibG9ja3NfYWxsb2NhdGVkICAgICAxICAgICAgMSAgICAgNQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIDAgICAgICA0ICAgICA2Cj4gICAgYmxvY2tzX2FsbG9jYXRlZCAg
ICAgMiAgICAgIDEgICAgMTAKPiAgICAgICAgICAgICAgICAgICAgICAgICAwICAgICAgNCAgICAx
MQo+ICAgIGJsb2Nrc19hbGxvY2F0ZWQgICAgIDMgICAgICAxICAgIDE1Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgMCAgICAgIDQgICAgMTYKPiAgICBibG9ja3NfYWxsb2NhdGVkICAgICA0ICAg
ICAgMSAgICAyMAo+ICAgICAgICAgICAgICAgICAgICAgICAgIDAgNDc2OTE3ICAgIDIxCj4KPgo+
IGhvdyBjYW4gaSBkbyB0aGlzIGluIHJldmVyc2UgPwo+Cj4gd2hlbiBpIHNwZWNpZnkgdGhlIHBo
eXNpY2FsIGV4dGVuZCB0byBiZSBhZGRlZCwgaXQgd29ya3MgLSBidXQgd2hlbiBpcwo+IHNwZWNp
ZmN5IHRoZSBwaHlzaWNhbCBleHRlbnQgdG8gYmUgcmVtb3ZlZCwKPiB0aGUgbGFzdCBvbmUgaXMg
YmVpbmcgcmVtb3ZlZCBidXQgbm90IHRoZSBzcGVjaWZpZWQgb25lLgo+Cj4gc2VlIGhlcmUgZm9y
IGV4YW1wbGUgLSBpIHdhbnRlZCB0byByZW1vdmUgZXh0ZW50IG51bWJlciAxMCBsaWtlIGkgZGlk
Cj4gYWRkIGl0LCBidXQgaW5zdGVhZCBleHRlbnQgbnVtYmVyIDIwCj4gaXMgYmVpbmcgcmVtb3Zl
ZAo+Cj4gcm9vdEBzNzQwOn4jIGx2cmVzaXplIG15dGVzdFZHL2Jsb2Nrc19hbGxvY2F0ZWQgLWwg
LTEgL2Rldi9zZGI6MTAKPiAgICBJZ25vcmluZyBQVnMgb24gY29tbWFuZCBsaW5lIHdoZW4gcmVk
dWNpbmcuCj4gICAgV0FSTklORzogUmVkdWNpbmcgYWN0aXZlIGxvZ2ljYWwgdm9sdW1lIHRvIDQu
MDAgTWlCLgo+ICAgIFRISVMgTUFZIERFU1RST1kgWU9VUiBEQVRBIChmaWxlc3lzdGVtIGV0Yy4p
Cj4gRG8geW91IHJlYWxseSB3YW50IHRvIHJlZHVjZSBteXRlc3RWRy9ibG9ja3NfYWxsb2NhdGVk
PyBbeS9uXTogeQo+ICAgIFNpemUgb2YgbG9naWNhbCB2b2x1bWUgbXl0ZXN0VkcvYmxvY2tzX2Fs
bG9jYXRlZCBjaGFuZ2VkIGZyb20gNS4wMAo+IE1pQiAoNSBleHRlbnRzKSB0byA0LjAwIE1pQiAo
NCBleHRlbnRzKS4KPiAgICBMb2dpY2FsIHZvbHVtZSBteXRlc3RWRy9ibG9ja3NfYWxsb2NhdGVk
IHN1Y2Nlc3NmdWxseSByZXNpemVkLgo+Cj4gcm9vdEBzNzQwOn4jIHB2cyAtLXNlZ21lbnRzCj4g
LW9sdl9uYW1lLHNlZ19zdGFydF9wZSxzZWdfc2l6ZV9wZSxwdnNlZ19zdGFydCAgLU8gcHZzZWdf
c3RhcnQKPiAgICBMViAgICAgICAgICAgICAgIFN0YXJ0IFNTaXplICBTdGFydAo+ICAgIGJsb2Nr
c19hbGxvY2F0ZWQgICAgIDAgICAgICAxICAgICAwCj4gICAgICAgICAgICAgICAgICAgICAgICAg
MCAgICAgIDQgICAgIDEKPiAgICBibG9ja3NfYWxsb2NhdGVkICAgICAxICAgICAgMSAgICAgNQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIDAgICAgICA0ICAgICA2Cj4gICAgYmxvY2tzX2FsbG9j
YXRlZCAgICAgMiAgICAgIDEgICAgMTAKPiAgICAgICAgICAgICAgICAgICAgICAgICAwICAgICAg
NCAgICAxMQo+ICAgIGJsb2Nrc19hbGxvY2F0ZWQgICAgIDMgICAgICAxICAgIDE1Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgMCA0NzY5MjIgICAgMTYKPgo+Cj4gaG93IGNhbiBpIHJlbW92ZSBl
eHRlbnQgbnVtYmVyIDEwID8KPgo+IGlzIHRoaXMgYSBidWcgPwo+CgpXZWxsLCBpZiB0aGUgTFYg
aXMgYmVpbmcgdXNlZCBmb3IgYW55dGhpbmcgcmVhbCwgdGhlbiBJIGRvbid0IGtub3cgb2YKYW55
dGhpbmcgd2hlcmUgeW91IGNvdWxkIHJlbW92ZSBhIGJsb2NrIGluIHRoZSBtaWRkbGUgYW5kIHN0
aWxsIGhhdmUgYQp3b3JraW5nIGZzLiAgIFlvdSBjYW4gb25seSByZWR1Y2UgZnMnZXMgKHRoZSBv
bmVzIHRoYXQgeW91IGNhbiByZWR1Y2UpCmJ5IHJlZHVjaW5nIG9mZiBvZiB0aGUgZW5kIGFuZCBt
YWtpbmcgaXQgc21hbGxlci4KCkl0IG1ha2VzIHplcm8gc2Vuc2UgdG8gYmUgYWJsZSB0byByZW1v
dmUgYSBibG9jayBpbiB0aGUgbWlkZGxlIG9mIGEgTFYKdXNlZCBieSBqdXN0IGFib3V0IGV2ZXJ5
dGhpbmcgdGhhdCB1c2VzIExWJ3MgYXMgbm90aGluZyBzdXBwb3J0cyBiZWluZwphYmxlIHRvIHJl
bW92ZSBhIGJsb2NrIGluIHRoZSBtaWRkbGUuCgpXaGF0IGlzIHlvdXIgdXNlIGNhc2UgdGhhdCB5
b3UgYmVsaWV2ZSByZW1vdmluZyBhIGJsb2NrIGluIHRoZSBtaWRkbGUKb2YgYW4gTFYgbmVlZHMg
dG8gd29yaz8KCk5vdyBpZiB5b3UgcmVhbGx5IG5lZWQgdG8gcmVtb3ZlIGEgc3BlY2lmaWMgYmxv
Y2sgaW4gdGhlIG1pZGRsZSBvZiB0aGUKTFYgdGhlbiB5b3UgYXJlIGxpa2VseSBnb2luZyB0byBu
ZWVkIHRvIHVzZSBwdm1vdmUgd2l0aCBzcGVjaWZpYwpibG9ja3MgdG8gcmVwbGFjZSB0aG9zZSBi
bG9ja3Mgd2l0aCBzb21ldGhpbmcgZWxzZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhh
dC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1s
dm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RP
Lwo=

