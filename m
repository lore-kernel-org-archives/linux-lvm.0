Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6A5C77B61
	for <linux-lvm@archiver.kernel.org>; Sun,  9 Apr 2023 22:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681077875;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C0MD4ZtfxKv3wfqwJxRrT/B2KiXx/NhGK4rz+Ke1hvs=;
	b=JAPFFTqB9YzyHHBAGpYZ3vNjLwg5FUU/UMEA/k/CMKsbso4HOzNZu2SuwEZlS7iePIgqXw
	JlHkyVIrQoB4kUYRZ9wBtCASK51WxLOWPF3ntntSXKsfNietBq3p/heWdlegoCm/GWQkp0
	5Vi22E7nw+AeUZTTmG9uEXLzBRlyM6w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-18g8nv1cOi6-wQC2tsnlyw-1; Sun, 09 Apr 2023 18:04:33 -0400
X-MC-Unique: 18g8nv1cOi6-wQC2tsnlyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2640E29A9D4C;
	Sun,  9 Apr 2023 22:04:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A6761121314;
	Sun,  9 Apr 2023 22:04:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F256D19465A8;
	Sun,  9 Apr 2023 22:04:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C1EC31946586
 for <linux-lvm@listman.corp.redhat.com>; Sun,  9 Apr 2023 22:04:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5355A492C14; Sun,  9 Apr 2023 22:04:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B022492C13
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 22:04:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1BB33C02B85
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 22:04:24 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-208-IbvJgxI_PNianHe3qPgnlg-1; Sun,
 09 Apr 2023 18:04:23 -0400
