Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C280C6FA8E
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Mar 2023 08:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677746045;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lLMjJa1zZWISMmm5qEhzRkiBIovsfduP5XMAwL9uKQo=;
	b=I4uBy/FYkXOXHbaB6cVFyTPIkQMJxLaP44k6k1dRATwwcqR/CwYclCX2H0qul/cPWWLxx6
	y1GNS2ZI9nbXRJ4otuytaEREbDSCjbHuzcP6ttih60i1Er+EZ9GTwD4ddkF4qHegpZc8y/
	Relqrz+/Or2bAjgrW9lYJaJ7ug+WP10=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-asvQyWf8PsWf9mYbk0HkdQ-1; Thu, 02 Mar 2023 03:34:01 -0500
X-MC-Unique: asvQyWf8PsWf9mYbk0HkdQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1FC5803490;
	Thu,  2 Mar 2023 08:33:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 749D214171B8;
	Thu,  2 Mar 2023 08:33:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3C6FA19452D0;
	Thu,  2 Mar 2023 08:33:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E9A719452CD
 for <linux-lvm@listman.corp.redhat.com>; Thu,  2 Mar 2023 08:33:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6035540CF8E2; Thu,  2 Mar 2023 08:33:54 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 588D0400EA93
 for <linux-lvm@redhat.com>; Thu,  2 Mar 2023 08:33:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2579E3C0F198
 for <linux-lvm@redhat.com>; Thu,  2 Mar 2023 08:33:54 +0000 (UTC)
Received: from zimbra.karlsbakk.net (zimbra.karlsbakk.net [193.29.58.196])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-YkuizeSdPFWdVAVJUVHpMw-1; Thu, 02 Mar 2023 03:33:51 -0500
X-MC-Unique: YkuizeSdPFWdVAVJUVHpMw-1
Received: from localhost (localhost.localdomain [IPv6:::1])
 by zimbra.karlsbakk.net (Postfix) with ESMTP id 7F7BF3C1EC3;
 Thu,  2 Mar 2023 09:33:49 +0100 (CET)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
 by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10032)
 with ESMTP id STJmojEL-0jb; Thu,  2 Mar 2023 09:33:48 +0100 (CET)
Received: from localhost (localhost.localdomain [IPv6:::1])
 by zimbra.karlsbakk.net (Postfix) with ESMTP id 26B023C1ECC;
 Thu,  2 Mar 2023 09:33:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.karlsbakk.net 26B023C1ECC
X-Virus-Scanned: amavisd-new at zimbra.karlsbakk.net
Received: from zimbra.karlsbakk.net ([IPv6:::1])
 by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id 19FRnVS5o44A; Thu,  2 Mar 2023 09:33:47 +0100 (CET)
Received: from zimbra.karlsbakk.net (localhost.localdomain [127.0.0.1])
 by zimbra.karlsbakk.net (Postfix) with ESMTP id D671C3C1EC3;
 Thu,  2 Mar 2023 09:33:47 +0100 (CET)
Date: Thu, 2 Mar 2023 09:33:46 +0100 (CET)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
To: linux-lvm <linux-lvm@redhat.com>
Message-ID: <885248342.299.1677746026822.JavaMail.zimbra@karlsbakk.net>
In-Reply-To: <CAAMCDeftn7gLN8s3EMFer+jJ95dRkdpR4007hDMqNNhjrbGDJA@mail.gmail.com>
References: <2023967259.761825.1677710640334.JavaMail.zimbra@karlsbakk.net>
 <CAAMCDeftn7gLN8s3EMFer+jJ95dRkdpR4007hDMqNNhjrbGDJA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [::ffff:158.36.145.169]
