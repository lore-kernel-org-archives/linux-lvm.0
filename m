Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79857EB64DB
	for <linux-lvm@archiver.kernel.org>; Mon, 19 Jun 2023 18:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687198973;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TOq5/tMYO/djz7hRlU1fujkcVBUo5ZqQrNKwVhBTOEE=;
	b=HbL2FkkJf/zThI5RITuMAXv6iomUpxb6PpEFsPs2AVSr/kxbG3iIbztMeI4F2Db52j2z4o
	DNyC7nYFElVBnZoZYWgmX6asKEe9xxZighoTpxvY4RsDdeheAqHnqrotwNzQP1/efyp4rK
	BL9tjUikDBUF7Os2hnVo5BYOpgxbY1A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-rGv17pLTNXmhl-B8c2MLnw-1; Mon, 19 Jun 2023 14:22:51 -0400
X-MC-Unique: rGv17pLTNXmhl-B8c2MLnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73A07811E9E;
	Mon, 19 Jun 2023 18:22:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 742F940C6F56;
	Mon, 19 Jun 2023 18:22:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 545401946595;
	Mon, 19 Jun 2023 18:22:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 48B41194658C
 for <linux-lvm@listman.corp.redhat.com>; Mon, 19 Jun 2023 18:22:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DA38B40C20F6; Mon, 19 Jun 2023 18:22:38 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1CFC40C20F5
 for <linux-lvm@redhat.com>; Mon, 19 Jun 2023 18:22:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97872101A529
 for <linux-lvm@redhat.com>; Mon, 19 Jun 2023 18:22:38 +0000 (UTC)
Received: from beige.elm.relay.mailchannels.net
 (beige.elm.relay.mailchannels.net [23.83.212.16]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-7LfW0o1mNtWD7q8T8tUKeA-1; Mon, 19 Jun 2023 14:22:36 -0400
X-MC-Unique: 7LfW0o1mNtWD7q8T8tUKeA-1
X-Sender-Id: dreamhost|x-authsender|relay@brickies.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 3943226110E
 for <linux-lvm@redhat.com>; Mon, 19 Jun 2023 18:22:35 +0000 (UTC)
Received: from pdx1-sub0-mail-a210.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 8BC28260942
 for <linux-lvm@redhat.com>; Mon, 19 Jun 2023 18:22:33 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|relay@brickies.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|relay@brickies.net
X-MailChannels-Auth-Id: dreamhost
X-Power-Left: 43308d0473311992_1687198955050_2037095131
X-MC-Loop-Signature: 1687198955050:3871676807
X-MC-Ingress-Time: 1687198955049
Received: from pdx1-sub0-mail-a210.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.127.59.48 (trex/6.9.1); Mon, 19 Jun 2023 18:22:35 +0000
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: relay@brickies.net)
 by pdx1-sub0-mail-a210.dreamhost.com (Postfix) with ESMTPSA id 4QlJ5j2qXkz8t
 for <linux-lvm@redhat.com>; Mon, 19 Jun 2023 11:22:33 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2b47354c658so24648671fa.1
 for <linux-lvm@redhat.com>; Mon, 19 Jun 2023 11:22:33 -0700 (PDT)
X-Gm-Message-State: AC+VfDxnk1ifKux3ajS0nhfi8jLmj2TonrWvtQSOdCHzMUDoNWGoQdMP
 oKv9gNfsvQV0UTCObvOFy830h8Z5yt4cHY4e5R0=
X-Google-Smtp-Source: ACHHUZ5HD/fJZkneBkEfEyYwAbf7yi7qD3u7bM9o9VJ9beqXh109S+XtqFwXlGqmCVa6V4YTtnDFP0qHTtKZI048JDU=
X-Received: by 2002:a2e:7018:0:b0:2b4:7503:b8ff with SMTP id
 l24-20020a2e7018000000b002b47503b8ffmr2412908ljc.4.1687198952034; Mon, 19 Jun
 2023 11:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAKxE60wDS+8d2q5PVZ7SeqN5vMhXK_vK12j_CknZt6rStp5v6g@mail.gmail.com>
 <331beb2b-ec8e-5525-edc5-71fbdfc93c34@gmail.com>
