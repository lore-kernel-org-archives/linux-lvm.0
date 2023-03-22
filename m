Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF71BC6FD1C
	for <linux-lvm@archiver.kernel.org>; Wed, 22 Mar 2023 15:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679497645;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=quNmzv9nAn6kQJ2f4h91EXqQIo1zbR+P5FHMiHtVusk=;
	b=Ki1yMs5Ja30EmqMVu6jmTeQDgrnpfwtgGTH/vQGFC9nqFmsaPFAXFxBzw9lzmSMe9+HfuV
	8zfNQEftrMbc74sqjYLby6+bTycEgOMcLMn+IhK/8BL56eF8AjyynmItgVVS+1wZEBjQWE
	7puG3MyryPsCQnOml+UyZOGBFm+qBXY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-0VmS_Sq4Oxy2Nc-cLqdnwQ-1; Wed, 22 Mar 2023 11:07:24 -0400
X-MC-Unique: 0VmS_Sq4Oxy2Nc-cLqdnwQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9235C88904B;
	Wed, 22 Mar 2023 15:07:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA66B4619F5;
	Wed, 22 Mar 2023 15:07:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 88DE71946A42;
	Wed, 22 Mar 2023 15:07:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1432119465BA
 for <linux-lvm@listman.corp.redhat.com>; Wed, 22 Mar 2023 14:51:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C0A131731B; Wed, 22 Mar 2023 14:51:36 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8C7751FF
 for <linux-lvm@redhat.com>; Wed, 22 Mar 2023 14:51:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84B3185A5A3
 for <linux-lvm@redhat.com>; Wed, 22 Mar 2023 14:51:36 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-VXIMobm0N1-5krhoT6IQjQ-1; Wed, 22 Mar 2023 10:51:34 -0400
X-MC-Unique: VXIMobm0N1-5krhoT6IQjQ-1
Received: by mail-ed1-f44.google.com with SMTP id r11so74076706edd.5
 for <linux-lvm@redhat.com>; Wed, 22 Mar 2023 07:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679496693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zxf7EGNnmwdG/oKo65kMnQX59OJu910bs4BqktoB6KM=;
 b=LmPzyMBbRtwDgiEHzC2HeDzMVW4GQeb65xxBv5mVGvtmclCQWBC5X5sLQgqdlGSSj4
 l29tiN4N8ogq8MWPBDIeAK5dp0z7KQsbCoy8VJgwPoZT8xmKmyzFC8IiqIWQcawiVpLQ
 irFr1sWL37PYqdGDGoBGS5gCBar7VpfYCKthZ4epDnA17VE7D7KoVGZsboWsdS3mzBW6
 SGlh+KNxyUHndkNOrTbVqMHQudivStkPZDfM6s6m2PRuR33VfRSkcmGSYh3qOoVMEB0t
 2p/qYkrpbZ8SXytpcM5/J0XhYcMtqNAIDJ7jaeHM8FFGtAPyPbWtDzvPmp6XNYlZSa3l
 SIWQ==
X-Gm-Message-State: AO0yUKVmawWqZ5THoCKJ2mTlLpMurXDdd/qlVswCd7N/sF2KbD0cUL7M
 Ve4UCHFrn26m9rEHKu2jKeHsOTf+bKW32EJLFeGhQAvu7vB+8Q==
X-Google-Smtp-Source: AK7set+aGXgx+ODdKItk9XYrds3tCJ2YF44hwRixmL5CSJ/QREHeVHiu4jvU8m2WdgZKWED+72aZy+YZ2Acrw37Em5w=
X-Received: by 2002:a50:d55d:0:b0:4ad:6052:ee90 with SMTP id
 f29-20020a50d55d000000b004ad6052ee90mr3699551edj.7.1679496693543; Wed, 22 Mar
 2023 07:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAGhAaddYD7Y8ObY6Q3Yprhruzb8s6-q0t+GJUv5oYGLR3LCpRg@mail.gmail.com>
 <5b9e31d6-2675-8903-619c-cf33c48f1ba8@gmail.com>
 <CAGhAade3Uzobn5amNYVB489NJ-OOj2MFW591eHVaK3ZoEKr15Q@mail.gmail.com>
 <CAGhAaddCmjQeOrdqueHHpM6znVpvMK_vy8XfTxgsMgWPLwyndQ@mail.gmail.com>
 <699c4cd0-fa9d-09d3-ed4f-e7139ccc1db4@gmail.com>
