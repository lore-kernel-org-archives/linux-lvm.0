Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4895FE80AB1
	for <linux-lvm@archiver.kernel.org>; Wed, 27 Sep 2023 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695824830;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uWI528m5hYcpZJWIfL9mNPmdRy3TD2uqB8mD3gQZ5L4=;
	b=c8bTH09VfODAIMS5Rts0VpizWLxZedwg6Gfp7zdzqJQ+ENSMPJdB6ce75g9162a9FYAj5G
	d62tjiHu5pnWpLjjHNy5WmsN2/NK97Qp4JuVgUeiY9+Zk9nMrjr/pQirWqn/yRKQwPKONe
	aQc/URavpqQcH88UwyfyOQuGdf3q9rA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-q4kG-1S0NUKmWXdlZZkgbQ-1; Wed, 27 Sep 2023 10:27:06 -0400
X-MC-Unique: q4kG-1S0NUKmWXdlZZkgbQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD938805B32;
	Wed, 27 Sep 2023 14:27:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E70CE1678B;
	Wed, 27 Sep 2023 14:26:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8E670194658F;
	Wed, 27 Sep 2023 14:26:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 015C91946588
 for <linux-lvm@listman.corp.redhat.com>; Wed, 27 Sep 2023 13:45:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D2BED2156711; Wed, 27 Sep 2023 13:45:55 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB6212156702
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 13:45:55 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC99A2802223
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 13:45:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-oFB1uLQ_NHWpuyKvkGuriA-1; Wed, 27 Sep 2023 09:45:53 -0400
X-MC-Unique: oFB1uLQ_NHWpuyKvkGuriA-1
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-405524e6769so56990555e9.1
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 06:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695822352; x=1696427152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oN6N232C++HG2SABUafDEjyAIxZIQRzUblkz03mYsFA=;
 b=cPOcCKJqS50JY/uMk3zkvDgJSWW1UTiOboGHDkSLQPeEeS6zhwxH3va3zuFz2mvBU2
 xl3QNKkGz9iRer74GkGgb2o5uIkKJxSkEpmeU0hB/DytRAqiuxnILBlnKhCMNnNpCsja
 PMWaKwZmiycv7ogul2WoWuXZmP5O+xfGrpfg3sja2paPui5Vvu3+FznqtFBGUNP2uMLw
 DHk5t2oD9WX0g77OwtP2XNLsWxGh5Lpi1y1wXpPMz0tm51C1LKaoCGBrKTcWvQ34jEbz
 XbfQ05PpUis0AvFGwdkcI9eDrC4NT+yKmjg9JUFVjbmYhb07Jg5HbaG7WgJC+BK/hRpb
 21Vg==
X-Gm-Message-State: AOJu0YzClfgn32GnMIC5gARDpW1mFgU9RyhVqyCbgFEis/VnmazZ7CQu
 zPYU45XYnb/cJh6hmjIkmznNHChtoVgf9rA0Lvw=
X-Google-Smtp-Source: AGHT+IGGEP6YwQjBef0jZaUQf1oulokUKCoVV62hr2VCRKZYY0Uj6IqbNzbtOwcItkO2jC2iMCQwiyK9lZxlK/+2zeE=
X-Received: by 2002:a7b:cd11:0:b0:401:c8b9:4b86 with SMTP id
 f17-20020a7bcd11000000b00401c8b94b86mr1845774wmj.9.1695822352334; Wed, 27 Sep
 2023 06:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
 <6e0faedf-f450-4454-a86b-6448a1b4747b@gmail.com>
 <CAM5YWZfL8zf9=re+VU2MiAQcYvXodqDV-08Zu5RkKUMfkDJ7Tg@mail.gmail.com>
 <90d9a21d-f748-4ca1-b327-6c38f4440298@gmail.com>
