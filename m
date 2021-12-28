Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF672C433EF
	for <linux-lvm@archiver.kernel.org>; Tue, 28 Dec 2021 06:41:36 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-JJ8t5pK2OsaGxDgb-rUaiw-1; Tue, 28 Dec 2021 01:41:32 -0500
X-MC-Unique: JJ8t5pK2OsaGxDgb-rUaiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 825ED801AAB;
	Tue, 28 Dec 2021 06:41:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 772146ABA7;
	Tue, 28 Dec 2021 06:41:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4575E4BB7C;
	Tue, 28 Dec 2021 06:41:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BS6epKg007335 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 28 Dec 2021 01:40:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 89E0E40D1B9F; Tue, 28 Dec 2021 06:40:51 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8565D40D1B9D
	for <linux-lvm@redhat.com>; Tue, 28 Dec 2021 06:40:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C1EA28EB6FB
	for <linux-lvm@redhat.com>; Tue, 28 Dec 2021 06:40:51 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-607-LX1Ej6KLMtGS4LL0-DIHnQ-1; Tue, 28 Dec 2021 01:40:49 -0500
X-MC-Unique: LX1Ej6KLMtGS4LL0-DIHnQ-1
Received: by mail-lf1-f49.google.com with SMTP id bu9so39422239lfb.7
	for <linux-lvm@redhat.com>; Mon, 27 Dec 2021 22:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version
	:subject:date:message-id:references:cc:in-reply-to:to;
	bh=ycQ1fyChqLye0IE6+WGT5+C0lCSDD2ekYJmkE+ejvTU=;
	b=uwr6Wn45fEbKUoi5ctbKLnc/XYnfrna6x2QV5JYIkQFchlCLD0HzVEH2FtJfG31gFC
	Z6K2pxl3fUI10BNwCv29zRUZlez4Kk/9fQy28s/uszFQwBcHowiuwjw6TjpK4Q1FFHOX
	myxgEOIcriP40/MpKSZhBcxAbiruIDnsypHbVLpbJ5Fp6h2GYmuxWhcipNpCuk9yEnjO
	6j35FjJ0sipS6rni2vI812ICkke0JxVQWxxdYgQlzGRwnLCCTM/3m/H8rNbDOms1k894
	W5eLozuYqtas52casbRdj8LucdTk5w5m+3JqBZUlsZEU7EWvRYPcHRmyjwMgxsiSzDVy
	aJJQ==
X-Gm-Message-State: AOAM532BzEsIASsE6eixLX7OuqCnygQ+IEOsDxJlxmcBJiRKx4PyfqRY
	K54+cwW2+syCwjkVlpDfviwbLnFz4RE=
X-Google-Smtp-Source: ABdhPJwlOYY4UrEqFokUuPOYlSFcgPOcUQ13Ulz8CowThvRnZwDlV7vhFhrh8ai/yK4+RU+0LKgrVw==
X-Received: by 2002:a05:6512:5c8:: with SMTP id
	o8mr17885144lfo.659.1640673647098; 
	Mon, 27 Dec 2021 22:40:47 -0800 (PST)
Received: from smtpclient.apple ([193.235.16.13])
	by smtp.gmail.com with ESMTPSA id
	o3sm1247169lfu.122.2021.12.27.22.40.46
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Dec 2021 22:40:46 -0800 (PST)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 28 Dec 2021 07:40:45 +0100
Message-Id: <315E5303-D491-4487-BAD4-958420346163@gmail.com>
References: <1b906296-f66d-e755-9574-f1398bc9564@gathman.org>
In-Reply-To: <1b906296-f66d-e755-9574-f1398bc9564@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BS6epKg007335
X-loop: linux-lvm@redhat.com
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Subject: Re: [linux-lvm] how to convert a disk containing a snapshot to a
	snapshot lv?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkKWWVzLCBpdCBpcyBhbiBpbmNyZW1lbnRhbCBiYWNrdXAgYmFzZWQgb2YgdGhlIGNvdyBkZXZp
