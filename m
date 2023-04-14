Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E01C77B70
	for <linux-lvm@archiver.kernel.org>; Fri, 14 Apr 2023 06:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681455139;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uXLz7I2F2+kbjdIo5ndBDBIlELorYHgHT4tnvfh86AY=;
	b=AWCWrnxIfyQqUe/ufV3sZRfUnOJ3TFujCzo6RzZPKO4cgu+KbFhSwqr+algtPAkhEdRzBA
	4PVAzJFHzo2lUadz+dFvlx5JkRC/RWnngm+Jlgt/bDDENGjyr0ogloLLZsPiPjIYifMP+s
	BxAui9QwEevxwlaIPCWy3TLkNTB5y44=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-1MA5txqUN3KIrZpLtRGH9w-1; Fri, 14 Apr 2023 02:52:18 -0400
X-MC-Unique: 1MA5txqUN3KIrZpLtRGH9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8F4518E0AC3;
	Fri, 14 Apr 2023 06:52:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 155C7112132E;
	Fri, 14 Apr 2023 06:52:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E832C1946A73;
	Fri, 14 Apr 2023 06:52:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0161419465B6
 for <linux-lvm@listman.corp.redhat.com>; Fri, 14 Apr 2023 03:49:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E1100112132D; Fri, 14 Apr 2023 03:49:06 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D93EB1121320
 for <linux-lvm@redhat.com>; Fri, 14 Apr 2023 03:49:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B48A08996F1
 for <linux-lvm@redhat.com>; Fri, 14 Apr 2023 03:49:06 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-Wg6qkCOaOZ2S2CdP2DIP1g-1; Thu, 13 Apr 2023 23:49:04 -0400
X-MC-Unique: Wg6qkCOaOZ2S2CdP2DIP1g-1
Received: by mail-pj1-f42.google.com with SMTP id
 mq14-20020a17090b380e00b002472a2d9d6aso2789332pjb.5
 for <linux-lvm@redhat.com>; Thu, 13 Apr 2023 20:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681444144; x=1684036144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WH96tvKdjRviRw3BI8TqAVlPwr1qeUwQaiL9kSs0WH4=;
 b=WlUuyfUUQZCM5BOcdMIxT5r1tBIy8/7nYRrVtr91UFU3vjpO+hJBL3/WzhHdAr1AE9
 x+e15IBf7KNeie+tB28mZUJQ3qEDfOh5/KkGNlToKjM6n7gg/f6P1qvQY2D1ZjV+/+h2
 NZlZg5aie7aRYgzdOLwB7QcYQ7RQB5h0XQ1WMROBzQDnJ6nhopm4Po5OOFdzIINXFIyc
 +ookiJN3vuZOxhLONorzuGlbroLYLCmEtV3crlcD2DDwG3RQ/NPPVMLZnv1qmqVyNNHy
 UW0ypW6+CpSDKdl1J3j7Nj9A3Y8NDgyhEBjpTmrbVYXtAck9173zFWAz3EaOqZbYFuJf
 vL7w==
X-Gm-Message-State: AAQBX9cqeV8RhniQGtD0d1E9aBDZQ8ijqAZMltjfMDlt+oL3Ig7jWJQt
 Jf3wryFcrlQqKozeFH1w0/qaYA==
X-Google-Smtp-Source: AKy350YaiCfIKTMziRzFqXyCofAyZiDXXdja9lxfpCV8nKKehuGApAt4TE2q8fyZ+uebDEhll/jtgA==
X-Received: by 2002:a17:903:41c3:b0:19e:8566:ea86 with SMTP id
 u3-20020a17090341c300b0019e8566ea86mr1475126ple.62.1681444143673; 
 Thu, 13 Apr 2023 20:49:03 -0700 (PDT)
Received: from [10.87.56.20] ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id
 ij29-20020a170902ab5d00b0019462aa090bsm2130293plb.284.2023.04.13.20.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 20:49:03 -0700 (PDT)
Message-ID: <9b3c6fd7-5139-989e-69c1-6b007c402378@bytedance.com>
Date: Fri, 14 Apr 2023 11:48:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
To: Giorgio Bersano <giorgio.bersano@gmail.com>
References: <ac0f39c8-932d-293a-b7aa-568532bda22a@bytedance.com>
 <20230411133147.GB27598@redhat.com>
 <e318740a-bb17-8e38-ed3f-f1776292b47c@bytedance.com>
 <CA+ZC=DhNUKE53bpLcOvNoaf4oFikeFDYT6NrrG_Bo6K5m7fTqA@mail.gmail.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <CA+ZC=DhNUKE53bpLcOvNoaf4oFikeFDYT6NrrG_Bo6K5m7fTqA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Fri, 14 Apr 2023 06:52:11 +0000
