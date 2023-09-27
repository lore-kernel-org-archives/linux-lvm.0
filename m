Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409D4E82CA5
	for <linux-lvm@archiver.kernel.org>; Wed, 27 Sep 2023 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695829863;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UyDpqmkdGGy4iJ/OVc0IhM+HKkWY1XYKgTn77GbBM+M=;
	b=IHXfmuhPSKzxg0etXoUB5rmLX4A7V05I7B6wAWiSk1umjygvVe9QO7Jyznh5socHI0ldhH
	OJ+jOpD/ajnK4zt6AjOtlv1fiLgRQxUUONwIyVOxcvY9lKXHxlECpltf4ShDmJZwcsql30
	4gpg3ziKwfCU8dRx1yo1iCMxjNckn6U=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-ahS3TySiPhCV1nfLWwZULw-1; Wed, 27 Sep 2023 11:50:59 -0400
X-MC-Unique: ahS3TySiPhCV1nfLWwZULw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 501D13C40C10;
	Wed, 27 Sep 2023 15:50:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BA0D401027;
	Wed, 27 Sep 2023 15:50:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 92E3C1946589;
	Wed, 27 Sep 2023 15:50:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0D7C31946587
 for <linux-lvm@listman.corp.redhat.com>; Wed, 27 Sep 2023 15:41:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E2F562026D4B; Wed, 27 Sep 2023 15:41:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB59F2026D33
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 15:41:03 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CDE6811E88
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 15:41:03 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-GqEj7BTcN_6dCxiwG1S-fA-1; Wed, 27 Sep 2023 11:41:01 -0400
X-MC-Unique: GqEj7BTcN_6dCxiwG1S-fA-1
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2c135cf2459so174432471fa.0
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 08:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695829259; x=1696434059;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EDiy9BORM5YVNUi0UReWakv2Yq4gaAtWo0IIvmeZyt4=;
 b=OBHfo/itYsp/1epX5rXwyEz1nDu540zIaDVGAoJVYBgnN5NkprGJYG28a2HwMDmP91
 LBSgQW8XlPpM63uNm6DJG4ObwPFS/KbqTiRnFCPWvZ2wGBTY9XozejE4KxEbkhpCVjyv
 vgE+96exYIyGQionEEcHCdAUwUrMJtW19QtbvD+i8oKkRpPMNNVFGdrC27bW3aSynv3l
 eh5+D6+sHPL+fQs1wrIDr70M2Lk5EVtXaQ069ZMhb21v6kK99+Gn0rH2Y8LFxjq2B1pi
 FX7aodiAhiORgRJJkSjgjwN1eJeo91Skp6WFsRTXL6F/dlAplraLWETmvq2OIFdSOoMG
 COzQ==
X-Gm-Message-State: AOJu0YyI5R9hv52c2CoRRdu+DsT0Ay0eOi25SRV4bfi84DadD8pRvYa9
 UBeYzf6xojmwfBj43+bYiIEmWgf+gl1yMg==
X-Google-Smtp-Source: AGHT+IFFooK138MHEdgILOQvCql+j4TYSIo6gQJIdCKo4FiScbS0bJWr7As7H8kW1dP9Bjl9WdSFeA==
X-Received: by 2002:a2e:808f:0:b0:2c0:d21:39de with SMTP id
 i15-20020a2e808f000000b002c00d2139demr2532120ljg.42.1695829259209; 
 Wed, 27 Sep 2023 08:40:59 -0700 (PDT)
