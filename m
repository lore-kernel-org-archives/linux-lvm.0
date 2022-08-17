Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D93BC28B2B
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Aug 2022 16:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660753162;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=en22y8rvLZLEr+OArWk0FWokdm9488n/48HWhe+WvIY=;
	b=DA3cDcNJr0T7iOl84M6O/XQep8isYsYXtpuUTLTLFDvORbkpxY8JSknZc7EM5KdaX9zzsF
	cjjZTwisq1hSoRSZ0KePld7IYoXDjh6QYiniqYvlhhBQ9+MtcFLzRglV9WbRRZ8LiZNQVO
	+qxyxe4Text50R2Cqm7DJWu01sMTxfY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-C3kafJ35M6qloo4si4heXA-1; Wed, 17 Aug 2022 12:19:17 -0400
X-MC-Unique: C3kafJ35M6qloo4si4heXA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34D9E185A79C;
	Wed, 17 Aug 2022 16:19:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 010D2492C3B;
	Wed, 17 Aug 2022 16:19:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B1EC6194E00A;
	Wed, 17 Aug 2022 16:19:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 258151946A40
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 16:05:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 11825403348; Wed, 17 Aug 2022 16:05:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DB46403340
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 16:05:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA7BC101A586
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 16:05:57 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-VR3O-AChPt6b-psSE1X1xw-1; Wed, 17 Aug 2022 12:05:54 -0400
X-MC-Unique: VR3O-AChPt6b-psSE1X1xw-1
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4C88F5C017E;
 Wed, 17 Aug 2022 11:59:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Aug 2022 11:59:00 -0400
X-ME-Sender: <xms:RBD9YuABZPxIASZwdlXUqMOlUKT2dsrdL68ZxrzLxnkqhA4uEI3bUg>
 <xme:RBD9YogoupJz0dmzw5YmDLqo761glXnldQLnG5u0XXX3oLhsB8toh38K97UrUeITx
 VH7XkADdv91VB8>
X-ME-Received: <xmr:RBD9YhnKbf6VKZVetjlaz4ls5RHVHhpp32F1rKeRaQ2uNcIZxcOFp5ANz9E2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtgfgjgesthekredttddtjeenucfhrhhomhepffgvmhhi
 ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
 hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudfgieetueeuueeihefhfeetudfh
 iefgteekuedvgfeuhffggeegfedvkeegkeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomh
X-ME-Proxy: <xmx:RBD9YszuQDrW5DEojjPf6VjNPkfL6UVXALj9GVLr-G8WSW-y6xSX-w>
 <xmx:RBD9YjS5hGxQ4XzBZe0LxNYCspmO4puYOGN7Zr5j0S6yLV_73Yawzw>
 <xmx:RBD9YnYvvscerwswzU6nx1iIg5YJSah2YvD6jVtqX5MOKvMlgK29lQ>
 <xmx:RBD9YqKHgikwG41Hn5hH4FTQtVWIPcMOP1GxOBBX730jxLXDphbOoA>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 11:58:59 -0400 (EDT)
