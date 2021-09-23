Return-Path: <SRS0=iYY7=ON=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB01C433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 23 Sep 2021 13:49:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B6461090
	for <linux-lvm@archiver.kernel.org>; Thu, 23 Sep 2021 13:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79B6461090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-veIojps4MK6Qr9fJV-LyKQ-1; Thu, 23 Sep 2021 09:49:46 -0400
X-MC-Unique: veIojps4MK6Qr9fJV-LyKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D34B10168C6;
	Thu, 23 Sep 2021 13:49:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 406FA60BF4;
	Thu, 23 Sep 2021 13:49:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5CAE180598A;
	Thu, 23 Sep 2021 13:49:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18NDnLx3022607 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 23 Sep 2021 09:49:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 62EB720A897F; Thu, 23 Sep 2021 13:49:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AED320A0555
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2021 13:49:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99801106655E
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2021 13:49:14 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-14-9cL0fQihPQq9QsRymWP1Hg-1; Thu, 23 Sep 2021 09:49:12 -0400
X-MC-Unique: 9cL0fQihPQq9QsRymWP1Hg-1
Received: by mail-wr1-f52.google.com with SMTP id u18so17435756wrg.5
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2021 06:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:from:in-reply-to
	:content-transfer-encoding;
	bh=TUSPpj6Gmdvqkf3XTBiSYcdGxKOjE2GqjckvNuaxtLI=;
	b=vjosWLbyz1YwWs9VWjBShf4naCndE/TrCDOTwkesHyfgcIQMKLQFOwc94bl4lzilfZ
	Tc+pxCYgUnOL6v/TaWoxF93FCCMzf2HfpzpclHENc6yICaBVfVFG4jjJjqb0s3rLjyZx
	GNZhUiHxfRnfSIO4ggAqq++9E1xW9gEIi6eZv9jZGOlf+ZMYXYWaEC9t7DTjN+GC8Ipe
	CP9ykLyqW1yuxMeBFh+6BzmXnJNngtgYc2gxz8dJ3FGFwYdYRyF6Vqjw9FgrFeopfhFh
	S4IY1LBwj7Tc+UQTZ6Hl2qa45wS5cpT/PG1DHq3B9Oz0PptCt+lQJHDm/ts9LJjhncfD
	3E1w==
X-Gm-Message-State: AOAM530A2y+yIK4CgWqAWgJh2FslKfbP1nDAHpcZ2AoM3oSy/Qcu44z2
	+y3dSX2GUmHFzAWWW/b/uAXmUDOZ8tSSpg==
X-Google-Smtp-Source: ABdhPJym7xYGLYjsJwqnYaKZ9xyR/HqvWEOOsQ3pfNMGYWFKj3e7u91UePPFf2n9nwdOUgx4SLoj8Q==
X-Received: by 2002:adf:e546:: with SMTP id z6mr5293830wrm.346.1632404950905; 
	Thu, 23 Sep 2021 06:49:10 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id b7sm6934127wrm.9.2021.09.23.06.49.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 23 Sep 2021 06:49:10 -0700 (PDT)
Message-ID: <6be34e20-b344-d2ec-a62a-9090bf102635@gmail.com>
Date: Thu, 23 Sep 2021 15:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.1.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
	=?UTF-8?Q?Arkadiusz_Mi=c5=9bkiewicz?= <arekm@maven.pl>