Received: from [10.43.17.103] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a170906970f00b0098733a40bb7sm9482065ejx.155.2023.09.27.08.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 08:40:58 -0700 (PDT)
Message-ID: <b7754a3e-ed6f-4f7e-afea-ed24426d7dd5@gmail.com>
Date: Wed, 27 Sep 2023 17:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jean-Marc Saffroy <saffroy+redhat@gmail.com>
References: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
 <6e0faedf-f450-4454-a86b-6448a1b4747b@gmail.com>
 <CAM5YWZfL8zf9=re+VU2MiAQcYvXodqDV-08Zu5RkKUMfkDJ7Tg@mail.gmail.com>
 <90d9a21d-f748-4ca1-b327-6c38f4440298@gmail.com>
 <CAM5YWZfbEhSJo_01SXRuxSwRPOWYexxDVm9-3W_+=rP+icHStQ@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAM5YWZfbEhSJo_01SXRuxSwRPOWYexxDVm9-3W_+=rP+icHStQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, cs
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDI3LiAwOS4gMjMgdiAxNTo0NSBKZWFuLU1hcmMgU2FmZnJveSBuYXBzYWwoYSk6Cj4gT24g
V2VkLCBTZXAgMjcsIDIwMjMgYXQgMTE6NTjigK9BTSBaZGVuZWsgS2FiZWxhYwo+IDx6ZGVuZWsu
a2FiZWxhY0BnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBEbmUgMjcuIDA5LiAyMyB2IDE6MTAgSmVh
bi1NYXJjIFNhZmZyb3kgbmFwc2FsKGEpOgo+Pj4gSGksCj4+Pgo+Pj4gT24gVHVlLCBTZXAgMjYs
IDIwMjMgYXQgMTA6MDDigK9QTSBaZGVuZWsgS2FiZWxhYwo+Pj4gPHpkZW5lay5rYWJlbGFjQGdt
YWlsLmNvbT4gd3JvdGU6Cj4+Pj4gWWVwIHR5cGljYWwgdXNhZ2UgaXMgdG8gZW5jcnlwdCB1bmRl
cmx5aW5nIFBWIC0gYW5kIHRoZW4gY3JlYXRlIExWcyBhbmQgaXRzCj4+Pj4gc25hcHNob3RzIG9u
IGVuY3J5cHRlZCBkZXZpY2UuCj4+Pgo+Pj4gU3VyZSwgSSdkIGRvIHRoYXQgaW4gb3RoZXIgY2ly
Y3Vtc3RhbmNlcy4KPj4+Cj4+PiBCdXQgaW4gbXkgY2FzZSBpdCB3b3VsZCBqdXN0IGJlIGEgd2Fz
dGU6IEkgYW0gcmVwbGFjaW5nIHNldmVyYWwgZGlza3MKPj4+IG9uIGEgZGVza3RvcCBjb21wdXRl
ciB3aXRoIGEgc2luZ2xlIDJUQiBOVk1FIFNTRCBmb3IgZXZlcnl0aGluZy4gT25seQo+Pj4gL2hv
bWUgbmVlZHMgdG8gYmUgZW5jcnlwdGVkLCBhbmQgaXQncyB0aW55LCBsaWtlIDEwMC0yMDBHQi4g
R29pbmcKPj4+IHRocm91Z2ggZW5jcnlwdGlvbiBmb3IgbW9zdCBhcHBsaWNhdGlvbiBJL09zIHdv
dWxkIHVzZSBDUFUgdGltZSBhbmQKPj4+IGluY3JlYXNlIGxhdGVuY3kgd2l0aCBubyBiZW5lZml0
Lgo+Pj4KPj4+IFNvIEkgcHJlZmVyIHRvIG1hbmFnZSBhdmFpbGFibGUgcmF3ICh1bi1lbmNyeXB0
ZWQpIHNwYWNlIHdpdGggTFZNLgo+Pj4KPj4+IE5vdywgSSBhbHNvIG5lZWQgdG8gZG8gYmFja3Vw
cyBvZiAvaG9tZSwgYW5kIHRoYXQncyB3aHkgSSB3YW50Cj4+PiBzbmFwc2hvdHMuIEJ1dCB0aGF0
IGZpcnN0IGxheWVyIG9mIExWTSB3b3VsZCBvbmx5IHNob3cgYSBzbmFwc2hvdCBvZgo+Pj4gYW4g
ZW5jcnlwdGVkIHZvbHVtZSwgYW5kIHRoZSBiYWNrdXAgam9iIHNob3VsZG4ndCBoYXZlIHRoZSBw
YXNzcGhyYXNlCj4+PiB0byBkZWNyeXB0IHRoZSB2b2x1bWUuCj4+Pgo+Pj4gV2hpY2ggaXMgd2h5
IEknbSB0cnlpbmcgdG8gZmluZCBhIHdheSBvZiBkb2luZyBzbmFwaG90cyBvZiBhbiAib3BlbmVk
Igo+Pj4gTFVLUyB2b2x1bWU6IHRoaXMgd2F5LCB0aGUgYmFja3VwIGpvYiBjYW4gZG8gaXRzIGpv
YiB3aXRob3V0IHJlcXVpcmluZwo+Pj4gYSBwYXNzcGhyYXNlLgo+Pgo+PiB3ZWxsIHRoYXQncyB3
aGVyZSB5b3Ugd2lsbCBjb25zaWRlcmFibHkgJ2NvbXBsaWNhdGUnIHlvdXIgbGlmZSA6KQo+PiBB
cyB5b3Ugd291bGQgbmVlZCB0byAnb3JjaGVzdHJhY2UnIHRoaXMgeW91cnNlbGYgd2l0aCAnZG1z
ZXR1cCcgdXNhZ2UuCj4gCj4gSWYgeW91IG1lYW4gdGhhdCBJJ2QgaGF2ZSB0byBzY3JpcHQgYSBm
ZXcgdGhpbmdzLCB0aGVuIEkgYW0gcGVyZmVjdGx5Cj4gZmluZSB3aXRoIHRoYXQuCj4gCj4+IHJ1
bm5pbmcgJ2Rtc2V0dXAgc3VzcGVuZCcgb24geW91ciBob21lIGRldmljZSwKPj4gdGhhdCB0YWtp
bmcgYSBzbmFwc2hvdCBvZiB5b3VyIHVuZGVybHlpbmcgIExWLgo+IAo+IFdoYXQgaXMgdGhlIHJv
bGUgb2YgImRtc2V0dXAgc3VzcGVuZCI/IEkgYW0gaGF2aW5nIHRyb3VibGUgZmluZGluZwo+IGRl
Y2VudCBkb2N1bWVudGF0aW9uIGFib3V0IGl0cyBwdXJwb3NlIGFuZCBob3cgaXQncyByZWxhdGVk
IHRvCj4gc25hcHNob3RzLiBJIGRpZCBub3QgbmVlZCBpdCBpbiBteSBleHBlcmltZW50cywgc28g
SSBhbSBjdXJpb3VzLgo+IAoKClN1c3BlbmQgaXMgZnJlZXppbmcgZGV2aWNlJ3MgaS9vIHF1ZXVl
ICAodG9nZXRoZXIgd2l0aCBmcmVlemluZyBGUyBsYXllciAtIHNvIAp0aGUgc25hcHNob3Qgc2hv
dWxkIGJlIGVhc2lseSBtb3VudGFibGUgd2l0aG91dCByZXF1aXJpbmcgZXh0ZW5zaXZlIGZzY2sg
Cm9wZXJhdGlvbiBhcyBpdCB3b3VsZCBiZSBtaXNzaW5nIHNvbWUgaW1wb3J0YW50IG1ldGFkYXRh
IHRvIGJlIHdyaXR0ZW4gb24gZGlzaykKU28gdGhlIGdvYWwgb2YgYSBzdXNwZW5kIGlzIHRvIHRh
a2UgYSAnZ29vZCBwb2ludCBpbiB0aW1lJyB3aGVyZSB0aGUgY29udGVudCAKb2Ygc25hcHNob3Qg
aXMgaGF2aW5nIGFsbCAnY29tbWl0dGVkJyB0cmFuc2FjdGlvbiBvbiBkaXNrIGluIHZhbGlkIHN0
YXRlLgoKQ2xlYXJseSB0aGF0IG5lZWRzIGEgJ3RvcC1sZXZlbCBkZXZpY2UgLSB3aGljaCB3b3Vs
ZCBiZSBhIGNyeXB0byBETSBpbiB5b3VyIApjYXNlIC0gYW5kIGdvZXMgdmlhICd0cmVlJyBkb3du
IHRvIFBWIGxldmVsLgoKQ2xlYXJseSBsdm0yIGRvZXMgdGhpcyB3aGlsZSB0YWtpbmcgc25hcHNo
b3QgIC0gYW5kIHlvdSBjYW4gZWFzaWx5IG9ic2VydmUgCnRoYXQgJ21hZ2ljJyBpZiB5b3UgcmVh
ZCBjYXJlZnVsbHkgIC12dnZ2ICB0cmFjZSBvZiBhIGNvbW1hbmQuCgpUaGVuIHlvdXIgc2NyaXB0
IG5lZWRzIHRvIHJlcGxpY2F0ZSB0aGlzIGF0IHNjcmlwdCBsZXZlbC4KRnVuIHdvdWxkIGJlZ2lu
IG9uY2UgeW91IHdvdWxkIHN0YXJ0IHRvIHJlc29sdmUgYWxsIHRoZSBwb3NzaWJsZSBlcnJvciBw
YXRocy4uLgoKCj4gSWYgSSB3ZXJlIG9rYXkgd2l0aCBnaXZpbmcgdGhlIHBhc3NwaHJhc2UgdG8g
bXkgYmFja3VwIHNjcmlwdCwgdGhlbiBJCj4gY291bGQgc2ltcGx5IGhhdmUgdGhlIGJhY2t1cCBz
Y3JpcHQgY3JlYXRlIGl0cyBzbmFwc2hvdCBmcm9tIHRoZQo+IGVuY3J5cHRlZCBMViwgYW5kIEkg
d291bGRuJ3QgaGF2ZSBzdGFydGVkIHRoaXMgdGhyZWFkIGluIHRoaXMgY2FzZS4KPiA6LSkKCk1h
eWJlIHlvdSBjb3VsZCBkcm9wIHlvdXIgd2hvbGUgZGlzayBlbmNyeXB0aW9uIGlkZWEgdGhlbiBh
bmQganVzdCB1c2Ugc29tZSAKZW5jcnlwdGVkIHRhcmJhbGxzIC0gc2luY2UgaWYgeW91IHRlbmQg
dG8gcGxhY2UgcGFzc3dvcmRzIGludG8gc2NyaXB0cyAtIGl0J3MgCmtpbmQgb2YgYmlnIHNlY3Vy
aXR5IGhvbGUuLi4uCgpJZiBhbGwgeW91IHdhbnQgdG8gaGF2ZSBpcyBlbmNyeXB0ZWQgZmlsZXMg
b24gZGlzayAtIHRoZXJlIGFyZSBwcm9iYWJseSBtb3JlIAplYXNpZXIgYXBwcm9hY2hlcyB3aXRo
IHRoZSB1c2Ugb2YgZW5jcnlwdGVkIGZpbGVzeXN0ZW1zLi4uCgo+PiBCdXQgdGhlIGxldmVsIG9m
IGNvbXBsZXhpdHkgaGVyZSBpcyByYXRoZXIgIGhpZ2ggLSB0aGlzIGl0IG1pZ2h0IGJlIGFjdHVh
bGx5Cj4+IHdheSBlYXNpZXIgdG8ganVzdCAncGFydGl0aW9uJyB5b3VyIGRldmljZSBmb3IgICdl
bmNyeXB0ZWQnICBhbmQgdW5lY3J5cHRlZCcKPj4gcGFydHMgYW5kIHVzZSAyIFBWcyBmb3IgMiBW
R3MuLi4uCj4gCj4gQnV0IHRoZW4gSSBjYW4ndCByZXNpemUgdGhlIGVuY3J5cHRlZCB2b2x1bWUv
cGFydGl0aW9uLgoKTm90IHN1cmUgaG93IG9mdGVuIGRvIHlvdSBuZWVkIHRvIGRvIHRoYXQgLSBz
dXJlbHkgYSAnc3BsaXQnIGJldHdlZW4gdGhvc2UgMiAKcGFydGl0aW9ucyBpcyBhIGRlY2lzaXZl
IHBvaW50Li4uCgpCdXQgdGhlbiB3aGF0ZXZlciB5b3UgZG8gd2l0aGluIHRob3NlIFZHIGlzIGZ1
bGx5IHJlc2l6YWJsZSBhcyBiZWZvcmUuCgoKPiBJdCBzZWVtcyBMVk0gY2Fubm90IGRvIGl0IGRp
cmVjdGx5LCBidXQgaXQgYmVjb21lcyBwb3NzaWJsZSAoYXQgbGVhc3QKPiBpbiBteSBzaW1wbGUg
dGVzdHMpIGlmIEkgdXNlIGEgYnVuY2ggb2YgZG1zZXR1cCBjb21tYW5kcywgb3IgaWYgSSB1c2UK
PiB0aGUgZGVjcnlwdGVkIGRldmljZSBhcyB0aGUgUFYgZm9yIGEgbmV3IFZHLgo+IAo+IEJ1dCBJ
IGRvbid0IGtub3cgaWYgdGhlc2UgYXBwcm9hY2hlcyBhcmUgc2FmZSB0byB1c2UsIGFuZCB0aGF0
IGlzIHdoYXQKPiBkcm92ZSBtZSBoZXJlLgo+IAo+IEluIHRoZSBtZWFuIHRpbWUsIEkgZm91bmQg
dGhpcyBwYWdlOgo+IGh0dHBzOi8vYWNjZXNzLnJlZGhhdC5jb20vYXJ0aWNsZXMvMjEwNjUyMQo+
IAo+IEFwcGFyZW50bHksIExWTSBvbiBMVUtTIG9uIExWTSB3b3VsZCBiZSBjYXNlIG9mICJMVk0g
cmVjdXJzaW9uIiwgYW5kCj4gc28gbm90IGVudGlyZWx5IHVuaGVhcmQgb2YuCj4gCj4gRG9lcyBh
bnlvbmUgaGVyZSBoYXZlIGV4cGVyaWVuY2Ugd2l0aCAiTFZNIHJlY3Vyc2lvbiI/Cgpsdm0yIGRv
ZXMgbm90IGFkdmljZSB0byB1c2UgJ3N0YWNraW5nJyAgLSBpdCdzIHZlcnkgY29tcGxpY2F0ZWQg
YW5kIGluIHNvbWUgCndheSBpbmVmZmljaWVudCAtIGl0J3MgYWx3YXlzIHRydWUgdGhlIGxlc3Mg
bGF5ZXJzIC0+IHRoZSBiZXR0ZXIgdGhlIApwZXJmb3JtYW5jZSB3aWxsIGJlIChlc3BlY2lhbGx5
IHRydWUgd2l0aCBtb2Rlcm4gTlZNZSBkZXZpY2VzLi4uKQoKQW5kIGx2bTIgaXRzZWxmIGRvZXMg
Tk9UIHN1cHBvcnQvY291bnQgd2l0aCByZWN1cnNpb24gLSBzbyB3aGlsZSBpdCBtYXkgYXBwZWFy
IAp0byBiZSB3b3JraW5nIC0gdGhlcmUgd2lsbCBiZSBjb3JuZXIgY2FzZXMgd2l0aCB1bnJlc29s
dmFibGUgcHJvYmxlbXMgLSAKYWx0aG91Z2ggdGhpcyBpcyBtb3N0bHkgYW4gaXNzdWUgaWYgeW91
IGFyZSBydW5uaW5nIHlvdXIgc3lzdGVtIGZyb20gc3VjaCAKJ3N0YWNrZWQnIHNvbHV0aW9uIChj
YXVzaW5nIGRlYWRsb2Nrcy4uLikKCkFueXdheSAtIHBsYWNpbmcgVkcgb24gdG9wIG9mIGFub3Ro
ZXIgVkcgaXMgYWx3YXlzIGdvb2QgdG8gYXZvaWQgYW5kIHVzZSBvbmx5IAphcyBhIGxhc3QgcmVz
b3VyY2UgaWYgdGhlcmUgaXMgbm8gYmV0dGVyIGFwcHJvYWNoIGV4aXN0aW5nLgoKUmVnYXJkcwoK
WmRlbmVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1h
bi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ct
VE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