Date: Wed, 17 Aug 2022 11:58:58 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Martin Wilck <martin.wilck@suse.com>, Heming Zhao <heming.zhao@suse.com>
Message-ID: <Yv0QQrK/B23/06oC@itl-email>
References: <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
 <20220817084343.33la7o6fdh5txul4@c73>
 <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
 <20220817104732.jhu3ug6ahep3rnpq@c73>
 <b36cd2879a9ccaf25d0bb0389291e331adcc68c6.camel@suse.com>
 <727dcd28-99a2-739b-debd-a921e477e0d3@gmail.com>
 <4e0551e18a28ff602fae6e419dc746145e5962d3.camel@suse.com>
 <6be41a4e-9764-03ba-7231-911c733ffecd@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6be41a4e-9764-03ba-7231-911c733ffecd@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [linux-lvm] lvmpolld causes high cpu load issue
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
Cc: "teigland@redhat.com" <teigland@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQpIYXNoOiBTSEE1MTIKCk9uIFdlZCwg
QXVnIDE3LCAyMDIyIGF0IDA1OjI2OjA4UE0gKzAyMDAsIFpkZW5layBLYWJlbGFjIHdyb3RlOgo+
IERuZSAxNy4gMDguIDIyIHYgMTU6NDEgTWFydGluIFdpbGNrIG5hcHNhbChhKToKPiA+IE9uIFdl
ZCwgMjAyMi0wOC0xNyBhdCAxNDo1NCArMDIwMCwgWmRlbmVrIEthYmVsYWMgd3JvdGU6Cj4gPiA+
IERuZSAxNy4gMDguIDIyIHYgMTQ6MzkgTWFydGluIFdpbGNrIG5hcHNhbChhKToKPiA+ID4gCj4g
PiA+IAo+ID4gPiBMZXQncyBtYWtlIGNsZWFyIHdlIGFyZSB2ZXJ5IHdlbGwgYXdhcmUgb2YgYWxs
IHRoZSBjb25zdHJhaW5zCj4gPiA+IGFzc29jaWF0ZWQgd2l0aAo+ID4gPiB1ZGV2IHJ1bGUgbG9n
aWPCoCAoYW5kIHdlIHRyaWVkIHF1aXRlIGhhcmQgdG8gbWluaW1pemUgaW1wYWN0IC0KPiA+ID4g
aG93ZXZlciB1ZGV2ZAo+ID4gPiBkZXZlbG9wZXJzIGtpbmQgb2YgJ21pc3VuZGVyc3Rvb2QnwqAg
aG93IGJhZGx5IHRoZXkgd2lsbCBiZSBpbXBhY3RpbmcKPiA+ID4gc3lzdGVtJ3MKPiA+ID4gcGVy
Zm9ybWFuY2Ugd2l0aCB0aGUgZXhpc3Rpbmcgd2F0Y2ggcnVsZSBsb2dpYyAtIGFuZCB0aGUgc3Rv
cnkga2luZAo+ID4gPiBvZgo+ID4gPiAnY29udGludWVzJyB3aXRowqAgJ3N5c3RlbWQncycgJiBk
QnVzIHNlcnZpY2VzIHVuZm9ydHVuYXRlbGx5Li4uCj4gPiAKPiA+IEkgZGltbHkgcmVtZW1iZXIg
eW91IGRpc2xpa2UgdWRldiA7LSkKPiAKPiBXZWxsIGl0J3Mgbm90ICdhIGRpc2xpa2UnIGZyb20g
bXkgc2lkZSAtIGJ1dCB0aGUgYXJjaGl0ZWN0dXJlIGFsb25lIGlzIGp1c3QKPiBtaXNzaW5nIGlu
IG1hbnkgYXJlYXMuLi4KPiAKPiBEYXZlIGlzIGEgY29tcGxldGUgZGlzbGlrZXIgb2YgdWRldiAm
IHN5c3RlbWQgYWxsIHRvZ2V0aGVyIDopLi4uLgoKSSBmaW5kIHVkZXYgdXNlZnVsIGZvciBwaHlz
aWNhbCBkZXZpY2VzLCBidXQgZm9yIHZpcnR1YWwgZGV2aWNlcyBpdCBpcyBhCnRlcnJpYmxlIGZp
dC4gIEl0IGlzIGZhciB0b28gc2xvdyBhbmQgZnVsbCBvZiByYWNlIGNvbmRpdGlvbnMuCgpJZGVh
bGx5LCBkZXZpY2UtbWFwcGVyIGlvY3RscyB3b3VsZCB1c2UgZGlza3NlcSBpbnN0ZWFkIG9mIG1h
am9yK21pbm9yCm51bWJlciBldmVyeXdoZXJlLCBhbmQgZGV2aWNlcyB3b3VsZCBiZSBuYW1lZCBh
ZnRlciB0aGUgZGlza3NlcS4KCj4gPiBJIGxpa2UgdGhlIGdlbmVyYWwgaWRlYSBvZiB0aGUgdWRl
diB3YXRjaC4gSXQgaXMgdGhlIG1hZ2ljIHRoYXQgY2F1c2VzCj4gPiBuZXdseSBjcmVhdGVkIHBh
cnRpdGlvbnMgdG8gbWFnaWNhbGx5IGFwcGVhciBpbiB0aGUgc3lzdGVtLCB3aGljaCBpcwo+IAo+
IFRyYWdlZHkgb2YgZGVzaWduIGNvbWVzIGZyb20gdGhlIHBsYWluIGZhY3QgdGhhdCB0aGVyZSBh
cmUgb25seSAndmVyeQo+IG9jY2FzaW9uYWwnIGNvbnN1bWVycyBvZiBhbGwgdGhlc2UgJ2NvbGxl
Y3RlZCcgZGF0YSAtIGJ1dCBnYXRoZXJpbmcgYWxsIHRoZQo+IGluZm8gYW5kIGtlZXBpbmcgYWxs
IG9mIGl0ICd1cC10by1kYXRlJyBpcyBnZXR0aW5nIHZlcnkgdmVyeSBleHBlbnNpdmUgYW5kCj4g
Y2FuIGJhc2ljYWxseSAnbmV1dHJhbGl6ZScgYSBsb3Qgb2YgeW91ciBDUFUgaWYgeW91IGhhdmUg
dG9vIG1hbnkgcmVzb3VyY2VzCj4gdG8gd2F0Y2ggYW5kIGtlZXAgdXBkYXRlLi4uLi4KPiAKPiAK
PiA+IHZlcnkgY29udmVuaWVudCBmb3IgdXNlcnMgYW5kIHdvdWxkbid0IHdvcmsgb3RoZXJ3aXNl
LiBJIGNhbiBzZWUgdGhhdAo+ID4gaXQgbWlnaHQgYmUgaW5hcHByb3ByaWF0ZSBmb3IgTFZNIFBW
cy4gV2UgY2FuIGRpc2N1c3MgY2hhbmdpbmcgdGhlCj4gPiBydWxlcyBzdWNoIHRoYXQgdGhlIHdh
dGNoIGlzIGRpc2FibGVkIGZvciBMVk0gZGV2aWNlcyAoYm90aCBQViBhbmQgTFYpLgo+IAo+IEl0
J3MgcmVhbGx5IG5vdCBmaXhhYmxlIGFzIGlzIC0gc2luY2Ugb2YgdGhlIGNvbXBsZXRlIGxhY2sg
b2YgJ2Vycm9yJwo+IGhhbmRsaW5nIG9mIGRldmljZSBpbiB1ZGV2IERCIChpLmUuIGR1cGxpY2F0
ZSBkZXZpY2VzLi4uLiwgdmFyaW91cyBmcm96ZW4KPiBkZXZpY2VzLi4uKQo+IAo+IFRoZXJlIGlz
IG9uIGdvaW5nICAnU0lEJyBwcm9qZWN0IC0gdGhhdCBtaWdodCBwdXNoIHRoZSBsb2dpYyBzb21l
d2hhdAo+IGZ1cnRoZXIsIGJ1dCBleGlzdGluZyAnZGV2aWNlJyBzdXBwb3J0IGxvZ2ljIGFzIGlz
IHRvZGF5IGlzIHVuZm9ydHVuYXRlCj4gJ3RyYWNlJyBvZiBob3cgdGhlIGRlc2lnbiBzaG91bGQg
bm90IGhhdmUgYmVlbiBtYWRlIC0gYW5kIHNpbmNlIGFsbAo+ICdvcmlnaW5hbCcgcHJvZ3JhbW1l
cnMgbGVmdCB0aGUgcHJvamVjdCBsb25nIHRpbWUgYWdvIC0gaXQncyBub24tdHJpdmlhbCB0bwo+
IHB1c2ggdGhpbmdzIGZvcndhcmQuCgpXaGF0IGlzIHRoZSBTSUQgcHJvamVjdCwgd2hhdCBhcmUg
aXRzIGdvYWxzLCBhbmQgaG93IGRvZXMgaXQgcGxhbiB0bwphY2hpZXZlIHRoZW0/CgotIC0tIApT
aW5jZXJlbHksCkRlbWkgTWFyaWUgT2Jlbm91ciAoc2hlL2hlci9oZXJzKQpJbnZpc2libGUgVGhp
bmdzIExhYgotLS0tLUJFR0lOIFBHUCBTSUdOQVRVUkUtLS0tLQoKaVFJekJBRUJDZ0FkRmlFRWRv
ZE5ueE0ydWlKWkJ4eHhzb2kxWC8rY0lzRUZBbUw5RUVFQUNna1Fzb2kxWC8rYwpJc0VrTGhBQTAv
N0UxclA0NGJFRkNLNzZKekt2ZXZkbHhlN3NSQkVQdmduLzFtOVNpRW50QzQ3UWlFam5RZU5pCmNJ
OVJMbUhVbHBZUmdoZkRRTXE4dmhLazZhK05ibkdzV1R4M2pjaXFRcGgrNVNTSWZQVzlWdU5pOXcw
bmx2d1MKR1BITHdlTWFkQ2JsV3FYaDhYUDJSdkp4MVoxUWVYWjZrWWJmTWpoWmR4WTdhL3ZnMHJY
VGgwWGdoU3lyZ2ZZcwpsZ0ZiY3FkSmJFWDVxNzBPR2RzOHJoeEFiVGlCS25QSGgzejVhRlRDTjdJ
TFhPNGJsUldjcWhEdkFrMHczU1FmCmx0NVdnREJqWis1Z3YycE5pTnV3Wkl6cXNnTDZGREU0Q2NS
KzdKV2xBYWtDMUdjb2NWcDg3YW9pUjFoTkdNb2IKWlFvR2FpdnZJanFZd1NrV1VEVUFyUzhudGNL
UkJyL21ZQmNtNld1R1pGYldqYTZOVDJ0RVZKOHZjWGRyMng1VwpEb1BrN1Zrai9ZOXBPbjJrY1lR
TUtSMW1HT1FocTFBd2ltU0h1elBPZVdpZlVXTTVCT2tIN2hTNDZUeXEyYlpKCkJNL1FqVVFjbmNr
eUFnUFJZdStPV1AzSXZmT1UrYkZkVEthYmFvTmd0Q1Q4NW1mZ0w2NXNyOGt4MjNpa1FlWmIKUlE5
VmNiUW5KY2VLck5zcUJuQ0RFNFhlZ2g5NmVyNEdtKzY4Q3JkZ3MwYWRIT1RjeUM1OTM3UFBTVnk5
OWxzOApNYmtkUEVWR0hlNEwxVFM4WGhJNitOQ2Ywb2FGQ1ZFLzF2S2VTNHlPMjhWYlNuL04zcGJo
aU5GNmNwYzBzV0RnCk5BMG1iSXNsMTl0NGo4Q3RYVkNqUGVoMStSVUx2WHFoZWRRSUMveEpGM0Zz
ZXJBSW5rYz0KPUo3WVkKLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0tLS0tCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0
CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3Jn
L0hPV1RPL0xWTS1IT1dUTy8K

