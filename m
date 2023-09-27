Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895B2E82CAF
	for <linux-lvm@archiver.kernel.org>; Wed, 27 Sep 2023 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695831508;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cIzgUZWka8kAP84mc+cTEeMcf9MdMLKkoAQixAsyEjk=;
	b=Pz+1jeylxwA+Rd6/9z3Q8O+zI8T/Y8Y0Q0sOMFR371ss2kP1dplf2cRR3ZEfMjAOrcksQd
	9aEscHevfAsAxMHDpqfII9RrF6wlKO2eRDBYwcvEYzHWSqvEZauXQSZIBs4wK7yS+rRGvX
	5WGMRA0UEXlbzbSOP87RJHJUKNwN+OQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-l2OE4QLkMW6JGqNnK6XyKA-1; Wed, 27 Sep 2023 12:18:24 -0400
X-MC-Unique: l2OE4QLkMW6JGqNnK6XyKA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30B2C8039D2;
	Wed, 27 Sep 2023 16:18:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 248FE492B05;
	Wed, 27 Sep 2023 16:18:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D6CD5194658D;
	Wed, 27 Sep 2023 16:18:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DDC491946587
 for <linux-lvm@listman.corp.redhat.com>; Wed, 27 Sep 2023 15:14:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B8099170EC; Wed, 27 Sep 2023 15:14:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFB55176E4
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 15:14:03 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D9FE3816D8F
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 15:14:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-4O8ZVXPLPZy5AIg4STvYtQ-1; Wed, 27 Sep 2023 11:13:59 -0400
X-MC-Unique: 4O8ZVXPLPZy5AIg4STvYtQ-1
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-406402933edso28432965e9.2
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 08:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695827638; x=1696432438;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RdA295BO//71dAxNHi7FqmSWjSh0Hm4B+LY1658Bm4M=;
 b=Z+3U7L4Or1JMyvbAzK15QNQVE5aQEwsyfX+qYwF1v2bhAwOJRW3SS146fvl8mu136F
 OPGWFTKua7e/YizTWztQ3xblKEMrJj+MFCX8G/rqup/9A8c8Cy6BsZ4jYu6lDQqMMync
 lZa1EdDU06hXfIblZcJdHFePgAARohuGMYl7LHOoW88ceb0tr4KlF31JQK1586kAa+EO
 P6FpODV5Bz7LCtQP/HzM/RO2tV1PhBfd8S7v0uctncofu2e8yNI5pu/mYibpsWonPPXp
 1oID9Bihr8zMGt5T49mDcmfQKKgz1NZgsiMZMf/7zP1Mv6VkYNy8VvK1q1nPr3V/bFMK
 M+uQ==
X-Gm-Message-State: AOJu0Yybt+RbEPubJyvzteTP/ksIgUgZnQ1j8wLOCPcj++M+6+U1BwWs
 Dg0vT+nx6h3vxZ14xxdW8ukwDZ0Gx6cOrYSJofFGe4SEYBA=
X-Google-Smtp-Source: AGHT+IGIfZLbB3tZIGTUngBr72+RfGThKr2VSHIbcMfQbcksJOgq9fPz7DAWZTXVdQVLwCRa7M5htuCM4OCRZYPGB7I=
X-Received: by 2002:a1c:7913:0:b0:401:b204:3b8d with SMTP id
 l19-20020a1c7913000000b00401b2043b8dmr2155442wme.27.1695827637472; Wed, 27
 Sep 2023 08:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
 <6e0faedf-f450-4454-a86b-6448a1b4747b@gmail.com>
 <CAM5YWZfL8zf9=re+VU2MiAQcYvXodqDV-08Zu5RkKUMfkDJ7Tg@mail.gmail.com>
 <90d9a21d-f748-4ca1-b327-6c38f4440298@gmail.com>
 <dc311492-ec67-43f8-a809-6ee7729af703@gmail.com>
In-Reply-To: <dc311492-ec67-43f8-a809-6ee7729af703@gmail.com>
From: Jean-Marc Saffroy <saffroy+redhat@gmail.com>
Date: Wed, 27 Sep 2023 17:13:46 +0200
Message-ID: <CAM5YWZctfRe7ywaOtKPT3XKD451dy_iZ0vDi=zENx_TTX2aSJw@mail.gmail.com>
To: Roberto Fastec <roberto.fastec@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [linux-lvm] Can I combine LUKS and LVM to achieve encryption
 and snapshots?
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

