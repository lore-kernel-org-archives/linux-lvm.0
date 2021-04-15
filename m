Return-Path: <SRS0=HOtc=JM=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02A3C433B4
	for <linux-lvm@archiver.kernel.org>; Thu, 15 Apr 2021 04:20:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 449E361073
	for <linux-lvm@archiver.kernel.org>; Thu, 15 Apr 2021 04:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 449E361073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-SzzpNIBlPKqssO32ZD5lUA-1; Thu, 15 Apr 2021 00:20:28 -0400
X-MC-Unique: SzzpNIBlPKqssO32ZD5lUA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04A4D8030BB;
	Thu, 15 Apr 2021 04:20:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DB245D760;
	Thu, 15 Apr 2021 04:20:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C71F01806D0F;
	Thu, 15 Apr 2021 04:20:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13F4JwHO030207 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 15 Apr 2021 00:19:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FB12103F286; Thu, 15 Apr 2021 04:19:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B52B103F28F
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2021 04:19:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 216BC802A61
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2021 04:19:55 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-373-L97eTO1APjqdgcc8TvDD7A-1;
	Thu, 15 Apr 2021 00:19:52 -0400
X-MC-Unique: L97eTO1APjqdgcc8TvDD7A-1
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.104] ([5.83.191.199]) by mail.gmx.net (mrgmx105
	[212.227.17.168]) with ESMTPSA (Nemesis) id 1McH9Y-1m72a239hM-00ciSg
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2021 06:19:50 +0200
To: linux-lvm@redhat.com
References: <34286f13-5b4c-cceb-09f2-09d8703765f3@gmx.de>
	<CAP1D0fRH2Ngk-1pVdTcVRiGcXtyW=JJ2c9Tj3Bk0LGG7neZWkg@mail.gmail.com>
From: Marc Weber <marco-oweber@gmx.de>
Message-ID: <9a08e0e2-2423-c7f2-df96-94caf53eb0b3@gmx.de>
Date: Thu, 15 Apr 2021 06:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAP1D0fRH2Ngk-1pVdTcVRiGcXtyW=JJ2c9Tj3Bk0LGG7neZWkg@mail.gmail.com>
X-Provags-ID: V03:K1:PTzt5Czeew7mBl0ZT/BE8kDiC/IPdfKmigkxHjbmsxgCwEWPsV1
	bHQSFRfjCF3mgs4kWrqoYQFvsEVfjL+dkV+hHrDjBPk+avR0YIB82k7yEBBmRtFbZ0dGXMt
	0xmGnU4RyHJxXWxewX6Wg1YVei7ltz+0gJBoxzdWGVk1vg2qWlYu4v7SAHSa5HrZIiywiZg
	Y8HBhGWoC6NR+QwFMBTkQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3MX64Qpj4zI=:SEgExux/NYF4UzBpMqIiYy
	U3zVX0t7F7DsxBioTzqKV/eD0RsArcxS4xfo+PyWqlvbxiWjI28V6Jtr2EB3BR9LDLkOtbSGZ
	3xu+00D1adfElRqmcNrIXKQ7QFIVKkNn49dl9CmyEenIKRycTDwaEjzRGbdar6V7GN+BFQFfl
	1Gk9ax3J0q8QV91zprGwIQUZkSEotFWQm282brBpZWzD7qoS8U1jCHdxh8FBOZnkNB1ZIytBy
	4DfjBXh2cOyTP5gteg9zDpaDvZIabm+t9qvLodYq6V8i0eEITCXyn4oT16NO5b0d4dEE46dYr
	iV0OtUGeQgBj0qHMFjGod3xmuOC9YN/FS5ZFOELmrcz/SUX8102jrehOj+LioU5zM9PT/j5Yt
	u3qDc2xNINsfcu35lRu1Jo7uQMWQTeb0+capkhxSzCPO+aCAFCfAZywLszXJfxf+hQ+QFjfSB
	fWBIXWTcHNZrOnrH3hM507ty5qrazFyVniOi/Cxk44no4LJtfgVA36nAHbLTPnU1D+wAQT6OU
	agIVqWSgpdBoiL2i6rd2SQhY5dLIx2Q1C13VbYj85Z8QMf5+0AIiZrUHEQUEXe+ZBfjGjh/KO
	7L13Hfo7WX6zL7y80vmrBSPSDzPQRhHZ71CjttGOd1saE1lX2v2cz8fyzokpro1zrnb/BsNje
	mhZP5juLNSyxG0laVYuKeU/XT3/e5O936Jt5vNXs+3YOhVTuHsLCBVN9GyuQjP7IdOZvWpc+2
	ImBibsthz1a3hiZ7nR+wEVt6fEzdb8dO5wBIbAOQlR2AL73M3MVSnMa2uX/CGw9KGFIfVMLb9
	1q7TMaGQkzJ4hlfyvZmhKrp/QSucmji1usidDwwk+eZf1RgqNrwEhgEPGey/mqg7Jt25hSdCs
	Vg98ndtrL1pjpTCiqZmQvHWK8q6B93ujRm9E+y8K7JDm+8y+tjnwNL6bMAHH7fbvBLLqiuYrL
	lQndO15EktIF2QccDdLA91t3puhi8oLDcQj9Hlrqq5v1LVwhTgTXA1NH1S5OYxAC43sDWH7Y/
	ZCDNgmWLfNYc2+zIdDzNZHBUQY0/3VpjDVrPNjCf/5e7DDjdwZrzXgkFf4QT1we5C63b6z+U/
	r0NM9Rz1FRfLbTQ2/dWQrjXzCytbL0aSM8Iq0OFBgin1eaiz4eiI+SPvkSGYgH+lAb6MXJ1ad
	o+DhyvF4O5wcXj3yvPHCKwTZmPFfsY9cSTKYImyjKH31OsVAeif/ICQzJMwwTurs37X9g77lv
	tA4RoXYPxT+bY5Z/wDLxH7m3Jc1lZ3ZJ5vZgR2Q==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13F4JwHO030207
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] RAID1 mirroring behavior when one disk is dead
 sometimes - why not just use random numbers ??
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

