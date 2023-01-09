Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834C2C54EBD
	for <linux-lvm@archiver.kernel.org>; Mon,  9 Jan 2023 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673250860;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NWr1jvLJiyxLrWn/0QM40HF1hOXR0n7me+rfdY/OhZk=;
	b=Z9B3tCulXK28e8fGmJg+6VTUU8ilOdfVJshAYRiIEWQZnZOlO2lQAVSSq98OW+90Ka8pg3
	Cdszm50NQGUmrFhZ4rTvDTYNxCKSWQnU42JUAY4vxaj7ia32GWfETQyunFfVUqyb/g2psM
	Rp/G68Xkn8cCaKgZk7C+fBXHqWZ2mB0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-QSp3ZJD7N6W_-cqp3Qvsvw-1; Mon, 09 Jan 2023 02:54:17 -0500
X-MC-Unique: QSp3ZJD7N6W_-cqp3Qvsvw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 776602A59570;
	Mon,  9 Jan 2023 07:54:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9544E492B00;
	Mon,  9 Jan 2023 07:54:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5FA901947B82;
	Mon,  9 Jan 2023 07:54:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 252A01946586
 for <linux-lvm@listman.corp.redhat.com>; Mon,  9 Jan 2023 06:21:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 12F1B42220; Mon,  9 Jan 2023 06:21:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A461175AD
 for <linux-lvm@redhat.com>; Mon,  9 Jan 2023 06:21:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A26B52A5955C
 for <linux-lvm@redhat.com>; Mon,  9 Jan 2023 06:21:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-RAkAXH32O4uB-kyAnv8ryQ-1; Mon, 09 Jan 2023 01:21:54 -0500
X-MC-Unique: RAkAXH32O4uB-kyAnv8ryQ-1
Received: by mail-pl1-f175.google.com with SMTP id w3so8464844ply.3
 for <linux-lvm@redhat.com>; Sun, 08 Jan 2023 22:21:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pyoA4Yy08CLAcoQ719ImHK4CHOsmoo6elCvoTcBCkm4=;
 b=2QjuxTGEbw/HXQL3YzQRoyuf8UOnU1YP+Ndj+eW9NNYquKWk6QsbogfNAF89DAP57O
 WzhNq/hU2EcwR4RQ9Iq2BOcgcaAHpJ0ZkSefd5cgZYBoxdZbZC5v8KT22Q1ezM9k9MNo
 qS5KWIkj5j4QOGago9jfn2j886PGmIBgKAqNBTukLFqAtS4qoPQQYlgUTfe1mMFZThpD
 5N7qGtxdk7Aw6D/jsL6yqLI3VZmnhIEaEiIEa4Bu1hgGsjzwF+VNpHjfCFyNATFnk8Z9
 /JQQ/HM/Cfak0gtA5wqBlLwGFqga5QBfbK09dqIO5vZsttdpwojMTZ41g68CrBLkeO10
 mmdQ==
X-Gm-Message-State: AFqh2kr7tj9QG0NUtpHtLZmCtmoisbpBEEG9M+IpZiSkleXILVwuELcs
 1WzLwtPdnTtSwTj9m9dm0pu2zA==
X-Google-Smtp-Source: AMrXdXt4jvkJ5gedoqtJsusVF2jKSGfKLr7E9p/Xvhv7xp1GIO8l33de357Tfve/qxDIzXTpWmltCg==
X-Received: by 2002:a17:902:d544:b0:192:757c:b111 with SMTP id
 z4-20020a170902d54400b00192757cb111mr54342204plf.21.1673245313699; 
 Sun, 08 Jan 2023 22:21:53 -0800 (PST)
Received: from ?IPV6:fdbd:ff1:ce00:1371:1854:aca7:3e89:8ad6?
 ([2404:9dc0:cd01::1]) by smtp.gmail.com with ESMTPSA id
 q3-20020a17090311c300b001911e0af95dsm5108440plh.240.2023.01.08.22.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 22:21:53 -0800 (PST)
Message-ID: <ffd6b6d7-c197-1e3a-4b9b-c6fe8271a82d@bytedance.com>
Date: Mon, 9 Jan 2023 14:21:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
 LVM general discussion and development <linux-lvm@redhat.com>,
 Zdenek Kabelac <zkabelac@redhat.com>
