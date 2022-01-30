Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B762C433EF
	for <linux-lvm@archiver.kernel.org>; Sun, 30 Jan 2022 11:18:58 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-rz117UKpPJ2HdZz0fVvQMg-1; Sun, 30 Jan 2022 06:18:52 -0500
X-MC-Unique: rz117UKpPJ2HdZz0fVvQMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEEC61006AA0;
	Sun, 30 Jan 2022 11:18:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A19F66E3C;
	Sun, 30 Jan 2022 11:18:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3646C1809CB8;
	Sun, 30 Jan 2022 11:18:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20UBIb5Z030310 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 30 Jan 2022 06:18:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1ED9B492CAB; Sun, 30 Jan 2022 11:18:37 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A987492CA4
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 11:18:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F316F811E78
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 11:18:36 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
	[209.85.218.51]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-529-2d4uf5vvOd2Se4LdlENLXA-1; Sun, 30 Jan 2022 06:18:35 -0500
X-MC-Unique: 2d4uf5vvOd2Se4LdlENLXA-1
Received: by mail-ej1-f51.google.com with SMTP id p15so33568037ejc.7
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 03:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=opfv4RR7up8s/kTGiU3I+pSCKz1YhtaRFxed8c9ZZKs=;
	b=sHrLA6Vck4wdvYmAwLr2hTbnBNkAF2fXX8KAf7nYqiOdI8c4wgtQC4Ahotd7KStC6H
	Bg9ASwRuw5FPDeHepmdlB111PgU6aecKyOP0j97dYsDLeboKbEyCK/DxEJUvsUQADcvh
	lCIsl+q2OSADPFqyZI8TwzOSq4gddkDeM4I9wyD1S7Dx/rY0IAosWG9y3oVLIBMQ4Dlm
	eallLeYjMKfBLnwx7jRt/P+GkaiNc0b9yzEyJjGZl0ixO7MNA7Zny/jG3zH5Wa2Tiym5
	nbxBToP4i3Nd7z/bVCNnN1AyE6mWyG30uEXcvjiiXuZTCd7BO//Z92N8ge94431uz0nO
	pucw==
X-Gm-Message-State: AOAM530j/x5S6ETwBZW4g7oUxMv3gd1w3IB0ZYCOhuJlZay9pOU4nMu7
	lfEabe567ogFeh7ld+ALMwCtga3RI9Hp+A==
X-Google-Smtp-Source: ABdhPJy3fwA6uCWpHutu4k7drAf6dFQjJ6Adi42mUSBODHCffXUX28tIa+jf9u06VROJKTv+wV56wg==
X-Received: by 2002:a17:906:9756:: with SMTP id
	o22mr4849610ejy.448.1643541513777; 
	Sun, 30 Jan 2022 03:18:33 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id
	y5sm16180170edw.45.2022.01.30.03.18.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 30 Jan 2022 03:18:33 -0800 (PST)
