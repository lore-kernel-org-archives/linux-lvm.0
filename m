Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5DAC433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 20 Dec 2021 16:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640019244;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iC/IqD4+SIgAqijDEXBrijrCv1ukrIJJWmIrqbGSSto=;
	b=DW6ZDWjblL9g9PWv2BXfFVuiUXwO1BaofrbskppiW5WZ1l+gvo49Uool7fzs+QvUdrCiT+
	fYK+kyPIeUL6pZ4vklQzQ4o5iylTmbtHT5e8c4IN/SKikI7xa/+H7kNkTQ/O9V7EiA8LZw
	pHQ1kTNy2mqiTEIXyJLxB/QVdJA6Zmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-7P_2jzugMaqWEdf0sQzjQQ-1; Mon, 20 Dec 2021 11:54:00 -0500
X-MC-Unique: 7P_2jzugMaqWEdf0sQzjQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8279C85B692;
	Mon, 20 Dec 2021 16:53:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 003547940B;
	Mon, 20 Dec 2021 16:53:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E3231809CB9;
	Mon, 20 Dec 2021 16:53:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BKGqiok008339 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 20 Dec 2021 11:52:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0B86C5BD01; Mon, 20 Dec 2021 16:52:44 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B95B9604CC;
	Mon, 20 Dec 2021 16:52:43 +0000 (UTC)
