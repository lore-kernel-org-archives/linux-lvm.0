Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7B2C77B6E
	for <linux-lvm@archiver.kernel.org>; Wed, 12 Apr 2023 10:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681294855;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Pov66bEuCkLsEm2VAak2RUyQzDKMfWmB53QgTFjrhwg=;
	b=X2UwSYOEahnr2hPHTkhjP2nZ6ybotyxIAPbRVzMKcGKhGiaLgrOZ9gxc8dISLCALvI4X/W
	5TAy4CEUpyKwoiA64ttD3M+PYcmf+OaqGttM0sktaK3f+nm+B/Dn9w0MaGuP45gZBzJ7iO
	2buh9pnnQDO+rZpRSCUw8U8J3EKMOQA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-MIJY7NPxMViSEu_s1zEppA-1; Wed, 12 Apr 2023 06:20:51 -0400
X-MC-Unique: MIJY7NPxMViSEu_s1zEppA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35D75380606E;
	Wed, 12 Apr 2023 10:20:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 870B5FD6E;
	Wed, 12 Apr 2023 10:20:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 55CD319465A4;
	Wed, 12 Apr 2023 10:20:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 24585194658F
 for <linux-lvm@listman.corp.redhat.com>; Wed, 12 Apr 2023 10:20:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CC3C3112132E; Wed, 12 Apr 2023 10:20:37 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C537F112132D
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 10:20:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A66551C05EAB
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 10:20:37 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-dEc_ZdBOPj-vWpb0_qeyDw-1; Wed, 12 Apr 2023 06:20:36 -0400
X-MC-Unique: dEc_ZdBOPj-vWpb0_qeyDw-1
Received: by mail-ej1-f50.google.com with SMTP id qa44so27163494ejc.4
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 03:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681294835; x=1683886835;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Yo5zYPzMzULmk2qoMAxk6aD+sZ7w2dzbZEzqVkRAxI=;
 b=58hc2SNPbopw71T62qRa9NQAkIXc6k6bttm3Pq8iaS1bWeZ+tj5/bRgC0aQx42nmtI
 EK3YW9gX0eu+Bi7SjB/NmXBg5sU2VENXdWhkhWe+CbUKkUTamm/jHVO4PUl1fXRlI8LG
 bPstVIjwblS7+g0fDp8nBrRlzaItYaB3szB27qVhnBifgEglHZojxS8f7zqBModYM5IP
 /qOHBUnDQlRUa/i2UAkO+4ixa33rUyZDQHMhRjRXSMgafwUnwQANb5Mpi/koxG/WMYa5
 TDs+fnw47UzcySzaLF+teD1F3GLlL1Soz+B3xbDVg0Hyi5mCPNtmbosi9hkmcRNBcvrE
 565Q==
X-Gm-Message-State: AAQBX9ct1DQn6cssx3lgNjq3DcEvPTcnZ2xwtYpArVH8Nqmu08d7pP5u
 GzncBLJUJc3uVuX+vnWdsgx4C7dS5YqQq9v2
X-Google-Smtp-Source: AKy350aNFPTkUYDHg7v7w26Xvb9L0bxl2Ju+RpobE4sVqmDwfe/6gOu/4YDh4qJArKT2iLelo9Bcgg==
X-Received: by 2002:a17:906:848c:b0:94c:b07e:47b5 with SMTP id
 m12-20020a170906848c00b0094cb07e47b5mr6790838ejx.60.1681294834483; 
 Wed, 12 Apr 2023 03:20:34 -0700 (PDT)
Received: from [192.168.0.177] ([94.142.239.37])
 by smtp.gmail.com with ESMTPSA id
 vo14-20020a170907a80e00b00947cac48916sm7080653ejc.8.2023.04.12.03.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:20:34 -0700 (PDT)