Y2UKbm8gd29ycmllcyBhYm91dCB0aGUgYmFja3VwLCB0aGF0IHdvcmtzIGZpbmUsIGFuZCBub3cg
YnkganVzdCBjcmVhdGluZyBhIGx2IHNuYXBzaG90IG9uIGl0LCB3b3JrcyB0b28Kc2VudCB5b3Ug
YW4gZXhhbXBsZSBiZWZvcmUKZWcKIyBleHRlbmQgdmcgd2l0aCBuZXcgYnUgZGlzawp2Z2V4dGVu
ZCB4eHggbmV3ZGlzawojIGNyZWF0ZSBsdiBzdHJ1Y3R1cmUgb24gZGlzawpsdmNyZWF0ZSAtcyAt
TCB3aG9sZWRpc2tzaXplIC1uIHMxIHh4eC9sdiBuZXdkaXNrCiMgbWVyZ2UgaGFzIHRvIGJlIHN0
YXJ0ZWQgb2ZmbGluZT8KbHZjaGFuZ2UgLWEgbiB4eHgvbHYKIyBzdGFydCBtZXJnZQpsdmNvbnZl
cnQgLW1lcmdlIC1iIHh4eC9zMQojIG9ubGluZSB0aGUgbHYKbHZjaGFuZ2UgLWEgeSB4eHgvczEK
ClRoZSBiYWNrdXAgaXMgcHJvdmlzaW9uZWQgdGhyb3VnaCB0aGUgZGlzaywgYW5kIG1ha2VzIHRo
ZSBkYXRhIGF2YWlsYWJsZSBpbW1lZGlhdGVseQoKQnV0LCBJIGd1ZXNzIEkgY2FuIHNraXAgc29t
ZSBzdGVwcz8KClJlc3RvcmluZyBkYXRhIGluIGp1c3QgYSBtYXR0ZXIgb2YgbWludXRlcywgcmVn
YXJkbGVzcyBvZiBzaXplLCBvciB3aWxsIHNheSwgbWFraW5nIHRoZSBkYXRhIGF2YWlsYWJsZSBh
bnl3aGVyZSBpbiBqdXN0IGEgZmV3IG1pbnV0ZXMsIHJlZ2FyZGxlc3Mgb2Ygc2l6ZQoKQWxzbyB3
b3JraW5nIHdpdGggd3JpdGVzLCB3aXRob3V0IGRlc3Ryb3lpbmcgdGhlIGJhY2t1cAoKYXJlIHRo
ZXJlIGEgd2F5IHRvIGdldCBhIHNpZ25hbCB3aGVuIGEgbWVyZ2UgaGFzIGNvbXBsZXRlZD8Kb3Ig
ZG8gSSBoYXZlIHRvIGltcGxlbWVudCBhIG1vbml0b3IgCmRtc2V0dXAgeHh4Cm9yIGx2cwp0byBj
aGVjayB3aGVuIG1lcmdlIGhhcyBjb21wbGV0ZWQKClJlZmVyZW5jZSBUb21hcwoKU2VudCBmcm9t
IG15IGlQaG9uZQoKPiBPbiAyOCBEZWMgMjAyMSwgYXQgMDY6MzIsIFN0dWFydCBEIEdhdGhtYW4g
PHN0dWFydEBnYXRobWFuLm9yZz4gd3JvdGU6Cj4gCj4g77u/Cj4+IAo+PiBJZiB5b3Ugd2FudCB0
byBnaXZlIGl0IGEgdHJ5LCBqdXN0IGNyZWF0ZSBhIHNuYXBzaG90IG9uIGEgc3BlY2lmaWMgZGV2
aWNlCj4+IEFuZCBjaGFuZ2UgYWxsIHRoZSBibG9ja3Mgb24gdGhlIG9yaWdpbiwgdGhlcmUgeW91
IGFyZSwgeW91IG5vdyBoYXZlIGEgY293Cj4+IGRldmljZSBjb250YWluaW5nIGFsbCBkYXRhIG5l
ZWRlZC4KPj4gSG93IHRvIG1vdmUgdGhpcyBzbmFwc2hvdCBkZXZpY2UgdG8gYW5vdGhlciBzZXJ2
ZXIsIHJlYXR0YWNoIGl0IHRvIGFuIGVtcHR5Cj4+IGx2IHZvbHVtZSBhcyBhIHNuYXBzaG90Lgo+
PiBsdmNvbnZlcnQgLXMsIGNvbW1hbmQgcmVxdWlyZXMgYW4gYXJndW1lbnQgb2YgYW4gZXhpc3Rp
bmcgc25hcHNob3Qgdm9sdW1lCj4+IG5hbWUuCj4+IEJ1dCB0aGVyZSBpcyBubyBzbmFwc2hvdCBv
biB0aGUgbmV3IHNlcnZlciwgc28gaXQgY2FuJ3QgcmUtYXR0YWNoIHRoZQo+PiB2b2x1bWUuCj4+
IFNvIHdoYXQgcHJvY2VkdXJlcyBzaG91bGQgYmUgaW52b2tlZCB0byBjcmVhdGUganVzdCB0aGUg
ZGV0YWNoZWQgcmVmZXJlbmNlcwo+PiBpbiBMVk0sIHNvIHRoYXQgdGhlIGx2Y29udmVyIC1zIGNv
bW1hbmQgY2FuIHdvcms/Cj4gCj4gSnVzdCBjb3B5IHRoZSBzbmFwc2hvdCB0byBhbm90aGVyIHNl
cnZlciwgYnkgd2hhdGV2ZXIgbWV0aG9kIHlvdSB3b3VsZAo+IHVzZSB0byBjb3B5IHRoZSBDT1cg
YW5kIERhdGEgdm9sdW1lcyAoSSBwcmVmZXIgcGFydGNsb25lIGZvciBzdXBwb3J0ZWQKPiBmaWxl
c3lzdGVtcykuICBObyBuZWVkIGZvciBsdmNvbnZlcnQuICBZb3UgYXJlIHRyeWluZyBXQVkgV0FZ
IHRvbyBoYXJkLgo+IEFyZSB5b3UgYnkgYW55IGNoYW5jZSB0cnlpbmcgdG8gY3JlYXRlIGFuIGlu
Y3JlbWVudGFsIGJhY2t1cCBzeXN0ZW0KPiBiYXNlZCBvbiBsdm0gc25hcHNob3QgQ09XPyAgSWYg
c28sIHNheSBzby4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKPiBsaW51eC1sdm1AcmVkaGF0LmNvbQo+
IGh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCj4g
cmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJl
ZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBh
dCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLw==

