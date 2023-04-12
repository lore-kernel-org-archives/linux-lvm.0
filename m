Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BC2C77B6E
	for <linux-lvm@archiver.kernel.org>; Wed, 12 Apr 2023 12:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681303106;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Jyv3n9+NeWBrjkUN4BQovh5a7AOFOMj9oSake50M2xs=;
	b=LIKgbatiOR94S5RjIbzZGUa0PYUVURXW3zzKEFJAg27xVpSB8cIY+4gSulYO1dMf/LwacJ
	JARo4jtrHI9IDRAebGfahtUEozoVh2vrXslxAEt8dLyAfSfMhF0MCpX9TUfeFxzQ5jD5yK
	X8FebAbS/XJlU8WR9/+tkypVjdxjWh0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-ULkuHDSkN-2EvNjIRPAc-Q-1; Wed, 12 Apr 2023 08:38:25 -0400
X-MC-Unique: ULkuHDSkN-2EvNjIRPAc-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85BB31C05142;
	Wed, 12 Apr 2023 12:38:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E88CC15BB8;
	Wed, 12 Apr 2023 12:38:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2E23C19465A0;
	Wed, 12 Apr 2023 12:38:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F12471946587
 for <linux-lvm@listman.corp.redhat.com>; Wed, 12 Apr 2023 12:37:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DE9262166B26; Wed, 12 Apr 2023 12:37:40 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B30842166B2A
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 12:37:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94BA88996FA
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 12:37:40 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-574-5gl7INNmNhKfYysQ700GIw-1; Wed,
 12 Apr 2023 08:37:38 -0400