Message-ID: <563d6e1e-e752-12df-4073-70c9b45c1879@gmail.com>
Date: Wed, 12 Apr 2023 12:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Roland <devzero@web.de>, Roger Heflin <rogerheflin@gmail.com>
References: <4649980a-7af2-5b2e-47de-ce88ccb8ac6f@web.de>
 <CAAMCDefZC-J7Nc0H45e_EmqkRDr8ZjpOn-JvNWyBzExh8TaCsg@mail.gmail.com>
 <845e5b45-42d5-3d7f-bdad-a66ce7a2e5a9@web.de>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <845e5b45-42d5-3d7f-bdad-a66ce7a2e5a9@web.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [linux-lvm] bug? shrink lv by specifying pv extent to be
 removed does not behave as expected
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDA5LiAwNC4gMjMgdiAyMDoyMSBSb2xhbmQgbmFwc2FsKGEpOgo+PiBXZWxsLCBpZiB0aGUg
TFYgaXMgYmVpbmcgdXNlZCBmb3IgYW55dGhpbmcgcmVhbCwgdGhlbiBJIGRvbid0IGtub3cgb2YK
Pj4gYW55dGhpbmcgd2hlcmUgeW91IGNvdWxkIHJlbW92ZSBhIGJsb2NrIGluIHRoZSBtaWRkbGUg
YW5kIHN0aWxsIGhhdmUgYQo+PiB3b3JraW5nIGZzLsKgwqAgWW91IGNhbiBvbmx5IHJlZHVjZSBm
cydlcyAodGhlIG9uZXMgdGhhdCB5b3UgY2FuIHJlZHVjZSkKPiAKPiBteSBwbGFuIGlzIHRvIHNj
YW4gYSBkaXNrIGZvciB1c2FibGUgc2VjdG9ycyBhbmQgbWFwIHRoZSBsb2dpY2FsIHZvbHVtZQo+
IGFyb3VuZCB0aGUgYnJva2VuIHNlY3RvcnMuCj4gCj4gd2hlbmV2ZXIgbW9yZSBzZWN0b3JzIGdl
dCBicm9rZW4sIGknZCBsaWtlIHRvIHJlbW92ZSB0aGUgYnJva2VuIG9uZXMgdG8gaGF2ZQo+IGEg
dXNhYmxlIGx2IHdpdGhvdXQgYnJva2VuIHNlY3RvcnMuCj4KClJlYWxsIHNpbGx5IHBsYW4gIC0g
YmVlbiB0aGVyZSB5ZWFycyBiYWNrIGluIHRpbWUgd2hlbiBkcml2ZXMgd2VyZSBGQVIgbW9yZSAK
ZXhwZW5zaXZlIHdpdGggdGhlIHByaWNlIHBlciBHaUIuCgpUb2RheXMgLSBqdXN0IHRocm93IGJh
ZCBkcml2ZSB0byByZWN5Y2xlIGJpbiAtIGl0J3Mgbm90IHdvcnRoIHRvIGRvIHRoaXMgCnNpbGxp
bmVzcy4KCkhERCBiYWQgc2VjdG9ycyBhcmUgc3ByZWFkaW5nIC0gYW5kIHNsb3dseSB0aGUgc3Vy
ZmFjZSBnZXRzIGRlc3Ryb3llZC4uLi4KClNvIGlmIHlvdSBtYWtlIGxhcmdlICdoZWFkLXJvb20n
IGFyb3VuZCBiYWQgZGlzayBhcmVhcyAtIGlmIHRoZXkgYXJlIApjb25jZW50cmF0ZWQgb24gc29t
ZSBkaXNrIGFyZWEgLSBhbmQgeW91IGtub3cgdG9wb2xvZ3kgb2YgeW91IGRpc2sgZHJpdmUKbGlr
ZSBpLmUuIDElIGZyZWUgZGlzayBzcGFjZSBiZWZvcmUgYW5kIGFmdGVyIGJhZCBhcmVhIC0geW91
IGNvdWxkIHBvc3NpYmx5IAp1c2UgZGlzayBmb3IgYSBsaXR0bGUgd2hpbGUgbW9yZSAtIGJ1dCBv
bmx5IHRvIHN0b3JlIGludmFsdWFibGUgZGF0YS4uLi4KCgo+IHNpbmNlIHlvdSBuZWVkIHRvIHJl
YnVpbGQgeW91ciBkYXRhIGFueXdheSBmb3IgdGhhdCBkaXNrLCB5b3UgY2FuIGFsc28KPiByZWNy
ZWF0ZSB0aGUgd2hvbGUgbG9naWNhbCB2b2x1bWUuCj4gCj4gbXkgcXVlc3Rpb24gYW5kIG15IHBy
b2plY3QgaXMgYSBsaXR0bGUgYml0IGFjYWRlbWljLiBpJ2Qgc2ltcGx5IHdhbnQgdG8gdHJ5Cj4g
b3V0IGhvdyBtdWNoIHVzZSB5b3UgY2FuIGhhdmUgZnJvbSBzb21lIGRlYWQgZGlza3Mgd2hpY2gg
YXJlIHRyYXNoIG90aGVyd2lzZS4uLgoKWW91IGNvdWxkIGFsd2F5cyB0YWtlICAndmdjZmdiYWNr
dXAnICBvZiBsdm0yIG1ldGFkYXRhIGFuZCBtYWtlIHNvbWUgY3JhenkgCnRyYW5zaXRpb24gb2Yg
aWYgd2l0aCBldmVuICBBV0svcHl0aG9uL3BlcmwgICAtICBidXQgd2UgcmVhbGx5IHRlbmQgdG8g
c3VwcG9ydApqdXN0IHNvbWUgdXNlZnVsIGZlYXR1cmVzIC0gYXMgdGhlcmUgaXMgYWxyZWFkeSAg
J3RvbyBtdWNoJyBhbmQgdXNlcnMgYXJlIApnZXR0aW5nIG9mdGVuIGxvc3QuCgpPbmUgdmVyeSBz
aW1wbHkgJiBuYWl2ZSBpbXBsZW1lbnRhdGlvbiBjb3VsZCBiZSBnb2luZyBhbG9uZ2UgdGhpcyBw
YXRoIC0KCndoZW5ldmVyIHlvdSB3YW50IHRvIGNyZWF0ZSBuZXcgYXJyYW5nZW1lbnQgZm9yIHlv
dSBkaXNrIHdpdGggJ2JhZCcgYXJlYXMsCnlvdSBjYW4gYWx3YXlzIHN0YXJ0IGZyb20gJ3NjcmF0
Y2gnIC0gc2luY2UgYWZ0ZXJhbGwgLSBsdm0yIE9OTFkgbWFuaXB1bGF0ZXMgCndpdGggbWV0YWRh
dGEgd2l0aGluIGRpc2sgZnJvbnQgLSBzbyBpZiB5b3UgbmVlZCB0byBjcmVhdGUgbmV3ICdob2xl
cycsCmp1c3QgICAncHZjcmVhdGUgLWYnLCB2Z2NyZWF0ZSwgICBhbmQgJ2x2Y3JlYXRlIC1abiAt
V24nCmFuZCB0aGVuICAnbHZleHRlbmQnICB3aXRoIG5vcm1hbCAgb3IgICdsdmV4dGVuZCAtLXR5
cGUgZXJyb3IgfCAtLXR5cGUgemVybycgCnNlZ21lbnQgdHlwZXMgYXJvdW5kIGJhZCBhcmVhcyB3
aXRoIHNwZWNpZmljIHNpemUuCk9uY2UgeW91IGFyZSBmaW5pc2hlZCBhbmQgeW91ciBMViBwcmVj
aXNlbHkgbWF0Y2hlcyB5b3VyICdwcmV2aW91cycgIExWIG9mIHlvdSAKcGFzdCBWRyAtIHlvdSBj
YW4gc3RhcnQgdG8gdXNlIHRoaXMgTFYgYWdhaW4gd2l0aCBuZXcgYXJyYW5nZW1lbnQgb2YgICdi
cm9rZW4gCnplcm9lZC9lcnJvcmVkJyBhcmVhcy4KCkkndmUgc29tZSBzZXJpb3VzIGRvdWJ0cyBh
Ym91dCB1c2FiaWxpdHkgb2YgdGhpcyB3aXRoIGFueSBmaWxlc3lzdGVtIDopIGJ1dCBpZiAKeW91
IHRoaW5rIHRoaXMgaGFzIHNvbWUgYWRkZWQgdmFsdWUgLSBmZWxsIGZyZWUgdG8gdXNlLgpJZiB0
aGUgZHJpdmUgeW91IHBsYXkgd2l0aCB3b3VsZCBiZSAnZGlzY2FyZGFibGUnIChTU0QvTlZNZSkg
dGhlbiBvbmUgbXVzdCAKdGFrZSBleHRyYSBjYXJlIHRoZXJlIGlzIG5vICdkaXNjYXJkL1RSSU0n
IGFueXdoZXJlIGluIHRoZSBwcm9jZXNzIC0gYXMgdGhhdCAKd291bGQgbG9zZSBhbGwgZGF0YSBp
cnJlY292ZXJhYmx5Li4uLgoKQnV0IGdvb2QgYWR2aWNlIGZyb20gbWUgLSB3aGVuZXZlciAgJ3Nt
YXJ0Y3RsJyBzdGFydHMgdG8gc2hvdyByZWxvY2F0aW9uIGJsb2NrIAplcnJvcnMgLSBpdCdzIHRo
ZSByaWdodCBtb21lbnQgdG8gICdkZF9yZXNjdWUnIGFueSBMViB0byB5b3VyIG5ldyBkcml2ZS4u
Lgo+IAo+IHllcywgcHZtb3ZlIGlzIHRoZSBvdGhlciBhcHByb2FjaCBmb3IgdGhhdC4KPiAKPiBi
dXQgd2lsbCBwdm1vdmUgY29udGludWUvZmluaXNoIGJ5IGFsbCBtZWFucyB3aGVuIG1vdmluZyBl
eHRlbnRzIGxvY2F0ZWQgb24gYQo+IGJhZCBzZWN0b3IgPwoKcHZtb3ZlICBDQU5OT1QgYmUgdXNl
ZCB3aXRoIGJhZCBkcml2ZXMgLSBpdCBjYW5ub3QgZGVhbCB3aXRoIGVycm9yaW5nIHNlY3RvcnMg
CmFuZCBiYXNpY2FsbHkgZ2V0cyBzdHVjayB0aGVyZSB0cnlpbmcgdG8gbWlycm9yIHVucmVjb3Zl
cmFibGUgZGlzayBhcmVhcy4uLgoKUmVnYXJkcwoKWmRlbmVrCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGlu
dXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9X
VE8vTFZNLUhPV1RPLwo=