Message-ID: <b66e90ec-28ed-3962-ac99-69f8e1b01936@gmail.com>
Date: Sun, 30 Jan 2022 12:18:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.4.0
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YfWM+8w1TonBXNsP@itl-email>
	<9156ffae-650d-198d-5c7a-32f84dbcb332@gmail.com>
	<YfWfAAGK8L1iy7LU@itl-email>
	<83468eda-6697-5f15-d949-e23611cded84@gmail.com>
	<YfXoBour6CGZt9NH@itl-email>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <YfXoBour6CGZt9NH@itl-email>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Running thin_trim before activating a thin pool
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDMwLiAwMS4gMjIgdiAyOjIwIERlbWkgTWFyaWUgT2Jlbm91ciBuYXBzYWwoYSk6Cj4gT24g
U2F0LCBKYW4gMjksIDIwMjIgYXQgMTA6NDA6MzRQTSArMDEwMCwgWmRlbmVrIEthYmVsYWMgd3Jv
dGU6Cj4+IERuZSAyOS4gMDEuIDIyIHYgMjE6MDkgRGVtaSBNYXJpZSBPYmVub3VyIG5hcHNhbChh
KToKPj4+IE9uIFNhdCwgSmFuIDI5LCAyMDIyIGF0IDA4OjQyOjIxUE0gKzAxMDAsIFpkZW5layBL
YWJlbGFjIHdyb3RlOgo+Pj4+IERuZSAyOS4gMDEuIDIyIHYgMTk6NTIgRGVtaSBNYXJpZSBPYmVu
b3VyIG5hcHNhbChhKToKPj4+Pj4gSXMgaXQgcG9zc2libGUgdG8gY29uZmlndXJlIExWTTIgc28g
dGhhdCBpdCBydW5zIHRoaW5fdHJpbSBiZWZvcmUgaXQKPj4+Pj4gYWN0aXZhdGVzIGEgdGhpbiBw
b29sPyAgUXViZXMgT1MgY3VycmVudGx5IHJ1bnMgYmxrZGlzY2FyZCBvbiBldmVyeSB0aGluCj4+
Pj4+IHZvbHVtZSBiZWZvcmUgZGVsZXRpbmcgaXQsIHdoaWNoIGlzIHNsb3cgYW5kIHVucmVsaWFi
bGUuICBXb3VsZCBydW5uaW5nCj4+Pj4+IHRoaW5fdHJpbSBkdXJpbmcgc3lzdGVtIHN0YXJ0dXAg
cHJvdmlkZSBhIGJldHRlciBhbHRlcm5hdGl2ZT8KPj4+Pgo+Pj4+IEhpCj4+Pj4KPj4+Pgo+Pj4+
IE5vcGUgdGhlcmUgaXMgY3VycmVudGx5IG5vIHN1cHBvcnQgZnJvbSBsdm0yIHNpZGUgZm9yIHRo
aXMuCj4+Pj4gRmVlbCBmcmVlIHRvIG9wZW4gUkZFLgo+Pj4KPj4+IERvbmU6IGh0dHBzOi8vYnVn
emlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MjA0ODE2MAo+Pj4KPj4+Cj4+Cj4+IFRo
YW5rcwo+Pgo+PiBBbHRob3VnaCB5b3VyIHVzZS1jYXNlIFRoaW5wb29sIG9uIHRvcCBvZiBWRE8g
aXMgbm90IHJlYWxseSBhIGdvb2QgcGxhbiBhbmQKPj4gdGhlcmUgaXMgYSBnb29kIHJlYXNvbiBi
ZWhpbmQgd2h5IGx2bTIgZG9lcyBub3Qgc3VwcG9ydCB0aGlzIGRldmljZSBzdGFjawo+PiBkaXJl
Y3RseSAoYWthIHRoaW4tcG9vbCBkYXRhIExWIGFzIFZETyBMVikuCj4+IEknZCBzYXkgeW91IGFy
ZSBzdGVwcGluZyBvbiB2ZXJ5IHZlcnkgdGhpbiBpY2UuLi4KPiAKPiBUaGluIHBvb2wgb24gVkRP
IGlzIG5vdCBteSBhY3R1YWwgdXNlLWNhc2UuICBUaGUgYWN0dWFsIHJlYXNvbiBmb3IgdGhlCj4g
dGlja2V0IGlzIHNsb3cgZGlzY2FyZHMgb2YgdGhpbiBkZXZpY2VzIHRoYXQgYXJlIGFib3V0IHRv
IGJlIGRlbGV0ZWQ7CgpIaQoKRGlzY2FyZCBvZiB0aGlucyBpdHNlbGYgaXMgQUZBSUMgcHJldHR5
IGZhc3QgLSB1bmxlc3MgeW91IGhhdmUgbWFzc2l2ZWx5IHNpemVkIAp0aGluIGRldmljZXMgd2l0
aCBtYW55IEdpQiBvZiBtZXRhZGF0YSAtIG9idmlvdXNseSB5b3UgY2Fubm90IHByb2Nlc3MgdGhp
cyAKYW1vdW50IG9mIG1ldGFkYXRhIGluIG5hbm9zZWNvbmRzIChhbmQgdGhlcmUgYXJlIHByZXBh
cmVkIGtlcm5lbCBwYXRjaGVzIHRvIAptYWtlIGl0IGV2ZW4gZmFzdGVyKQoKV2hhdCBpcyB0aGUg
cHJvYmxlbSBpcyB0aGUgc3BlZWQgb2YgZGlzY2FyZCBvZiBwaHlzaWNhbCBkZXZpY2VzLgpZb3Ug
Y291bGQgYWN0dWFsbHkgdHJ5IHRvIGZlZWwgZGlmZmVyZW5jZSB3aXRoOgpsdmNoYW5nZSAtLWRp
c2NhcmRzIHBhc3Nkb3dufG5vcGFzc2Rvd24gdGhpbnBvb2wKCkFsc28gaXQncyB2ZXJ5IGltcG9y
dGFudCB0byBrZWVwIG1ldGFkYXRhIG9uIGZhc3Qgc3RvcmFnZSBkZXZpY2UgKFNTRC9OVk1lKSEK
S2VlcGluZyBtZXRhZGF0YSBvbiBzYW1lIGhkZCBzcGluZGxlIGFzIGRhdGEgaXMgYWx3YXlzIGdv
aW5nIHRvIGZlZWwgc2xvdwooaW4gZmFjdCBpdCdzIHF1aXRlIHBvaW50bGVzcyB0byB0YWxrIGFi
b3V0IHBlcmZvcm1hbmNlIGFuZCB1c2UgaGRkLi4uKQoKPiB5b3UgY2FuIGZpbmQgbW9yZSBkZXRh
aWxzIGluIHRoZSBsaW5rZWQgR2l0SHViIGlzc3VlLiAgVGhhdCBzYWlkLCBub3cgSQo+IGFtIGN1
cmlvdXMgd2h5IHlvdSBzdGF0ZSB0aGF0IGRtLXRoaW4gb24gdG9wIG9mIGRtLXZkbyAodGhhdCBp
cywKPiB1c2Vyc3BhY2UvZmlsZXN5c3RlbS9WTS9ldGMg4oeSIGRtLXRoaW4gZGF0YSAoKm5vdCog
bWV0YWRhdGEpIOKHkiBkbS12ZG8g4oeSCj4gaGFyZHdhcmUvZG0tY3J5cHQvZXRjKSBpcyBhIGJh
ZCBpZGVhLiAgSXQgc2VlbXMgdG8gYmUgYSBkZWNlbnQgd2F5IHRvCgpPdXQtb2Ytc3BhY2UgcmVj
b3ZlcmllcyBhcmUgQVRNIG11Y2ggaGFyZGVyIHRoZW4gd2hhdCB3ZSB3YW50LgoKU28gYXMgbG9u
ZyBhcyB1c2VyIGNhbiBtYWludGFpbiBmcmVlIHNwYWNlIG9mIHlvdXIgVkRPIGFuZCB0aGluLXBv
b2wgaXQncyBvay4gCk9uY2UgdXNlciBydW5zIG91dCBvZiBzcGFjZSAtIHJlY292ZXJ5IGlzIHBy
ZXR0eSBoYXJkIHRhc2sgKGFuZCB0aGVyZSBpcyAKcmVhc29uIHdlIGhhdmUgc3VwcG9ydC4uLikK
Cj4gYWRkIHN1cHBvcnQgZm9yIGVmZmljaWVudCBzbmFwc2hvdHMgb2YgZGF0YSBzdG9yZWQgb24g
YSBWRE8gdm9sdW1lLCBhbmQKPiB0byBoYXZlIG11bHRpcGxlIHZvbHVtZXMgb24gdG9wIG9mIGEg
c2luZ2xlIFZETyB2b2x1bWUuICBGdXJ0aGVybW9yZSwKCldlIGhvcGUgd2Ugd2lsbCBhZGQgc29t
ZSBkaXJlY3QgJ3NuYXBzaG90JyBzdXBwb3J0IHRvIFZETyBzbyB1c2VycyB3aWxsIG5vdCAKbmVl
ZCB0byBjb21iaW5lIGJvdGggdGVjaG5vbG9naWVzIHRvZ2V0aGVyLgoKVGhpbiBpcyBtb3JlIG9y
aWVudGVkIHRvd2FyZHMgZXh0cmVtZSBzcGVlZC4KVkRPIGlzIG1vcmUgYWJvdXQgJ2NvbXByZXNz
aW9uICYgZGVkdXBsaWNhdGlvbicgLSBzbyBzcGFjZSBlZmZpY2llbmN5LgoKQ29tYmluaW5nIGJv
dGggdG9nZXRoZXIgaXMga2luZCBvZiBoYXJtaW5nIHRoZWlyIGFkdmFudGFnZXMuCgo+IGh0dHBz
Oi8vYWNjZXNzLnJlZGhhdC5jb20vYXJ0aWNsZXMvMjEwNjUyMSN2ZG8gcmVjb21tZW5kcyBleGFj
dGx5IHRoaXMKPiB1c2UtY2FzZS4gIE9yIGFtIEkgbWlzdW5kZXJzdGFuZGluZyB5b3U/CgpUaGVy
ZSBhcmUgbWFueSBwYXRocyB0byBSb21lLi4uClNvIGFzIG1lbnRpb25lZCBhYm92ZSAtIHlvdSBu
ZWVkIHRvIHBpY2sgcGVyZm9ybWFuY2Uvc3BhY2UgZWZmaWVjaWVuY3kuCkFuZCBzaW5jZSB5b3Ug
d2FudCB0byB3cml0ZSB5b3VyIG93biAgdGhpbiB2b2x1bWUgbWFuYWdpbmcgc29mdHdhcmUsIEkn
bSAKZ3Vlc3NpbmcgeW91IGNhcmUgYWJvdXQgcGVyZm9ybWFuY2UgYSBsb3QgIChzbyB3ZSBkbyAt
IGJ1dCB3aXRoIG91ciBnaXZlbiAKY29uc3RyYWlucyB0aGF0IGFyZSBsaW1pdGluZyB1cyB0byBz
b21lIGxldmVsKS4uLgoKPj4gQWxzbyBJIGFzc3VtZSB5b3UgaGF2ZSBhbHJlYWR5IGNoZWNrZWQg
cGVyZm9ybWFuY2Ugb2YgZGlzY2FyZCBvbiBWRE8sIGJ1dCBJCj4+IHdvdWxkIG5vdCB3YW50IHRv
IHJ1biB0aGlzIG9wZXJhdGlvbiBmcmVxdWVudGx5IG9uIGFueSBsYXJnZXIgdm9sdW1lLi4uCj4g
Cj4gSSBoYXZlIG5ldmVyIGFjdHVhbGx5IHVzZWQgVkRPIG15c2VsZiwgYWx0aG91Z2ggdGhlIGRv
Y3VtZW50YXRpb24gZG9lcwo+IHdhcm4gYWJvdXQgdGhpcy4KCkl0J3MgYmVlbiBwdXJlbHkgcmVs
YXRlZCB0byB0aGUgaW5pdGlhbCBCWiBkZXNjcmlwdGlvbiB3aGljaCBjYXJlcyBhIGxvdCBhYm91
dCAKdGhpbiBkaXNjYXJkIHBlcmZvcm1hbmNlIGFuZCBmb2xsb3dpbmcgY29tbWVudCBhZGRzIFZE
TyBkaXNjYXJkIGludG8gc2FtZSAKZXF1YXRpb24uLi4gOikKClJlZ2FyZHMKClpkZW5lawoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1h
aWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6
Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