X-MC-Unique: 5gl7INNmNhKfYysQ700GIw-1
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [172.20.35.164] ([37.24.118.138]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQ8Wa-1pzrPs0oQy-00M0MS; Wed, 12
 Apr 2023 14:37:36 +0200
Message-ID: <b24e48de-f4c7-b9f4-97fa-60671824c1f4@web.de>
Date: Wed, 12 Apr 2023 14:37:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
 LVM general discussion and development <linux-lvm@redhat.com>,
 Roger Heflin <rogerheflin@gmail.com>
References: <4649980a-7af2-5b2e-47de-ce88ccb8ac6f@web.de>
 <CAAMCDefZC-J7Nc0H45e_EmqkRDr8ZjpOn-JvNWyBzExh8TaCsg@mail.gmail.com>
 <845e5b45-42d5-3d7f-bdad-a66ce7a2e5a9@web.de>
 <563d6e1e-e752-12df-4073-70c9b45c1879@gmail.com>
From: Roland <devzero@web.de>
In-Reply-To: <563d6e1e-e752-12df-4073-70c9b45c1879@gmail.com>
X-Provags-ID: V03:K1:FHKY0cyaYVjYqLb80psROs5eWCfp7385XOMRVrDG2TKxH7qV4sa
 NuHLgw3//nrRdwIvM60veQ/8kf0b+O/qMmQeR9nJ7TdGxHFzlzCL1tu6m6EOlV/6ENJOppk
 Wd6lr/HxWr9Hevd8VY5YTOkNVL4evlJMu5ZP6yzQ++c4VzVnoIGsy7S4w0RBtW40bAB9ohb
 BmsMfyj8BLWNriPBpA+9Q==
UI-OutboundReport: notjunk:1;M01:P0:MWZfxgXpwVo=;Jt0Uz5peesXs3B2R1fMb4n0zFjh
 dpDoh+zqETcbx9F71I+QTaU60MdQ68ftxUD5nw2RRMXuZo5sjqVZaj2t7n6Lql4m5odFhWW3L
 HqyQivIPGTdMI0UL6p5HkTrrNUjLCi0AuAJCrFNkzNQNpK8QM792a5vS2Kx13TAXw5DfAxO92
 bhGcMF/32g/xJcUTRr9OFXUHGO/O/wpVRarICOLluFzHX+99JEubZakReS1BrAr7aleVylCc7
 mCHZ46NYSkyGmBKPMrXm0xAOAirlAJu8jdPS6lWz63kRFh3GK1noRDnKl4wuG2757GrBrnYwP
 rAPcUB9unmxU6BEDlENtV6PAkYpKvcbnrksdzOIdzgETFNhpVrobCVGaJfwVqGzfugWnKxXOM
 B7Th9ENKOD3RukedwLM4wtQwkhI28AZSqL7iH+J2ZhVDQpvyC0Gz5TgAs0rgCX6n123cFEq/e
 VUqO1i2B9MlMPC6nXildIgP7dlxk8M+7NjinI4aFM3cLjKmwOEC+Lm6fDaqPv/0/trQDlDQmp
 b6qEE4EmXmar3G5yL0EkABa48PPFN/EMTXVBnaOgFp/dSd3Ab86xq6SSRyDphE8UaCFJkSLTP
 vrQiDEN0SNZ0x8h1u/7m1K/GHo8j7KF98mtJ+9BfJ78ZEwhglE5zKCcOc3+UhiyjUCs48+7ka
 ySwkFrMeMNII+kFwQ0ZDYBnk2zSUWp9vftK0iPE/e3UkGzUwsX4miliXlFkeKuYt8jqqUe80R
 KtsasUWaJcyjYSWZhabg50xxgRTaohtRv1ZD3stAkT2UdM1ul9+2E/VAWd/lZHbJjIkMuj7ky
 VGVzxI4TQso+mSQ2pJjglV8DH80wpr6RW8FbmYFvwM8/aZLBoJpN6smjBJASt89Vn+T3kr/ZI
 XSUrA0FTcWvR/CIYvB2idN2oKmSzYbclhpu1QfEzFw3QQ+KOPXqehsByWeZIdLk/hslNwuVqj
 bIXmug==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: web.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

ID5SZWFsbCBzaWxseSBwbGFuwqAgLSBiZWVuIHRoZXJlIHllYXJzIGJhY2sgaW4gdGltZSB3aGVu
IGRyaXZlcyB3ZXJlIEZBUgptb3JlIGV4cGVuc2l2ZSB3aXRoIHRoZSBwcmljZSBwZXIgR2lCLgog
PlRvZGF5cyAtIGp1c3QgdGhyb3cgYmFkIGRyaXZlIHRvIHJlY3ljbGUgYmluIC0gaXQncyBub3Qg
d29ydGggdG8gZG8KdGhpcyBzaWxsaW5lc3MuCgpvaywgaSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQg
b2Ygdmlldy4gYW5kIHRoYW5rIHlvdSBmb3IgdGhlIGlucHV0LgoKYnV0IHRoaXMgYXBwbGllcyB0
byBhIHdvcmxkIHdpdGggZW5kbGVzcyByZXNzb3VyY2VzIGFuZCB3aGVuIHBlb3BsZSBjYW4KYWZm
b3JkIHRoZSBuZXcgaGFyZHdhcmUuCgppIHRoaW5rLCB3aXRoIHRoZSBzYW1lIGxvZ2ljLCB5b3Ug
Y2FuIGRlc2lnbmF0ZSBzb21lIGd1eSB0byBiZSBzaWxseSAsCmlmIGhlIHB1dHMgYSBwYXRjaCBv
biBoaXMgYmljeWNsZSBpbm5lciB0dWJlIGluc3RlYWQKb2YgYnV5aW5nIGEgbmV3IG9uZSwgYXMg
dGhleSBhcmUgY2hlYXAuIHdpdGggdGhlIHBhdGNoLCB0aGUgdHViZSBpcwphbHdheXMgd29yc2Ug
dGhlbiBhIG5ldyBvbmUuIGFuZCBoZSBwcm9iYWJseSByaXNrcwpoaXMgb3duIGhlYWx0aCwgYmVj
YXVzZSBvZiB1c2luZyBhIHR1YmUgd2hpY2ggbWF5IGFscmVhZHkgaGF2ZSBnb3R0ZW4KcG9yb3Vz
Li4uCgpidXQgc2hvdWxkbid0IHdlIHBlcmhhcHMgbGVhdmUgaXQgdXAgdG8gdGhlIGVuZCB1c2Vy
IC8gb3duZXIgb2YgdGhlCmhhcmR3YXJlLMKgIHRvIGRlY2lkZSB3aGVuIGl0J3MgcmVhZHkgZm9y
IHRoZSByZWN5Y2xlIGJpbiA/CgpvciBzaG91bGQgd2UgcGVyaGFwcyB3YWl0IGZvciB0aGUgbmV4
dCBoYXJkZHJpdmUgc3VwcGx5IGNyaXNpcyAobGlrZSBpbgoyMDExKT/CoCB0aGVuIHBlb3BsZSBz
dGFydCB0byBnZXQgbW9yZSBjcmVhdGl2ZSBpbiB1c2luZwp3aGF0IHRoZXkgaGF2ZSwgYmVjYXVz
ZSB0aGV5IGhhdmUgbm8gb3RoZXIgb3B0aW9uLi4uCgogPiB3aGVuZXZlciB5b3Ugd2FudCB0byBj
cmVhdGUgbmV3IGFycmFuZ2VtZW50IGZvciB5b3UgZGlzayB3aXRoICdiYWQnCmFyZWFzLAogPnlv
dSBjYW4gYWx3YXlzIHN0YXJ0IGZyb20gJ3NjcmF0Y2gnIC0gc2luY2UgYWZ0ZXJhbGwgLSBsdm0y
IE9OTFkKbWFuaXB1bGF0ZXMgd2l0aCBtZXRhZGF0YSB3aXRoaW4gZGlzayBmcm9udCAtCiA+c28g
aWYgeW91IG5lZWQgdG8gY3JlYXRlIG5ldyAnaG9sZXMnLAogPmp1c3TCoMKgICdwdmNyZWF0ZSAt
ZicsIHZnY3JlYXRlLMKgwqAgYW5kICdsdmNyZWF0ZSAtWm4gLVduJwogPmFuZCB0aGVuwqAgJ2x2
ZXh0ZW5kJ8KgIHdpdGggbm9ybWFswqAgb3LCoCAnbHZleHRlbmQgLS10eXBlIGVycm9yIHwgLS10
eXBlCnplcm8nIHNlZ21lbnQgdHlwZXMgYXJvdW5kIGJhZCBhcmVhcyB3aXRoIHNwZWNpZmljIHNp
emUuCiA+T25jZSB5b3UgYXJlIGZpbmlzaGVkIGFuZCB5b3VyIExWIHByZWNpc2VseSBtYXRjaGVz
IHlvdXIgJ3ByZXZpb3VzJ8KgCkxWIG9mIHlvdSBwYXN0IFZHIC0geW91IGNhbiBzdGFydCB0byB1
c2UgdGhpcyBMViBhZ2FpbiB3aXRoCiA+bmV3IGFycmFuZ2VtZW50IG9mwqAgJ2Jyb2tlbiB6ZXJv
ZWQvZXJyb3JlZCcgYXJlYXMuCgp5ZXMsIGkgaGF2ZSBhbHJlYWR5IGNvbWUgdG8gdGhlIGNvbmNs
dXNpb24sIHRoYXQgaXQncyBhbHdheXMgYmV0dGVyIHRvCnN0YXJ0IGZyb20gc2NyYXRjaCBsaWtl
IHRoaXMuIGkgZGlzbWlzc2VkIHRoZSBpZGVhIG9mCmV4Y2x1ZGluZyBvciByZWxvY2F0aW5nIGJh
ZCBzZWN0b3JzLgoKID4gQnV0IGdvb2QgYWR2aWNlIGZyb20gbWUgLSB3aGVuZXZlcsKgICdzbWFy
dGN0bCcgc3RhcnRzIHRvIHNob3cKcmVsb2NhdGlvbiBibG9jayBlcnJvcnMgLSBpdCdzIHRoZSBy
aWdodCBtb21lbnQgdG/CoCAnZGRfcmVzY3VlJwogPiBhbnkgTFYgdG8geW91ciBuZXcgZHJpdmUu
Li4KCnllcywgaSdtIHRvdGFsbHkgYXdhcmUgdGhhdCB3ZSB3YWxrIG9uIHZlcnkgdGhpbiBpY2Ug
aGVyZS4KCmJ1dCBpJ2QgcmVhbGx5IGxpa2UgdG8gY29sbGVjdCBzb21lIHJlYWwgd29ybGQgZGF0
YS9pbmZvcm1hdGlvbiBvbiBob3cKZ29vZCBzdWNoIGRpc2sgInJlY3ljbGluZyIgY2FuIHByb2Jh
Ymx5IHdvcmsuwqAgaSBkb24ndCBoYXZlCmFueSBwb2ludGVycyBmb3Igc3VjaCBhbmQgZGlkIG5v
dCBmaW5kIGFueSBpbmZvcm1hdGlvbiwgb24gImhvdyBmYXN0IGEKYmFkIGRpc2sgZ2V0cyB3b3Jz
ZSzCoCBpZiBpdCBoYXMgaXJyZXRyaWV2YWJsZSBiYWQgc2VjdG9ycwphbmQgc21hcnQgaXMgcmVw
b3J0aW5nIHJlbG9jYXRpb24gZXJyb3JzLiB0aGVyZSBzZWVtcyBub3QgbXVjaAppbmZvcm1hdGlv
biBhcm91bmQgZm9yIHRoaXMuLi4KCmkgZ3Vlc3Mgc3VjaCAiYnJva2VuIiBkaXNrcyBiZWluZyB1
c2VkIHdpdGggemZzIGluIGEgcmVkdW5kYW50IHNldHVwLAp0aGV5IGNvdWxkIHByb2JhYmxlIHN0
aWxsIHNlcnZlIGEgcHVycG9zZS4gbWF5YmUgbm90CmZvciBwcm9kdWN0aW9uIGRhdGEsIGJ1dCBw
cm9iYWJseSBnb29kIGVub3VnaCBmb3IgIm5vdCBzbyBpbXBvcnRhbnQiCmFwcGxpY2F0aW9uLgoK
aXQncyBhIGxpdHRsZSBiaXQgYWNhZGVtaWMgcHJvamVjdC4gZm9yIG15IG93biBmdW4uIGkgbGlr
ZSB0byBmaWRkbGUKd2l0aCBkaXNrcywgbHZtLCB6ZnMgYW5kIHRoYXQgc3R1ZmYuLi4uCgpyb2xh
bmQKCkFtIDEyLjA0LjIzIHVtIDEyOjIwIHNjaHJpZWIgWmRlbmVrIEthYmVsYWM6Cj4gRG5lIDA5
LiAwNC4gMjMgdiAyMDoyMSBSb2xhbmQgbmFwc2FsKGEpOgo+Pj4gV2VsbCwgaWYgdGhlIExWIGlz
IGJlaW5nIHVzZWQgZm9yIGFueXRoaW5nIHJlYWwsIHRoZW4gSSBkb24ndCBrbm93IG9mCj4+PiBh
bnl0aGluZyB3aGVyZSB5b3UgY291bGQgcmVtb3ZlIGEgYmxvY2sgaW4gdGhlIG1pZGRsZSBhbmQg
c3RpbGwgaGF2ZSBhCj4+PiB3b3JraW5nIGZzLsKgwqAgWW91IGNhbiBvbmx5IHJlZHVjZSBmcydl
cyAodGhlIG9uZXMgdGhhdCB5b3UgY2FuIHJlZHVjZSkKPj4KPj4gbXkgcGxhbiBpcyB0byBzY2Fu
IGEgZGlzayBmb3IgdXNhYmxlIHNlY3RvcnMgYW5kIG1hcCB0aGUgbG9naWNhbCB2b2x1bWUKPj4g
YXJvdW5kIHRoZSBicm9rZW4gc2VjdG9ycy4KPj4KPj4gd2hlbmV2ZXIgbW9yZSBzZWN0b3JzIGdl
dCBicm9rZW4sIGknZCBsaWtlIHRvIHJlbW92ZSB0aGUgYnJva2VuIG9uZXMKPj4gdG8gaGF2ZQo+
PiBhIHVzYWJsZSBsdiB3aXRob3V0IGJyb2tlbiBzZWN0b3JzLgo+Pgo+Cj4gUmVhbGwgc2lsbHkg
cGxhbsKgIC0gYmVlbiB0aGVyZSB5ZWFycyBiYWNrIGluIHRpbWUgd2hlbiBkcml2ZXMgd2VyZSBG
QVIKPiBtb3JlIGV4cGVuc2l2ZSB3aXRoIHRoZSBwcmljZSBwZXIgR2lCLgo+Cj4gVG9kYXlzIC0g
anVzdCB0aHJvdyBiYWQgZHJpdmUgdG8gcmVjeWNsZSBiaW4gLSBpdCdzIG5vdCB3b3J0aCB0byBk
bwo+IHRoaXMgc2lsbGluZXNzLgo+Cj4gSEREIGJhZCBzZWN0b3JzIGFyZSBzcHJlYWRpbmcgLSBh
bmQgc2xvd2x5IHRoZSBzdXJmYWNlIGdldHMgZGVzdHJveWVkLi4uLgo+Cj4gU28gaWYgeW91IG1h
a2UgbGFyZ2UgJ2hlYWQtcm9vbScgYXJvdW5kIGJhZCBkaXNrIGFyZWFzIC0gaWYgdGhleSBhcmUK
PiBjb25jZW50cmF0ZWQgb24gc29tZSBkaXNrIGFyZWEgLSBhbmQgeW91IGtub3cgdG9wb2xvZ3kg
b2YgeW91IGRpc2sgZHJpdmUKPiBsaWtlIGkuZS4gMSUgZnJlZSBkaXNrIHNwYWNlIGJlZm9yZSBh
bmQgYWZ0ZXIgYmFkIGFyZWEgLSB5b3UgY291bGQKPiBwb3NzaWJseSB1c2UgZGlzayBmb3IgYSBs
aXR0bGUgd2hpbGUgbW9yZSAtIGJ1dCBvbmx5IHRvIHN0b3JlCj4gaW52YWx1YWJsZSBkYXRhLi4u
Lgo+Cj4KPj4gc2luY2UgeW91IG5lZWQgdG8gcmVidWlsZCB5b3VyIGRhdGEgYW55d2F5IGZvciB0
aGF0IGRpc2ssIHlvdSBjYW4gYWxzbwo+PiByZWNyZWF0ZSB0aGUgd2hvbGUgbG9naWNhbCB2b2x1
bWUuCj4+Cj4+IG15IHF1ZXN0aW9uIGFuZCBteSBwcm9qZWN0IGlzIGEgbGl0dGxlIGJpdCBhY2Fk
ZW1pYy4gaSdkIHNpbXBseSB3YW50Cj4+IHRvIHRyeQo+PiBvdXQgaG93IG11Y2ggdXNlIHlvdSBj
YW4gaGF2ZSBmcm9tIHNvbWUgZGVhZCBkaXNrcyB3aGljaCBhcmUgdHJhc2gKPj4gb3RoZXJ3aXNl
Li4uCj4KPiBZb3UgY291bGQgYWx3YXlzIHRha2XCoCAndmdjZmdiYWNrdXAnwqAgb2YgbHZtMiBt
ZXRhZGF0YSBhbmQgbWFrZSBzb21lCj4gY3JhenkgdHJhbnNpdGlvbiBvZiBpZiB3aXRoIGV2ZW7C
oCBBV0svcHl0aG9uL3BlcmzCoMKgIC3CoCBidXQgd2UgcmVhbGx5Cj4gdGVuZCB0byBzdXBwb3J0
Cj4ganVzdCBzb21lIHVzZWZ1bCBmZWF0dXJlcyAtIGFzIHRoZXJlIGlzIGFscmVhZHnCoCAndG9v
IG11Y2gnIGFuZCB1c2Vycwo+IGFyZSBnZXR0aW5nIG9mdGVuIGxvc3QuCj4KPiBPbmUgdmVyeSBz
aW1wbHkgJiBuYWl2ZSBpbXBsZW1lbnRhdGlvbiBjb3VsZCBiZSBnb2luZyBhbG9uZ2UgdGhpcyBw
YXRoIC0KPgo+IHdoZW5ldmVyIHlvdSB3YW50IHRvIGNyZWF0ZSBuZXcgYXJyYW5nZW1lbnQgZm9y
IHlvdSBkaXNrIHdpdGggJ2JhZCcKPiBhcmVhcywKPiB5b3UgY2FuIGFsd2F5cyBzdGFydCBmcm9t
ICdzY3JhdGNoJyAtIHNpbmNlIGFmdGVyYWxsIC0gbHZtMiBPTkxZCj4gbWFuaXB1bGF0ZXMgd2l0
aCBtZXRhZGF0YSB3aXRoaW4gZGlzayBmcm9udCAtIHNvIGlmIHlvdSBuZWVkIHRvIGNyZWF0ZQo+
IG5ldyAnaG9sZXMnLAo+IGp1c3TCoMKgICdwdmNyZWF0ZSAtZicsIHZnY3JlYXRlLMKgwqAgYW5k
ICdsdmNyZWF0ZSAtWm4gLVduJwo+IGFuZCB0aGVuwqAgJ2x2ZXh0ZW5kJ8KgIHdpdGggbm9ybWFs
wqAgb3LCoCAnbHZleHRlbmQgLS10eXBlIGVycm9yIHwgLS10eXBlCj4gemVybycgc2VnbWVudCB0
eXBlcyBhcm91bmQgYmFkIGFyZWFzIHdpdGggc3BlY2lmaWMgc2l6ZS4KPiBPbmNlIHlvdSBhcmUg
ZmluaXNoZWQgYW5kIHlvdXIgTFYgcHJlY2lzZWx5IG1hdGNoZXMgeW91ciAncHJldmlvdXMnwqAK
PiBMViBvZiB5b3UgcGFzdCBWRyAtIHlvdSBjYW4gc3RhcnQgdG8gdXNlIHRoaXMgTFYgYWdhaW4g
d2l0aCBuZXcKPiBhcnJhbmdlbWVudCBvZsKgICdicm9rZW4gemVyb2VkL2Vycm9yZWQnIGFyZWFz
Lgo+Cj4gSSd2ZSBzb21lIHNlcmlvdXMgZG91YnRzIGFib3V0IHVzYWJpbGl0eSBvZiB0aGlzIHdp
dGggYW55IGZpbGVzeXN0ZW0KPiA6KSBidXQgaWYgeW91IHRoaW5rIHRoaXMgaGFzIHNvbWUgYWRk
ZWQgdmFsdWUgLSBmZWxsIGZyZWUgdG8gdXNlLgo+IElmIHRoZSBkcml2ZSB5b3UgcGxheSB3aXRo
IHdvdWxkIGJlICdkaXNjYXJkYWJsZScgKFNTRC9OVk1lKSB0aGVuIG9uZQo+IG11c3QgdGFrZSBl
eHRyYSBjYXJlIHRoZXJlIGlzIG5vICdkaXNjYXJkL1RSSU0nIGFueXdoZXJlIGluIHRoZQo+IHBy
b2Nlc3MgLSBhcyB0aGF0IHdvdWxkIGxvc2UgYWxsIGRhdGEgaXJyZWNvdmVyYWJseS4uLi4KPgo+
IEJ1dCBnb29kIGFkdmljZSBmcm9tIG1lIC0gd2hlbmV2ZXLCoCAnc21hcnRjdGwnIHN0YXJ0cyB0
byBzaG93Cj4gcmVsb2NhdGlvbiBibG9jayBlcnJvcnMgLSBpdCdzIHRoZSByaWdodCBtb21lbnQg
dG/CoCAnZGRfcmVzY3VlJyBhbnkgTFYKPiB0byB5b3VyIG5ldyBkcml2ZS4uLgo+Pgo+PiB5ZXMs
IHB2bW92ZSBpcyB0aGUgb3RoZXIgYXBwcm9hY2ggZm9yIHRoYXQuCj4+Cj4+IGJ1dCB3aWxsIHB2
bW92ZSBjb250aW51ZS9maW5pc2ggYnkgYWxsIG1lYW5zIHdoZW4gbW92aW5nIGV4dGVudHMKPj4g
bG9jYXRlZCBvbiBhCj4+IGJhZCBzZWN0b3IgPwo+Cj4gcHZtb3ZlwqAgQ0FOTk9UIGJlIHVzZWQg
d2l0aCBiYWQgZHJpdmVzIC0gaXQgY2Fubm90IGRlYWwgd2l0aCBlcnJvcmluZwo+IHNlY3RvcnMg
YW5kIGJhc2ljYWxseSBnZXRzIHN0dWNrIHRoZXJlIHRyeWluZyB0byBtaXJyb3IgdW5yZWNvdmVy
YWJsZQo+IGRpc2sgYXJlYXMuLi4KPgo+IFJlZ2FyZHMKPgo+IFpkZW5lawo+Cj4KPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxp
bmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90
bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCg==

