Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C5DC25B08
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Aug 2022 18:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660762798;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2/PXJkshyya09whPMtbpvgU+GSqrMagG6N+JyWDams0=;
	b=ZQHyEp3WdzIMITcGzTZQWV840UAmiRo/HCJRQ6E+n5kAzoFLq+hkgiYz75ycL9Ztp9KVhL
	hEI9gFgaAR1b3HQMttvc2ke3/6DwBiMOSnhjRsEWljR/NlHFtY0hcMAMr2mNr+etsPM2rG
	1kJxnH702szbYqfUcJjzIVwczg2kDzU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-TzNbaCjaOpWdt0ecdTwRkA-1; Wed, 17 Aug 2022 14:59:55 -0400
X-MC-Unique: TzNbaCjaOpWdt0ecdTwRkA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E9538041BE;
	Wed, 17 Aug 2022 18:59:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 085EF492C3B;
	Wed, 17 Aug 2022 18:59:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B6383194E00A;
	Wed, 17 Aug 2022 18:59:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2ABC8193F6F6
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 18:59:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F3B579458A; Wed, 17 Aug 2022 18:59:31 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F032518EB5
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 18:59:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D524A85A584
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 18:59:31 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-195-Oas-uTQZOyOzkRFQkqWtSg-1; Wed,
 17 Aug 2022 14:59:30 -0400
X-MC-Unique: Oas-uTQZOyOzkRFQkqWtSg-1
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gllg-linux-lvm@m.gmane-mx.org>) id 1oOOBK-0006lt-S0
 for linux-lvm@redhat.com; Wed, 17 Aug 2022 20:54:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: linux-lvm@redhat.com
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Date: Wed, 17 Aug 2022 20:54:18 +0200
Message-ID: <007c8163-7480-951c-c8b6-78fe47b3a874@gmail.com>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
 <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
 <20220817084343.33la7o6fdh5txul4@c73>
 <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
 <20220817104732.jhu3ug6ahep3rnpq@c73>
 <b36cd2879a9ccaf25d0bb0389291e331adcc68c6.camel@suse.com>
 <727dcd28-99a2-739b-debd-a921e477e0d3@gmail.com>
 <4e0551e18a28ff602fae6e419dc746145e5962d3.camel@suse.com>
 <6be41a4e-9764-03ba-7231-911c733ffecd@gmail.com>
 <6a1d353d97a6dcdb658affe54b04c1be@assyoma.it>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
In-Reply-To: <6a1d353d97a6dcdb658affe54b04c1be@assyoma.it>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Cc: Martin Wilck <martin.wilck@suse.com>, teigland@redhat.com,
 Heming Zhao <heming.zhao@suse.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Message-ID: <20220817185418.cXNyhanV_cG_W2Qh2FB0zcIZzCqw_nwAQv6BiIQpZg8@z>