In-Reply-To: <331beb2b-ec8e-5525-edc5-71fbdfc93c34@gmail.com>
From: Scott Moser <smoser@brickies.net>
Date: Mon, 19 Jun 2023 14:22:20 -0400
X-Gmail-Original-Message-ID: <CAKxE60xFh5HGjW2JgNd1Ev_gb1N9D6ns4HiCua7QM4Ga_ceZOw@mail.gmail.com>
Message-ID: <CAKxE60xFh5HGjW2JgNd1Ev_gb1N9D6ns4HiCua7QM4Ga_ceZOw@mail.gmail.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [linux-lvm] lvm2-testsuite stability
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: brickies.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksIHRoYW5rcyBmb3IgeW91ciByZXNwb25zZS4KCj4gWWVwIC0gc29tZSB0ZXN0cyBhcmUgZmFp
bGluZwo+Cj4gPiBleHBlY3RlZC1mYWlsICBhcGkvZGJ1c3Rlc3Quc2gKPgo+IFdlIGRvIGhhdmUg
dGhlbSBldmVuIHNwbGl0IHRvIGluZGl2aWR1YWwgdGVzdHM7Cj4gYXBpL2RidXNfdGVzdF9jYWNo
ZV9sdl9jcmVhdGUuc2gKPiBhcGkvZGJ1c190ZXN0X2xvZ19maWxlX29wdGlvbi4Kc2gKClRoYXQg
aXMgbm90IGF2YWlsYWJsZSB1cHN0cmVhbSwgcmlnaHQ/CkkganVzdCBzYXcgdGhlIHNpbmdsZSAn
ZGJ1c3Rlc3Quc2gnIGluClttYWluL3Rlc3RdKGh0dHBzOi8vZ2l0aHViLmNvbS9sdm10ZWFtL2x2
bTIvdHJlZS9tYXN0ZXIvdGVzdC9hcGkpLgpJcyB0aGVyZSBhbm90aGVyIGJyYW5jaCBJIHNob3Vs
ZCBiZSBsb29raW5nIGF0PwoKPiBJJ2QgbGlrZWx5IG5lZWQgdG8gZ2V0IGFjY2Vzcy9zZWUgIHRv
IHRoZSBsb2dzIG9mIHN1Y2ggbWFjaGluZXMKPiAob3IgeW91IHdvdWxkIG5lZWQgdG8gcHJvdmlk
ZSBhcyBzb21lIGRvd25sb2FkYWJsZSBpbWFnZSBvZiB5b3UgUWVtdSBtYWNoaW5lCj4gaW5zdGFs
bGF0aW9uKQoKVGhlIGdpc3QgYXQgaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vc21vc2VyLzMxMDdk
YWZlYzQ5MGMwZjRkOWJmOWZhZjAyMzI3ZjA0CmRlc2NyaWJlcyBob3cgSSBhbSBkb2luZyB0aGlz
LiAgSXQgaXMgInN0YW5kYXJkIiBwYWNrYWdlIGJ1aWxkIGFuZCBhdXRvcGtndGVzdApvbiBkZWJp
YW4vdWJ1bnR1LiAgVGhlIGF1dG9wa2d0ZXN0IFZNIGRvZXMgbm90IHVzZSBMVk0gZm9yIHRoZSBz
eXN0ZW0Kc28gd2UgZG9uJ3QgaGF2ZSB0byB3b3JyeSBhYm91dCBpbnRlcmFjdGlvbiB3aXRoIHRo
YXQuCgpJIGNvdWxkIHByb3ZpZGUgYSB2bSBpbWFnZSBpZiB5b3Ugd2VyZSBpbnRlcmVzdGVkLgoK
PiA+IERvIG90aGVycyBydW4gdGhpcyB0ZXN0LXN1aXRlIGluIGF1dG9tYXRpb24gYW5kIGdldCBy
ZWxpYWJsZSByZXN1bHRzID8KPiA+Cj4KPiBXZSBzdXJlbHkgZG8gcnVuIHRoZXNlIHRlc3RzIG9u
IHJlZ3VsYXIgYmFzaXMgb24gVk0gLSBzbyB0aG9zZSBhcmUgdXN1YWxseQo+IHNsaWdodGx5IG1v
ZGlmaWVkIHRvIGF2b2lkIGNvbGxpc2lvbnMgd2l0aCB0ZXN0cy4gIFRoZXJlIGlzIGFsc28gbm8K
PiBzdHJpY3QgcnVsZSB0byBub3QgYnJlYWsgc29tZSAndGVzdHMnIC0gc28gb2NjYXNpb25hbGx5
IHNvbWUgdGVzdHMgY2FuCj4gYmUgZmFpbGluZyBmb3IgYSB3aGlsZSBpZiB0aGV5IGFyZSBzZWVu
ICdsZXNzIGltcG9ydGFudCcgb3ZlciBzb21lIG90aGVyCj4gYnVncy4uLgoKSWRlbnRpZnlpbmcg
dGhlIHNldCBvZiB0ZXN0cyB0aGF0IHdlcmUgYWxsb3dlZCB0byBmYWlsIGluIGdpdAphbmQgZ2F0
aW5nIHB1bGwgcmVxdWVzdHMgb24gc3VjY2Vzc2Z1bCBwYXNzIHdvdWxkIGJlIHdvbmRlcmZ1bC4g
IFdpdGhvdXQKc29tZSBleHBlY3RlZC13b3JraW5nIGxpc3QsIGl0IGlzIGhhcmQgZm9yIG1lIGFz
IGEgZG93bnN0cmVhbSB1c2VyIHRvCnNlcGFyYXRlIHNpZ25hbCBmcm9tIG5vaXNlLgoKV291bGQg
dXBzdHJlYW0gYmUgb3BlbiB0byBwdWxsIHJlcXVlc3RzIHRoYXQgYWRkZWQgdGVzdCBzdWl0ZSBy
dW5uaW5nCiB2aWEgZ2l0aHViIGFjdGlvbnM/ICBpcyB0aGVyZSBzb21lIG90aGVyIHByZWZlcnJl
ZCBtZWNoYW5pc20gZm9yIHN1Y2ggYSB0aGluZz8KClRoZSB0ZXN0IHN1aXRlIGlzIHJlYWxseSB3
ZWxsIGRvbmUuIEkgd2FzIHN1cnByaXNlZCBob3cgd2VsbCBpdCBpbnN1bGF0ZXMKaXRzZWxmIGZy
b20gdGhlIHN5c3RlbSBhbmQgaG93IGVhc3kgaXQgd2FzIHRvIHVzZS4gIFJ1bm5pbmcgaXQgaW4g
YQpkaXN0cm8gd291bGQgZ2l2ZSB0aGUgZGlzdHJvIGRldmVsb3BlciBhICpodWdlKiBib29zdCBp
biBjb25maWRlbmNlIHdoZW4KYXR0ZW1wdGluZyB0byBpbnRlZ3JhdGUgYSBuZXcgTFZNIHJlbGVh
c2UgaW50byB0aGUgZGlzdHJvLgoKPgo+IFdlIHdvdWxkIG5lZWQgdG8gdGhpbmsgbXVjaCBoYXJk
ZXIgaWYgdGhlIHRlc3Qgc2hvdWxkIGJlIHJ1bm5pbmcgd2l0aAo+IHNvbWUgZGFlbW9ucyBvciBh
dXRvYWN0aXZhdGlvbiBvbiB0aGUgc3lzdGVtIHRoYXQgY291bGQgc2VlIGFuZCBjb3VsZAo+IGlu
dGVyYWN0IHdpdGggb3VyIGRldmljZXMgZ2VuZXJhdGVkIGR1cmluZyB0aGUgdGVzdCBydW4gKG9u
ZSBvZiB0aGUKPiByZWFzb25zIG1hY2hpbmUgZm9yIHRlc3RzIG5lZWQgc29tZSBsb2NhbCBtb2Rp
ZmljYXRpb24gLSB3ZSBtYXkgcHJvdmlkZQo+IHNvbWUgQW5zaWJsZS1saWtlIHRlc3Rpbmcgc2Ny
aXB0IGV2ZW50dWFsbHkuCgpBdXRvcGtndGVzdCB3aWxsCiAqIHN0YXJ0IGEgbmV3IHZtIGZvciBl
YWNoIHJ1biBvZiB0aGUgdGVzdHMKICogaW5zdGFsbCB0aGUgcGFja2FnZXMgbGlzdGVkIGFzIGRl
cGVuZGVuY2llcyBvZiB0aGUgdGVzdC4KICogcnVuIHRoZSB0ZXN0ICJlbnRyeXBvaW50IiAoZGVi
aWFuL3Rlc3QvdGVzdHN1aXRlKS4KCkkgdGhpbmsgdGhhdCBJIGhhdmUgZGViaWFuL3Rlc3QvdGVz
dHN1aXRlIGNvcnJlY3RseSBzaHV0dGluZwpkb3duL21hc2tpbmcgdGhlIG5lY2Vzc2FyeSBzeXN0
ZW0gc2VydmljZXMgYmVmb3JlIGludm9raW5nIHRoZSB0ZXN0cy4gQXMKc3VnZ2VzdGVkIGluIFRF
U1RJTkcuCgo+IEJ1dCBhbnl3YXkgLSB0aGUgZWFzaWVzdCBpcyB0byBnaXZlIHVzIGFjY2VzcyB0
byB5b3VyIHRlc3QgcmVzdWx0cyBzbyB3ZQo+IGNvdWxkIHNlZSB3aGV0aGVyIHRoZXJlIGlzIHNv
bWV0aGluZyB3cm9uZyB3aXRoIG91ciB0ZXN0IGVudmlyb25tZW50LAo+IGx2bTIgYnVnLCBvciBz
eXN0ZW0gc2V0dXAgLSBpdCdzIG5vdCBhbHdheXMgdHJpdmlhbCB0byBndWVzcy4uLgoKSWYgeW91
IGFyZSB3aWxsaW5nIHRvIGhlbHAsIEkgY2FuIHBvc3QgYSB2bSBpbWFnZSBzb21ld2hlcmUuIEkg
c3VzcGVjdAp5b3UncmUgbm90IHdvcmtpbmcgd2l0aCBkZWJpYW4gb3IgdWJ1bnR1IG9uIGEgZGFp
bHkgYmFzaXMuICBJZiB5b3UgaGFkCmFjY2VzcyB0byBhIGRlYmlhbiBvciB1YnVudHUgc3lzdGVt
IGl0IHdvdWxkIHByb2JhYmx5IGJlIGVhc2llc3QgdG8KanVzdCBsZXQgYXV0b3BrZ3Rlc3QgZG8g
dGhlIHJ1bm5pbmcuIGF1dG9wa2d0ZXN0IGRvZXMgcHJvdmlkZSBhCmAtLXNoZWxsYCBhbmQgYC0t
c2hlbGwtZmFpbGAgcGFyYW1ldGVyIHRvIHB1dCB5b3UgaW50byBhIHJvb3Qgc2hlbGwKYWZ0ZXIg
dGhlIHRlc3RzLgoKTXkgdWx0aW1hdGUgZ29hbCBpcyB0byBwcm92aWRlIGEgZGlzdHJvIHdpdGgg
Y29uZmlkZW5jZSB0aGF0IHRoZSBsdm0yCnBhY2thZ2UgdGhleSdyZSBpbnRlZ3JhdGluZyBpcyB3
b3JraW5nIGNvcnJlY3RseS4gIEknbSBvayB0byBza2lwCnRlc3RzIHRoYXQgcHJvdmlkZSBub2lz
eSByZXN1bHRzLiAgSW4gdGhpcyBjYXNlLCBoYXZpbmcgKnNvbWUqCnJlbGlhYmxlIHRlc3QgaXMg
YSBodWdlIGltcHJvdmVtZW50LgoKVGhhbmtzLApTY290dAoKT24gTW9uLCBKdW4gMTksIDIwMjMg
YXQgODoyNuKAr0FNIFpkZW5layBLYWJlbGFjIDx6ZGVuZWsua2FiZWxhY0BnbWFpbC5jb20+IHdy
b3RlOgo+Cj4gRG5lIDE1LiAwNi4gMjMgdiAyMDowMiBTY290dCBNb3NlciBuYXBzYWwoYSk6Cj4g
PiBIaSwKPiA+IFtzb3JyeSBmb3IgZHVwbGljYXRlIHBvc3QsIHJlLXNlbmRpbmcgZnJvbSBhIHN1
YnNjcmliZWQgYWRkcmVzc10KPiA+Cj4gPiBJJ20gbG9va2luZyB0byBlbmFibGUgdGhlIGx2bTIg
dGVzdHN1aXRlIGFzIGFuIGF1dG9wa2d0ZXN0IFsxXSB0byBydW4KPiA+IGluIGRlYmlhbiBhbmQg
dWJ1bnR1LiBJIGhhdmUgYSBtZXJnZSByZXF1ZXN0IHVwIGF0IFsyXS4gIFRoZSBnZW5lcmFsCj4g
PiBpZGVhIGlzIGp1c3QgdG8gYS4pIHBhY2thZ2UgJ2x2bTItdGVzdHN1aXRlJyBhcyBhbiBpbnN0
YWxsYWJsZSBwYWNrYWdlCj4gPiBiLikgcnVuIHRoZSB0ZXN0c3VpdGUgYXMgcGFydCBvZiB0aGUg
YXV0b3BrZ3Rlc3QuCj4gPgo+ID4gVGhlIHZlcnNpb24gSSdtIHRlc3Rpbmcgb24gVWJ1bnR1IDIy
LjA0IGlzIDIuMDMuMTYtMyBmcm9tIGRlYmlhbgo+ID4gKHJlYnVpbHQgZm9yIDIyLjA0KS4gSSdt
IHJ1bm5pbmcgdWRldi12YW5pbGxhICBpbiBhIDIgY3B1LzRHQiBWTSwgYW5kCj4gPiBzdG9wcGlu
Zy9tYXNraW5nICB0aGUgZm9sbG93aW5nIHNlcnZpY2VzOiBkbS1ldmVudCBsdm0yLWx2bXBvbGxk
Cj4gPiBsdm0yLW1vbml0b3IgbHZtMi1sdm1kYnVzZCAuCj4gPgo+ID4gSSdtIHNlZWluZyBzb21l
IGZhaWx1cmVzIHdoZW4gcnVubmluZyB0aGUgdGVzdC4gIFNvbWUgc2VlbSBleHBlY3RlZAo+ID4g
ZHVlIHRvIHNpemUgbGltaXRhdGlvbnMsIHNvbWUgc2VlbSB0byBmYWlsIGV2ZXJ5IHRpbWUsIGFu
ZCBzb21lIHNlZQo+ID4gdHJhbnNpZW50IGZhaWx1cmVzLgo+ID4KPiA+IEhlcmUgaXMgdGhlIGxp
c3Qgb2YgdGVzdHMgdGhhdCBJJ20gc2VlaW5nIGZhaWwgYW5kIG15IGluaXRpYWwKPiA+IGNhdGVn
b3JpemF0aW9uLiAgSSd2ZSBzZWVuIHRoaXMgYWNyb3NzIHNheSBoYWxmIGEgZG96ZW4gcnVuczoK
PiA+Cj4KPiBZZXAgLSBzb21lIHRlc3RzIGFyZSBmYWlsaW5nCj4KPiA+IGV4cGVjdGVkLWZhaWwg
IGFwaS9kYnVzdGVzdC5zaAo+Cj4gV2UgZG8gaGF2ZSB0aGVtIGV2ZW4gc3BsaXQgdG8gaW5kaXZp
ZHVhbCB0ZXN0czsKPgo+IGFwaS9kYnVzX3Rlc3RfY2FjaGVfbHZfY3JlYXRlLnNoCj4gYXBpL2Ri
dXNfdGVzdF9jb3B5X3NpZ25hdHVyZS5zaAo+IGFwaS9kYnVzX3Rlc3RfZXh0ZXJuYWxfZXZlbnQu
c2gKPiBhcGkvZGJ1c190ZXN0X2xvZ19maWxlX29wdGlvbi5zaAo+IGFwaS9kYnVzX3Rlc3Rfd2lw
ZWZzLnNoCj4gYXBpL2RidXNfdGVzdF96X3NpZ2ludC5zaAo+Cj4gdGhlc2UgbmVlZCB0byBiZSBm
aXhlZCBhbmQgcmVzb2x2ZWQuCj4KPiA+IGV4cGVjdGVkLWZhaWwgIHNoZWxsL2x2Y29udmVydC1y
ZXBhaXItdGhpbi5zaAo+Cj4KPgo+ID4gc3BhY2UtcmVxICAgICAgc2hlbGwvbHZjcmVhdGUtbGFy
Z2UtcmFpZC5zaAo+ID4gc3BhY2UtcmVxICAgICAgc2hlbGwvbHZjcmVhdGUtdGhpbi1saW1pdHMu
c2gKPiA+IGV4cGVjdGVkLWZhaWwgIHNoZWxsL2x2bS1jb25mLWVycm9yLnNoCj4gPiBleHBlY3Rl
ZC1mYWlsICBzaGVsbC9sdnJlc2l6ZS1mdWxsLnNoCj4gPiB0aW1lb3V0ICAgICAgICBzaGVsbC9w
dm1vdmUtYWJvcnQtYWxsLnNoCj4gPiBzcGFjZS1yZXEgICAgICBzaGVsbC9wdm1vdmUtYmFzaWMu
c2gKPiA+IGV4cGVjdGVkLWZhaWwgIHNoZWxsL3B2c2Nhbi1hdXRvYWN0aXZhdGlvbi1wb2xsaW5n
LnNoCj4gPiBleHBlY3RlZC1mYWlsICBzaGVsbC9zbmFwc2hvdC1tZXJnZS5zaAo+ID4gc3BhY2Ut
cmVxICAgICAgc2hlbGwvdGhpbi1sYXJnZS5zaAo+ID4gcmFjeSAgICAgICAgICAgc2hlbGwvd3Jp
dGVjYWNoZS1jYWNoZS1ibG9ja3NpemUuc2gKPgo+IFRoZXNlIGFyZSBpbmRpdmlkdWFsIC0gd2Ug
aGF2ZSBzb21lIG9mIHRob3NlIHRlc3Rpbmcgb24gc29tZSBtYWNoaW5lcy4KPiBUaGV5IG1heSBu
ZWVkIHNvbWUgJ2V4dHJhJyBjYXJlLgo+Cj4gPgo+ID4gZXhwZWN0ZWQtZmFpbCBmYWlscyBtb3N0
IGV2ZXJ5IHRpbWUuIHRpbWVvdXQgc2VlbXMgdG8gd29yayBzb21ldGltZXMsCj4gPiBzcGFjZS1y
ZXEgaSB0aGluayBpcyBqdXN0IHNwYWNlIHJlcXVpcmVtZW50IGlzc3VlIChpJ2xsIGp1c3Qgc2tp
cAo+ID4gdGhvc2UgdGVzdHMpLgo+ID4KPgo+IEknZCBsaWtlbHkgbmVlZCB0byBnZXQgYWNjZXNz
L3NlZSAgdG8gdGhlIGxvZ3Mgb2Ygc3VjaCBtYWNoaW5lcwo+IChvciB5b3Ugd291bGQgbmVlZCB0
byBwcm92aWRlIGFzIHNvbWUgZG93bmxvYWRhYmxlIGltYWdlIG9mIHlvdSBRZW11IG1hY2hpbmUK
PiBpbnN0YWxsYXRpb24pCj4KPgo+ID4gVGhlIGZ1bGwgb3V0cHV0IGZyb20gdGhlIHRlc3QgcnVu
IGNhbiBiZSBzZWVuIGF0IFszXSBpbiB0aGUKPiA+IHRlc3RzdWl0ZS1zdGRvdXQudHh0IGFuZCB0
ZXN0c3VpdGUtc3RkZXJyLnR4dCBmaWxlcy4KPiA+Cj4gPiBEbyBvdGhlcnMgcnVuIHRoaXMgdGVz
dC1zdWl0ZSBpbiBhdXRvbWF0aW9uIGFuZCBnZXQgcmVsaWFibGUgcmVzdWx0cyA/Cj4gPgo+Cj4g
V2Ugc3VyZWx5IGRvIHJ1biB0aGVzZSB0ZXN0cyBvbiByZWd1bGFyIGJhc2lzIG9uIFZNIC0gc28g
dGhvc2UgYXJlIHVzdWFsbHkKPiBzbGlnaHRseSBtb2RpZmllZCB0byBhdm9pZCBjb2xsaXNpb25z
IHdpdGggdGVzdHMuCj4gVGhlcmUgaXMgYWxzbyBubyBzdHJpY3QgcnVsZSB0byBub3QgYnJlYWsg
c29tZSAndGVzdHMnIC0gc28gb2NjYXNpb25hbGx5IHNvbWUKPiB0ZXN0cyBjYW4gYmUgZmFpbGlu
ZyBmb3IgYSB3aGlsZSBpZiB0aGV5IGFyZSBzZWVuICdsZXNzIGltcG9ydGFudCcgb3ZlciBzb21l
Cj4gb3RoZXIgYnVncy4uLgo+Cj4gV2Ugd291bGQgbmVlZCB0byB0aGluayBtdWNoIGhhcmRlciBp
ZiB0aGUgdGVzdCBzaG91bGQgYmUgcnVubmluZyB3aXRoIHNvbWUKPiBkYWVtb25zIG9yIGF1dG9h
Y3RpdmF0aW9uIG9uIHRoZSBzeXN0ZW0gdGhhdCBjb3VsZCBzZWUgYW5kIGNvdWxkIGludGVyYWN0
IHdpdGgKPiBvdXIgZGV2aWNlcyBnZW5lcmF0ZWQgZHVyaW5nIHRoZSB0ZXN0IHJ1biAob25lIG9m
IHRoZSByZWFzb25zIG1hY2hpbmUgZm9yCj4gdGVzdHMgbmVlZCBzb21lIGxvY2FsIG1vZGlmaWNh
dGlvbiAtIHdlIG1heSBwcm92aWRlIHNvbWUgQW5zaWJsZS1saWtlIHRlc3RpbmcKPiBzY3JpcHQg
ZXZlbnR1YWxseS4KPgo+IEJ1dCBhbnl3YXkgLSB0aGUgZWFzaWVzdCBpcyB0byBnaXZlIHVzIGFj
Y2VzcyB0byB5b3VyIHRlc3QgcmVzdWx0cyBzbyB3ZSBjb3VsZAo+IHNlZSB3aGV0aGVyIHRoZXJl
IGlzIHNvbWV0aGluZyB3cm9uZyB3aXRoIG91ciB0ZXN0IGVudmlyb25tZW50LCAgbHZtMiBidWcs
IG9yCj4gc3lzdGVtIHNldHVwIC0gaXQncyBub3QgYWx3YXlzIHRyaXZpYWwgdG8gZ3Vlc3MuLi4K
Pgo+Cj4gUmVnYXJkcwo+Cj4gWmRlbmVrCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVk
aGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9X
VE8vCg==