References: <eed877f5-53f5-101b-44ab-a61f1328e62f@bytedance.com>
 <930cea69-8e7a-d0df-a48c-93e7a668be2f@redhat.com>
 <d2c5bef2-a418-049e-1ff8-160375881e90@bytedance.com>
 <2b1466c2-f545-d06a-6ce4-d420ed038ad1@gmail.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <2b1466c2-f545-d06a-6ce4-d420ed038ad1@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Mon, 09 Jan 2023 07:54:08 +0000
Subject: Re: [linux-lvm] The feasibility of implementing an alternative
 snapshot approach
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
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGkgWmRlbmVrLAoKVGhhbmsgeW91IGZvciB5b3VyIGRldGFpbGVkIGFuc3dlci4KCkZvciB0aGUg
dGhpbiBzbmFwc2hvdCBJIHdpbGwgdXNlIHRoZSBsYXRlc3QgdmVyc2lvbiBvZiBrZXJuZWwgYW5k
IGx2bSAKZm9yIGZ1cnRoZXIgdGVzdGluZy4gSSB3YW50IHRvIHVzZSBib3RoIHNuYXBzaG90IG1l
dGhvZHMgKHRoaW4gYW5kIAp0aGljaykgaW4gdGhlIHByb2R1Y3Rpb24gZW52aXJvbm1lbnQuIEJ1
dCBpZiB0aGUgdGhpY2sgc25hcHNob3QgaXMgb25seSAKc3RpbGwgaW4gdGhlIG1haW50ZW5hbmNl
IHBoYXNlLCB0aGVuIGZvciB0aGljayBsdiBJIGhhdmUgdG8gc2VlIGlmIHRoZXJlIAppcyBhbnkg
b3RoZXIgd2F5IHRvIGFjY29tcGxpc2ggdGhlIHNuYXBzaG90IGZ1bmN0aW9uLgoKSSB1c2UgbHZt
IG1haW5seSBmb3IgdmlydHVhbGl6ZWQgZW52aXJvbm1lbnRzLiBFYWNoIGx2IGFjdHMgYXMgYSBi
bG9jayAKZGV2aWNlIG9mIHRoZSB2aXJ0dWFsIG1hY2hpbmUuIFNvIEkgYWxzbyBjb25zaWRlciB1
c2luZyBxZW11J3Mgb3duIApzbmFwc2hvdCBmZWF0dXJlLiBXaGVuIHFlbXUgY3JlYXRlcyBhIHNu
YXBzaG90LCB0aGUgb3JpZ2luYWwgaW1hZ2UgdXNlZCAKYnkgdGhlIHZpcnR1YWwgbWFjaGluZSBi
ZWNvbWVzIHJlYWQtb25seSwgYW5kIGFsbCB3cml0ZSBjaGFuZ2VzIGFyZSAKc3RvcmVkIGluIHRo
ZSBuZXcgc25hcHNob3QuIEJ1dCBjdXJyZW50bHkgcWVtdSdzIHNuYXBzaG90cyBvbmx5IHN1cHBv
cnQgCmZpbGVzLCBub3QgYmxvY2sgZGV2aWNlcy4KClJlZ2FyZHMKClpoaXlvbmcKCk9uIDEvNi8y
MyA5OjQyIFBNLCBaZGVuZWsgS2FiZWxhYyB3cm90ZToKPiBEbmUgMDQuIDAxLiAyMyB2IDE3OjEy
IFpoaXlvbmcgWWUgbmFwc2FsKGEpOgo+PiBIaSBaZGVuZWssCj4+Cj4+IFRoYW5rIHlvdSBmb3Ig
eW91ciByZXBseS4KPj4KPj4gU25hcHNob3RzIG9mIHRoaW5sdiBhcmUgaW5kZWVkIG1vcmUgZWZm
aWNpZW50IGNvbXBhcmVkIHRvIHN0YW5kYXJkIGx2LCAKPj4gdGhpcyBpcyBiZWNhdXNlIGRhdGEg
YmxvY2tzIGNhbiBiZSBzaGFyZWQgYmV0d2VlbiBzbmFwc2hvdCBhbmQgCj4+IG9yaWdpbmFsIHRo
aW5sdi4gQnV0IHRoZXJlIGlzIGFsc28gYSBwZXJmb3JtYW5jZSBsb3NzIGFmdGVyIHRoaW5sdiAK
Pj4gY3JlYXRlcyBhIHNuYXBzaG90LiBUaGlzIGlzIGJlY2F1c2UgdGhlIGZpcnN0IHdyaXRlIHRv
IHRoZSBzbmFwc2hvdHRlZCAKPj4gdGhpbmx2IHJlcXVpcmVzIG5vdCBvbmx5IGFsbG9jYXRpbmcg
YSBuZXcgY2h1bmsgYnV0IGFsc28gY29weWluZyB0aGUgCj4+IG9sZCBkYXRhLgo+Pgo+PiBIZXJl
IGFyZSBzb21lIHBlcmZvcm1hbmNlIGRhdGEgYW5kIGEgZGlzY3Vzc2lvbiBvZiB0aGUgdGhpbmx2
IHNuYXBzaG90Ogo+Pgo+PiBodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9hcmNoaXZlcy9saW51
eC1sdm0vMjAyMi1KdW5lLzAyNjIwMC5odG1sCj4+Cj4gCj4gV2VsbCB0aGF0J3Mgb3VyIGN1cnJl
bnTCoCAnc3RhdGUtb2YtdGhlLWFydCcgc29sdXRpb24uCj4gCj4gTWFrZSBzdXJlIHlvdSBhcmUg
dXNpbmcgbGF0ZXN0IGtlcm5lbHMgZm9yIHlvdXIgcGVyZm9ybWFuY2UgdGVzdGluZyAtIAo+IHRo
ZXJlIGhhdmUgYmVlbiBzZXZlcmFsIGltcHJvdmVtZW50cyBhcm91bmQgdGhlIGxvY2tpbmcgKDYr
IGtlcm5lbHMpIC0gCj4gYnV0IGlmIHRoaXMgc3RpbGwgbm90IGdvb2QgZW5vdWdoIGZvciB5b3Vy
IGNhc2UgeW91IG1pZ2h0IG5lZWQgdG8gc2VlayAKPiBmb3Igc29tZSBvdGhlciBzb2x1dGlvbnMg
KGFsdGhvdWdoIHdvdWxkIGJlIG5pY2UgdG8ga25vdyB3aG8gaGFuZGxlcyAKPiB0aGlzIHRhc2sg
YmV0dGVyKS4KPiAKPiBEZWZpbml0ZWx5IHRoZSBvbGQgJ3RoaWNrLXNuYXBzaG90JyBpcyBtb3N0
bHkgaW4gbWFpbnRlbmFuY2UgcGhhc2UgYW5kIAo+IGl0J3MgdXNhYmlsaXR5IChhbmQgaXRzIGRl
c2lnbikgaXMgbGltaXRlZCBmb3Igc29tZSBzaG9ydCBsaXZpbmcgCj4gdGVtcG9yYXJ5IHNuYXBz
aG90aW5nIChpLmUuIHlvdSBhcmUgbWFraW5nIGJhY2t1cCBhbmQgYWZ0ZXIgY29tcGxldGluZyAK
PiB5b3VyIGJhY2t1cCBvZiB0aGUgZmlsZXN5c3RlbSB5b3UgcmVtb3ZlIHlvdXIgdGVtcG9yYXJ5
IHNuYXBzaG90IC0gaXQncyAKPiBiZWVuIG5ldmVyIGRlc2lnbmVkIHRvIGJlIHVzZWQgZm9yIG11
bHRpLWxldmVsIG11bHRpLUdpQiBzbmFwc2hvdHMgLSAKPiB0aGlzIHdpbGwgbm90IGZseS4uLgo+
IAo+IFdoZW4geW91IHVzZSB0aGluIHNuYXBzaG90cyAtIG1ha2Ugc3VyZSB5b3VyIG1ldGFkYXRh
IExWIGlzIGxvY2F0ZWQgb24gCj4geW91ciBmYXN0IGRldmljZSBhbmQgeW91IHVzZSBiZXN0IGZp
dHRpbmcgY2h1bmtzaXplLgo+IAo+IFJlZ2FyZHMKPiAKPiBaZGVuZWsKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QK
bGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcv
SE9XVE8vTFZNLUhPV1RPLwo=

