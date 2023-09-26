Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1547E7F143
	for <linux-lvm@archiver.kernel.org>; Tue, 26 Sep 2023 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695770433;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aELNavACc5OFLue6oJnmaeQXmyQPtIOMGds9bMrLK5I=;
	b=jSahy0sYk7Dy8CliK1C0XNfltCOc/YHzE5RhtAVZn82Br9cvq3nZuBmb9OHN6fs6kSfFyk
	/2zaCt3bqKcHfxehg4K4ZTSxyMBkYKfDHlUBLSh2EcXKoqATGWK45ufZpC85eK9s/kbhFw
	p4aNAMNt0wn7Gatwmr1ZT+70+KJ/110=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-AZBwjH3yNhOhLdX5T7YfRw-1; Tue, 26 Sep 2023 19:20:30 -0400
X-MC-Unique: AZBwjH3yNhOhLdX5T7YfRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47B3E29A8AEA;
	Tue, 26 Sep 2023 23:20:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F14EC10069B4;
	Tue, 26 Sep 2023 23:20:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C1133194658D;
	Tue, 26 Sep 2023 23:20:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 69C5C1946588
 for <linux-lvm@listman.corp.redhat.com>; Tue, 26 Sep 2023 23:10:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4B77E215670B; Tue, 26 Sep 2023 23:10:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 435342156702
 for <linux-lvm@redhat.com>; Tue, 26 Sep 2023 23:10:25 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C0B3801FA9
 for <linux-lvm@redhat.com>; Tue, 26 Sep 2023 23:10:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-tRWOkrc6O7u3jpnzZP41Xw-1; Tue, 26 Sep 2023 19:10:23 -0400
X-MC-Unique: tRWOkrc6O7u3jpnzZP41Xw-1
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4060b623e64so22215225e9.0
 for <linux-lvm@redhat.com>; Tue, 26 Sep 2023 16:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695769822; x=1696374622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GoV4cE/7fKKbJ4IDdKCQ0fSOnOC11bTPLnon/CYFbNE=;
 b=k1C+g3TlcCeURiNLGxWJl0abaXse/IVWJWnSlD03/M+nGr97WHy31ZZ9qXiE7QcO+2
 eSZiV0/Ynw2kW/vv0BuAyYzWppYoB+TJPInvv5km1zP6jFAUdOsbsL+/LqSkvWBdzq94
 i6jkicIIbpZJwELRZwBZ/4MV/iSQO9zMT7apKbvjbsxGlk+NEAeF8lzEqXr/VBBOaQTs
 JRqXgxycJ63gZIWyQwXMYacW/hOk1JvSMC2Z//JIeXqw75LONuaIlizab+VsKBN9uf16
 gpU5UPXoSHaMoAgBhvHOZWzlzAWUucwjqBLkaPkXEG8650tAU8KL7WofVmgKjEvxWp0A
 2O+g==
X-Gm-Message-State: AOJu0YxYJSreDPaz1EiFOl+uPFlqZc8J9fvssY44ScaBmyCW9Nl+CO+5
 ipFmXSQnHb3JdNwL80La4i7jRCgtrvWLPvv4/1Q=
X-Google-Smtp-Source: AGHT+IHrVd80OSVLRscZJK+KHS3SVPkxxHNrdGhq9TGt7hUVMOA1AI55p0/lbxPp9CvB5zBjqIKk9Fp4m5m5qmyRb7w=
X-Received: by 2002:a05:600c:46cb:b0:401:b92f:eec5 with SMTP id
 q11-20020a05600c46cb00b00401b92feec5mr2989443wmo.9.1695769821740; Tue, 26 Sep
 2023 16:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
 <6e0faedf-f450-4454-a86b-6448a1b4747b@gmail.com>