Thread-Topic: lvconvert --uncache takes hours
Thread-Index: p6UTx8eipYVKWIG4LRBhmAYXHKx8yA==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [linux-lvm] lvconvert --uncache takes hours
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
Cc: Malin Bruland <malin.bruland@pm.me>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBGcm9tOiAiUm9nZXIgSGVmbGluIiA8cm9n
ZXJoZWZsaW5AZ21haWwuY29tPgo+IFRvOiAibGludXgtbHZtIiA8bGludXgtbHZtQHJlZGhhdC5j
b20+Cj4gQ2M6ICJNYWxpbiBCcnVsYW5kIiA8bWFsaW4uYnJ1bGFuZEBwbS5tZT4KPiBTZW50OiBU
aHVyc2RheSwgMiBNYXJjaCwgMjAyMyAwMTo1MTowOAo+IFN1YmplY3Q6IFJlOiBbbGludXgtbHZt
XSBsdmNvbnZlcnQgLS11bmNhY2hlIHRha2VzIGhvdXJzCgo+IE9uIFdlZCwgTWFyIDEsIDIwMjMg
YXQgNDo1MCBQTSBSb3kgU2lndXJkIEthcmxzYmFrayA8cm95QGthcmxzYmFray5uZXQ+IHdyb3Rl
Ogo+Pgo+PiBIaSBhbGwKPj4KPj4gV29ya2luZyB3aXRoIGEgZnJpZW5kJ3MgbWFjaGluZSwgaXQg
aGFzIGx2bWNhY2hlIHR1cm5lZCBvbiB3aXRoIHdyaXRlYmFjay4gVGhpcwo+PiBoYXMgd29ya2Vk
IHdlbGwsIGJ1dCBub3cgaXQncyB1bmNhY2hpbmcgYW5kIGl0IHRha2VzICpob3VycyouIFRoZSBh
bW91bnQgb2YKPj4gY2FjaGUgd2FzIGNob3NlbiB0byAxMDBHQiBvbiBhbiBTU0Qgbm90IHVzZWQg
Zm9yIG11Y2ggZWxzZSBhbmQgdGhlIGRhdGFzZXQgdGhhdAo+PiBpcyBiZWluZyBjYWNoZWQsIGlz
IGEgUkFJRC02IHNldCBvZiAxMHgyVEIgd2l0aCBYRlMgb24gdG9wLiBUaGUgc3lzdGVtIG1haW5s
eQo+PiB3b3JrcyB3aXRoIGZpbGUgc2VydmluZywgYnV0IGFsc28gaGFzIHNvbWUgVk1zIHRoYXQg
YmVuZWZpdCBmcm9tIHRoZSBjYWNoaW5nCj4+IHF1aXRlIGEgYml0LiBCdXQgdGhlbiAtIEkgd29u
ZGVyIC0gaG93IGNhbiBpdCBzcGVuZCBob3VycyBlbXB0eWluZyB0aGUgY2FjaGUKPj4gbGlrZSB0
aGlzPyBNb3N0IHdyaXRlIGNhY2hpbmcgSSBrbm93IG9mIGxhc3Qgb25seSBzZWNvbmRzIG9yIHBl
cmhhcHMgaW4gcmVhbGx5Cj4+IHdvcnN0IGNhc2Ugc2NlbmFyaW9zLCBtaW51dGVzLiBTaW5jZSB0
aGlzIGlzIHRha2luZyBob3VycywgaXQgbG9va3MgdG8gbWUKPj4gc29tZXRoaW5nIHNob3VsZCBo
YXZlIGJlZW4gZmx1c2hlZCBhZ2VzIGFnby4KPj4KPj4gSGF2ZSBJIChvciB3ZSkgZG9uZSBzb21l
dGhpbmcgdmVyeSBzdHVwaWQgaGVyZSBvciBpcyB0aGlzIHJlYWxseSBob3cgaXQncwo+PiBzdXBw
b3NlZCB0byB3b3JrPwo+Pgo+PiBWZW5ubGlnIGhpbHNlbgo+Pgo+PiByb3kKPiAKPiBBIHNwaW5u
aW5nIHJhaWQ2IGFycmF5IGlzIHNsb3cgb24gd3JpdGVzIChzZWUgcmFpZDYgIHdyaXRlIHBlbmFs
dHkpLgo+IEJlY2F1c2Ugb2YgdGhhdCB0aGUgYXJyYXkgY2FuIG9ubHkgZG8gYWJvdXQgMTAwIHdy
aXRlIG9wZXJhdHRpb25zL3NlYy4KCkFib3V0IDEwMCB3cml0ZXMvc2Vjb25kIHBlciBkYXRhIGRy
aXZlLCB0aGF0IGlzLiBtZCBwYXJhbGxpbHNlcyBJL08gd2VsbC4KCj4gSWYgdGhlIGRpc2sgaXMg
ZG9pbmcgb3RoZXIgd29yayB0aGVuIGl0IG9ubHkgaGFzIHRoZSBleHRyYSBjYXBhY2l0eSBzbwo+
IGl0IGNvdWxkIGRlc3RhZ2Ugc2xvd2VyLgoKVGhlIHN5c3RlbSB3YXMgbW9zdGx5IGlkbGUuCgo+
IEEgbG90IGRlcGVuZHMgb24gaG93IGJpZyBlYWNoIGNodW5rIGlzLiAgICAgVGhlIGx2bWNhY2hl
IGluZGljYXRlcyB0aGUKPiBzbWFsbGVzdCBjaHVua3NpemUgaXMgMzJrLgo+IAo+IDEwMEcgLyAz
MmsgPSAzIG1pbGxpb24sIGFuZCBhdCAxMDBzZWVrcy9zZWMgdGhhdCBjb21lcyB0byBhdCBsZWFz
dCBhbiBob3VyLgoKVGhvc2UgMTAwR0Igd2FzIG9uIFNTRCwgbm90IHNwaW5uaW5nIHJ1c3QuIExh
c3QgSSBjaGVja2VkLCB0aGF0IHdhcyB0aGUgd2hvbGUgcG9pbnQgd2l0aCBjYWNoaW5nLgoKPiBM
dm0gYm9va2tlZXBpbmcgaGFzIHRvIGFsc28gYmUgd3JpdHRlbiB0byB0aGUgc3Bpbm5pbmcgZGlz
a3MgSSB3b3VsZAo+IHRoaW5rLCBzbyAyIGhvdXJzIGlmIHRoZSBhcnJheSB3ZXJlIGlkbGUuCgpl
cm0gLSB3aHkgb24gZWFydGggd291bGQgeW91IGRvIHdyaXRlcyB0byBoZGQgaWYgeW91J3JlIGNh
Y2hpbmcgaXQ/Cgo+IFRocm93IGluIGEgNTAlIGJhc2Vsb2FkIG9uIHRoZSBkaXNrcyBhbmQgeW91
IGdldCA0IGhvdXJzLgo+IAo+IEhvdXJzIGlzIHJlYXNvbmFibGUuCgpBcyBJIHNhaWQsIHRoZSBz
eXN0ZW0gd2FzIGlkbGUuCgpWZW5ubGlnIGhpbHNlbgoKcm95Ci0tClJveSBTaWd1cmQgS2FybHNi
YWtrCigrNDcpIDk4MDEzMzU2Ci0tCkkgYWxsIHBlZGFnb2dpa2sgZXIgZGV0IGVzc2Vuc2llbHQg
YXQgcGVuc3VtIHByZXNlbnRlcmVzIGludGVsbGlnaWJlbHQuIERldCBlciBldCBlbGVtZW50w6Zy
dCBpbXBlcmF0aXYgZm9yIGFsbGUgcGVkYWdvZ2VyIMOlIHVubmfDpSBla3Nlc3NpdiBhbnZlbmRl
bHNlIGF2IGlkaW9tZXIgbWVkIHhlbm90eXAgZXR5bW9sb2dpLiBJIGRlIGZsZXN0ZSB0aWxmZWxs
ZXIgZWtzaXN0ZXJlciBhZGVrdmF0ZSBvZyByZWxldmFudGUgc3lub255bWVyIHDDpSBub3Jzay4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2
bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhh
dC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBo
dHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

