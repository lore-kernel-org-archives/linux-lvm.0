Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A81CC433EF
	for <linux-lvm@archiver.kernel.org>; Mon,  9 May 2022 00:19:18 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-8H6CR-ZiOIaYoC-tjxeeSA-1; Sun, 08 May 2022 20:19:13 -0400
X-MC-Unique: 8H6CR-ZiOIaYoC-tjxeeSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 899B93C025C0;
	Mon,  9 May 2022 00:19:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6A6540D1B9A;
	Mon,  9 May 2022 00:19:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5FCEA194704E;
	Mon,  9 May 2022 00:19:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 50DD31947041
 for <linux-lvm@listman.corp.redhat.com>; Mon,  9 May 2022 00:19:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F076B17596; Mon,  9 May 2022 00:19:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA80B17586
 for <linux-lvm@redhat.com>; Mon,  9 May 2022 00:19:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BE681C0513A
 for <linux-lvm@redhat.com>; Mon,  9 May 2022 00:19:00 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
 [172.104.24.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-Z8Tr0sSVPdOS61P8tbajlA-1; Sun, 08 May 2022 20:18:58 -0400
X-MC-Unique: Z8Tr0sSVPdOS61P8tbajlA-1
Received: from quad.stoffel.org (068-116-170-226.res.spectrum.com
 [68.116.170.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.stoffel.org (Postfix) with ESMTPSA id 52F401E592
 for <linux-lvm@redhat.com>; Sun,  8 May 2022 20:18:58 -0400 (EDT)
Received: by quad.stoffel.org (Postfix, from userid 1000)
 id 3A391A7B98; Sun,  8 May 2022 20:18:57 -0400 (EDT)
MIME-Version: 1.0
Message-ID: <25208.24049.171380.847909@quad.stoffel.home>
Date: Sun, 8 May 2022 20:18:57 -0400
From: "John Stoffel" <john@stoffel.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <4D4E1DC0-8A04-474C-8DB2-4C9429F092F2@icloud.com>
References: <7534073B-7DBD-46B5-9CA5-BFB3C603C75E@icloud.com>
 <25199.10122.376547.499176@quad.stoffel.home>
 <324D8F25-90D3-4165-BE86-11B217DAFDE4@icloud.com>
 <25200.21283.981034.416787@quad.stoffel.home>
 <87561BC7-DDA5-4BC9-9F98-17118199E96D@icloud.com>
 <6d72d74a-98cc-b055-d1ba-bcd20201e67@gathman.org>
 <4D4E1DC0-8A04-474C-8DB2-4C9429F092F2@icloud.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pj4+Pj4gIkFsZXgiID09IEFsZXggTGllZmxhbmRlciA8YXRsaWVmQGljbG91ZC5jb20+IHdyaXRl
czoKCj4+IE9uIE1heSA3LCAyMDIyLCBhdCA0OjQxIFBNLCBTdHVhcnQgRCBHYXRobWFuIHdyb3Rl
Ogo+PiAKPj4+IE9uIEZyaSwgNiBNYXkgMjAyMiwgQWxleCBMaWVmbGFuZGVyIHdyb3RlOgo+Pj4g
Cj4+PiBUaGFua3MuIEkgcmVhbGx5IGRvbuKAmXQgd2FudCB0byBnaXZlIHVwIHRoZSBETS1JbnRl
Z3JpdHkgbWFuYWdlbWVudC4gTGVzcyBjb21wbGV4aXR5IGlzIGp1c3QgYSBib251cy4KPj4gCj4+
IFdoYXQgYXJlIHlvdSB0cnlpbmcgdG8gZ2V0IG91dCBvZiBSQUlENj8gIElmIHJlZHVuZGFuY3kg
YW5kIGludGVncml0eQo+PiBhcmUgYWxyZWFkeSBtYW5hZ2VkIGF0IGFub3RoZXIgbGF5ZXIsIHRo
ZW4ganVzdCB1c2UgUkFJRDAgZm9yIHN0cmlwaW5nLgo+PiAKPj4gSSBsaWtlIHRvIHVzZSBSQUlE
MTAgZm9yIG1pcnJvciArIHN0cmlwaW5nLCBidXQgSSB1bmRlcnN0YW5kIHBhcml0eSBkaXNrcyBn
aXZlIHJlZHVuZGFuY3kgd2l0aG91dCBoYWx2aW5nIGNhcGFjaXR5LiAgUGFyaXR5IG1lYW5zIFJN
VyBjeWNsZXMgb2YKPj4gbGFyZ2lzaCBibG9ja3MsIHdoZXJlYXMgc3RyYWlnaHQgbWlycm9yaW5n
IChSQUlEMSwgUkFJRDEwKSBjYW4gd3JpdGUKPj4gc2luZ2xlIHNlY3RvcnMgd2l0aG91dCBhIFJN
VyBjeWNsZS4KCkFsZXg+IEkgZG9u4oCZdCB0cnVzdCB0aGUgaGFyZHdhcmUgSeKAmW0gcnVubmlu
ZyBvbiB2ZXJ5IG11Y2gsIGJ1dCBpdOKAmXMKQWxleD4gYWxsIEkgaGF2ZSB0byB3b3JrIHdpdGgg
YXQgdGhlIG1vbWVudDsgaXTigJlzIGltcG9ydGFudCB0aGF0IHRoZQpBbGV4PiBhcnJheSBpcyBy
ZXNpbGllbnQgdG8gKmFueSogKGFuZCBtdWx0aXBsZSkgc2luZ2xlIGNodW5rCkFsZXg+IGNvcnJ1
cHRpb25zIGJlY2F1c2Ugc3VjaCBjb3JydXB0aW9ucyBhcmUgbGlrZWx5IHRvIGhhcHBlbiBpbiB0
aGUKQWxleD4gZnV0dXJlLgoKT3VjaCEgIEkgaG9wZSB5b3UgaGF2ZSBnb29kIGJhY2t1cHMgc29t
ZXdoZXJlLCBiZWNhdXNlIEkgc3VzcGVjdAp5b3UncmUgZG9pbmcgdG8gc3VmZmVyIGEgY29tcGxl
dGUgZmFpbHVyZSBhdCBzb21lIHBvaW50LgoKQWxleD4gRm9yIHRoZSBsYXN0IHNldmVyYWwgbW9u
dGhzIEnigJl2ZSBwZXJpb2RpY2FsbHkgYmVlbiBzZWVpbmcKQWxleD4gKERNLUludGVncml0eSkg
Y2hlY2tzdW0gbWlzbWF0Y2ggd2FybmluZ3MgYXQgdmFyaW91cyBsb2NhdGlvbnMKQWxleD4gb24g
YWxsIG9mIG15IGRpc2tzLiBJIHN0b3BwZWQgdXNpbmcgYSBmZXcgU0FUQSBwb3J0cyB0aGF0IHdl
cmUKQWxleD4gZXhwbGljaXRseSB0aHJvd2luZyBTQVRBIGVycm9ycywgYnV0IEkgc3VzcGVjdCB0
aGF0IHRoZQpBbGV4PiByZW1haW5pbmcgY29ubmVjdGlvbnMgYXJlIHVucHJlZGljdGFibHkgKGFs
YmVpdCBpbmZyZXF1ZW50bHkpCkFsZXg+IGNvcnJ1cHRpbmcgZGF0YSBpbiB3YXlzIHRoYXQgYXJl
IG1vcmUgZGlmZmljdWx0IHRvIGRldGVjdC4KClRoaXMgaXMgaW50ZXJlc3RpbmcuICBBbmQgd29y
cmlzb21lLCBiZWNhdXNlIEkgd291bGQgbm90IGV4cGVjdCBtb3ZpbmcKZnJvbSBvbmUgU0FUQSBw
b3J0IHRvIGFub3RoZXIgdG8gY3VyZSBwcm9ibGVtcywgdW5sZXNzIGl0IHdhcyBBKQptb3Zpbmcg
dG8gYSBkaWZmZXJlbnQgY29udHJvbGxlciwgb3IgQikgeW91IGNoYW5nZWQvcmVzZWF0ZWQgdGhl
IFNBVEEKY2FibGUuCgpCdXQgSSBhbHNvIHdvbmRlciBhYm91dCB5b3VyIHBvd2VyIHN1cHBseSBh
bmQgd2hhdCBpdCdzIHJhdGVkIGZvci4KWW91IG1pZ2h0IGp1c3QgYmUgaGl0dGluZyB0aGUgcmFn
Z2VkIGVkZ2Ugb2Ygd2hhdCBpdCBjYW4gc3VwcGx5LCBhbmQKc28geW91J3JlIHJ1bm5pbmcgaW50
byBwcm9ibGVtcyB3aXRoIHZvbHRhZ2UgZHJvcHBpbmcganVzdCBlbm91Z2ggdG8KbWFrZSB0aGlu
Z3Mgc2xpZ2h0bHkgZmxha3kuIAoKQWxleD4gSeKAmXZlIHRyaWVkIHRvIOKAnGNoZWNr4oCdIGFu
ZCDigJxyZXBhaXLigJ0gbXkgYXJyYXkgb24gbXVsdGlwbGUga2VybmVsCkFsZXg+IHZlcnNpb25z
IGFuZCBsaXZlIHJlY292ZXJ5IFVTQiBzdGlja3MsIGJ1dCB0aGUg4oCcY2hlY2siIGFsd2F5cwpB
bGV4PiBzZWVtcyB0byBmcmVlemUgYW5kIGFsbCBzdWJzZXF1ZW50IElPIHRvIHRoZSBhcnJheSBo
YW5ncyB1bnRpbApBbGV4PiByZWJvb3Q7IGF0IHRoZSBtb21lbnQsIGEgY2h1bmsgaXMgb25seSBl
dmVyIG1hZGUgY29uc2lzdGVudCB3aGVuCkFsZXg+IGl0cyBkYXRhIGlzIG92ZXJ3cml0dGVuLCBz
byBpdCBuZWVkcyB0byBzdXJ2aXZlIHBlcmlvZGljLCByYW5kb20KQWxleD4gY29ycnVwdGlvbiBm
b3IgYXMgbG9uZyBhcyBwb3NzaWJsZS4KClRoaXMgaXMgYWxzbyBhIHdhcm5pbmcgdG8gbXkgdGhh
dCBtYXliZSB5b3UgaGF2ZSBwb3dlciBzdXBwbHkgaXNzdWVzLgpDYW4geW91IGdpdmUgYSBzdW1t
YXJ5IG9mIHlvdXIgaGFyZHdhcmUgY29uZmlndXJhdGlvbiBhbmQgbW9kZWwKbnVtYmVycz8gIElm
IHlvdSdyZSBydW5uaW5nIGEgc21hbGxpc2ggcG93ZXIgc3VwcGx5LCBtYXliZSBsb29rIGZvciBh
CnJlcGxhY2VtZW50IHdoaWNoIGNhbiBnZXQgeW91IG1vcmUgcG93ZXIuICBHbyBmcm9tIGEgNDMw
VyBvbmUgdG8gNjAwVywKb3IgNTAwVyB0byA3NTBXIGFuZCBzZWUgaWYgdGhhdCBtYWtlcyBhIGRp
ZmZlcmVuY2UuICAKCkxvb2tpbmcgYXQgeW91ciBkYXRhIGZyb20gYmVmb3JlLCBJIHNlZSB5b3Ug
aGF2ZSAxMiBkaXNrcyBvbiB0aGUKc3lzdGVtLCAxMSBzcGlubmluZyBkaXNrcyBhbmQgb25lIG52
bWUgZGV2aWNlLiAgU28gSSAqcmVhbGx5KiBzdXNwZWN0CnlvdSBoYXZlIGFuIG92ZXJsb2FkZWQg
cG93ZXIgc3VwcGx5LgoKQXJlIHlvdSBhbHNvIHVzaW5nIGEgZGlzayBjb250cm9sbGVyPyAgQW5k
IHdoaWNoIHZlcnNpb24gb2YgbGludXg/ICAKCkFsZXg+IEkgYWxzbyBoYXZlIGEgZGlzayB0aGF0
IGluZnJlcXVlbnRseSBmYWlscyB0byByZWFkIGZyb20gYQpBbGV4PiBwYXJ0aWN1bGFyIGFyZWEs
IGJ1dCB0aGUgcmVzdCBvZiB0aGUgZGlzayBpcyBmaW5lLiBJIHdvdWxkbuKAmXQKQWxleD4gdHJ1
c3QgdGhhdCBkaXNrIHdpdGggdmFsdWFibGUgZGF0YSwgYnV0IGl0IHNlZW1zIGxpa2UgYSBwZXJm
ZWN0CkFsZXg+IGNhbmRpZGF0ZSB0byBob2xkIGFkZGl0aW9uYWwgcGFyaXR5IChyYWlkNl9sc182
KSB0aGF0IEkKQWxleD4gaG9wZWZ1bGx5IG5ldmVyIG5lZWQuCgpUaGlzIGlzIG5vdCBob3cgUkFJ
RDYgcGFyaXR5IHdvcmtzLiAgVGhlIGVudGlyZSBkaXNrIChvciBwYXJ0aXRpb24pIGlzCnVzZWQg
dG8gd3JpdGUgZGF0YSBhbmQvb3IgcGFyaXR5LiAgSXQncyBSQUlENCB3aGljaCBkZWRpY2F0ZXMg
YSBzaW5nbGUKZGlzayB0byBwYXJpdHkgZHV0aWVzLiAgU28gdGhpbmtpbmcgdGhhdCBhIGtub3du
IGZsYWt5IGRpc2sgd2lsbCBiZSBvawpmb3IganVzdCBwYXJpdHkgdXNlIGlzbid0IHJlYWxseSBh
IGdvb2QgaWRlYS4gIAoKSSdkIGFsc28gbG9vayBhdCB0aGUgb3V0cHV0IG9mICdzbWFydGN0bCAt
LWFsbCAvZGV2L3NkPGxldHRlcj4nIGZvcgphbGwgeW91ciBkaXNrcyBhbmQgc2VlIHdoYXQgdGhl
IG51bWJlcnMgc2F5LiAgQnV0IGhvbmVzdGx5LCBpdCBzb3VuZHMKbGlrZSB5b3UgaGF2ZSBzb21l
IHNlcmlvdXMgaGFyZHdhcmUgaXNzdWVzIHdoaWNoIHlvdSdyZSB0cnlpbmcgdG8KcGFwZXIgb3Zl
ciB3aXRoIERNLUludGVncml0eSBhbmQgUkFJRDUuICBBbmQgSSBzdXNwZWN0IGl0IHdpbGwgYWxs
IGVuZAppbiB0ZWFycyBzb29uZXIgb3IgbGF0ZXIuCgpZb3UgZG8gaGF2ZSBiYWNrdXBzIG9mIHlv
dXIgZGF0YSwgcmlnaHQ/ICBFdmVuIG9udG8gYSBzaW5nbGUgbmV3IDEwdGIKZGlzayB0aGF0J3Mg
bm93IGNvbm5lY3RlZCB0byB0aGUgc3lzdGVtIGFsbCB0aGUgdGltZT8KCkdvb2QgbHVjaywKSm9o
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
bHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0
IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCg==

