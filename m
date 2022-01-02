Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238C9C433F5
	for <linux-lvm@archiver.kernel.org>; Sun,  2 Jan 2022 19:06:39 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-237on5BQPEizVzXZKENlog-1; Sun, 02 Jan 2022 14:06:37 -0500
X-MC-Unique: 237on5BQPEizVzXZKENlog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BF591853022;
	Sun,  2 Jan 2022 19:06:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74E0710013C1;
	Sun,  2 Jan 2022 19:06:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AADA91809CB8;
	Sun,  2 Jan 2022 19:06:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 202J5e8b006610 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 2 Jan 2022 14:05:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C3490112131B; Sun,  2 Jan 2022 19:05:39 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF0011121319
	for <linux-lvm@redhat.com>; Sun,  2 Jan 2022 19:05:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4741D2A59545
	for <linux-lvm@redhat.com>; Sun,  2 Jan 2022 19:05:36 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-487-AGLROwRjO6KELi8jl60q8A-1; Sun, 02 Jan 2022 14:05:34 -0500
X-MC-Unique: AGLROwRjO6KELi8jl60q8A-1
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.20.35.215] ([37.24.118.138]) by smtp.web.de (mrweb005
	[213.165.67.108]) with ESMTPSA (Nemesis) id 1MBSB9-1nGRMn3259-00CfmY
	for <linux-lvm@redhat.com>; Sun, 02 Jan 2022 20:00:30 +0100
Message-ID: <97c9434a-d291-dc92-4418-89ab2c7d48e1@web.de>
Date: Sun, 2 Jan 2022 20:00:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.4.0
To: linux-lvm@redhat.com
From: Roland <devzero@web.de>
X-Provags-ID: V03:K1:O1cy2853mjomJpYK0/y8mbat7kE9b1GUd1xS6RXpsS94ZnGTH84
	1b2xeogZJA9zBS65tL6CImH57kONcHLMd/F7dK3eYrz5U4IPcO1iFMVVD/7qLPHPMhFzPrz
	FNftnJg28bRfmnpRcoiVpPDcwvkOXEVNFCP8b2kn0tOPsW8mtCNYTTVVDIVBDdlkmOelKll
	su5Qft10CRNvEpfEK+4vw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oQTuhHUpynQ=:5Oq7PZdRiNssJMxWpvlaUU
	Jc1gaVArULl52DdSt/w2wANSaaSLJJbiiJXEu8avpPYVXiK3qCqTVkcYit1svQHVF+UDzYyqP
	qo4XQ+IJqhlQCc6hpQ1DVOzbZDI3F63BppYTUiT1ffcXVSII3s/T3Vfwsmaur/SandQOk8nK8
	rJraGoi7+4JYd+iC8cfMq97UYTkzy+sQg236+lQxMFoHI13kIX7wXB2DyiGSKcUEvJkSFHnGb
	dV0OeFEaVADViO3nB9fhM51D2a+inuWC8yWGUP32PQ31+Ek37ga6MYzwKhbf+M4gNJzOavzFS
	fmjkXRdUvKp68i2obgc78ueRsXohQh5B2h8CDmxDUDmpPlzWY12TiXNQPhY4pyZexfMQUPVZS
	Js0aM1jcjZADnVwxN0MM3hLvW2iwqDz4OUoNaz5IFKaOXTzQHU0828QZGLcut488kq9M39Q5H
	iMewkGDs+aVCMR9iGvlxM6U9m1QpkSYd75e6st/RjrrnGnTXsO6+HPV8XV2w8o85gm77C1UCl
	+Hz33BeMVego1cebwlKoavSGDWOtmj9TTcZfQSf8VUOn7s4aAd7c+nuDa8B6+cSWz23BpYhqd
	q03rJ+OHKo4Y5KndZhHzvxXR8oZxQ177qwZE0mR03yrQ7DUDozAbOXJEoWOkZO0wlNF1HPxer
	iI5IQFgi077rRxao3JNew/0PS6YESzXefa7RMhWteOkq7DBPoS8lFqHJUKRf6+RFakjkP3lBq
	dGsnijvadfiQvk7Pnc5QjfYpb9z5d5q/3/RN/YUPrtAIj7968D0eH5agbjj48S9Or4dCgy0rL
	zsIcxAOik9MXsJsD0MOxrxiP3pfF0+xvg3P2uZMcHPKs0o9NXHDIuFmofbW0PsfjXf9JcLw6L
	exlrMMkGGTA390UIr6TqSlLDFqSi8EQ+UPsLYAfzsAkEZ4Yrop5PjpoCWxZUcIqt2dK69CUXN
	RohnTJM+SZRBE1dTuwGNG3VTZ7W8niYitgQDr2lh+99FxZ55jzYHDTmrs5oN6ZohMVwwQv432
	06xRTY3SwlW6O1SFez3jp5jHJoke6GwAMH61avZE9cm/XVTmcuSubz0wG4UvtRLIUXt094Iqg
	5btHr0hEZ9S+7Y=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 202J5e8b006610
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] convert logical sector -> physical sector + pv/vg
	extent number
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

aGVsbG8sCgppZiBpIGhhdmUgYSBsb2dpY2FsIHNlY3Rvci9ibG9jayAieCIgb24gYSBsdm0gbG9n
aWNhbCB2b2x1bWUgLMKgIGlzIHRoZXJlCmEgd2F5IHRvIGVhc2lseSBjYWxjdWxhdGUvZGV0ZXJt
aW5lIChvcHRpbWFsbHkgYnkgc2NyaXB0L2NsaSkgdGhlCmNvcnJlc3BvbmRpbmcgcGh5c2ljYWwg
c2VjdG9yIG9mIHRoZSBwaHlzaWNhbCBkZXZpY2UgaXQgYmVsb25ncyB0byBhbmQKdGhlIGV4dGVu
dCBudW1iZXIgb2YgdGhlIGFwcHJvcGlhdGUgcHYvdmcgd2hlcmUgaXQgcmVzaWRlcyA/CgpyZWdh
cmRzCnJvbGFuZAoKcHM6Cmkgd29uZGVyIGlmIHRoZXJlIGlzIGJhZCBibG9jayByZWxvY2F0aW9u
IHBvc3NpYmxlIHdpdGggbHZtLCBhbmQgaSdtCnRyeWluZyB0byBidWlsZCBzb21lIHNjcmlwdC4g
YXMgZmFyIGFzIGkgY2FuIHNlZSBsdm0gaGFzIGV2ZXJ5dGhpbmcKbmVlZGVkIGZvciB0aGF0IHRv
IHNodWZmbGUgZXh0ZW50cyBmcm9tIG9uZSBwb3NpdGlvbiBvbiBkaXNrIHRvIGFub3RoZXIuLi4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1s
dm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRo
YXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQg
aHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8=