Subject: Re: [linux-lvm] How to convert a single path to a multipath after
 using dm-multipath
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGkgR2lvcmdpbywKClRoYW5rIHlvdSBmb3IgeW91ciByZXBseSBhbmQgZGV0YWlsZWQgYW5zd2Vy
cy4KCldoZW4gSSBmaWx0ZXJlZCBvdXQgdGhlIHNkYSBkZXZpY2Ugb24gdGhlIGx2bSBjb25maWd1
cmF0aW9uIGZpbGUgaXQgCndvcmtzIGZpbmUuCgpUaGFuayB5b3UgYWdhaW4gZm9yIHlvdXIgaGVs
cC4KClJlZ2FyZHMKClpoaXlvbmcKCk9uIDQvMTMvMjMgNjo1NCBQTSwgR2lvcmdpbyBCZXJzYW5v
IHdyb3RlOgo+IEhpIFpoaXlvbmcsCj4gZGlkIHlvdSBmaWx0ZXIgb3V0IHRoZSBkZXZpY2UgaW4g
bHZtLmNvbmYgPwo+IAo+IGZpbHRlciA9IFsgLi4uICwgInIvc2QuKi8iICwgLi4uIF0KPiAKPiAg
wqAgwqAgwqAgwqAgwqBvcsKgICJyL3NkYS8iIGlmIHlvdSB3YW50IHRvIG9ubHkgZXhjbHVkZcKg
IHNkYQo+IAo+IFJlZ2FyZHMsCj4gR2lvcmdpby4KPiAKPiAKPiBJbCBnaW9ybm8gZ2lvIDEzIGFw
ciAyMDIzIGFsbGUgb3JlIDA4OjU1IFpoaXlvbmcgWWUgCj4gPHllemhpeW9uZ0BieXRlZGFuY2Uu
Y29tIDxtYWlsdG86eWV6aGl5b25nQGJ5dGVkYW5jZS5jb20+PiBoYSBzY3JpdHRvOgo+IAo+IAo+
ICAgICBIaSBEYXZlLAo+IAo+ICAgICBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCj4gCj4gICAg
IEJlY2F1c2UgSSBoYWQgbm90IGNvbnNpZGVyZWQgbXVsdGktcGF0aGluZyBiZWZvcmUsIHRoZXJl
IGlzIG5vIHdheSB0bwo+ICAgICBjb25maWd1cmUgbXBhdGggb24gc2RhIGFsb25lIG9uIHRoZSBj
dXJyZW50IHN0b2NrIG9mIG1hY2hpbmVzLiBBbmQgSQo+ICAgICB0ZXN0ZWQgdGhpcyBpbiBteSBl
bnZpcm9ubWVudCB1c2luZyBsdmNoYW5nZSAtLXJlZnJlc2gsIGJ1dCBpdCBkb2Vzbid0Cj4gICAg
IHN3aXRjaCB0aGUgYWN0aXZlIExWIHRvIHVzZSBtcGF0aGEuCj4gCj4gICAgICMgbHZjaGFuZ2Ug
LS1yZWZyZXNoIGlzLWhlNTdlNm1yNHdlbWIxOWtnZjhpCj4gICAgIFdBUk5JTkc6IE5vdCB1c2lu
ZyBkZXZpY2UgL2Rldi9tYXBwZXIvbXBhdGhhIGZvciBQVgo+ICAgICBIZ0wzeFItcVRpby1tNzVR
LW5HQU8tVW4wVS04dUhrLXdIYkgyNS4KPiAgICAgV0FSTklORzogUFYgSGdMM3hSLXFUaW8tbTc1
US1uR0FPLVVuMFUtOHVIay13SGJIMjUgcHJlZmVycyBkZXZpY2UKPiAgICAgL2Rldi9zZGEgYmVj
YXVzZSBkZXZpY2UgaXMgdXNlZCBieSBMVi4KPiAKPiAgICAgIyBwdnMKPiAgICAgV0FSTklORzog
Tm90IHVzaW5nIGRldmljZSAvZGV2L21hcHBlci9tcGF0aGEgZm9yIFBWCj4gICAgIEhnTDN4Ui1x
VGlvLW03NVEtbkdBTy1VbjBVLTh1SGstd0hiSDI1Lgo+ICAgICBXQVJOSU5HOiBQViBIZ0wzeFIt
cVRpby1tNzVRLW5HQU8tVW4wVS04dUhrLXdIYkgyNSBwcmVmZXJzIGRldmljZQo+ICAgICAvZGV2
L3NkYSBiZWNhdXNlIGRldmljZSBpcyB1c2VkIGJ5IExWLgo+ICAgICBQVsKgIMKgIMKgIMKgIMKg
IMKgVkfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBGbXTCoCBBdHRyIFBTaXplwqAg
UEZyZWUKPiAgICAgL2Rldi9zZGHCoCDCoCDCoGlzLWhlNTdlNm1yNHdlbWIxOWtnZjhpIGx2bTIg
YS0twqAgMTAuMDB0IDkuOTh0Cj4gCj4gICAgIFRoaXMgaXMgYmVjYXVzZSBkdXBsaWNhdGUgUFZz
IGFyZSBlbmNvdW50ZXJlZCBkdXJpbmcgdGhlIGRpc2sgZGlzY292ZXJ5Cj4gICAgIHBoYXNlLCBi
dXQgbHZtY2FjaGUgdGVuZHMgdG8gdXNlIHNkYSBiZWNhdXNlIGl0IGlzIGN1cnJlbnRseSBiZWlu
ZyB1c2VkCj4gICAgIGJ5IExWIGFuZCBtcGF0aGEgd2lsbCBiZSBkcm9wcGVkLgo+IAo+ICAgICBJ
IGRlYnVnZ2VkIHRoZSBfY2hvb3NlX2R1cGxpY2F0ZXMgZnVuY3Rpb24gaW4gbHZtY2FjaGUgYW5k
IHByaW50ZWQgdGhlCj4gICAgIGZvbGxvd2luZyBsb2c6Cj4gICAgIGx2bVszMzUyNDUwXTogUFYg
SGdMM3hScVRpb203NVFuR0FPVW4wVTh1SGt3SGJIMjUgY29tcGFyZSBkdXBsaWNhdGVzOgo+ICAg
ICAvZGV2L21hcHBlci9tcGF0aGEgMjU0OjMuIC9kZXYvc2RhIDg6MTYuIGRldmljZV9oaW50IC9k
ZXYvc2RhLgo+ICAgICB2bVszMzUyNDUwXTogUFYgSGdMM3hScVRpb203NVFuR0FPVW4wVTh1SGt3
SGJIMjU6IHNpemUgMjE0NzQ4MzY0ODAuCj4gICAgIC9kZXYvbWFwcGVyL21wYXRoYSBpcyAyMTQ3
NDgzNjQ4MC4gL2Rldi9zZGEgaXMgMjE0NzQ4MzY0ODAuCj4gICAgIGx2bVszMzUyNDUwXTogUFYg
SGdMM3hScVRpb203NVFuR0FPVW4wVTh1SGt3SGJIMjU6IC9kZXYvbWFwcGVyL21wYXRoYQo+ICAg
ICB3YXMgcHJldiA8bm9uZT4uIC9kZXYvc2RhIHdhcyBwcmV2IDxub25lPi4KPiAgICAgbHZtWzMz
NTI0NTBdOiBQViBIZ0wzeFJxVGlvbTc1UW5HQU9VbjBVOHVIa3dIYkgyNToKPiAgICAgL2Rldi9t
YXBwZXIvbXBhdGhhIGlzCj4gICAgIGluIHN1YnN5c3RlbS4gL2Rldi9zZGEgaXMgbm90IGluIHN1
YnN5c3RlbS4KPiAgICAgbHZtWzMzNTI0NTBdOiBQViBIZ0wzeFJxVGlvbTc1UW5HQU9VbjBVOHVI
a3dIYkgyNToKPiAgICAgL2Rldi9tYXBwZXIvbXBhdGhhIGlzCj4gICAgIGRtLiAvZGV2L3NkYSBp
cyBub3QgZG0uCj4gICAgIGx2bVszMzUyNDUwXTogUFYgSGdMM3hScVRpb203NVFuR0FPVW4wVTh1
SGt3SGJIMjU6IC9kZXYvbWFwcGVyL21wYXRoYQo+ICAgICBoYXMgbm8gbW91bnRlZCBmcy4gL2Rl
di9zZGEgaGFzIG5vIG1vdW50ZWQgZnMuCj4gICAgIGx2bVszMzUyNDUwXTogUFYgSGdMM3hScVRp
b203NVFuR0FPVW4wVTh1SGt3SGJIMjU6Cj4gICAgIC9kZXYvbWFwcGVyL21wYXRoYSBpcwo+ICAg
ICBub3QgdXNlZCBmb3IgTFYuIC9kZXYvc2RhIGlzIHVzZWQgZm9yIExWLgo+ICAgICBsdm1bMzM1
MjQ1MF06IFBWIEhnTDN4UnFUaW9tNzVRbkdBT1VuMFU4dUhrd0hiSDI1IHdpdGggZHVwbGljYXRl
cyB3aWxsCj4gICAgIGNoYW5nZSBmcm9tIC9kZXYvbWFwcGVyL21wYXRoYSB0byAvZGV2L3NkYS4K
PiAgICAgbHZtWzMzNTI0NTBdOiBEcm9wcGluZyB1bmNob3NlbiBkdXBsaWNhdGUgL2Rldi9tYXBw
ZXIvbXBhdGhhCj4gICAgIGx2bVszMzUyNDUwXTogQWRkaW5nIGNob3NlbiBkdXBsaWNhdGUgL2Rl
di9zZGEKPiAKPiAgICAgSXMgdGhlcmUgYW55IHdheSB0byBjaGFuZ2UgdGhlIFBWIHByZWZlcmVu
Y2UgcG9saWN5IGluCj4gICAgIF9jaG9vc2VfZHVwbGljYXRlcz8KPiAKPiAKPiAKPiAKPiAgICAg
UmVnYXJkcwo+IAo+ICAgICBaaGl5b25nCj4gCj4gICAgIE9uIDQvMTEvMjMgOTozMSBQTSwgRGF2
aWQgVGVpZ2xhbmQgd3JvdGU6Cj4gICAgICA+IE9uIFR1ZSwgQXByIDExLCAyMDIzIGF0IDAxOjI5
OjQyUE0gKzA4MDAsIFpoaXlvbmcgWWUgd3JvdGU6Cj4gICAgICA+PiBhbmQgbHYgb24gaXQuIEkg
dGhlbiB0dXJuIG9uIHRoZSBtdWx0aXBhdGggZnVuY3Rpb24gYW5kIG1lcmdlCj4gICAgIHRoZSB0
d28gcGF0aHMKPiAgICAgID4+IGludG8gYSBuZXcgZGV2aWNlICgvZGV2L21hcHBlci9tYXRoYSks
IGFuZCBJIGdldCB0aGUgZm9sbG93aW5nCj4gICAgIGVycm9yIHdoZW4gSQo+ICAgICAgPj4gZXhl
Y3V0ZSB0aGUgbHZtIGNvbW1hbmQuCj4gICAgICA+Pgo+ICAgICAgPj4gIyBwdnMKPiAgICAgID4+
IFdBUk5JTkc6IE5vdCB1c2luZyBkZXZpY2UgL2Rldi9tYXBwZXIvbWF0aGEgZm9yIFBWCj4gICAg
ICA+PiBIZ0wzeFItcVRpby1tNzVRLW5HQU8tVW4wVS04dUhrLXdIYkgyNS4KPiAgICAgID4+IFdB
Uk5JTkc6IFBWIEhnTDN4Ui1xVGlvLW03NVEtbkdBTy1VbjBVLTh1SGstd0hiSDI1IHByZWZlcnMK
PiAgICAgZGV2aWNlIC9kZXYvc2RhCj4gICAgICA+PiBiZWNhdXNlIGRldmljZSBpcyB1c2VkIGJ5
IExWLgo+ICAgICAgPj4gUFbCoCDCoCDCoCDCoCDCoCDCoFZHwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgRm10wqAgQXR0ciBQU2l6ZcKgIFBGcmVlCj4gICAgICA+PiAvZGV2L3NkYcKg
IMKgIMKgaXMtaGU1N2U2bXI0d2VtYjE5a2dmOGkgbHZtMiBhLS3CoCAxMC4wMHQgOS45OHQKPiAg
ICAgID4KPiAgICAgID4+IE1heSB5b3UgcGxlYXNlIGFkdmlzZSBob3cgb25lIGNhbiBjb252ZXJ0
IHRoZSBwdiB1c2VkIGJ5IHZnIGZyb20KPiAgICAgc2RhIHRvCj4gICAgICA+PiBtYXRoYSB3aXRo
b3V0IGFmZmVjdGluZyB0aGUgY3VycmVudCBsdiB1c2FnZS4KPiAgICAgID4KPiAgICAgID4gbHZj
aGFuZ2UgLS1yZWZyZXNoIHNob3VsZCByZWZyZXNoIHRoZSBhY3RpdmUgTFYgdG8gdXNlIG1wYXRo
YS4gCj4gICAgIFRvIGF2b2lkCj4gICAgICA+IHRoaXMsIHlvdSBtaWdodCBjb25maWd1cmUgbXBh
dGggb24gc2RhIGFsb25lIHByaW9yIHRvIGFkZGluZyB0aGUKPiAgICAgc2Vjb25kCj4gICAgICA+
IHBhdGguCj4gICAgICA+Cj4gICAgICA+IERhdmUKPiAgICAgID4KPiAKPiAgICAgX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiAgICAgbGludXgtbHZtIG1h
aWxpbmcgbGlzdAo+ICAgICBsaW51eC1sdm1AcmVkaGF0LmNvbSA8bWFpbHRvOmxpbnV4LWx2bUBy
ZWRoYXQuY29tPgo+ICAgICBodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWx2bQo+ICAgICA8aHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1sdm0+Cj4gICAgIHJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3Rs
ZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8KPiAgICAgPGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0t
SE9XVE8vPgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xp
c3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0g
SE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCg==

