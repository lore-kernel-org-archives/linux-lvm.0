Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E46BC433EF
	for <linux-lvm@archiver.kernel.org>; Mon,  3 Jan 2022 11:19:17 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-vjWwi4f9PA6DcYsbDhrMMg-1; Mon, 03 Jan 2022 06:19:14 -0500
X-MC-Unique: vjWwi4f9PA6DcYsbDhrMMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A06ED1023F4F;
	Mon,  3 Jan 2022 11:19:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCAAC752CC;
	Mon,  3 Jan 2022 11:19:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 623684BB7C;
	Mon,  3 Jan 2022 11:18:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 203BIfeb006332 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 3 Jan 2022 06:18:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 09C1A401E20; Mon,  3 Jan 2022 11:18:41 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05F4D515981
	for <linux-lvm@redhat.com>; Mon,  3 Jan 2022 11:18:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0788811E78
	for <linux-lvm@redhat.com>; Mon,  3 Jan 2022 11:18:40 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-44-nfv9cNe8MyKH1KVZSJNNUw-1; Mon, 03 Jan 2022 06:18:39 -0500
X-MC-Unique: nfv9cNe8MyKH1KVZSJNNUw-1
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.20.35.215] ([37.24.118.138]) by smtp.web.de (mrweb105
	[213.165.67.124]) with ESMTPSA (Nemesis) id 1MS17h-1mxQJq1Mfj-00TEfF;
	Mon, 03 Jan 2022 12:13:25 +0100
Message-ID: <a6e37c26-77c4-2a8e-ab81-3a909c477a47@web.de>
Date: Mon, 3 Jan 2022 12:13:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.4.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Andy Smith <andy@strugglers.net>
References: <97c9434a-d291-dc92-4418-89ab2c7d48e1@web.de>
	<20220102231242.jebpzbtuxgio7l2m@bitfolk.com>
From: Roland <devzero@web.de>
In-Reply-To: <20220102231242.jebpzbtuxgio7l2m@bitfolk.com>
X-Provags-ID: V03:K1:PLOaAQLxklV6N59rejZafLsAbTp5ihV/0hmR5ETypvTCknDlaDH
	g92dFtAWXDje9XeIvQnTsSN2YUHks3qru89qT9Bx+hqnyRokSlUamL2ptvGtl7RmExtVGNm
	wm2beRgdUFWQFgO/S7uu7kswhOv5xoU+0cPHmwdJOcuokDVImBTdmwWYnilSS9HDggm23BE
	JIpF233Z4uf17rru+6wvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:z+1fJbRVwzE=:pL6AxoqcmSfu2tgcTie7YM
	74CERfccwlqXGjA9254u0stb0rWv3n4TXDeC8tYWhK7rGqrxctJl7tCUUjUqwDn2O1NxjlCZe
	x7byvw4KhksZl1Mid0nAqKLTQrdB0cjoOIPzd8T//bL2lBgYfddXTcYLLqe9LTnVi/qhdOEO9
	kS50/HTDmt99gvncPeXXEBaB8C/DmMcpBMYuB0OQQKejhftby97vJc2aqYnmqweCug+T8dImb
	aSfaaW39GH0hrRS+mT0xl7svFriiPlc+m6Z+aT3OzWMvg2MrgKnHAy3kwRKEq17XbjsKLMzRK
	kuEdPq9v4Y5gHyzfbowSXy/YNkA4TLnwqdMgxpcgMa2RSMcijgJ5EB4A5tZXsRATDxytzrU9w
	kv6tvPKVBsyvENGCeitBvyIGW8kEj5LJPRHILwWYlkMUA3ILC/2gBoIOzdQavxu++NzqtCOa+
	HM8f0HxybBJQ5KY3VNHBTVlqymbOjTRy3h8WHHaQGagfmGumpCg1AE63yGihJlf6nJrsqLG5w
	ChtQlQEc003WM3c72Cilc+r2tjjuB4t/26os0KK7uEweiQDQReHsrZH1Qg0IgffqnDJhlLwhs
	u87GyeksGZstLpz8uKbbk+5ufLa7m62xkcj3XCxdPCqRAilavDI8Pho8e+A9P9LzMo9TgD6rv
	xK3TuUPxN5AeU45LTNlS0kWHGD9TRFTuEBtNpC4d5Kf0sXlMWq7f+vzwS7LVe0E4d1ka9fjZg
	HIJHy2gBEGSrtYJJtZEM7e6CxTnnhkrVPHoLdDh+w1ETeH28sal7jzijfWo1LMoep6aeLOKTC
	95qs8/B0nBPsjyWt0TOTMe2j2fYoIDbLtEziZJ4HT4dSBnNyIL/FA2Qy9feafFWtj/6ZjlGx8
	dUvjUvwfxg49psn34M/rQ6P/j3O4Z79aLflIytwHa4nbtQNr04Ooa+u3Ox7iAjqx/IHcbPXem
	thMGZO2CY7jHPUNwwHNI+Q73XBfupOkj2H3TGWDKJHQbnxvIrM9jqo+ZXa8vHUbtzJQGEIeSs
	Sd8zEkkO3hNRd1pJ0+kryBK1WbdUkWUblLrXFoPnP4d1PAs1F+pkp9cN0IHz1mgCgbiwE+1+Z
	CQ/grS9BR5GjBA=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 203BIfeb006332
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] convert logical sector -> physical sector + pv/vg
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