RG5lIDE3LiAwOC4gMjIgdiAxOTozNSBHaW9uYXRhbiBEYW50aSBuYXBzYWwoYSk6Cj4gSWwgMjAy
Mi0wOC0xNyAxNzoyNiBaZGVuZWsgS2FiZWxhYyBoYSBzY3JpdHRvOgo+Pj4gSSBsaWtlIHRoZSBn
ZW5lcmFsIGlkZWEgb2YgdGhlIHVkZXYgd2F0Y2guIEl0IGlzIHRoZSBtYWdpYyB0aGF0IGNhdXNl
cwo+Pj4gbmV3bHkgY3JlYXRlZCBwYXJ0aXRpb25zIHRvIG1hZ2ljYWxseSBhcHBlYXIgaW4gdGhl
IHN5c3RlbSwgd2hpY2ggaXMKPiAKPiBXb3VsZCBkaXNhYmxpbmcgdGhlIHdhdGNoIHJ1bGUgYmUg
YSByZWFzb25hYmxlIGFwcHJvYWNoIGluIHRoaXMgY2FzZT8gSWYgdGhlIAo+IHVzZXIgd2FudCB0
byBzY2FuIGEgbmV3IGRldmljZSwgaXQgb25seSBuZWVkcyB0byBpc3N1ZSBwYXJ0cHJvYmUgb3Ig
a3BhcnR4LCBvciAKPiBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKQmVmb3JlIGRpdmluZyBpbnRv
IHRoZXNlICdkZWVwIHdhdGVycycgIC0gSSdkIHJlYWxseSBsaWtlIHRvIGZpcnN0IHNlZSBpZiB0
aGUgCnByb2JsZW0gaXMgc3RpbGwgc3VjaCBhbiBpc3N1ZSB3aXRoIG91ciB1cHN0cmVhbSBjb2Rl
IGJhc2UuCgpUaGVyZSBoYXZlIGJlZW4gbG90IG9mIG1pbm9yIG9wdGltaXphdGlvbiBjb21taXR0
ZWQgb3ZlciB0aGUgdGltZSAtIHNvIHRoZSAKYW1vdW50IG9mIGZpcmVkICd3YXRjaCcgcnVsZXMg
c2hvdWxkIGJlIGNvbnNpZGVyYWJseSBzbWFsbGVyIHRoZW4gdGhlIHZlcnNpb24gCm1lbnRpb25l
ZCBpbiBjdXN0b21lciBpc3N1ZS4KCj4+IFRoZXJlIGlzIG9uIGdvaW5nwqAgJ1NJRCcgcHJvamVj
dCAtIHRoYXQgbWlnaHQgcHVzaCB0aGUgbG9naWMgc29tZXdoYXQKPj4gZnVydGhlciwgYnV0IGV4
aXN0aW5nICdkZXZpY2UnIHN1cHBvcnQgbG9naWMgYXMgaXMgdG9kYXkgaXMKPj4gdW5mb3J0dW5h
dGUgJ3RyYWNlJyBvZiBob3cgdGhlIGRlc2lnbiBzaG91bGQgbm90IGhhdmUgYmVlbiBtYWRlIC0g
YW5kCj4+IHNpbmNlIGFsbCAnb3JpZ2luYWwnIHByb2dyYW1tZXJzIGxlZnQgdGhlIHByb2plY3Qg
bG9uZyB0aW1lIGFnbyAtIGl0J3MKPj4gbm9uLXRyaXZpYWwgdG8gcHVzaCB0aGluZ3MgZm9yd2Fy
ZC4KPiAKPiBXZWxsLCB0aGlzIGlzIG5vdCBnb29kIG5ld3MuIEp1c3QgZm9yIG15IGVkdWNhdGlv
biwgaXQgaXMgcG9zc2liaWxlIHRvIHJ1biBhIAo+IG1vZGVybiBsaW51eCBkaXN0cm8gd2l0aG91
dCB1ZGV2IGF0IGFsbD8gSSBzdGlsbCByZW1lbWJlciB3aGVuIHRoZSBuZXcgY29vbCAKPiB0aGlu
ZyBmb3IgZGV2aWNlIGF1dG9kaXNjb3Zlcnkgd2FzIGRldmZzICh3aXRoIHNvbWUgZGlzdHJvIC0g
bGlrZSBnZW50b28gLSAKPiB0YWtpbmcgdGhlIGFsdGVybmF0aXZlIGFwcHJvYWNoIHRvIHNpbXBs
eSB0YXJyaWcgJiB1bnRhcnJpbmcgbXVjaCBvZiB0aGUgCj4gZW50aXJlIC9kZXYvIGZpbGVzIHRv
IHByZXBvcHVsYXRlIHRoZSBtYWpvcittaW5vciBudW1iZXIuLi4gPgo+PiBXZSBqdXN0IGhvcGUg
dGhlIFNJRCB3aWxsIG1ha2Ugc29tZSBwcm9ncmVzcyAoYWx0aG91Z2ggcHJvYmFibHkgc21hbGwK
Pj4gb25lIGF0IHRoZSBiZWdpbm5pbmcpLgo+IAo+IEFueSBpbmZvIG9uIHRoZSBwcm9qZWN0PwoK
aHR0cHM6Ly9naXRodWIuY29tL3ByYWpub2hhL3NpZAoKClpkZW5lawoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdAps
aW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9I
T1dUTy9MVk0tSE9XVE8vCg==