In-Reply-To: <699c4cd0-fa9d-09d3-ed4f-e7139ccc1db4@gmail.com>
From: lacsaP Patatetom <patatetom@gmail.com>
Date: Wed, 22 Mar 2023 15:50:51 +0100
Message-ID: <CAGhAadcYBVChTVAnYZMbhv2yEZsPg7DJY2a1pVET8McZdoQsiQ@mail.gmail.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [linux-lvm] LVM and RO device/partition(s
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TGUgbWVyLiAyMiBtYXJzIDIwMjMgw6AgMTU6MTEsIFpkZW5layBLYWJlbGFjCjx6ZGVuZWsua2Fi
ZWxhY0BnbWFpbC5jb20+IGEgw6ljcml0IDoKPgo+IERuZSAyMC4gMDMuIDIzIHYgMTc6MzcgbGFj
c2FQIFBhdGF0ZXRvbSBuYXBzYWwoYSk6Cj4gPiBoaSwKPiA+Cj4gPiBJIGNvbWUgYmFjayB0byB5
b3Ugd2l0aCB0aGUgbWVtbyBtZW50aW9uZWQgOgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3BhdGF0
ZXRvbS9sdm0tb24tcmVhZG9ubHktYmxvY2stZGV2aWNlCj4gPiA8aHR0cHM6Ly9naXRodWIuY29t
L3BhdGF0ZXRvbS9sdm0tb24tcmVhZG9ubHktYmxvY2stZGV2aWNlPgo+ID4gSSBob3BlIHRoYXQg
aXQgd2lsbCBhbGxvdyB5b3UgdG8gYmV0dGVyIHVuZGVyc3RhbmQgdGhpcyBwcm9ibGVtIG9mIGFs
dGVyYXRpb24KPiA+IG9mIHRoZSBkaXNrLgo+ID4KPiA+IGFzIEkgbWVudGlvbmVkLCBMVk0gc2hv
dWxkIG5vcm1hbGx5L3RoZW9yZXRpY2FsbHkgbm90IHRvdWNoIHRoZSBkaXNrIGFzIGxvbmcKPiA+
IGFzIGl0IGlzIHJlYWQtb25seSwgYnV0IHdoYXQgYm90aGVycyBtZSB0aGUgbW9zdCBpcyB0aGUg
ZmFjdCB0aGF0IEkgY2FuJ3QKPiA+ICJjYXRjaCB1cCIgYnkgY29ycmVjdGluZyB0aGUgbmV3IDYu
MS4xNSBrZXJuZWwgYXMgSSBkaWQgYmVmb3JlLgo+ID4KPiA+IHJlZ2FyZHMsIGxhY3NhUC4KPiA+
Cj4gPiBMZSBsdW4uIDIwIG1hcnMgMjAyMyDDoCAxNToxNSwgbGFjc2FQIFBhdGF0ZXRvbSA8cGF0
YXRldG9tQGdtYWlsLmNvbQo+Cj4gSGkKPgo+IFNvIEknbSBwb3NzaWJseSBmaW5hbGx5IHN0YXJ0
aW5nIHRvIHVuZGVyc3RhbmQgeW91ciBwcm9ibGVtIGhlcmUuCgo6LSkKCj4KPiBZb3UgYXJlIHVz
aW5nIHlvdXIgb3duIHBhdGNoZWQga2VybmVsIC0gd2hlcmUgeW91IHdlcmUgcmV2ZXJ0aW5nCj4g
YTMyZTIzNmViOTNlNjJhMGY2OTJlNzliN2MzYzk2MzY2ODk1NTliOSAgbGludXgga2VybmVsIHBh
dGNoLgo+Cj4gd2l0aG91dCBsaWtlbHkgdW5kZXJzdGFuZGluZyB0aGUgY29uc2VxdWVuY2VzLgoK
aW5kZWVkLCBJIGRpZCBub3QgZ28gZG93biBpbiB0aGUgbWVhbmRlcnMgb2YgTFZNIGFuZCBMaW51
eCBrZXJuZWwsIEkKaGF2ZSBuZWl0aGVyIHRoZSBjYXBhY2l0eSBub3IgdGhlIHRpbWUgOi0oCm15
IGdvYWwgd2FzL2lzIHRvIHByZXZlbnQgYW55IG1vZGlmaWNhdGlvbiBvZiBhIHJlYWQtb25seSBj
b25maWd1cmVkCm1lZGlhIGFuZCB0aGlzIGxpdHRsZSBgcmV0dXJuIHRydWU7YCB3YXMgZG9pbmcg
dGhlIGpvYiBmb3IgTFZNIDotKQoKPgo+IFdpdGgga2VybmVsIDYuWCB0aGVyZSBpcyBjb21taXQg
YmRiN2Q0MjBjNmY2ZDI2MThkNGM5MDdjZDc3NDJjMzE5NWM0MjVlMgo+IG1vZGlmeWluZyBiaW9f
Y2hlY2tfcm8oKSB0byByZXR1cm4gdm9pZCAgLSBzbyB5b3VyICdyZXZlcnRpbmcnIHBhdGNoCj4g
aXMgbm8gbG9uZ2VyIHVzYWJsZSB0aGUgd2F5IGl0J3MgYmVlbiBjcmVhdGVkLgoKeWVzLgoKPgo+
Cj4gIEZyb20geW91ciBnaXRodWIgcmVwb3J0IGl0IHNlZW1zIHlvdSBhcmUgY3JlYXRpbmcgICdy
YWlkJyBhY3Jvc3MgMyBzZGIgZHJpdmVzLgoKSSBkb24ndCBkbyBhbnl0aGluZyBzcGVjaWFsIGF0
IHRoaXMgbGV2ZWwsIGl0J3MgbXkgc3lzdGVtIChBcmNoTGludXgpCnRoYXQgdGFrZXMgY2FyZSBv
ZiBpdC4KdGhlICJvbmx5IiB0aGluZyBJIGludHJvZHVjZSBpcyB0aGUgdWRldiBydWxlIHdoaWNo
IGFsbG93cyB0byBzd2l0Y2gKZGV2aWNlcy9wYXJ0aXRpb25zIHRvIHJlYWQtb25seSBhcyBzb29u
IGFzIHRoZXkgYXBwZWFyLgoKPgo+IFNvIHdpdGggbm9ybWFsIGtlcm5lbCAtIGl0IGhhcHBlbnMg
dG8gYmUgdGhhdCAgJ2RtJyBkcml2ZXMgYXJlIGFsbG93ZWQgdG8KPiBieXBhc3MgYW55ICdyZWFk
LW9ubHknIHByb3RlY3Rpb24gc2V0IG9uIGEgZGV2aWNlLgo+Cj4gU28gd2hlbiB5b3UgYWN0dWFs
bHkgY3JlYXRpbmcgcmFpZCBMViBvbiAgbG9vcDAgJiBsb29wMSAtIGRlYWN0aXZhdGUsIHRoZW4g
eW91Cj4gbWFrZSBsb29wMCAmIGxvb3AxICByZWFkLW9ubHksIGFjdGl2ZSByYWlkIExWIC0gdGhl
biB5b3UgY2FuIGVhc2lseSBjYWxsCj4gJ21rZnMnIGFuZCBpdCB3aWxsIG5vcm1hbGx5IHdvcmsu
Cj4KPiBSYWlkIGRldmljZSBjb25zaXN0IG9yICAnX3JpbWFnZScgJiAnX3JtZXRhJyBMViBwZXIg
bGVnIC0gd2hlcmUgX3JtZXRhIGlzCj4gbWV0YWRhdGEgZGV2aWNlIHVwZGF0ZWQgd2l0aCBhY3Rp
dmF0aW9uIG9mIHJhaWQgTFYuCgpJIHRoaW5rIGluZGVlZCB0aGF0IG9ubHkgdGhlIG1ldGFkYXRh
cyBhcmUgY29uY2VybmVkIGJ5IHRoZXNlCm1vZGlmaWNhdGlvbnMgYnV0IHRoZXkgYXJlIHN0b3Jl
ZCBzb21ld2hlcmUgb24gYSByZWFkLW9ubHkgZGlzayBhbmQKdGhlb3JldGljYWxseSBzaG91bGQg
bm90IGJlIG1vZGlmaWVkIC4KCj4KPiBTbyB3aGVuIHlvdXIgbG9jYWwgJ3JldmVydCcgcGF0Y2gg
Zm9yIDYuWCBrZXJuZWwgbm8gbG9uZ2VyIHdvcmtzIC0gdGhlcmUgaXMgbm8KPiBzdXJwcmlzZSB0
aGF0IHlvdXIgICdzZGJYJyBkcml2ZXMgYXJlIGJlaW5nIGFjdHVhbGx5IG1vZGlmaWVkIC0gc2lu
Y2UgQVRNICBkbQo+IHRhcmdldHMgYXJlIGFsbG93ZWQgdG8gYnlwYXNzICByZWFkLW9ubHkgcHJv
dGVjdGlvbi4KPgo+IFNpbmNlIHRoZSByZWFzb24gZm9yIHRoZSAgJ2J5cGFzcycgKHNuYXBzaG90
IHJlYWQtb25seSBhY3RpdmF0aW9uKSAgd2FzIGZpeGVkCj4gNSB5ZWFycyBhZ28gd2Ugc2hvdWxk
IHByb2JhYmx5IGJ1aWxkIHNvbWUgYmV0dGVyIHdheSBob3cgdG8gcmVzdG9yZSB0bwo+ICdyZWFk
LW9ubHknIHByb3RlY3Rpb24gLSBhbmQgYWxsb3cgdG8gZGlzYWJsZSBpdCBvbmx5IHdoZW4gdXNl
ciByZXF1ZXN0cyBzdWNoCj4gYmVoYXZpb3IgZHVlIHRvIHVzZSBvZiBvbGQgdXNlci1zcGFjZSB0
b29saW5nLgoKdGhhdCB3b3VsZCBiZSBjb29sIDstKQpJJ20gY3VycmVudGx5IHdvcmtpbmcgYXJv
dW5kIG15IHByb2JsZW0gd2l0aCBhIHNwZWNpZmljIGNvbmZpZ3VyYXRpb24Kb2YgbHZtLmNvbmYg
YW5kIHRoZSB1c2Ugb2YgL2Rldi9uYmQgaW4gc25hcHNob3QgbW9kZSB3aGljaCBhbGxvd3MgYW4K
YXBwYXJlbnQgY2hhbmdlIHdpdGhvdXQgcmVhbCBjaGFuZ2UuCgo+Cj4gUmVnYXJkcwo+Cj4gWmRl
bmVrCj4KCnRoYW5rIHlvdSBmb3IgdGhlc2UgZXhjaGFuZ2VzIGFuZCB5b3VyIHdvcmsuCnJlZ2Fy
ZHMsIGxhY3NhUC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9s
aXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZN
IEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