References: <fd7cf93d-4f51-28a9-d7a8-dd61fd59268b@maven.pl>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <fd7cf93d-4f51-28a9-d7a8-dd61fd59268b@maven.pl>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] vgchange -a n --sysinit hangs without udevd
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDIyLiAwOS4gMjEgdiA5OjE5IEFya2FkaXVzeiBNacWba2lld2ljeiBuYXBzYWwoYSk6Cj4g
Cj4gSGVsbG8uCj4gCj4gTGludXggNS4xMC42NywgZ2xpYmMgMi4zNCwgbHZtIDIuMDMuMTMsIHVk
ZXZkIDI0Niwgc2ltcGxlIGluaXQgc2NyaXB0Cj4gcnVuIG9uIHNodXRkb3duIHdoaWNoIGRvZXMK
PiAKPiB2Z2NoYW5nZSAtYSBuIC0tc3lzaW5pdAo+IAo+IG5vIG90aGVyIHByb2Nlc3NlcyBhcmUg
cnVubmluZyAoanVzdCBpbml0LCBteSBzY3JpcHQgYW5kIHZnY2hhbmdlKSwKPiB2Z3N0b3JhZ2Ug
aXMgdmcgb24gbWQgcmFpZCAxMCBvbiA0IGhkZCBkaXNrcy4KPiAKPiBpdCBoYW5ncyB3aXRoCj4g
Cj4gKyAvc2Jpbi92Z2NoYW5nZSAtYSBuIC0tc3lzaW5pdCAtLXZlcmJvc2UgLS1kZWJ1Zwo+ICAg
IEZhaWxlZCB0byBmaW5kIHN5c2ZzIG1vdW50IHBvaW50Cj4gICAgTm8gcHJvYyBmaWxlc3lzdGVt
IGZvdW5kOiBza2lwcGluZyBzeXNmcyBmaWx0ZXIKPiAgICBObyBwcm9jIGZpbGVzeXN0ZW0gZm91
bmQ6IHNraXBwaW5nIG11bHRpcGF0aCBmaWx0ZXIKPiAgICBGaWxlIGxvY2tpbmcgaW5pdGlhbGlz
YXRpb24gZmFpbGVkLgo+ICAgIERlYWN0aXZhdGluZyBsb2dpY2FsIHZvbHVtZSB2Z3N0b3JhZ2Uv
bHZob21lLgo+ICAgIFJlbW92aW5nIHZnc3RvcmFnZS1sdmhvbWUgKDI1MzowKQo+ICAgIERlYWN0
aXZhdGVkIDEgbG9naWNhbCB2b2x1bWVzIGluIHZvbHVtZSBncm91cCB2Z3N0b3JhZ2UuCj4gCj4g
Tm90ZSB0aGF0IHJ1bm5pbmcKPiB2Z2NoYW5nZSAtYSBuIC0tc3lzaW5pdCAtLXZlcmJvc2UgLS1k
ZWJ1Zwo+IG9uIGZ1bGx5IHJ1bm5pbmcgc3lzdGVtIGp1c3Qgd29ya3MgZmluZToKPiAKPiAjIHZn
Y2hhbmdlIC1hIG4gLS1zeXNpbml0IC0tdmVyYm9zZSAtLWRlYnVnCj4gICAgRGVhY3RpdmF0aW5n
IGxvZ2ljYWwgdm9sdW1lIHZnc3RvcmFnZS9sdmhvbWUuCj4gICAgUmVtb3ZpbmcgdmdzdG9yYWdl
LWx2aG9tZSAoMjUzOjApCj4gICAgRGVhY3RpdmF0ZWQgMSBsb2dpY2FsIHZvbHVtZXMgaW4gdm9s
dW1lIGdyb3VwIHZnc3RvcmFnZS4KPiAgICAwIGxvZ2ljYWwgdm9sdW1lKHMpIGluIHZvbHVtZSBn
cm91cCAidmdzdG9yYWdlIiBub3cgYWN0aXZlCj4gIwo+IAo+IAo+IHNvIEkndmUgcmVzdGFydGVk
IHVkZXZkIGp1c3QgYmVmb3JlIHZnY2hhbmdlIGNhbGwgaW4gbXkgc2NyaXB0IGFuZCBpdAo+IHdv
cmtzLgo+IAo+IE90aGVyIHRlc3Q6Cj4gCj4gZnVsbHkgcnVubmluZyBzeXN0ZW0KPiAjIHVkZXZk
IC0tdmVyc2lvbgo+IDI0Ngo+ICMga2lsbGFsbCB1ZGV2ZAo+ICMgdmdjaGFuZ2UgLWEgbiAtLXN5
c2luaXQgLS12ZXJib3NlIC0tZGVidWcKPiAgICBEZWFjdGl2YXRpbmcgbG9naWNhbCB2b2x1bWUg
dmdzdG9yYWdlL2x2aG9tZS4KPiAgICBSZW1vdmluZyB2Z3N0b3JhZ2UtbHZob21lICgyNTM6MCkK
PiAgICBEZWFjdGl2YXRlZCAxIGxvZ2ljYWwgdm9sdW1lcyBpbiB2b2x1bWUgZ3JvdXAgdmdzdG9y
YWdlLgo+IGFuZCBoYW5ncwo+IAo+IAo+IFdoeSBpcyB1ZGV2ZCBuZWVkZWQgZm9yIHZnY2hhbmdl
IHRoZXJlPyBJdCB3YXNuJ3QgbmVlZGVkIHRvIGRlYWN0aXZhdGUKPiB2ZyBiZWZvcmUgQUZBSUsu
Cj4gCj4gCj4gc3RyYWNlCgpIaQoKSXQgZG9lcyBsb29rIGxpa2UgdGhlIGluaXRpYWwgZGV0ZWN0
aW9uIG9mIHJ1bm5pbmcgdWRldiB3aXRoaW4gbHZtMiBjb2RlIGlzIApkb2luZyBzb21ldGhpbmcg
d3JvbmcuCgpJdCBzaG91bGQgcmVjb2duaXplIHRoZXJlIGlzIG5vIHVkZXYgcnVubmluZyBhbmQg
YmVoYXZlIGxpa2UgaWYgIC0tbm91ZGV2c3luYyAKd291bGQgYmUgZ2l2ZW4uCgpJJ2xsIGNoZWNr
IHdoYXQgaGFzIGNoYW5nZWQuCgoKUmVnYXJkcwoKWmRlbmVrCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51
eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dU
Ty9MVk0tSE9XVE8v