X-MC-Unique: IbvJgxI_PNianHe3qPgnlg-1
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.179.90] ([89.0.109.233]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N01ds-1qYlBz0nbS-00xN3U; Mon, 10
 Apr 2023 00:04:21 +0200
Message-ID: <b30b040a-1441-a333-5c11-d893dd744755@web.de>
Date: Mon, 10 Apr 2023 00:04:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Roger Heflin <rogerheflin@gmail.com>
References: <4649980a-7af2-5b2e-47de-ce88ccb8ac6f@web.de>
 <CAAMCDefZC-J7Nc0H45e_EmqkRDr8ZjpOn-JvNWyBzExh8TaCsg@mail.gmail.com>
 <845e5b45-42d5-3d7f-bdad-a66ce7a2e5a9@web.de>
 <CAAMCDedPAgGgVd4FdkWyfWfu_aqWtUtEbFvevXiJE90UzmYEcA@mail.gmail.com>
From: Roland <devzero@web.de>
In-Reply-To: <CAAMCDedPAgGgVd4FdkWyfWfu_aqWtUtEbFvevXiJE90UzmYEcA@mail.gmail.com>
X-Provags-ID: V03:K1:K3qH4RgLRMRae+6W1gyL4WWhh6D7FQQEGCtNobZjvbPxK7jH4Ic
 snL+Lkf+KViTqLVzFGXznJLDrPV3CvLt139ujb1rX3b+olc6I1uPePi+RIeXITF3giiKYFk
 znhAClDdgYbhwmG4b5ADoJrdRIdwQlv9yCrBkIOAbz54WGxieQMrKeG1RGgMKaxi/p+IBEI
 Qin5hoAKAyQJ7BF5ppeGA==
UI-OutboundReport: notjunk:1;M01:P0:Jon/px9KEmo=;3lr7e5ZsZ1vN8PKicGe4nPAj4y3
 xlZzUqg/5UfFNG2Y7sgEQIpZu9VGbYRWTufW3epXvkayCE0BusObSAfBSX+QM+Ta122S2/5Qi
 9WYQHFqa4Iz5HCX5le2HaLsZdFEs37YOwJCQHfi2KHGiKRwAZrjpI2XaljBFUOshMaDHK9dpS
 SO0DyNjUEyW6EcBTBahwTumq1BN1DRrMFaLp8QlJfI1CXh8Cc1vOupi2tRvCZeMr7qeSSGgz1
 YZHl7BG+apaWZx0JnUkyz1BLPOaAauxDiIyksHQXfnsMSFJalau1SmbMf/LSIFAMigI4aN6GB
 QQYdSc0A6Zjo5XBLRt6Ol6R3x2eiu6PWXhJB3g7aIeuARylXPK9F2qVAGZmWfpemofvl/3yCJ
 0S9GvJ1+aVNKLc8roSxTmoOZ4BN2YeAFZTwHc6O0BixKmtrMmQfmd6rzmmzVxotEmxhJ7OEBN
 XkoEXTrEt/j2Eloh3BC82ero3m1xMYJttVxgBwfP6xbzRa+/cqviu6YpDeaL93YHZA0BzeCIH
 +BbvKfNlLFC5I9KBzhaltHq7GPatPuYPisrJGdG1dATK54M01dZ+I1QhxLS5Tbpq/xe055cUl
 LjXNbQ76KAFvpZQ10fVJa6tRdPc9kFJ59f1nUi+TGB2HkwARemoBR6ZAFyud+3WvojzTYg+AS
 MPNNz8I2NpKBPNfDa8YGYTonA5bAI1LwQ7rfOpRbWJSwhEdPFWRZXiiKrur9YhLBdM6pUwB9g
 KcWCt5qul7y9T0QQ8KbgQ17H1CfZYB3bl98moGlV7YpnOnDkfbZeKYZ3cwrahqW0DWGXhn2qS
 cqc0aN6AT2UccIoTyZ1nHSJneFs0yK15gtUCSyqihGuBhvKFyS0yxwdyKDMDokiZjc0Cihqqh
 C6zYJFuF6dzgWLmMEzw0Kc66lidfc54kDWtkSVWEMlYbkXDbSvEhYTTOFSC/fF8rLRpHhHDtr
 txd4yg==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: web.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

dGhhbmsgeW91LCB2ZXJ5IHZhbHVhYmxlIQoKQW0gMDkuMDQuMjMgdW0gMjA6NTMgc2NocmllYiBS
b2dlciBIZWZsaW46Cj4gT24gU3VuLCBBcHIgOSwgMjAyMyBhdCAxOjIx4oCvUE0gUm9sYW5kIDxk
ZXZ6ZXJvQHdlYi5kZT4gd3JvdGU6Cj4+PiBXZWxsLCBpZiB0aGUgTFYgaXMgYmVpbmcgdXNlZCBm
b3IgYW55dGhpbmcgcmVhbCwgdGhlbiBJIGRvbid0IGtub3cgb2YKPj4+IGFueXRoaW5nIHdoZXJl
IHlvdSBjb3VsZCByZW1vdmUgYSBibG9jayBpbiB0aGUgbWlkZGxlIGFuZCBzdGlsbCBoYXZlIGEK
Pj4+IHdvcmtpbmcgZnMuICAgWW91IGNhbiBvbmx5IHJlZHVjZSBmcydlcyAodGhlIG9uZXMgdGhh
dCB5b3UgY2FuIHJlZHVjZSkKPj4+IGJ5IHJlZHVjaW5nIG9mZiBvZiB0aGUgZW5kIGFuZCBtYWtp
bmcgaXQgc21hbGxlci4KPj4geWVzLCB0aGF0J3MgY2xlYXIgdG8gbWUuCj4+Cj4+PiBJdCBtYWtl
cyB6ZXJvIHNlbnNlIHRvIGJlIGFibGUgdG8gcmVtb3ZlIGEgYmxvY2sgaW4gdGhlIG1pZGRsZSBv
ZiBhIExWCj4+PiB1c2VkIGJ5IGp1c3QgYWJvdXQgZXZlcnl0aGluZyB0aGF0IHVzZXMgTFYncyBh
cyBub3RoaW5nIHN1cHBvcnRzIGJlaW5nCj4+PiBhYmxlIHRvIHJlbW92ZSBhIGJsb2NrIGluIHRo
ZSBtaWRkbGUuCj4+IHllcywgdGhhdCBjcml0aWNzIGlzIHRvdGFsbHkgdmFsaWQuIGZyb20gYSBm
cyBwb2ludCBvZiB2aWV3IHlvdSBjb21wbGV0ZWx5Cj4+IGNvcnJ1cHQgIHRoZSB2b2x1bWUsIHRo
YXQncyBjbGVhciB0byBtZS4KPj4KPj4+IFdoYXQgaXMgeW91ciB1c2UgY2FzZSB0aGF0IHlvdSBi
ZWxpZXZlIHJlbW92aW5nIGEgYmxvY2sgaW4gdGhlIG1pZGRsZQo+Pj4gb2YgYW4gTFYgbmVlZHMg
dG8gd29yaz8KPj4gbXkgdXNlIGNhc2UgaXMgY3JlYXRpbmcgc29tZSBiYWRibG9ja3Mgc2NyaXB0
IHdpdGggbHZtIHdoaWNoIGludGVsbGlnZW50bHkKPj4gaGFuZGxlcyBhbmQgc2tpcHMgYnJva2Vu
IHNlY3RvcnMgb24gZGlza3Mgd2hpY2ggY2FuJ3QgYmUgdXNlZCBvdGhlcndpc2UuLi4KPj4KPj4g
bXkgcGxhbiBpcyB0byBzY2FuIGEgZGlzayBmb3IgdXNhYmxlIHNlY3RvcnMgYW5kIG1hcCB0aGUg
bG9naWNhbCB2b2x1bWUKPj4gYXJvdW5kIHRoZSBicm9rZW4gc2VjdG9ycy4KPj4KPj4gd2hlbmV2
ZXIgbW9yZSBzZWN0b3JzIGdldCBicm9rZW4sIGknZCBsaWtlIHRvIHJlbW92ZSB0aGUgYnJva2Vu
IG9uZXMgdG8gaGF2ZQo+PiBhIHVzYWJsZSBsdiB3aXRob3V0IGJyb2tlbiBzZWN0b3JzLgo+Pgo+
PiBzaW5jZSB5b3UgbmVlZCB0byByZWJ1aWxkIHlvdXIgZGF0YSBhbnl3YXkgZm9yIHRoYXQgZGlz
aywgeW91IGNhbiBhbHNvCj4+IHJlY3JlYXRlIHRoZSB3aG9sZSBsb2dpY2FsIHZvbHVtZS4KPj4K
Pj4gbXkgcXVlc3Rpb24gYW5kIG15IHByb2plY3QgaXMgYSBsaXR0bGUgYml0IGFjYWRlbWljLiBp
J2Qgc2ltcGx5IHdhbnQgdG8gdHJ5Cj4+IG91dCBob3cgbXVjaCB1c2UgeW91IGNhbiBoYXZlIGZy
b20gc29tZSBkZWFkIGRpc2tzIHdoaWNoIGFyZSB0cmFzaCBvdGhlcndpc2UuLi4KPj4KPj4KPj4g
dGhlIG1hbnBhZ2UgaXMgdGVsbGluZyB0aGlzOgo+Pgo+Pgo+PiAgICAgICAgICBSZXNpemUgYW4g
TFYgYnkgc3BlY2lmaWVkIFBWIGV4dGVudHMuCj4+Cj4+ICAgICAgICAgIGx2cmVzaXplIExWIFBW
IC4uLgo+PiAgICAgICAgICAgICAgWyAtcnwtLXJlc2l6ZWZzIF0KPj4gICAgICAgICAgICAgIFsg
Q09NTU9OX09QVElPTlMgXQo+Pgo+Pgo+Pgo+PiBzbywgdGhhdCBzb3VuZHMgbGlrZSB0aGF0IGkg
Y2FuIHJlc2l6ZSBpbiBhbnkgZGlyZWN0aW9uIGJ5IHNwZWNpZnlpbmcgZXh0ZW50cy4KPj4KPj4K
Pj4+IE5vdyBpZiB5b3UgcmVhbGx5IG5lZWQgdG8gcmVtb3ZlIGEgc3BlY2lmaWMgYmxvY2sgaW4g
dGhlIG1pZGRsZSBvZiB0aGUKPj4+IExWIHRoZW4geW91IGFyZSBsaWtlbHkgZ29pbmcgdG8gbmVl
ZCB0byB1c2UgcHZtb3ZlIHdpdGggc3BlY2lmaWMKPj4+IGJsb2NrcyB0byByZXBsYWNlIHRob3Nl
IGJsb2NrcyB3aXRoIHNvbWV0aGluZyBlbHNlLgo+PiB5ZXMsIHB2bW92ZSBpcyB0aGUgb3RoZXIg
YXBwcm9hY2ggZm9yIHRoYXQuCj4+Cj4+IGJ1dCB3aWxsIHB2bW92ZSBjb250aW51ZS9maW5pc2gg
YnkgYWxsIG1lYW5zIHdoZW4gbW92aW5nIGV4dGVudHMgbG9jYXRlZCBvbiBhCj4+IGJhZCBzZWN0
b3IgPwo+Pgo+PiB0aGUgZGF0YSBtYXkgYmUgY29ycnVwdGVkIGFueXdoeSwgc28gaSB0aG91Z2h0
IGl0J3MgYmV0dGVyIHRvIHNraXAgaXQuCj4+Cj4+IHdoYXQgaSdtIHJlYWxseSBhZnRlciBpcyBz
b21lICJyZW1hcCBhIHBoeXNpY2FsIGV4dGVudCB0byBhIGhlYWx0eS9yZXNlcnZlZAo+PiBzZWN0
aW9uIGFuZCBsZXQgemZzIHNlbGZoZWFsIGRvIHRoZSByZXN0Ii4gIGp1c3QgbGlrZSAiZGlzbWlz
cyB0aGUgcHJvYmxlbWF0aWMKPj4gZXh0ZW50cyBhbmQgcmVwbGFjZSB3aXRoIGhlYWx0aHkgZXh0
ZW50cyIuCj4+Cj4+IGknZCBiZXR0ZXIgbGlrZSByZW1hcHBpbmcgaW5zdGVhZCBvZiByZW1vdmlu
ZyBhIFBFLCBhcyByZW1vdmluZyB3aWxsIGludmFsaWRhdGUKPj4gdGhlIHdob2xlIExWLi4uLgo+
Pgo+PiByb2xhbmQKPj4KPgo+IENyZWF0ZSBhbiBMViBwZXIgZGV2aWNlLCBhbmQgd2hlbiB0aGUg
ZGV2aWNlIGlzIHJlcGxhY2VkIHRoZW4gbHZyZW1vdmUKPiB0aGUgZGV2aWNlcyBsaXN0LiAgT25j
ZSBhIHNlY3Rvci9hcmVhIGlzIGJhZCBJIHdvdWxkIG5vdCB0cnVzdCB0aGUKPiBzZWN0b3JzIHVu
dGlsIHlvdSByZXBsYWNlIHRoZSBkZXZpY2UuICBZb3UgbWF5IGJlIGFibGUgdG8gdHJ5IHRoZQo+
IHB2bW92ZSBtdWx0aXBsZSB0aW1lcyBhbmQgdGhlIGRpc2sgbWF5IGJlIGFibGUgdG8gZXZlbnR1
YWxseSByZWJ1aWxkCj4gdGhlIGRhdGEuCj4KPiBNeSBleHBlcmllbmNlIHdpdGggYmFkIHNlY3Rv
cnMgaXMgb25jZSBpdCByZXBvcnRzIGJhZCB0aGUgZGlza3Mgd2lsbAo+IG9mdGVuIHJld3JpdGUg
aXQgYXQgdGhlIHNhbWUgbG9jYXRpb24gYW5kIGNhbGwgaXQgImdvb2QiIHdoZW4gaXQgaXMKPiBn
b2luZyB0byByZXBvcnQgYmFkIGFnYWluIGFsbW9zdCBpbW1lZGlhdGVseSwgb3IgYmUgYSB1c2Vs
ZXNzbHkgc2xvdwo+IHNlY3Rvci4gICBTb21ldGltZXMgaXQgd2lsbCByZXBsYWNlIHRoZSBzZWN0
b3Igb24gYQo+IHJlLXdyaXRlL3N1Y2Nlc3NmdWwgcmVhZCBidXQgdGhhdCBzZWVtcyB1bnJlbGlh
YmxlLgo+Cj4gT24gbm9uLXpmcyBmcydlcyBJIGhhdmUgZm91bmQgdGhlICJiYWQiIGZpbGUgYW5k
IHJlbmFtZWQgaXQKPiBiYWRmaWxlLiMjIyMgYW5kIHB1dCBpdCBpbiBhIGRpciBjYWxsZWQgYmFk
YmxvY2tzLiAgU28gbG9uZyBhcyB0aGUgYmFkCj4gYmxvY2sgaXMgaW4gdGhlIGZpbGUgZGF0YSB0
aGVuIHlvdSBjYW4gY29udGFpbiB0aGUgYmFkYmxvY2sgYnkKPiBjb250YWluaW5nIHRoZSBiYWQg
ZmlsZS4gICBBbmQgc2luY2UgbW9zdCBvZiB0aGUgZGlzayB3aWxsIGJlIGZpbGUKPiBkYXRhIHRo
YXQgc2hvdWxkIGFsc28gYmUgYSBtYW5hZ2VtZW50IHNjaGVtZSBub3QgcmVxdWlyaW5nIGEgZnMK
PiByZWJ1aWxkLgo+Cj4gVGhlIHJlLXdyaXR0ZW4gc2VjdG9yIG1heSBhbHNvIGJlICJzbG93IiBh
bmQgaXQgbWlnaHQgYmUgd2lzZSB0byB0cmVhdAo+IHRob3NlIHNlY3RvcnMgYXMgYmFkLCBhbmQg
aW4gdGhlICJzbG93IiBzZWN0b3IgY2FzZSBwdm1vdmUgc2hvdWxkCj4gYWN0dWFsbHkgd29yay4g
IEZvciB0aGF0IHlvdSB3b3VsZCBuZWVkIGEgYmFkYmxvY2tzIHRoYXQgInRpbWVkIiB0aGUKPiBy
ZWFkcyB0byBkaXNrIGFuZCB0cmVhdHMgYW55IHNlY3RvciB0YWtpbmcgbG9uZ2VyIHRoYXQgZXZl
biBzYXkgLjI1Cj4gc2Vjb25kcyBhcyBzbG93L2JhZC4gICBBdCA1NDAwIHJwbSwgLjI1LzI1MG1z
IHRyYW5zbGF0ZXMgdG8gYXJvdW5kIDIyCj4gZmFpbGVkIHJlLXJlYWQgdHJpZXMuICAgSWYgeW91
IHRpbWUgaXQgeW91IG1heSBoYXZlIHRvIGRvIHNvbWUgdGVzdGluZwo+IG9uIHRoZSBlbnRpcmUg
Z3JvdXAgb2YgcmVhZHMgaW4gc21hbGxlciBhbGlnbmVkIHNlY3RvcnMgdG8gZmlndXJlIG91dAo+
IHdoaWNoIHNlY3RvciBpbiB0aGUgbWFpbiByZWFkIHdhcyBiYWQuICBJZiB5b3Ugc2Nhbm5lZCBv
ZnRlbiBlbm91Z2gKPiBmb3Igc2xvd3MgeW91IG1pZ2h0IGNhdGNoIHRoZW0gYmVmb3JlIHRoZXkg
YXJlIGNvbXBsZXRlbHkgYmFkLgo+IFRlY2huaWNhbGx5IHRoZSBkaXNrIGlzIHN1cHBvc2VkIHRv
IGRvIHRoYXQgb24gaXRzIHNjYW5zLCBidXQgZXZlbgo+IHdoZW4gSSBoYXZlIHR1cm5lZCB0aGUg
c2NhbnMgdXAgdG8gZGFpbHkgaXQgZG9lcyBub3Qgc2VlbSB0byBhY3QKPiByaWdodC4KPgo+IEFu
ZCBJIGhhdmUgdXN1YWxseSBmb3VuZCB0aGF0IHRoZSBiYWQgInVuaXRzIiBhcmUgOCB1bml0cyBv
ZiA4Cj4gNTEyLWJ5dGUgc2VjdG9ycyBmb3IgYSB0b3RhbCBvZiBhcm91bmQgMzJrIChhbGlnbmVk
IG9uIHRoZSBkaXNrKS4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gbGludXgtbHZtIG1haWxpbmcgbGlzdAo+IGxpbnV4LWx2bUByZWRoYXQuY29t
Cj4gaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0K
PiByZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1s
dm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRo
YXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQg
aHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