In-Reply-To: <6e0faedf-f450-4454-a86b-6448a1b4747b@gmail.com>
From: Jean-Marc Saffroy <saffroy+redhat@gmail.com>
Date: Wed, 27 Sep 2023 01:10:10 +0200
Message-ID: <CAM5YWZfL8zf9=re+VU2MiAQcYvXodqDV-08Zu5RkKUMfkDJ7Tg@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksCgpPbiBUdWUsIFNlcCAyNiwgMjAyMyBhdCAxMDowMOKAr1BNIFpkZW5layBLYWJlbGFjCjx6
ZGVuZWsua2FiZWxhY0BnbWFpbC5jb20+IHdyb3RlOgo+IFllcCB0eXBpY2FsIHVzYWdlIGlzIHRv
IGVuY3J5cHQgdW5kZXJseWluZyBQViAtIGFuZCB0aGVuIGNyZWF0ZSBMVnMgYW5kIGl0cwo+IHNu
YXBzaG90cyBvbiBlbmNyeXB0ZWQgZGV2aWNlLgoKU3VyZSwgSSdkIGRvIHRoYXQgaW4gb3RoZXIg
Y2lyY3Vtc3RhbmNlcy4KCkJ1dCBpbiBteSBjYXNlIGl0IHdvdWxkIGp1c3QgYmUgYSB3YXN0ZTog
SSBhbSByZXBsYWNpbmcgc2V2ZXJhbCBkaXNrcwpvbiBhIGRlc2t0b3AgY29tcHV0ZXIgd2l0aCBh
IHNpbmdsZSAyVEIgTlZNRSBTU0QgZm9yIGV2ZXJ5dGhpbmcuIE9ubHkKL2hvbWUgbmVlZHMgdG8g
YmUgZW5jcnlwdGVkLCBhbmQgaXQncyB0aW55LCBsaWtlIDEwMC0yMDBHQi4gR29pbmcKdGhyb3Vn
aCBlbmNyeXB0aW9uIGZvciBtb3N0IGFwcGxpY2F0aW9uIEkvT3Mgd291bGQgdXNlIENQVSB0aW1l
IGFuZAppbmNyZWFzZSBsYXRlbmN5IHdpdGggbm8gYmVuZWZpdC4KClNvIEkgcHJlZmVyIHRvIG1h
bmFnZSBhdmFpbGFibGUgcmF3ICh1bi1lbmNyeXB0ZWQpIHNwYWNlIHdpdGggTFZNLgoKTm93LCBJ
IGFsc28gbmVlZCB0byBkbyBiYWNrdXBzIG9mIC9ob21lLCBhbmQgdGhhdCdzIHdoeSBJIHdhbnQK
c25hcHNob3RzLiBCdXQgdGhhdCBmaXJzdCBsYXllciBvZiBMVk0gd291bGQgb25seSBzaG93IGEg
c25hcHNob3Qgb2YKYW4gZW5jcnlwdGVkIHZvbHVtZSwgYW5kIHRoZSBiYWNrdXAgam9iIHNob3Vs
ZG4ndCBoYXZlIHRoZSBwYXNzcGhyYXNlCnRvIGRlY3J5cHQgdGhlIHZvbHVtZS4KCldoaWNoIGlz
IHdoeSBJJ20gdHJ5aW5nIHRvIGZpbmQgYSB3YXkgb2YgZG9pbmcgc25hcGhvdHMgb2YgYW4gIm9w
ZW5lZCIKTFVLUyB2b2x1bWU6IHRoaXMgd2F5LCB0aGUgYmFja3VwIGpvYiBjYW4gZG8gaXRzIGpv
YiB3aXRob3V0IHJlcXVpcmluZwphIHBhc3NwaHJhc2UuCgpJbiBzaW1wbGUgdGVzdHMsIEkgY291
bGQgbWFrZSBpdCB3b3JrLCB3aXRoIGRtc2V0dXAgb24gTFVLUyBvbiBMVk0sCmFuZCBhbHNvIChh
ZnRlciBJIHNlbnQgbXkgb3JpZ2luYWwgZW1haWwpIHdpdGggTFZNIG9uIExVS1Mgb24gTFZNLgoK
QnV0IG15IHRlc3RzIGRvbid0IHRlbGwgbWUgaWYgdGhlcmUgYXJlIG90aGVyIHBlb3BsZSBkb2lu
ZyBzaW1pbGFyCnRoaW5ncyBvbiBwcm9kdWN0aW9uIHN5c3RlbXMsIG9yIGlmIHRoZXkgYXJlIGhh
cHB5IHdpdGggdGhlIHJlc3VsdHMuClVudXN1YWwgc2V0dXBzIHRlbmQgdG8gZXhoaWJpdCB1bnVz
dWFsIGJ1Z3MsIGFuZCBJIGFtIG5vdCBzdXBlciBmb25kCm9mIGJ1Z3MgaW4gbXkgc3RvcmFnZSBz
eXN0ZW1zLiA6LSkKClNvIHRoYXQncyByZWFsbHkgdGhlIGNvcmUgb2YgbXkgcXVlc3Rpb246IGRv
IG90aGVyIHBlb3BsZSBydW4gZWl0aGVyCiJyYXciIGRtc2V0dXAgb3IgTFZNIG9uIHRvcCBvZiBM
VUtTL0xWTSwgYW5kIHdpdGggc3VjY2Vzcz8KCj4gRW5jcnlwdGluZyAnaW5kaXZpZHVhbCcgTFZz
IC0gd2hpbGUgY2VydGFpbmx5ICdkb2FibGUnIHdvdWxkIGkuZS4gY3JlYXRlIGEKPiBjb25zaWRl
cmFibGUgbGFyZ2VyIGFtb3VudCBvZiB2b2x1bWVzIHRoYXQgd291bGQgbmVlZCBpbmRpdmlkdWFs
ICd1bmxvY2tpbmcnCj4gd2l0aCBlYWNoIGFjdGl2YXRpb24uCgpKdXN0IHRoZSBvbmUgL2hvbWUg
aW4gbXkgY2FzZSwgc28gbm8gd29yc2UgdGhhbiBwcm9tcHRpbmcgZm9yIHRoZQpwYXNzcGhyYXNl
IGZvciBhbiBlbnRpcmUgZGlzay4KCj4gU3BlYWtpbmcgYWJvdXQgc25hcHNob3RzIC0geW91IHNo
b3VsZCBjb25zaWRlciBzd2l0Y2hpbmcgdG8gJ3RoaW4tcG9vbHMnICBmb3IKPiBmYXIgYmV0dGVy
IHBlcmZvcm1hbmNlLi4uCgpJIG9ubHkgbmVlZCBzbmFwc2hvdHMgZm9yIGJhY2t1cHM6IG9uY2Ug
YSBkYXksIGNyZWF0ZSBhIHNuYXBzaG90LAptb3VudCBpdCwgZG8gYSBmaWxlLWxldmVsIGluY3Jl
bWVudGFsIGJhY2t1cCwgdW5tb3VudCBpdCwgZGVsZXRlIGl0LgoKV291bGQgdGhlIHRoaW4tcG9v
bHMgbWFrZSBhIGRpZmZlcmVuY2UgaW4gdGhpcyBjYXNlPwoKCkNoZWVycywKSk0KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5n
IGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxk
cC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

