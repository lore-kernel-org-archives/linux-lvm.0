Return-Path: <SRS0=ldFN=JK=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8B6C433ED
	for <linux-lvm@archiver.kernel.org>; Tue, 13 Apr 2021 19:45:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76318613C4
	for <linux-lvm@archiver.kernel.org>; Tue, 13 Apr 2021 19:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76318613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-iWhD9hmEP6iVQ7tbwfxdyw-1; Tue, 13 Apr 2021 15:45:28 -0400
X-MC-Unique: iWhD9hmEP6iVQ7tbwfxdyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC0A46D24D;
	Tue, 13 Apr 2021 19:45:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38EA914106;
	Tue, 13 Apr 2021 19:45:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 181CD1806D16;
	Tue, 13 Apr 2021 19:45:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13DJj1cG005356 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 13 Apr 2021 15:45:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 49C3320389E6; Tue, 13 Apr 2021 19:45:01 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4447620389E3
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2021 19:44:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 432AD811E93
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2021 19:44:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-418-m7GmtNxOMJimm6afyWztCw-1; Tue, 13 Apr 2021 15:44:56 -0400
X-MC-Unique: m7GmtNxOMJimm6afyWztCw-1
Received: by mail-lf1-f41.google.com with SMTP id f41so5844638lfv.8
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2021 12:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=doOqhRA451618oF3MS9WZg0TVspR0QqxRfE/4EUTV2U=;
	b=g2Tij8soDCq3ED3CiQvCRXwYz+xJOSkXV9fk4jcMlK/+wcaAi1uUmWRG7r+K6iBOEm
	5lNq3mn157WmIMlrk1Hplf7j1mPxUMUAkx66/o5xAZHLStuHMvlp2p8lJDryRpqiClth
	cJiEa18QAShwlzZdsCYY8Tk15+4B/BK2NuHZz1wYiGjtf95jd/vIpILclHA01qUQsVMw
	uzJB+kRPBRbYVG2r4jsut/PsmHOiYqu/muMBbj2GqOqN0fZwaObNo/OuNft0RTDfsySH
	cK5dlps+8ScNTu96K+By49w1FRgkBoulTxeqtC9ZWEXdBOCKnnXVsXp6Q+LWj7M9JqKX
	dRIw==
X-Gm-Message-State: AOAM530ZW4dUp0Lrv/UOZR2gV9V0E5EO99yE+zwbAEXxWcatbTSV3Ojz
	oRrMVVrcD9+9hpA2qBgh9l2ZJZ+7yNKkraClwXvznKegv141LA==
X-Google-Smtp-Source: ABdhPJzwsR7ukNmuPfmLCXsLLafW2dzYW6BpNaJnWRB6tkPrTz/IsSapC/PNbJi7Yow6ec1cXUNcqzJ7A/sJDcRLqLw=
X-Received: by 2002:a05:6512:3b14:: with SMTP id
	f20mr7539020lfv.59.1618343094037; 
	Tue, 13 Apr 2021 12:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <34286f13-5b4c-cceb-09f2-09d8703765f3@gmx.de>
In-Reply-To: <34286f13-5b4c-cceb-09f2-09d8703765f3@gmx.de>
From: =?UTF-8?B?UMOpdGVyIFPDoXJrw7Z6aQ==?= <xmisterhu@gmail.com>
Date: Tue, 13 Apr 2021 21:44:42 +0200
Message-ID: <CAP1D0fRH2Ngk-1pVdTcVRiGcXtyW=JJ2c9Tj3Bk0LGG7neZWkg@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13DJj1cG005356
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] RAID1 mirroring behavior when one disk is dead
	sometimes?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TWFyYyBXZWJlciA8bWFyY28tb3dlYmVyQGdteC5kZT4gZXp0IMOtcnRhIChpZMWRcG9udDogMjAy
MS4gw6Fwci4gMTMuLCBLLCAxNzo1OCk6Cj4KPiBJIGNyZWF0ZWQgYSB0ZXN0IHdpdGggMiBkaXNr
cyB0aGVuIGJvb3RlZCB3aXRob3V0IGRpc2syIHRoZW4gd2l0aG91dCBkaXNrMSAoZWFjaCB0aW1l
IGFkZGluZyBhIGZpbGUuCj4KPiBUaGVuIEkgYm9vdGVkIHdpdGggYm90aC4gVGhlIHJlc3VsdCB3
YXMgaW4ga2VybmVsIGxvZ3MgSSBmb3VuZCAnbWlycm9yaW5nIG9yIHN1Y2gnIGFuZCBJIG9ubHkg
Z290IGNvbnRlbnRzIG9mIGRpc2sgMS4KPgo+Cj4gSXMgdGhlcmUgYW55IG9wdGlvbiB0byBzYXkg
aWYgYm90aCBtaXJyb3JzIGdldCBjaGFuZ2VkIGRvbid0IG1vdW50IGJ1dCBjYXVzZSBhbiBlcnJv
ciBiZWNhdXNlIHRoYXQgbWlnaHQgYmUgYmV0dGVyIHRoYW4KPgo+IGdldHRpbmcgbmV3bHkgd3Jp
dHRlbiBkYXRhIHJlc2V0IHJhbmRvbWx5ID8KPgo+Cj4gRGlkIEkgbWlzcyBhbiBvcHRpb24/IFdv
dWxkIG1kYWRtIGJlIGJldHRlciA/Cj4KPgo+IEkgdHJpZWQgbG9va2luZyBhdCBhcmNoaXZlcyB3
ZXJlIENQVSBib3R0bGVuZWNrIGZvciByYWlkcyB3YXMgbWVudGlvbmVkIG9mdGVuIGFuZCAnd29y
ayBiZWluZyBkb25lJyBvbiBpdC4KPgo+IFdoYXQncyBzdGF0dXMgb2YgdGhhdCBvciBhcmUgdGhl
IGFkdmljZXMgZ2l2ZW4gdGhlcmUgc3RpbGwgdmFsaWQgPwo+Cj4KPiBNYXJjIFdlYmVyCj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWx2
bSBtYWlsaW5nIGxpc3QKPiBsaW51eC1sdm1AcmVkaGF0LmNvbQo+IGh0dHBzOi8vbGlzdG1hbi5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCj4gcmVhZCB0aGUgTFZNIEhPVy1U
TyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo+CgpBcyBmYXIgYXMgSSBrbm93
IG1kYWRtIHdvcmtzIHRoZSBzYW1lIHdheS4gKEF0IGxlYXN0IGl0IHdhcyB3b3JraW5nCmxpa2Ug
dGhpcyB3aGVuIHRoaXMgdGhyZWFkIGhhcHBlbmVkOgpodHRwczovL3d3dy5zcGluaWNzLm5ldC9s
aXN0cy9yYWlkL21zZzM2OTYyLmh0bWwpCgpZb3UgY2FuIHVzZSBhIHNpbWlsYXIgdGFjdGljIHRo
YXQgd2FzIHJlY29tbWVuZGVkIHRoZXJlOiBEb24ndAphc3NlbWJsZSBhIGRlZ3JhZGVkIFJBSUQx
IGFycmF5IHdpdGhvdXQgdXNlciBpbnRlcmFjdGlvbi4gWW91IGNhbiBkbwp0aGlzIGJ5IGNoYW5n
aW5nIHRoZSBhY3RpdmF0aW9uIG1vZGUgdG8gY29tcGxldGUgaW4gbHZtLmNvbmYuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxp
bmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90
bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