In-Reply-To: <90d9a21d-f748-4ca1-b327-6c38f4440298@gmail.com>
From: Jean-Marc Saffroy <saffroy+redhat@gmail.com>
Date: Wed, 27 Sep 2023 15:45:41 +0200
Message-ID: <CAM5YWZfbEhSJo_01SXRuxSwRPOWYexxDVm9-3W_+=rP+icHStQ@mail.gmail.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBTZXAgMjcsIDIwMjMgYXQgMTE6NTjigK9BTSBaZGVuZWsgS2FiZWxhYwo8emRlbmVr
LmthYmVsYWNAZ21haWwuY29tPiB3cm90ZToKPgo+IERuZSAyNy4gMDkuIDIzIHYgMToxMCBKZWFu
LU1hcmMgU2FmZnJveSBuYXBzYWwoYSk6Cj4gPiBIaSwKPiA+Cj4gPiBPbiBUdWUsIFNlcCAyNiwg
MjAyMyBhdCAxMDowMOKAr1BNIFpkZW5layBLYWJlbGFjCj4gPiA8emRlbmVrLmthYmVsYWNAZ21h
aWwuY29tPiB3cm90ZToKPiA+PiBZZXAgdHlwaWNhbCB1c2FnZSBpcyB0byBlbmNyeXB0IHVuZGVy
bHlpbmcgUFYgLSBhbmQgdGhlbiBjcmVhdGUgTFZzIGFuZCBpdHMKPiA+PiBzbmFwc2hvdHMgb24g
ZW5jcnlwdGVkIGRldmljZS4KPiA+Cj4gPiBTdXJlLCBJJ2QgZG8gdGhhdCBpbiBvdGhlciBjaXJj
dW1zdGFuY2VzLgo+ID4KPiA+IEJ1dCBpbiBteSBjYXNlIGl0IHdvdWxkIGp1c3QgYmUgYSB3YXN0
ZTogSSBhbSByZXBsYWNpbmcgc2V2ZXJhbCBkaXNrcwo+ID4gb24gYSBkZXNrdG9wIGNvbXB1dGVy
IHdpdGggYSBzaW5nbGUgMlRCIE5WTUUgU1NEIGZvciBldmVyeXRoaW5nLiBPbmx5Cj4gPiAvaG9t
ZSBuZWVkcyB0byBiZSBlbmNyeXB0ZWQsIGFuZCBpdCdzIHRpbnksIGxpa2UgMTAwLTIwMEdCLiBH
b2luZwo+ID4gdGhyb3VnaCBlbmNyeXB0aW9uIGZvciBtb3N0IGFwcGxpY2F0aW9uIEkvT3Mgd291
bGQgdXNlIENQVSB0aW1lIGFuZAo+ID4gaW5jcmVhc2UgbGF0ZW5jeSB3aXRoIG5vIGJlbmVmaXQu
Cj4gPgo+ID4gU28gSSBwcmVmZXIgdG8gbWFuYWdlIGF2YWlsYWJsZSByYXcgKHVuLWVuY3J5cHRl
ZCkgc3BhY2Ugd2l0aCBMVk0uCj4gPgo+ID4gTm93LCBJIGFsc28gbmVlZCB0byBkbyBiYWNrdXBz
IG9mIC9ob21lLCBhbmQgdGhhdCdzIHdoeSBJIHdhbnQKPiA+IHNuYXBzaG90cy4gQnV0IHRoYXQg
Zmlyc3QgbGF5ZXIgb2YgTFZNIHdvdWxkIG9ubHkgc2hvdyBhIHNuYXBzaG90IG9mCj4gPiBhbiBl
bmNyeXB0ZWQgdm9sdW1lLCBhbmQgdGhlIGJhY2t1cCBqb2Igc2hvdWxkbid0IGhhdmUgdGhlIHBh
c3NwaHJhc2UKPiA+IHRvIGRlY3J5cHQgdGhlIHZvbHVtZS4KPiA+Cj4gPiBXaGljaCBpcyB3aHkg
SSdtIHRyeWluZyB0byBmaW5kIGEgd2F5IG9mIGRvaW5nIHNuYXBob3RzIG9mIGFuICJvcGVuZWQi
Cj4gPiBMVUtTIHZvbHVtZTogdGhpcyB3YXksIHRoZSBiYWNrdXAgam9iIGNhbiBkbyBpdHMgam9i
IHdpdGhvdXQgcmVxdWlyaW5nCj4gPiBhIHBhc3NwaHJhc2UuCj4KPiB3ZWxsIHRoYXQncyB3aGVy
ZSB5b3Ugd2lsbCBjb25zaWRlcmFibHkgJ2NvbXBsaWNhdGUnIHlvdXIgbGlmZSA6KQo+IEFzIHlv
dSB3b3VsZCBuZWVkIHRvICdvcmNoZXN0cmFjZScgdGhpcyB5b3Vyc2VsZiB3aXRoICdkbXNldHVw
JyB1c2FnZS4KCklmIHlvdSBtZWFuIHRoYXQgSSdkIGhhdmUgdG8gc2NyaXB0IGEgZmV3IHRoaW5n
cywgdGhlbiBJIGFtIHBlcmZlY3RseQpmaW5lIHdpdGggdGhhdC4KCj4gcnVubmluZyAnZG1zZXR1
cCBzdXNwZW5kJyBvbiB5b3VyIGhvbWUgZGV2aWNlLAo+IHRoYXQgdGFraW5nIGEgc25hcHNob3Qg
b2YgeW91ciB1bmRlcmx5aW5nICBMVi4KCldoYXQgaXMgdGhlIHJvbGUgb2YgImRtc2V0dXAgc3Vz
cGVuZCI/IEkgYW0gaGF2aW5nIHRyb3VibGUgZmluZGluZwpkZWNlbnQgZG9jdW1lbnRhdGlvbiBh
Ym91dCBpdHMgcHVycG9zZSBhbmQgaG93IGl0J3MgcmVsYXRlZCB0bwpzbmFwc2hvdHMuIEkgZGlk
IG5vdCBuZWVkIGl0IGluIG15IGV4cGVyaW1lbnRzLCBzbyBJIGFtIGN1cmlvdXMuCgo+IEhlcmUg
dGhlIHVzYWdlIG9mICd0aGluLXBvb2wnIHdvdWxkIHBvc3NpYmx5IGhlbHAgYSBsaXR0bGUgYml0
IC0gYXMgeW91IGdldCBhCj4gY29udHJvbCBvdmVyIHdoZW4gYSBzbmFwc2hvdCBMViBhcHBlYXJz
IGluIHlvdXIgc3lzdGVtLgo+Cj4gT25jZSB5b3UgaGF2ZSB0aGUgc25hcHNob3QgY3JlYXRlZCB5
b3UgJ3Jlc3VtZScgIHRoZSB0b3AtbGV2ZWwKPiBkZWNyeXB0ZWQgdm9sdW1lLgo+Cj4gVGhlbiBp
ZiB5b3Ugd2FudCB0byBhY2Nlc3MgeW91ciBzbmFwc2hvdCAtIHlvdSBjcmVhdGUgYW5vdGhlciAn
Y3J5cHRvJyBkZXZpY2UKPiAtIHVubG9jayBpdCBhZ2FpbiB3aXRoIHlvdXIga2V5IC0gYW5kIGl0
IHNob3VsZCB3b3JrLgoKQXQgYm9vdCB0aW1lIChvciBsb2dpbiB0aW1lLCBzYW1lIHRoaW5nKSwg
SSBuZWVkIHRvIGdpdmUgdGhlCnBhc3NwaHJhc2UgdG8gb3BlbiB0aGUgTFVLUyBkZXZpY2UsIGJ1
dCBhZnRlciB0aGF0LCBiYWNrdXAgam9icyBydW4gaW4KdGhlIGJhY2tncm91bmQsIHRoZXkgYXJl
IG5vdCBpbnRlcmFjdGl2ZS4KCklmIEkgd2VyZSBva2F5IHdpdGggZ2l2aW5nIHRoZSBwYXNzcGhy
YXNlIHRvIG15IGJhY2t1cCBzY3JpcHQsIHRoZW4gSQpjb3VsZCBzaW1wbHkgaGF2ZSB0aGUgYmFj
a3VwIHNjcmlwdCBjcmVhdGUgaXRzIHNuYXBzaG90IGZyb20gdGhlCmVuY3J5cHRlZCBMViwgYW5k
IEkgd291bGRuJ3QgaGF2ZSBzdGFydGVkIHRoaXMgdGhyZWFkIGluIHRoaXMgY2FzZS4KOi0pCgo+
IEJ1dCB0aGUgbGV2ZWwgb2YgY29tcGxleGl0eSBoZXJlIGlzIHJhdGhlciAgaGlnaCAtIHRoaXMg
aXQgbWlnaHQgYmUgYWN0dWFsbHkKPiB3YXkgZWFzaWVyIHRvIGp1c3QgJ3BhcnRpdGlvbicgeW91
ciBkZXZpY2UgZm9yICAnZW5jcnlwdGVkJyAgYW5kIHVuZWNyeXB0ZWQnCj4gcGFydHMgYW5kIHVz
ZSAyIFBWcyBmb3IgMiBWR3MuLi4uCgpCdXQgdGhlbiBJIGNhbid0IHJlc2l6ZSB0aGUgZW5jcnlw
dGVkIHZvbHVtZS9wYXJ0aXRpb24uCgo+ID4gSnVzdCB0aGUgb25lIC9ob21lIGluIG15IGNhc2Us
IHNvIG5vIHdvcnNlIHRoYW4gcHJvbXB0aW5nIGZvciB0aGUKPiA+IHBhc3NwaHJhc2UgZm9yIGFu
IGVudGlyZSBkaXNrLgo+Cj4gRXZlcnkgYWNjZXNzIHRvIGEgc25hcHNob3QgbmVlZHMgdGhlbiBh
IG5ldyBzZXBhcmF0ZSAgJ3VubG9jaycuLgoKTm90IHdpdGggdGhlIGFwcHJvYWNoZXMgSSBzdWdn
ZXN0ZWQsIGFzIHRoZXkgd29yayB0byBidWlsZCB0aGUKc25hcHNob3RzIG9uIHRvcCBvZiB0aGUg
Im9wZW4iLCBkZWNyeXB0ZWQgZGV2aWNlLgoKSXQgc2VlbXMgTFZNIGNhbm5vdCBkbyBpdCBkaXJl
Y3RseSwgYnV0IGl0IGJlY29tZXMgcG9zc2libGUgKGF0IGxlYXN0CmluIG15IHNpbXBsZSB0ZXN0
cykgaWYgSSB1c2UgYSBidW5jaCBvZiBkbXNldHVwIGNvbW1hbmRzLCBvciBpZiBJIHVzZQp0aGUg
ZGVjcnlwdGVkIGRldmljZSBhcyB0aGUgUFYgZm9yIGEgbmV3IFZHLgoKQnV0IEkgZG9uJ3Qga25v
dyBpZiB0aGVzZSBhcHByb2FjaGVzIGFyZSBzYWZlIHRvIHVzZSwgYW5kIHRoYXQgaXMgd2hhdApk
cm92ZSBtZSBoZXJlLgoKSW4gdGhlIG1lYW4gdGltZSwgSSBmb3VuZCB0aGlzIHBhZ2U6Cmh0dHBz
Oi8vYWNjZXNzLnJlZGhhdC5jb20vYXJ0aWNsZXMvMjEwNjUyMQoKQXBwYXJlbnRseSwgTFZNIG9u
IExVS1Mgb24gTFZNIHdvdWxkIGJlIGNhc2Ugb2YgIkxWTSByZWN1cnNpb24iLCBhbmQKc28gbm90
IGVudGlyZWx5IHVuaGVhcmQgb2YuCgpEb2VzIGFueW9uZSBoZXJlIGhhdmUgZXhwZXJpZW5jZSB3
aXRoICJMVk0gcmVjdXJzaW9uIj8KCkNoZWVycywKSk0KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZt
QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZN
LUhPV1RPLwo=

