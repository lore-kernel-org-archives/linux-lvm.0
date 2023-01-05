Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B09DC53210
	for <linux-lvm@archiver.kernel.org>; Thu,  5 Jan 2023 00:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672878077;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EXc1AhhkuISTLzlcDItbRPQRFZNnMYgz8vHTlUI34OI=;
	b=JaTvD0W4JJR6o3J8MJAagY3STBaIvA5QejRPksNhelvh+G9NkS+q+X7rCTulV7CPjsAe3w
	OJxCmiXw0uhgWyVKtLITgfbcvWWVELVHQKNnKEpaxquKga2VmumY6w1ceG1wBV2lBjBR1f
	ZcD/2ep3+8yDdznK6SAIq+wFdC6vQfs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-qQq8lL6eNC6e5gkCAaKNSQ-1; Wed, 04 Jan 2023 19:21:13 -0500
X-MC-Unique: qQq8lL6eNC6e5gkCAaKNSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4B7B3C0F66B;
	Thu,  5 Jan 2023 00:21:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3AFA140EBF5;
	Thu,  5 Jan 2023 00:21:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A9994194658D;
	Thu,  5 Jan 2023 00:21:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C5E301946589
 for <linux-lvm@listman.corp.redhat.com>; Thu,  5 Jan 2023 00:21:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 67688C15BAE; Thu,  5 Jan 2023 00:21:05 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60804C15BAD
 for <linux-lvm@redhat.com>; Thu,  5 Jan 2023 00:21:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 463BA1818E46
 for <linux-lvm@redhat.com>; Thu,  5 Jan 2023 00:21:05 +0000 (UTC)
Received: from mail.stoffel.org (mail.stoffel.org [172.104.24.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-7-1rXB7WrhN3mm0QisH-V8jA-1; Wed,
 04 Jan 2023 19:21:03 -0500
X-MC-Unique: 1rXB7WrhN3mm0QisH-V8jA-1
Received: from smtpclient.apple (mobile-166-171-186-168.mycingular.net
 [166.171.186.168])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.stoffel.org (Postfix) with ESMTPSA id 9CC4620D75
 for <linux-lvm@redhat.com>; Wed,  4 Jan 2023 19:12:06 -0500 (EST)
From: John Stoffel <john@stoffel.org>
Mime-Version: 1.0 (1.0)
Date: Wed, 4 Jan 2023 19:12:04 -0500
Message-Id: <63619F57-52A2-4575-8936-22E0EB4498F0@stoffel.org>
References: <CAPgkq_Xzz9XaburH7EzCmsZDXqdOuEtO-Exs285uSMz4P67eAw@mail.gmail.com>
In-Reply-To: <CAPgkq_Xzz9XaburH7EzCmsZDXqdOuEtO-Exs285uSMz4P67eAw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [linux-lvm] Trouble with balancing physical volumes with pvmove
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q2FuIHlvdSBnaXZlIHVzIHRoZSBvdXRwdXQgb2Yg4oCYcHZz4oCZIGFuZOKAmWx2c+KAmSBzbyB3
ZSBjYW4gc2VlIHlvdXIgc2V0dXA/ICBJdOKAmXMgYWxzbyBub3QgcXVpdGUgY2xlYXIgd2hhdCBm
YWlsZWQsIGEgZGlzaz8gIElmIHNvLCB3aGljaCBvbmU/ICAKCkRvIHlvdSBoYXZlIGNvcHkgb2Yg
dGhlIGx2cyBhbmQgcHZzIG91dHB1dCBiZWZvcmUgeW91ciBmYWlsdXJlPyAgQW5kIHdoYXQgYWJv
dXQgY2F0IC9wcm9jL3BhcnRpdGlvbnMgb3V0cHV0IGFzIHdlbGwuCgoKClNlbnQgZnJvbSBteSBp
UGhvbmUKCj4gT24gSmFuIDIsIDIwMjMsIGF0IDI6NDQgQU0sIFJvYmVydCBPc293aWVja2kgPHJv
YmVydC5vc293aWVja2lAZ21haWwuY29tPiB3cm90ZToKPiAKPiDvu78KPiBEZWFyIExWTSBsaXN0
LAo+IAo+IEkgaGFkIHNldmVyYWwgUFYncyB3aXRoIG1haW5seSByYWlkMTAgdm9sdW1lcy4gV2hl
biBvbmUgb2YgdGhlbSBmYWlsZWQsIEkgd2FzIGFibGUgdG8gcmVjb3ZlciB3aXRoIGx2Y29udmVy
dCAtLXJlcGFpci4KPiAKPiBBZnRlciBmYWlsZWQgUFYgd2FzIHJlcGxhY2VkLCBpdCBsZWZ0IG1l
IHdpdGggYSBjb3VwbGUgb2YgZmlsbGVkIHVwIGFsbW9zdCB0byAxMDAlIFBWJ3MgYW5kIG9uZSAx
MDAlIGZyZWUuIEknZCBsaWtlIHRvIGNyZWF0ZSBtb3JlIHJhaWQxMCB2b2x1bWVzLCBidXQgSSdt
IHVuYWJsZSB0byBmcmVlIGFueSBzcGFjZS4uLgo+IAo+IFRoZSBmb2xsb3dpbmcgY29tbWFuZCAo
ZXh0ZW50cyByYW5nZSBjb3ZlciBvbmUgb2YgcmltYWdlX04gdm9sdW1lcykgd2FzIG9ubHkgc3Vj
Y2Vzc2Z1bCBmb3Igb25lICJtZXRhIiBhbmQgb25lICJyaW1hZ2VfMCIsIGJ1dCBpbiBhbGwgb3Ro
ZXIgY2FzZXMgZmFpbHMgbGlrZToKPiAKPiBbcm9vdEBjaGltZXJhIH5dIyBwdm1vdmUgL2Rldi9z
ZGc6MC0xNTM1OSAvZGV2L3NkaAo+ICAgSW5zdWZmaWNpZW50IGZyZWUgc3BhY2U6IDE1MzYwIGV4
dGVudHMgbmVlZGVkLCBidXQgb25seSAwIGF2YWlsYWJsZQo+ICAgVW5hYmxlIHRvIGFsbG9jYXRl
IG1pcnJvciBleHRlbnRzIGZvciB2Z2t2bS9wdm1vdmUwLgo+ICAgRmFpbGVkIHRvIGNvbnZlcnQg
cHZtb3ZlIExWIHRvIG1pcnJvcmVkLgo+IAo+IFdoeT8gVGhlcmUncyBjZXJ0YWlubHkgbG90cyBv
ZiBmcmVlIHNwYWNlIG9uIC9kZXYvc2RoLCBpdCdzIGFsbW9zdCBmcmVlIQo+IAo+IEkgZG9uJ3Qg
d2FudCB0byBiZSBmb3JjZWQgdG8gdXNlIG9ubHkgbGluZWFyIHZvbHVtZXMgZnJvbSBub3cuLi4g
cGxlYXNlIGhlbHAhCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBsaW51eC1sdm0gbWFpbGluZyBsaXN0Cj4gbGludXgtbHZtQHJlZGhhdC5jb20KPiBo
dHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQo+IHJl
YWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBt
YWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRw
Oi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