V293LCB0aGF0IHdhcyB2ZXJ5IGhhcnNoIEFORCB2ZXJ5IHdyb25nLgoKQWxsIHN0b3JhZ2UgZGV2
aWNlcyBkaWUgZXZlbnR1YWxseSwgdGhhdCdzIHdoeSB3ZSBoYXZlIGJhY2t1cHMgKGFuZApSQUlE
LCBvZmYtc2l0ZSByZXBsaWNhdGlvbiwgZXRjKS4gSEREcyBhbmQgU1NEcyBhcmUgdGhlIHNhbWUg
aW4gdGhpcwpyZXNwZWN0LgoKU1NEcyBkbyBOT1QgZGllIGp1c3QgZnJvbSByZXBlYXRlZCB3cml0
ZXMgdG8gdGhlIHNhbWUgc2VjdG9yOiB0aGlzIGNhbgpoYXBwZW4gd2l0aCByYXcgZmxhc2ggY2Vs
bHMsIGJ1dCBTU0RzIGFyZSBOT1QgdGhhdCwgdGhleSBhbGwgaW5jbHVkZQpjb21wbGV4IGxvZ2lj
IGZvciB3ZWFyIGxldmVsaW5nLCBhbmQgaXQgd29ya3MgdmVyeSB3ZWxsIGluIHByYWN0aWNlLgoK
QXMgU1NEcyBncm93IGxhcmdlciwgdGhleSBjYW4gd2l0aHN0YW5kIG1vcmUgd3JpdGVzLCBhcyB3
ZWFyIGxldmVsaW5nCnNwcmVhZHMgdGhlIHdlYXIgb3ZlciBtb3JlIGZsYXNoIGNlbGxzLgoKRm9y
IGRhdGFjZW50ZXIgdXNlLCBTU0RzIGFyZSBnYWluaW5nIG1vcmUgYW5kIG1vcmUgdXNlIGNhc2Vz
IGFzCnByaW1hcnkgc3RvcmFnZSwgYW5kIHRoZWlyIHJlbGlhYmlsaXR5IGlzIGdldHRpbmcgYWhl
YWQgb2YgSEREczoKaHR0cHM6Ly93d3cuYmFja2JsYXplLmNvbS9ibG9nL3NzZC1kcml2ZS1zdGF0
cy1taWQtMjAyMi1yZXZpZXcvCgpIb21lIHVzZXJzIG5lZWQgbm90IHdvcnJ5IGF0IGFsbCBhYm91
dCBTU0QgbG9uZ2V2aXR5LiBUaGV5IGp1c3QgbmVlZAp0byBiZSByZWFkeSBmb3IgdGhleSBkcml2
ZXMgdG8gZGllLCBqdXN0IGxpa2UgYW55IHN0b3JhZ2UgZGV2aWNlLCBhbmQKdXNlIGJhY2t1cHMu
CgpKTQoKT24gV2VkLCBTZXAgMjcsIDIwMjMgYXQgMzoyNuKAr1BNIFJvYmVydG8gRmFzdGVjIDxy
b2JlcnRvLmZhc3RlY0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2hhdCBhbiBhd2Z1bCBpZGVhIHRv
IGVuY3J5cHQgZGF0YSBvbiBhbiBoYXJkd2FyZSBhY2NlbGVyYXRvcgo+Cj4gU1NEIGlzIGV2ZXJ5
dGhpbmcgYnV0IGFuIGFmZm9yZGFibGUgc3RvcmFnZSBmb3Iga2VlcGluZyBzYWZlbHkgeW91ciBk
YXRhCj4KPiBhbmQgYXMgc29vbiBzb21lIGNlbGxzIHdpbGwgZmFpbCAsIGFuZCB3aXRoIExWTSAs
IHRoZSBmaXJzdCBvbmVzIHdpbGwgYmUgd2hlcmUgTFZNIHRhYmxlcyBhcmUgc2l0dGluZyAoYW5k
IGJlaW5nIGhlYXZpbHkgbW9kaWZpZWQpIC4uIHlvdSdsbCBsb29zZSBBTEwgdGhlIGRhdGEsIGJl
Y2F1c2Ugb2YgdGhlIGV4dGVudHMgbWVjaGFuaXNtCj4KPiBOZXZlcnRoZWxlc3MsIGlmIHlvdSBn
b3QgZGFtYWdlZCBqdXN0IHRoZSBjZWxscyB3aGVyZSBlbmNyeXB0aW9uIGtleXMgYXJlIHdyaXR0
ZW4sIGFnYWluIHlvdSBsb29zZSBldmVyeXRoaW5nCj4KPiBSZW1lbWJlciB0aGF0IHRoZSBkYXRh
IG11c3Qgc2VhdCBvbiB0aGUgYWZmb3JkYWJsZSBoYXJkIGRpc2sgZHJpdmUuCj4KPiBTU0QgaXMg
anVzdCBhbiBoYXJkd2FyZSBhY2NlbGVyYXRvciwgaWYgb2YgaGlnaCBxdWFsaXR5IChlbnRlcnBy
aXNlIGNsYXNzKSBpdCBjYW4gYmUgZ29vZCBhcyBjYWNoZSBmb3IgUkFJRCBzeXN0ZW1zCj4KPiBN
YW4gdGhhdCBoYXMgYmVlbiBhZHZpc2VkLCBpcyBoYWxmIHNhdmVkCj4KPiBLaW5kIHJlZ2FyZHMK
Pgo+IFIuCj4KPiBPdHRpZW5pIEJsdWVNYWlsIHBlciBBbmRyb2lkCj4gSWwgZ2lvcm5vIDI3IHNl
dCAyMDIzLCBhbGxlIG9yZSAxMTo1OCwgWmRlbmVrIEthYmVsYWMgPHpkZW5lay5rYWJlbGFjQGdt
YWlsLmNvbT4gaGEgc2NyaXR0bzoKPj4KPj4gRG5lIDI3LiAwOS4gMjMgdiAxOjEwIEplYW4tTWFy
YyBTYWZmcm95IG5hcHNhbChhKToKPj4+Cj4+PiAgSGksCj4+Pgo+Pj4gIE9uIFR1ZSwgU2VwIDI2
LCAyMDIzIGF0IDEwOjAw4oCvUE0gWmRlbmVrIEthYmVsYWMKPj4+ICA8emRlbmVrLmthYmVsYWNA
Z21haWwuY29tPiB3cm90ZToKPj4+Pgo+Pj4+ICBZZXAgdHlwaWNhbCB1c2FnZSBpcyB0byBlbmNy
eXB0IHVuZGVybHlpbmcgUFYgLSBhbmQgdGhlbiBjcmVhdGUgTFZzIGFuZCBpdHMKPj4+PiAgc25h
cHNob3RzIG9uIGVuY3J5cHRlZCBkZXZpY2UuCj4+Pgo+Pj4KPj4+ICBTdXJlLCBJJ2QgZG8gdGhh
dCBpbiBvdGhlciBjaXJjdW1zdGFuY2VzLgo+Pj4KPj4+ICBCdXQgaW4gbXkgY2FzZSBpdCB3b3Vs
ZCBqdXN0IGJlIGEgd2FzdGU6IEkgYW0gcmVwbGFjaW5nIHNldmVyYWwgZGlza3MKPj4+ICBvbiBh
IGRlc2t0b3AgY29tcHV0ZXIgd2l0aCBhIHNpbmdsZSAyVEIgTlZNRSBTU0QgZm9yIGV2ZXJ5dGhp
bmcuIE9ubHkKPj4+ICAvaG9tZSBuZWVkcyB0byBiZSBlbmNyeXB0ZWQsIGFuZCBpdCdzIHRpbnks
IGxpa2UgMTAwLTIwMEdCLiBHb2luZwo+Pj4gIHRocm91Z2ggZW5jcnlwdGlvbiBmb3IgbW9zdCBh
cHBsaWNhdGlvbiBJL09zIHdvdWxkIHVzZSBDUFUgdGltZSBhbmQKPj4+ICBpbmNyZWFzZSBsYXRl
bmN5IHdpdGggbm8gYmVuZWZpdC4KPj4+Cj4+PiAgU28gSSBwcmVmZXIgdG8gbWFuYWdlIGF2YWls
YWJsZSByYXcgKHVuLWVuY3J5cHRlZCkgc3BhY2Ugd2l0aCBMVk0uCj4+Pgo+Pj4gIE5vdywgSSBh
bHNvIG5lZWQgdG8gZG8gYmFja3VwcyBvZiAvaG9tZSwgYW5kIHRoYXQncyB3aHkgSSB3YW50Cj4+
PiAgc25hcHNob3RzLiBCdXQgdGhhdCBmaXJzdCBsYXllciBvZiBMVk0gd291bGQgb25seSBzaG93
IGEgc25hcHNob3Qgb2YKPj4+ICBhbiBlbmNyeXB0ZWQgdm9sdW1lLCBhbmQgdGhlIGJhY2t1cCBq
b2Igc2hvdWxkbid0IGhhdmUgdGhlIHBhc3NwaHJhc2UKPj4+ICB0byBkZWNyeXB0IHRoZSB2b2x1
bWUuCj4+Pgo+Pj4gIFdoaWNoIGlzIHdoeSBJJ20gdHJ5aW5nIHRvIGZpbmQgYSB3YXkgb2YgZG9p
bmcgc25hcGhvdHMgb2YgYW4gIm9wZW5lZCIKPj4+ICBMVUtTIHZvbHVtZTogdGhpcyB3YXksIHRo
ZSBiYWNrdXAgam9iIGNhbiBkbyBpdHMgam9iIHdpdGhvdXQgcmVxdWlyaW5nCj4+PiAgYSBwYXNz
cGhyYXNlLgo+Pgo+Pgo+PiB3ZWxsIHRoYXQncyB3aGVyZSB5b3Ugd2lsbCBjb25zaWRlcmFibHkg
J2NvbXBsaWNhdGUnIHlvdXIgbGlmZSA6KQo+PiBBcyB5b3Ugd291bGQgbmVlZCB0byAnb3JjaGVz
dHJhY2UnIHRoaXMgeW91cnNlbGYgd2l0aCAnZG1zZXR1cCcgdXNhZ2UuCj4+Cj4+IHJ1bm5pbmcg
J2Rtc2V0dXAgc3VzcGVuZCcgb24geW91ciBob21lIGRldmljZSwKPj4gdGhhdCB0YWtpbmcgYSBz
bmFwc2hvdCBvZiB5b3VyIHVuZGVybHlpbmcgIExWLgo+Pgo+PiBIZXJlIHRoZSB1c2FnZSBvZiAn
dGhpbi1wb29sJyB3b3VsZCBwb3NzaWJseSBoZWxwIGEgbGl0dGxlIGJpdCAtIGFzIHlvdSBnZXQg
YQo+PiBjb250cm9sIG92ZXIgd2hlbiBhIHNuYXBzaG90IExWIGFwcGVhcnMgaW4geW91ciBzeXN0
ZW0uCj4+Cj4+IE9uY2UgeW91IGhhdmUgdGhlIHNuYXBzaG90IGNyZWF0ZWQgeW91ICdyZXN1bWUn
ICB0aGUgdG9wLWxldmVsCj4+IGRlY3J5cHRlZCB2b2x1bWUuCj4+Cj4+IFRoZW4gaWYgeW91IHdh
bnQgdG8gYWNjZXNzIHlvdXIgc25hcHNob3QgLSB5b3UgY3JlYXRlIGFub3RoZXIgJ2NyeXB0bycg
ZGV2aWNlCj4+IC0gdW5sb2NrIGl0IGFnYWluIHdpdGggeW91ciBrZXkgLSBhbmQgaXQgc2hvdWxk
IHdvcmsuCj4+Cj4+IEJ1dCB0aGUgbGV2ZWwgb2YgY29tcGxleGl0eSBoZXJlIGlzIHJhdGhlciAg
aGlnaCAtIHRoaXMgaXQgbWlnaHQgYmUgYWN0dWFsbHkKPj4gd2F5IGVhc2llciB0byBqdXN0ICdw
YXJ0aXRpb24nIHlvdXIgZGV2aWNlIGZvciAgJ2VuY3J5cHRlZCcgIGFuZCB1bmVjcnlwdGVkJwo+
PiBwYXJ0cyBhbmQgdXNlIDIgUFZzIGZvciAyIFZHcy4uLi4KPj4KPj4+ICBCdXQgbXkgdGVzdHMg
ZG9uJ3QgdGVsbCBtZSBpZiB0aGVyZSBhcmUgb3RoZXIgcGVvcGxlIGRvaW5nIHNpbWlsYXIKPj4+
ICB0aGluZ3Mgb24gcHJvZHVjdGlvbiBzeXN0ZW1zLCBvciBpZiB0aGV5IGFyZSBoYXBweSB3aXRo
IHRoZSByZXN1bHRzLgo+Pj4gIFVudXN1YWwgc2V0dXBzIHRlbmQgdG8gZXhoaWJpdCB1bnVzdWFs
IGJ1Z3MsIGFuZCBJIGFtIG5vdCBzdXBlciBmb25kCj4+PiAgb2YgYnVncyBpbiBteSBzdG9yYWdl
IHN5c3RlbXMuIDotKQo+Pgo+Pgo+PiBZZXAgLSBwZW9wbGUgcHJlZmVyIHNpbXBsZSByb2NrIHNv
bGlkIHNvbHV0aW9ucy4uLi4KPj4gVGhhdCdzIHdoeSB0aGUgYWJvdmUgZGVzY3JpYmUgc2NlbmFy
aW9zIGlzIG5vdCByZWFsbHkgdXNlZC4uLi4KPj4gQXMgc29sdmluZyB0aGVuIGFsbCBpbmRpdmlk
dWFsIGVycm9ycyB0aGF0IG1heSBhcHBlYXIgaXMgZmFyIGZyb20gYmVpbmcgc2ltcGxlLgo+Pgo+
Pgo+Pj4gIEp1c3QgdGhlIG9uZSAvaG9tZSBpbiBteSBjYXNlLCBzbyBubyB3b3JzZSB0aGFuIHBy
b21wdGluZyBmb3IgdGhlCj4+PiAgcGFzc3BocmFzZSBmb3IgYW4gZW50aXJlIGRpc2suCj4+Cj4+
Cj4+IEV2ZXJ5IGFjY2VzcyB0byBhIHNuYXBzaG90IG5lZWRzIHRoZW4gYSBuZXcgc2VwYXJhdGUg
ICd1bmxvY2snLi4KPj4KPj4+PiAgU3BlYWtpbmcgYWJvdXQgc25hcHNob3RzIC0geW91IHNob3Vs
ZCBjb25zaWRlciBzd2l0Y2hpbmcgdG8gJ3RoaW4tcG9vbHMnICBmb3IKPj4+PiAgZmFyIGJldHRl
ciBwZXJmb3JtYW5jZS4uLgo+Pj4KPj4+Cj4+PiAgSSBvbmx5IG5lZWQgc25hcHNob3RzIGZvciBi
YWNrdXBzOiBvbmNlIGEgZGF5LCBjcmVhdGUgYSBzbmFwc2hvdCwKPj4+ICBtb3VudCBpdCwgZG8g
YSBmaWxlLWxldmVsIGluY3JlbWVudGFsIGJhY2t1cCwgdW5tb3VudCBpdCwgZGVsZXRlIGl0Lgo+
Pj4KPj4+ICBXb3VsZCB0aGUgdGhpbi1wb29scyBtYWtlIGEgZGlmZmVyZW5jZSBpbiB0aGlzIGNh
c2U/Cj4+Cj4+Cj4+IFdlbGwgdGhlcmUgYXJlIG1hbnkgd2F5cyBob3cgdG8gc2tpbiBhIGNhdC4u
Lgo+PiBJLmUuIGNoZWNrICBibGstYXJjaGl2ZSAgaHR0cHM6Ly9naXRodWIuY29tL2p0aG9ybmJl
ci9ibGstYXJjaGl2ZQo+Pgo+PiBSZWdhcmRzCj4+Cj4+IFpkZW5lawo+Pgo+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+Pgo+PiBsaW51eC1sdm0gbWFpbGluZyBsaXN0Cj4+IGxp
bnV4LWx2bUByZWRoYXQuY29tCj4+IGh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtbHZtCj4+IHJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAu
b3JnL0hPV1RPL0xWTS1IT1dUTy8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20K
aHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVh
ZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

