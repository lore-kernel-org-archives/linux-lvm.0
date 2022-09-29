Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C23EC433FE
	for <linux-lvm@archiver.kernel.org>; Thu, 29 Sep 2022 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664462263;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4amVTiE6NfLX6KQBs8dhQGH//uZOI1PtDuOVVH/ga3o=;
	b=aSGnL0vfQtJ8jAHBIzu+JoWBfWpaSjr0STKMDQFCM1ct9ogSQYbiSQrZws6wqsp5/RaplN
	a5Z9PxoPdFp6i1CUt69u5x+E+76YDN3sFpF9KLicW7IxH0L0VukiDaxH2y877AFqzKphxA
	ONKMKpNki+EYQIsPvA75fKClEr+BuSU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-Bi3QyljGMkmflWe_UCwQUA-1; Thu, 29 Sep 2022 10:37:39 -0400
X-MC-Unique: Bi3QyljGMkmflWe_UCwQUA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4FCF3826A50;
	Thu, 29 Sep 2022 14:37:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A93F2492B06;
	Thu, 29 Sep 2022 14:37:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 737501946A47;
	Thu, 29 Sep 2022 14:37:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6896519465B8
 for <linux-lvm@listman.corp.redhat.com>; Thu, 29 Sep 2022 14:37:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5B6082166B2B; Thu, 29 Sep 2022 14:37:29 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53D4B2166B26
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 14:37:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02F3F84AC72
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 14:37:21 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-7RJH0vWIPYS8kV0_UF1u_A-1; Thu, 29 Sep 2022 10:37:16 -0400
X-MC-Unique: 7RJH0vWIPYS8kV0_UF1u_A-1
Received: by mail-qv1-f42.google.com with SMTP id m18so1000886qvo.12;
 Thu, 29 Sep 2022 07:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gC6nG3DXNpUnOtk+89Epnpf5v0ufL3Qm9TZ2RJyMrdk=;
 b=PSkPCfotus+jdZ1Xw4zYOUADZmUfQnZgSv/uxjzd8tJ5X0gD9PmYhiH3d4XGhAwuLw
 K0CQYgY+NVIjAvs8flp7HQCwCoY5kCXJeXoMLFPgnhytcZttXkU49Ius8wrDGWI0qniy
 VnDSTaZ2u+9nGruHE8wyB6vdrZ1sYCOAYHXU1n2FWxCTsbmrXyjHGNJizGndW/cKIAeV
 XmvJC8VlyYkG1B+nMfFelhXGytt2yksmLuNMsvdKY9t/1enOq45yGKqkVqV963zTIx7Y
 KsRyKWgNAPHzSlOnOwSbmyMbowICmiNEER4z3Q3dMDnjdOdV2+4GyEmE/owlKq9D3s/y
 rneA==
X-Gm-Message-State: ACrzQf3OLUhqoFzVMapIlQx1oJ66KmoCTOEx4pCe4jUK8q7UUpoCvsKl
 9mYlXmaPo/P/L7orPWnLnUJ+0lbap2C7c/4PxFmeba0x
X-Google-Smtp-Source: AMsMyM7579ooZ61qoaOMBoGuGACnafwfwVjuRZEeVYGJ0mYdZ4BTGsoU6L7l/VBRE4wQf1kfjj/ao4ACxMAcw2UMfy0=
X-Received: by 2002:a05:6214:1cc8:b0:4af:649f:dd57 with SMTP id
 g8-20020a0562141cc800b004af649fdd57mr2782373qvd.81.1664462235449; Thu, 29 Sep
 2022 07:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAPA01J3mh6G22h1938GYvPAZunah2Nv+HGikjBef05RBNHBj3w@mail.gmail.com>
 <17734cfc-cef2-3f6b-1426-ea8100bdd667@gmail.com>
In-Reply-To: <17734cfc-cef2-3f6b-1426-ea8100bdd667@gmail.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Thu, 29 Sep 2022 09:37:04 -0500
Message-ID: <CAAMCDee_xu--G63yWDS7KSd85+RfWqcXv6QH8yA-CgCFFLeLSA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [linux-lvm] How to change default system dir
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
Cc: =?UTF-8?B?QmFydMWCb21pZWogQsWCYWNodXQ=?= <bartlomiejblachut@gmail.com>,
 LVM2 development <lvm-devel@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXNzdW1pbmcgeW91IGFyZSB3cml0ZSBwcm90ZWN0aW5nIC9ldGMgZm9yIGEgcmVhc29uLCBzaW1w