dGhhbmtzIQoKYW55IGNoYW5jZSB0byBnZXQgcmV0cmlldmUgdGhpcyBpbmZvcm1hdGlvbiBmb3Ig
YXV0b21hdGVkL3NjcmlwdCBiYXNlZApwcm9jZXNzaW5nID8KCnJvbGFuZAoKCkFtIDAzLjAxLjIy
IHVtIDAwOjEyIHNjaHJpZWIgQW5keSBTbWl0aDoKPiBIaSBSb2xhbmQsCj4KPiBPbiBTdW4sIEph
biAwMiwgMjAyMiBhdCAwODowMDozMFBNICswMTAwLCBSb2xhbmQgd3JvdGU6Cj4+IGlmIGkgaGF2
ZSBhIGxvZ2ljYWwgc2VjdG9yL2Jsb2NrICJ4IiBvbiBhIGx2bSBsb2dpY2FsIHZvbHVtZSAswqAg
aXMgdGhlcmUKPj4gYSB3YXkgdG8gZWFzaWx5IGNhbGN1bGF0ZS9kZXRlcm1pbmUgKG9wdGltYWxs
eSBieSBzY3JpcHQvY2xpKSB0aGUKPj4gY29ycmVzcG9uZGluZyBwaHlzaWNhbCBzZWN0b3Igb2Yg
dGhlIHBoeXNpY2FsIGRldmljZSBpdCBiZWxvbmdzIHRvIGFuZAo+PiB0aGUgZXh0ZW50IG51bWJl
ciBvZiB0aGUgYXBwcm9waWF0ZSBwdi92ZyB3aGVyZSBpdCByZXNpZGVzID8KPiBsdmRpc3BsYXkg
LS1tYXBzIC9wYXRoL3RvL2x2Cj4KPiB0ZWxscyB5b3UgYWxsIHRoZSBtYXBwaW5ncyBvZiBsb2dp
Y2FsIGV4dGVudHMgd2l0aGluIHRoZSBMViB0bwo+IHBoeXNpY2FsIGV4dGVudHMgd2l0aGluIHRo
ZSBQVi4KPgo+IHB2ZGlzcGxheSAtLXVuaXRzIHMgL2Rldi95b3VycHYgfCBncmVwICdQRSBTaXpl
Jwo+Cj4gdGVsbHMgeW91IHRoZSBzaXplIG9mIGEgcGh5c2ljYWwgZXh0ZW50IGluIHNlY3RvcnMu
Cj4KPiBCZXR3ZWVuIHRob3NlIHlvdSBjYW4gd29yayBvdXQgdGhlIHNlY3RvciBudW1iZXIgb24g
dGhlIHBoeXNpY2FsCj4gZGV2aWNlIGZvciBhIHNlY3RvciBudW1iZXIgb24gYSBsb2dpY2FsIHZv
bHVtZS4KPgo+IENoZWVycywKPiBBbmR5Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKPiBsaW51eC1sdm1A
cmVkaGF0LmNvbQo+IGh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtbHZtCj4gcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8v
TFZNLUhPV1RPLwo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczov
L2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBM
Vk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