Cj4gQXMgZmFyIGFzIEkga25vdyBtZGFkbSB3b3JrcyB0aGUgc2FtZSB3YXkuIChBdCBsZWFzdCBp
dCB3YXMgd29ya2luZwo+IGxpa2UgdGhpcyB3aGVuIHRoaXMgdGhyZWFkIGhhcHBlbmVkOgo+IGh0
dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL3JhaWQvbXNnMzY5NjIuaHRtbCkKPgo+IFlvdSBj
YW4gdXNlIGEgc2ltaWxhciB0YWN0aWMgdGhhdCB3YXMgcmVjb21tZW5kZWQgdGhlcmU6IERvbid0
Cj4gYXNzZW1ibGUgYSBkZWdyYWRlZCBSQUlEMSBhcnJheSB3aXRob3V0IHVzZXIgaW50ZXJhY3Rp
b24uIFlvdSBjYW4gZG8KPiB0aGlzIGJ5IGNoYW5naW5nIHRoZSBhY3RpdmF0aW9uIG1vZGUgdG8g
Y29tcGxldGUgaW4gbHZtLmNvbmYuCgpCdXQgdGhlbiB0aGUgc2VydmVyIGRvZXNuJ3Qgc3RhcnQg
YXQgYWxsIHdoaWNoIG1pZ2h0IGFsc28gYmUgY29zdGx5LgoKClRoZSB0aHJlYWQgc2F5cyB0aGF0
IGNsb2NrIGkgbm90IHJlbGlhYmxlIGV2ZW50dWFsbHkgZHVlIHRvIGZhdWx0eSBoYXJkd2FyZSBl
dGMuCgoqQlVUKiB3aHkgaXNuJ3QgdGhlcmUgYSB3YXkgdG8gJ3N0YW1wJyB0aGUgZGlza3Mgb25j
ZSBjbG9jayBpcyBzeW5jZWQgd2l0aCB0aGUgaW50ZXJuZXQgPwoKCkxldCdzIGNvbXBhcmUgdHdv
IGNhc2VzIGFuZCB0d28gc29sdXRpb25zLgoKCnNvbHV0aW9uIDE6Cgp3cml0ZSBkYXRlcyBbZGF0
ZSwga25vd24tZGV2aWNlc10gdG8gdGhlIGFjdGl2ZSBkaXNrcwoKQ0FTRTogZGlzayAxIGFwcGVh
cnMgc29tZXRpbWVzLiBkaXNrMiB3b3VsZCBoYXZlICdrbm93LWRldmljZXMnIGRpc2syIG9ubHks
IHNvIGRpc2sxIGNvdWxkIGJlIGlkZW50aWZpZWQgYXMgdHJvdWJsZXNvbWUuCgphY3Rpb24gbWly
cm9yIGRpc2sywqAgdG8xCgoKQ0FTRTogc3BsaXQgYnJhaW46IGRpc2sxIGFwcGVhcnMsIHJlYm9v
dCBkaXNrMiBhcHBlYXJzLCByZWJvb3QgYm90aCBhcHBlYXIKCkRhdGVzIHdvdWxkIGJlIGRpZmZl
cmVudC4gLT4gbm8gbW91bnQKCgpOb3QgdXNpbmcgdGhlIGRhdGUgaW5mbyBhdCBhbGwsIHRodXMg
Y291bGQgYmUgdXNpbmcgcmFuZG9tIG51bWJlcnMgd2hpY2ggd291bGQgYmUgc29sdXRpb24gMi4K
CgoKSSBkb24ndCBoYXZlIGV4cGVyaWVuY2UgaG93IG9mdGVuIGRpc2tzIGFwcGVhciBzb21ldGlt
ZXMgb25seS4KClRvIG1lIGl0IGxvb2tzIGxpa2UgaGF2aW5nIHN1Y2ggc3RyYXRlZ3kgYWJvdmUg
d2hpY2ggYWxzbyBjb3VsZCBiZSBpbXBsZW1lbnRlZCBpbiB1c2VyIHNwYWNlIChidXQgd2h5ID8p
Cgp3b3VsZCB3b3JrIGluIG1vcmUgY2FzZXMgdmVyeSB3ZWxsIGNhdXNlIHRoZSBzZXJ2ZXIgd291
bGQgYm9vdCBtb3JlIG9mdGVuIHRoYW4gbm90LgoKCk1hcmMgV2ViZXIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0
CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3Jn
L0hPV1RPL0xWTS1IT1dUTy8=