bHkgbXYKZXZlcnl0aGluZyBpbiAvZXRjL2x2bSB0byB5b3VyIG5ldyBsb2NhdGlvbiBhbmQgcmVw
bGFjZSB0aGUgbHZtIGRpcgp3aXRoIGEgbHZtIHN5bWJvbGljIGxpbmsgdG8geW91ciBsb2NhdGlv
bi4KCkluIHRoZSBmYXIgcGFzdCB3aGVuIGJvb3Rpbmcgd2l0aCBSTyBkZXZpY2VzIEkgaGFkIGxv
dHMgb2YgbGlua3MgaW4KL2V0Yy8gcG9pbnRpbmcgdG8gZmlsZXMgdGhhdCB3ZXJlIG5vdCBvbiB0
aGUgcmVhZC1vbmx5IGFuZC9vcgp3cml0YWJsZS1idXQtbG9zdC1vbi1ib290KG92ZXJsYXkpIGRl
dmljZS4KCk9uIFRodSwgU2VwIDI5LCAyMDIyIGF0IDU6NTggQU0gWmRlbmVrIEthYmVsYWMgPHpk
ZW5lay5rYWJlbGFjQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBEbmUgMjguIDA5LiAyMiB2IDE3OjE2
IEJhcnTFgm9taWVqIELFgmFjaHV0IG5hcHNhbChhKToKPiA+IEhpLAo+ID4gSSBoYXZlIGEgcXVl
c3Rpb24gZm9yIHlvdSwgYmVjYXVzZSB3aGF0IEkgbmVlZCBpcyB0byBjaGFuZ2UgaW4gbXkKPiA+
IHVidW50dSgyMi4wNCkgdGhlIGxvY2FsaXNhdGlvbiBvZiBkZWZhdWx0LXN5c3RlbS1kaXIgZnJv
bSAvZXRjL2x2bSB0byBhIHBsYWNlCj4gPiB3aGVyZSBJIGhhdmUgd3JpdGUgYWNjZXNzIGUuZy4g
L2hvbWUvbXlfdXNlci9uZXdfbHZtX2Rpci4gSSd2ZSB0cmllZCBzbyBmYXIgdG8KPiA+IHByb3Zp
ZGUgdG8gLi9jb25maWd1cmUgb3B0aW9uCj4gPiAtLXdpdGgtZGVmYXVsdC1zeXN0ZW0tZGlyPS9o
b21lL215X3VzZXIvbmV3X2x2bV9kaXIgb3IgbGF0ZXIgSSByZXBsYWNlCj4gPiBldmVyeXdoZXJl
IGluIGNvZGUgcGF0dGVybiAvZXRjL2x2bSB0byAvaG9tZS9teV91c2VyL25ld19sdm1fZGlyIGJ1
dCB3aXRob3V0Cj4gPiBhbnkgc3VjY2Vzcy4gQXJlIHlvdSBhYmxlIHRvIGdpdmUgbWUgYW55IGlk
ZWEgaG93IEkgY2FuIGRvIGl0ID8KPiA+Cj4gPiBJIHRyaWVkIGl0IG9uIG1haW4vc3RhYmxlIGJy
YW5jaGVzIGdpdDovL3NvdXJjZXdhcmUub3JnL2dpdC9sdm0yLmdpdAo+ID4gPGh0dHA6Ly9zb3Vy
Y2V3YXJlLm9yZy9naXQvbHZtMi5naXQ+Cj4gPgo+Cj4gSGkKPgo+Cj4gbHZtMiBiYXNpY2FsbHkg
YWx3YXlzIHJlcXVpcmUgYSAncm9vdCcgYWNjZXNzIGZvciBhbnkgJ3JlYWwgdXNhYmxlJyBsdm0y
Cj4gY29tbWFuZCAtIHNvIHNheWluZyB5b3UgZG9uJ3QgaGF2ZSB3cml0ZSBhY2Nlc3MgdG8gL2V0
YyAgbG9va3MgdmVyeSBzdHJhbmdlIHRvCj4gc3RhcnQgd2l0aC4KPgo+IFdlIGhhdmUgYWxzbyBj
b25maWd1cmUgb3B0aW9uICAtLXdpdGgtY29uZmRpcj1bL2V0Y10KPiBidXQgSSBzdGlsbCB0aGlu
ayB5b3Ugc2hvdWxkIHN0YXJ0IHdpdGggZXhwbGFpbmluZyB3aGF0IGFyZSB5b3UgYWN0dWFsbHkK
PiB0cnlpbmcgdG8gZG8gLSBhcyBtYXliZSB0aGVyZSBpcyBzb21lIGRlc2lnbiBpc3N1ZT8/Cj4K
Pgo+IFJlZ2FyZHMKPgo+IFpkZW5lawo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBsaW51eC1sdm0gbWFpbGluZyBsaXN0Cj4gbGludXgtbHZtQHJl
ZGhhdC5jb20KPiBodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWx2bQo+IHJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xW
TS1IT1dUTy8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0
bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhP
Vy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