Date: Mon, 20 Dec 2021 10:52:41 -0600
From: David Teigland <teigland@redhat.com>
To: linux-lvm@harrier.ch, linux-lvm@redhat.com
Message-ID: <20211220165241.GA28533@redhat.com>
References: <39400.121121907140600191@us-mta-191.us.mimecast.lan>
MIME-Version: 1.0
In-Reply-To: <39400.121121907140600191@us-mta-191.us.mimecast.lan>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] LVM: Metadata on ... has wrong VG name
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCBEZWMgMTksIDIwMjEgYXQgMDc6MTQ6MDhBTSAtMDUwMCwgbGludXgtbHZtQGhhcnJp
ZXIuY2ggd3JvdGU6Cj4gICA+c3VkbyBwdnNjYW4KPiAgICBNZXRhZGF0YSBvbiAvZGV2L3NkZDIg
YXQgMTI4MDAgaGFzIHdyb25nIFZHIG5hbWUg4oCcZmVkb3JhMzIgewo+ICAgIGlkID0g4oCcZ0pn
Wk05LW4yUmQtVjd1cy1SV2FlLWNwVDYtSDg0RS1nN2RBc2vigJ0KPiAgICBzZXFubyA9IDkKPiAg
ICBmb3JtYXQgPSDigJxsdm0y4oCdCj4gICAgc3RhdHVzID0gW+KAnFJFU0laRUFCTEXigJ0sIOKA
nFJFQUTigJ0sIOKAnFdSSVRF4oCdXQo+ICAgIGZsYWfigJ0gZXhwZWN0ZWQgZmVkb3JhLgo+ICAg
IFdBUk5JTkc6IFJlYWRpbmcgVkcgZmVkb3JhIG9uIC9kZXYvc2RkMiBmYWlsZWQuCj4gICAgV0FS
TklORzogUFYgL2Rldi9zZGQyIGlzIG1hcmtlZCBpbiB1c2UgYnV0IG5vIFZHIHdhcyBmb3VuZCB1
c2luZyBpdC4KPiAgICBXQVJOSU5HOiBQViAvZGV2L3NkZDIgbWlnaHQgbmVlZCByZXBhaXJpbmcu
CgpJdCdzIG5vdCBjbGVhciBpZiB0aGVyZSdzIGEgcHJvYmxlbSB3aXRoIHRoZSBvbi1kaXNrIG1l
dGFkYXRhLCBvciBpZiB0aGUKcHZzY2FuIGlzIGNvbmZ1c2VkIGFuZCBtaXhpbmcgaW5mbyBmcm9t
IHRoZSBkdXBsaWNhdGVkIGRpc2tzLiAgWW91IGRvbid0CndhbnQgdG8gImZpeCIgbWV0YWRhdGEg
aWYgaXQncyBqdXN0IGEgcmVwb3J0aW5nIGVycm9yLCBzbyB1c2UgZmlsdGVycyB0bwpyZXBvcnQg
ZWFjaCBkZXZpY2UgaW4gaXNvbGF0aW9uOgoKcHZzIC0tY29uZmlnICdkZXZpY2VzL2ZpbHRlcj1b
ImF8L2Rldi9zZGQyfCIsICJyfC4qfCJdJyAvZGV2L3NkZDIKcHZzIC0tY29uZmlnICdkZXZpY2Vz
L2ZpbHRlcj1bImF8L2Rldi9zZGEyfCIsICJyfC4qfCJdJyAvZGV2L3NkYTIKCklmIGVhY2ggaXMg
ZGlzayBpcyBkaXNwbGF5ZWQgY29ycmVjdGx5IHdpdGhvdXQgZXJyb3IsIHRoZW4gdGhlIG9uLWRp
c2sKbWV0YWRhdGEgaXMgZmluZSAocGxlYXNlIGNyZWF0ZSBhIGJ6LCBvciBzZW5kLCB0aGUgb3V0
cHV0IG9mIHB2cyAtdnZ2dnYgc28Kd2UgY2FuIGZpeCBpdC4pICBUbyB3b3JrIGFyb3VuZCBpdCwg
dXNlIHRoZSBzYW1lIGZpbHRlciBpbiBsdm0uY29uZiB0bwpsaW1pdCBsdm0gYWNjZXNzIHRvIG9u
ZSBkaXNrIGF0IGEgdGltZSwgYW5kIGNoYW5nZSB0aGUgdmcgbmFtZSwgdmcgdXVpZCwKcHYgdXVp
ZCAoY2hhbmdpbmcgYWxsIGlzIHByb2JhYmx5IHVubmVjZXNzYXJ5LCB5b3UganVzdCB3YW50IGFs
bCB0aHJlZSBvZgp0aG9zZSB0byBiZSB1bmlxdWUgZm9yIGVhY2ggZGlzay4pCgpJZiB0aGUgaW5p
dGlhbCBwdnMgY29tbWFuZHMgd2l0aCBmaWx0ZXJzIHN0aWxsIHNob3cgZXJyb3JzLCB0aGVuIHRo
ZXJlIGFyZQpvbi1kaXNrIG1ldGFkYXRhIHByb2JsZW1zLiAgU2V0IHRoZSBsdm0uY29uZiBmaWx0
ZXIgdG8gbGltaXQgYWNjZXNzIHRvIHRoZQpvbmUgZGlzayB3aXRoIGVycm9ycywgdGhlbiB1c2Ug
dGhlIHB2Y2sgY29tbWFuZCB0byByZXBhaXIgaXQ6CgoxLiBsaXN0IG9sZGVyIHZlcnNpb25zIG9m
IG1ldGFkYXRhIG9uIHRoZSBkaXNrLgoKICAjIHB2Y2sgLS1kdW1wIG1ldGFkYXRhX2FsbCAvZGV2
L3NkeAoKMi4gcmV2aWV3IGxpc3QsIGFuZCBwaWNrIGEgdmVyc2lvbiB5b3UgdGhpbmsgaXMgYmVm
b3JlIGNoYW5nZXMsIG5vdGluZwogICAibWV0YWRhdGEgYXQgPG9mZnNldD4gLi4uIgoKMy4gc2F2
ZSB0aGF0IHZlcnNpb24gb2YgbWV0YWRhdGEgdG8gYSBmaWxlIHVzaW5nIHRoZSBvZmZzZXQKCiAg
IyBwdmNrIC0tZHVtcCBtZXRhZGF0YV9hbGwgLS1zZXR0aW5ncyBtZXRhZGF0YV9vZmZzZXQ9PG9m
ZnNldD4gLWYgbWV0YWZpbGUgL2Rldi9zZHgKCjQuIGxvb2sgYXQgdGhlIG1ldGFkYXRhIGZpbGUg
Y3JlYXRlZCBhbmQgY29uZmlybSBpdCdzIHdoYXQgeW91IHdhbnQsIG9yCiAgIHNhdmUgb3RoZXIg
ZmlsZXMgd2l0aCBvdGhlciB2ZXJzaW9ucyB0byBjb21wYXJlIHRoZW0uCgo1LiByZXBhaXIgdGhl
IFBWIHVzaW5nIHRoZSBmaWxlIGNvbnRhaW5pbmcgdGhlIG1ldGFkYXRhIHlvdSB3YW50CgogICMg
cHZjayAtLXJlcGFpciAtZiBtZXRhZmlsZSAvZGV2L3NkeAoKSWYgdGhpcyB3b3JrZWQsIHRoZW4g
dGhlICdwdnMnIGNvbW1hbmQgc2hvdWxkIGRpc3BsYXkgdGhlIGRpc2sgd2l0aG91dAplcnJvcnMu
ICBXaGlsZSB0aGlzIGRpc2sgcmVtYWlucyBpc29sYXRlZCB3aXRoIHRoZSBmaWx0ZXIsIHZlcmlm
eSB0aGUgTFZzCmNvbnRhaW4gdGhlIGRhdGEgeW91IHdhbnQuICBZb3UgbWF5IHdhbnQgdG8gY2hh
bmdlIHRoZSB2ZyBuYW1lLCB2ZyB1dWlkLApwdiB1dWlkIG9uIHRoaXMgZGlzayB3aGlsZSBpdCdz
IGlzb2xhdGVkIHRvIGVuc3VyZSB0aGVyZSB3b24ndCBiZQpkdXBsaWNhdGVkIGluZm8gbGF0ZXIu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
bHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0
IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

