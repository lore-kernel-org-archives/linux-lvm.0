Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C333C433F5
	for <linux-lvm@archiver.kernel.org>; Mon,  2 May 2022 00:44:39 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-X0ihP1iTPDyz0ogbJj-XrQ-1; Sun, 01 May 2022 20:44:35 -0400
X-MC-Unique: X0ihP1iTPDyz0ogbJj-XrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 853301E12D26;
	Mon,  2 May 2022 00:44:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2226B2026987;
	Mon,  2 May 2022 00:44:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9B7AD1947063;
	Mon,  2 May 2022 00:44:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C8C9E194705E
 for <linux-lvm@listman.corp.redhat.com>; Mon,  2 May 2022 00:44:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B9A842024CCE; Mon,  2 May 2022 00:44:23 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4E632024CC3
 for <linux-lvm@redhat.com>; Mon,  2 May 2022 00:44:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DCBB800186
 for <linux-lvm@redhat.com>; Mon,  2 May 2022 00:44:20 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
 [172.104.24.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-_dpS8WmBOQu1G8apJIRGlg-1; Sun, 01 May 2022 20:44:18 -0400
X-MC-Unique: _dpS8WmBOQu1G8apJIRGlg-1
Received: from quad.stoffel.org (068-116-170-226.res.spectrum.com
 [68.116.170.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.stoffel.org (Postfix) with ESMTPSA id 57C9F1E1B1
 for <linux-lvm@redhat.com>; Sun,  1 May 2022 20:36:27 -0400 (EDT)
Received: by quad.stoffel.org (Postfix, from userid 1000)
 id 6DD2BA7B5D; Sun,  1 May 2022 20:36:26 -0400 (EDT)
MIME-Version: 1.0
Message-ID: <25199.10122.376547.499176@quad.stoffel.home>
Date: Sun, 1 May 2022 20:36:26 -0400
From: "John Stoffel" <john@stoffel.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <7534073B-7DBD-46B5-9CA5-BFB3C603C75E@icloud.com>
References: <7534073B-7DBD-46B5-9CA5-BFB3C603C75E@icloud.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [linux-lvm] Bypassing LVM Restrictions - RAID6 With Less Than 5
 Disks
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CkFsZXg+IEkgaGF2ZSA0IGRpc2tzIHRoYXQgSeKAmWQgcmVhbGx5IGxpa2UgdG8gcHV0IGludG8g
YSBSQUlENi4gSSBrbm93CkFsZXg+IGFib3V0IFJBSUQxMCwgYnV0IGl0IHdvdWxkbuKAmXQgd29y
ayB3ZWxsIGZvciBtZSBmb3Igc2V2ZXJhbApBbGV4PiByZWFzb25zLgoKQ2FuIHlvdSBleHBsYWlu
IHRob3NlIHJlYXNvbnM/ICBJbiBnZW5lcmFsLCBSQUlEMTAgZ2l2ZXMgeW91IG9ubHkgNTAlCmNh
cGFjaXR5LCBidXQgbXVjaCBpbXByb3ZlZCBwZXJmb3JtYW5jZSBvdmVyIFJBSUQ1LzYgaW4gdGVy
bXMgb2YKcmVhZC93cml0ZSBwZXJmb3JtYW5jZS4KCkJ1dCBpZiB5b3Ugd2FudCB0byBiZSBhYmxl
IHRvIGhhbmRsZSB0aGUgZmFpbHVyZSBvZiBhbnkgdHdvIGRpc2tzIGluCnlvdXIgUkFJRDYsIHRo
ZW4gSSBjYW4gdW5kZXJzdGFuZCB5b3VyIGRlY2lzaW9uLgoKQWxleD4gQnV5aW5nIGFub3RoZXIg
ZGlzayB3b3VsZCBhbHNvIGJlIGEgd2FzdGUgb2YgbW9uZXkgYmVjYXVzZSBJCkFsZXg+IGRvbuKA
mXQgbmVlZCAzLWRpc2tzLXdvcnRoIG9mIHVzYWJsZSBjYXBhY2l0eS4KClRoYXQncyBmYWlyLiAK
CkFsZXg+IEkga25vdyB0aGVyZSB3YXMgYSBxdWVzdGlvbiByZWdhcmRpbmcgdGhpcyBhIGZldyB5
ZWFycyBhZ28sIGFuZApBbGV4PiB0aGUgY29uc2Vuc3VzIHdhcyB0byBub3QgbmF0aXZlbHkgc3Vw
cG9ydCB0aGF0IGNvbmZpZ3VyYXRpb24uIEkKQWxleD4gY2FuIHJlc3BlY3QgdGhhdCAoYWx0aG91
Z2ggSSB3b3VsZCB1cmdlIHlvdSB0byByZWNvbnNpZGVyKSwgYnV0CkFsZXg+IEnigJlkIHN0aWxs
IGxpa2UgdG8gZG8gaXQgb24gbXkgbWFjaGluZS4KCkkgd291bGQgaW5zdGVhZCBidWlsZCB5b3Vy
IFJBSUQ2IHVzaW5nIE1ELCBhbmQgdGhlbiBsYXllciBMVk0gb24gdG9wCm9mIGl0LiAgSXQgd29y
a3MsIGl0J3Mgc29saWQgYW5kIGl0IHJ1bnMgcmVhbGx5IHdlbGwuICAKCkFsZXg+IFNvIGZhciBJ
4oCZdmUgdHJpZWQgcmVtb3ZpbmcgdGhlIHJlc3RyaWN0aW9ucyBmcm9tIHRoZSBzb3VyY2UgY29k
ZQpBbGV4PiBhbmQgcmVjb21waWxpbmcgKEkgZG9u4oCZdCBrbm93IEMsIGJ1dCBJ4oCZbSBmYW1p
bGlhciB3aXRoIGdlbmVyYWwKQWxleD4gY29kZSBzeW50YXgpLiBJ4oCZdmUgc2xvd2x5IGdvdHRl
biBmdXJ0aGVyIGluIHRoZSBsdmNvbnZlcnQKQWxleD4gcHJvY2VzcywgYnV0IHRoZXJlIHNlZW1z
IHRvIGJlIG1hbnkgc2ltaWxhciBjaGVja3MgdGhyb3VnaG91dApBbGV4PiB0aGUgY29kZS4KCklm
IHlvdSBkb24ndCBrbm93IHRoZSBjb2RlLCB0aGVuIHlvdSdyZSBub3QgZ29pbmcgdG8gZ2V0IHdv
cmtpbmcgUkFJRDYKdXAgYW5kIHJ1bm5pbmcgYW55IHRpbWUgc29vbi4gIAoKQWxleD4gSeKAmW0g
aG9waW5nIHNvbWVvbmUgY291bGQgcG9pbnQgbWUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiB0b3dh
cmRzCkFsZXg+IGFjaGlldmluZyB0aGlzIGdvYWwuIElmIEkgc3VjY2Vzc2Z1bGx5IGJ5cGFzcyB0
aGUgdXNlci1zcGFjZQpBbGV4PiB0b29sIHJlc3RyaWN0aW9ucywgd2lsbCB0aGUgcmVzdCBvZiBM
Vk0gbGlrZWx5IHdvcmsgd2l0aCBteQpBbGV4PiBkZXNpcmVkIGNvbmZpZz8gV291bGQgeW91IGJl
IHdpbGxpbmcgdG8gYWxsb3cgdGhlIC0tZm9yY2Ugb3B0aW9uCkFsZXg+IHRvIGJ5cGFzcyB0aGUg
cmVzdHJpY3Rpb25zIHRoYXQgYXJlIG5vdCBzdHJpY3RseSBuZWNlc3NhcnksIGV2ZW4KQWxleD4g
YXQgdGhlIGV4cGVuc2Ugb2YgZXhwZWN0ZWQgc3RhYmlsaXR5PyBJcyB0aGVyZSBhbnl0aGluZyBl
bHNlIHlvdQpBbGV4PiBjb3VsZCBzdWdnZXN0PwoKSSByZWFsbHkgY2FuIG9ubHkgc3VnZ2VzdCB5
b3Ugc2V0dXAgUkFJRDYgdXNpbmcgdGhlIE1EIHJhaWQgdG9vbHMKKG1kYWRtKSBhbmQgdGhlbiBj
cmVhdGUgeW91ciBMVk0gUFZzLCBWR3MgYW5kIExWcyBvbiB0b3Agb2YgdGhhdC4gIEl0CnJlYWxs
eSB3b3JrcyB3ZWxsLgoKWWVzLCB5b3Ugbm93IG5lZWQgdG8gaGF2ZSBhbm90aGVyIHRvb2wgdG8g
bWFuYWdlIGFub3RoZXIgbGF5ZXIsIGJ1dApzaW5jZSB0aGUgTUQgc3lzdGVtIGlzIHdlbGwgdGVz
dGVkLCByZWxpYWJsZSBhbmQganVzdCB3b3JrcywgdGhlbiBJCndvdWxkIGdvIHdpdGggaXQgYXMg
dGhlIGJhc2UuCgpJZiB5b3UgY2FuIGNvcHkgYWxsIHlvdXIgZGF0YSBvbnRvIGEgc2luZ2xlIGRp
c2ssIHRoZW4geW91IGNvdWxkCnNpbXBsZSBjcmVhdGUgYSBSQUlENSBvbiB5b3VyIG90aGVyIHRo
cmVlIGRpc2tzLCBjcmVhdGUgYSBQViBvbiB0aGUKL2Rldi9tZDAsIHRoZW4gYWRkIHRoZSBQViBp
bnRvIHlvdXIgVkcgYW5kIGRvIGEgbHZtb3ZlIHRvIGNvcHkgeW91cgpkYXRhIG9udG8gdGhlIFJB
SUQ1LCBhbGwgd2l0aG91dCBkb3dudGltZS4KCk9uY2UgaXQncyBtb3ZlZCBvdmVyLCB5b3UgcmVt
b3ZlIHRoZSBmaW5hbCBkaXNrLCB0aGVuIGdyb3cgdGhlIE1ECmFycmF5IGZyb20gUkFJRDUgdG8g
UkFJRDYsIGFnYWluIG9ubGluZS4KClRoZSBkZXRhaWxzIGFyZW4ndCBoYXJkLCBidXQgeW91IGRv
IGhhdmUgdG8gYmUgY2FyZWZ1bC4KCkpvaG4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhh
dC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1s
dm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RP
Lwo=

