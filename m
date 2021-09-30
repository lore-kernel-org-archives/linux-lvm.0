Return-Path: <SRS0=XKGo=OU=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4433DC433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 11:41:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA13760F70
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 11:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA13760F70
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633002093;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nNsNiRQ3Lax/HhXsgXcmwoR/GcWLL7YAA7n2ufbPGI0=;
	b=PH0J83KufhOS3s3oRSO/zYNggaWddqq68nETunQaZ75kRr/vvyDXFrwe8zZ+BigX93JDDs
	OpI43GZLD+fzo+47VaNOPm42NswaalmDEqs/voYrwxfmM9RnbCvqQEJ785bEOWBiyF5KEb
	fYTLQJL2c+cErRYgynta7WrKklNc1FQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-7YjmPJzrOCG2Vaj0ma-11Q-1; Thu, 30 Sep 2021 07:41:31 -0400
X-MC-Unique: 7YjmPJzrOCG2Vaj0ma-11Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F8B4801B3D;
	Thu, 30 Sep 2021 11:41:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32C835D9C6;
	Thu, 30 Sep 2021 11:41:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8D501803B30;
	Thu, 30 Sep 2021 11:41:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18UBfIiD022663 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 30 Sep 2021 07:41:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C56FE107130; Thu, 30 Sep 2021 11:41:18 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0083106A40
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 11:41:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5A3D811E76
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 11:41:11 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
	[209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-256-SrlJXbQ9PrGGyHD3i-23GQ-1; Thu, 30 Sep 2021 07:41:10 -0400
X-MC-Unique: SrlJXbQ9PrGGyHD3i-23GQ-1
Received: by mail-ed1-f72.google.com with SMTP id
	c8-20020a50d648000000b003daa53c7518so5681750edj.21
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 04:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:content-language:to
	:cc:references:from:subject:in-reply-to:content-transfer-encoding;
	bh=ji9Bn/MFJ9euF5To9qIoC2h3cKiokM0UGdtsUi0UnwU=;
	b=OH/AVRacgQOOhB0to+IXcfiwj0L/i3a0HAsCRdswEgQwcQ4VgAOi8Tx6XfaT4MSqQo
	IACmpH9Z3U3enhRYNRe4JJ5ySF346u8VSpJNFKvkKholezgBIbEz4m4lKBtrQIbeSn4R
	Zn4jdxSXvcCoC3QHbGvVNfyd5jZw79sBKTaVgri/hKYVQzdWxfxiilbjtxUqhLtNX5ur
	YYyL9C5BSZ4ISMU8XXB5hs9Qdna+9cOazkv2w/shP9PchetmX2BR02NIMo+NH0S1IJ17
	XyAo76o4sL7deVjzU+YplpvQQN4+xDyz1ZE0pkkXa/F6RVOjaKVjd1mQ08PUgOiZJH/3
	YqOA==
X-Gm-Message-State: AOAM533371iuxWdSFLsLefj5I/aayjZJ+nBVuGmVwElYjzMPFhJYzrlD
	HvhjsA7cUZGKm1UBqtFn0xGU+GuvmnlyF9p97MPpDQPfNpnd6kqfwEXhn3ZUR3hq0422uIMztLV
	Sjes3X7VrrXAOGAZc
X-Received: by 2002:a17:906:d215:: with SMTP id
	w21mr3143851ejz.448.1633002069327; 
	Thu, 30 Sep 2021 04:41:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIheCySKSpDXxTaMEz+ZqRW+ZF3xEHV3GBIudPvmtPE1LTTzkpRwQmRTXwhW5RnbWQJIyuUA==
X-Received: by 2002:a17:906:d215:: with SMTP id
	w21mr3143826ejz.448.1633002069114; 
	Thu, 30 Sep 2021 04:41:09 -0700 (PDT)
Received: from [192.168.0.5] ([85.13.73.241]) by smtp.gmail.com with ESMTPSA id
	j26sm1186310ejs.76.2021.09.30.04.41.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 30 Sep 2021 04:41:08 -0700 (PDT)
Message-ID: <d7248c67-afdf-9f27-bf41-13b74346f0c1@redhat.com>
Date: Thu, 30 Sep 2021 13:41:08 +0200
MIME-Version: 1.0
To: "heming.zhao@suse.com" <heming.zhao@suse.com>,
	Martin Wilck <martin.wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>
References: <20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
	<20210928174246.GF3087@octiron.msp.redhat.com>
	<20210929220653.p45cvgzdhlbnp4gy@alatyr-rpi.brq.redhat.com>
	<e8459ca73b148e9ba20cbde0041f6e5f4093699d.camel@suse.com>
	<a3ef9433-ccab-68ea-de00-caebd74e81dc@suse.com>
From: Peter Rajnoha <prajnoha@redhat.com>
In-Reply-To: <a3ef9433-ccab-68ea-de00-caebd74e81dc@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>
Subject: Re: [linux-lvm] Discussion: performance issue on event activation
 mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gOS8zMC8yMSAxMDowNywgaGVtaW5nLnpoYW9Ac3VzZS5jb20gd3JvdGU6Cj4gT24gOS8zMC8y
MSAzOjUxIFBNLCBNYXJ0aW4gV2lsY2sgd3JvdGU6Cj4+IE9uIFRodSwgMjAyMS0wOS0zMCBhdCAw
MDowNiArMDIwMCwgUGV0ZXIgUmFqbm9oYSB3cm90ZToKPj4+IE9uIFR1ZSAyOCBTZXAgMjAyMSAx
Mjo0MiwgQmVuamFtaW4gTWFyemluc2tpIHdyb3RlOgo+Pj4+IE9uIFR1ZSwgU2VwIDI4LCAyMDIx
IGF0IDAzOjE2OjA4UE0gKzAwMDAsIE1hcnRpbiBXaWxjayB3cm90ZToKPj4+Pj4gSSBoYXZlIHBv
bmRlcmVkIHRoaXMgcXVpdGUgYSBiaXQsIGJ1dCBJIGNhbid0IHNheSBJIGhhdmUgYQo+Pj4+PiBj
b25jcmV0ZQo+Pj4+PiBwbGFuLgo+Pj4+Pgo+Pj4+PiBUbyBhdm9pZCBkZXBlbmRpbmcgb24gInVk
ZXYgc2V0dGxlIiwgbXVsdGlwYXRoZCBuZWVkcyB0bwo+Pj4+PiBwYXJ0aWFsbHkKPj4+Pj4gcmV2
ZXJ0IHRvIHVkZXYtaW5kZXBlbmRlbnQgZGV2aWNlIGRldGVjdGlvbi4gQXQgbGVhc3QgZHVyaW5n
Cj4+Pj4+IGluaXRpYWwKPj4+Pj4gc3RhcnR1cCwgd2UgbWF5IGVuY291bnRlciBtdWx0aXBhdGgg
bWFwcyB3aXRoIG1lbWJlcnMgdGhhdCBkb24ndAo+Pj4+PiBleGlzdAo+Pj4+PiBpbiB0aGUgdWRl
diBkYiwgYW5kIHdlIG5lZWQgdG8gZGVhbCB3aXRoIHRoaXMgc2l0dWF0aW9uCj4+Pj4+IGdyYWNl
ZnVsbHkuIFdlCj4+Pj4+IGN1cnJlbnRseSBkb24ndCwgYW5kIGl0J3MgYSB0b3VnaCBwcm9ibGVt
IHRvIHNvbHZlIGNsZWFubHkuIE5vdAo+Pj4+PiByZWx5aW5nCj4+Pj4+IG9uIHVkZXYgb3BlbnMg
dXAgYSBQYW5kb3JhJ3MgYm94IHdydCBXV0lEIGRldGVybWluYXRpb24sIGZvcgo+Pj4+PiBleGFt
cGxlLgo+Pj4+PiBBbnkgc3VjaCBjaGFuZ2Ugd291bGQgd2l0aG91dCBkb3VidCBjYXJyeSBhIGxh
cmdlIHJpc2sgb2YKPj4+Pj4gcmVncmVzc2lvbnMKPj4+Pj4gaW4gc29tZSBzY2VuYXJpb3MsIHdo
aWNoIHdlIHdvdWxkbid0IHdhbnQgdG8gaGFwcGVuIGluIG91ciBsYXJnZQo+Pj4+PiBjdXN0b21l
cidzIGRhdGEgY2VudGVycy4KPj4+Pgo+Pj4+IEknbSBub3QgYWN0dWFsbHkgc3VyZSB0aGF0IGl0
J3MgYXMgYmFkIGFzIGFsbCB0aGF0LiBXZSBqdXN0IG1heQo+Pj4+IG5lZWQgYQo+Pj4+IHdheSBm
b3IgbXVsdGlwYXRoZCB0byBkZXRlY3QgaWYgdGhlIGNvbGRwbHVnIGhhcyBoYXBwZW5lZC7CoCBJ
J20KPj4+PiBzdXJlIGlmCj4+Pj4gd2Ugc2F5IHdlIG5lZWQgaXQgdG8gcmVtb3ZlIHRoZSB1ZGV2
IHNldHRsZSwgd2UgY2FuIGdldCBzb21lIG1ldGhvZAo+Pj4+IHRvCj4+Pj4gY2hlY2sgdGhpcy4g
UGVyaGFwcyB0aGVyZSBpcyBvbmUgYWxyZWFkeSwgdGhhdCBJIGRvbid0IGtub3cgYWJvdXQuCj4+
Pj4gSWYKPj4+Cj4+PiBUaGUgY29sZHBsdWcgZXZlbnRzIGFyZSBzeW50aGVzaXplZCBhbmQgYXMg
c3VjaCwgdGhleSBhbGwgbm93IGNvbnRhaW4KPj4+IFNZTlRIX1VVSUQ9PFVVSUQ+IGtleS12YWx1
ZSBwYWlyIHdpdGgga2VybmVsPj00LjEzOgo+Pj4KPj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50
YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtdWV2ZW50IAo+Pj4KPj4+Cj4+PiBJJ3ZlIGFscmVhZHkg
dHJpZWQgdG8gcHJvcG9zZWUgYSBwYXRjaCBmb3Igc3lzdGVtZC91ZGV2IHRoYXQgd291bGQKPj4+
IG1hcmsKPj4+IGFsbCB1ZXZlbnRzIGNvbWluZyBmcm9tIHRoZSB0cmlnZ2VyIChpbmNsdWRpbmcg
dGhlIG9uZSB1c2VkIGF0IGJvb3QKPj4+IGZvcgo+Pj4gY29sZHBsdWcpIHdpdGggYW4gZXh0cmEg
a2V5LXZhbHVlIHBhaXIgdGhhdCB3ZSBjb3VsZCBlYXNpbHkgbWF0Y2ggaW4KPj4+IHJ1bGVzLAo+
Pj4gYnV0IHRoYXQgd2FzIG5vdCBhY2NlcHRlZC4gU28gcmlnaHQgbm93LCB3ZSBjb3VsZCBkZXRl
Y3QgdGhhdAo+Pj4gc3ludGhlc2l6ZWQgdWV2ZW50IGhhcHBlbmVkLCB0aG91Z2ggd2UgY2FuJ3Qg
YmUgc3VyZSBpdCB3YXMgdGhlCj4+PiBhY3R1YWwKPj4+IHVkZXYgdHJpZ2dlciBhdCBib290LiBG
b3IgdGhhdCwgd2UnZCBuZWVkIHRoZSBleHRyYSBtYXJrcy4gSSBjYW4gZ2l2ZQo+Pj4gaXQKPj4+
IGFub3RoZXIgdHJ5IHRob3VnaCwgbWF5YmUgaWYgdGhlcmUgYXJlIG1vcmUgcGVvcGxlIGFza2lu
ZyBmb3IgdGhpcwo+Pj4gZnVuY3Rpb25hbGl0eSwgd2UnbGwgYmUgYXQgYmV0dGVyIHBvc2l0aW9u
IGZvciB0aGlzIHRvIGJlIGFjY2VwdGVkLgo+Pgo+PiBUaGF0IHdvdWxkIGFsbG93IHVzIHRvIGRp
c2Nlcm4gc3ludGhldGljIGV2ZW50cywgYnV0IEknbSB1bnN1cmUgaG93Cj4+IHRoaXMgd2hhdCBo
ZWxwIHVzLiBIZXJlLCB3aGF0IG1hdHRlcnMgaXMgdG8gZmlndXJlIG91dCB3aGVuIHdlIGRvbid0
Cj4+IGV4cGVjdCBhbnkgbW9yZSBvZiB0aGVtIHRvIGFycml2ZS4KPj4KPj4gSSBndWVzcyBpdCB3
b3VsZCBiZSBwb3NzaWJsZSB0byBjb21wYXJlIHRoZSBsaXN0IG9mIChpbnRlcmVzdGluZykKPj4g
ZGV2aWNlcyBpbiBzeXNmcyB3aXRoIHRoZSBsaXN0IG9mIGRldmljZXMgaW4gdGhlIHVkZXYgZGIu
IEZvcgo+PiBtdWx0aXBhdGhkLCB3ZSBjb3VsZAo+Pgo+PiDCoCAtIHNjYW4gc2V0IFUgb2YgdWRl
diBkZXZpY2VzIG9uIHN0YXJ0dXAKPj4gwqAgLSBzY2FuIHNldCBTIG9mIHN5c2ZzIGRldmljZXMg
b24gc3RhcnR1cAo+PiDCoCAtIGxpc3RlbiBmb3IgdWV2ZW50cyBmb3IgdXBkYXRpbmcgYm90aCBT
IGFuZCBVCj4+IMKgIC0gYWZ0ZXIgZWFjaCB1ZXZlbnQsIGNoZWNrIGlmIHRoZSBkaWZmZXJlbmNl
IHNldCBvZiBTIGFuZCBVIGlzIGVtdHB5Cj4+IMKgIC0gaWYgeWVzLCBjb2xkcGx1ZyBoYXMgZmlu
aXNoZWQKPj4gwqAgLSBvdGhlcndpc2UsIGNvbnRpbnVlIHdhaXRpbmcsIHBvc3NpYmx5IHVudGls
IHNvbWUgdGltZW91dCBleHBpcmVzLgo+Pgo+PiBJdCdzIG1vcmUgZGlmZmljdWx0IGZvciBMVk0g
YmVjYXVzZSB5b3UgaGF2ZSBubyBkYWVtb24gbWFpbnRhaW5pbmcKPj4gc3RhdGUuCj4+Cj4gCj4g
QW5vdGhlciBwZXJmb3JtYW5jZSBzdG9yeToKPiBUaGUgbGVnYWN5IGx2bTIgKDIuMDIueHgpIHdp
dGggbHZtZXRhZCBkYWVtb24sIHRoZSBldmVudC1hY3RpdmF0aW9uIG1vZGUKPiBpcyB2ZXJ5IGxp
a2VseSB0aW1lb3V0IG9uIGEgbGFyZ2Ugc2NhbGUgUFZzLgo+IFdoZW4gY3VzdG9tZXIgbWV0IHRo
aXMgaXNzdWUsIHdlIHN1Z2dlc3RlZCB0aGVtIHRvIGRpc2FibGUgbHZtZXRhZC4KCldlJ3ZlIGFs
cmVhZHkgZHVtcGVkIGx2bWV0YWQuIEhhcyB0aGlzIGFsc28gYmVlbiBhbiBpc3N1ZSB3aXRoIGx2
bSB2ZXJzaW9ucyAKd2l0aG91dCBsdm1ldGFkLCBidXQgc3RpbGwgdXNpbmcgdGhlIGV2ZW50LWFj
dGl2YXRpb24gbW9kZT8gKC4uLnRoZSBsdm0gCnZlcnNpb25zIHdoZXJlIGluc3RlYWQgb2YgbHZt
ZXRhZCwgd2UgdXNlIHRoZSBoZWxwZXIgZmlsZXMgdW5kZXIgL3J1bi9sdm0gdG8gCnRyYWNrIHRo
ZSBzdGF0ZSBvZiBpbmNvbWluZyBQVnMgYW5kIFZHIGNvbXBsZXRlbmVzcykKCkFsc28sIHdoZW4g
SSB0cmllZCBib290dXAgd2l0aCBvdmVyIDEwMDAgZGV2aWNlcyBpbiBwbGFjZSAodGhvdWdoIGlu
IGEgVk0sIEkgCmRvbid0IGhhdmUgYWNjZXNzIHRvIHJlYWwgbWFjaGluZSB3aXRoIHNvIG1hbnkg
ZGV2aWNlcyksIEkndmUgbm90aWNlZCBhIApwZXJmb3JtYW5jZSByZWdyZXNzaW9uIGluIGxpYnVk
ZXYgaXRzZWxmIHdpdGggdGhlIGludGVyZmFjZSB0byBlbnVtZXJhdGUgCmRldmljZXMgKHdoaWNo
IGlzIHRoZSBkZWZhdWx0IG9idGFpbl9kZXZpY2VfbGlzdF9mcm9tX3VkZXY9MSBpbiBsdm0uY29u
Zik6Cmh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTk4NjE1OAoK
SXQncyB2ZXJ5IGltcG9ydGFudCB0byBtZWFzdXJlIHdoYXQncyBleGFjdGx5IGNhdXNpbmcgdGhl
IGRlbGF5cy4gQW5kIGFsc28gCmltcG9ydGFudCBob3cgd2UgbWVhc3VyZSBpdCAtIEknbSBub3Qg
dGhhdCB0cnVzdGZ1bCB0byBzeXN0ZW1kLWFuYWx5emUgYmxhbWUgCmFzIGl0J3MgdmVyeSBtaXN0
eSBvZiB3aGF0IGl0IGlzIGFjdHVhbGx5IG1lYXN1cmluZy4KCkkganVzdCB3YW50IHRvIHNheSB0
aGF0IHNvbWUgb2YgdGhlIGlzc3VlcyBtaWdodCBzaW1wbHkgYmUgcmVncmVzc2lvbnMvaXNzdWVz
IAp3aXRoIHN5c3RlbWQvdWRldiB0aGF0IGNvdWxkIGJlIGZpeGVkLiBXZSBhcyBwcm92aWRlcnMg
b2YgYmxvY2sgZGV2aWNlIAphYnN0cmFjdGlvbnMgd2hlcmUgd2UgbmVlZCB0byBoYW5kbGUsIHNv
bWV0aW1lcywgdGhvdXNhbmRzIG9mIGRldmljZXMsIG1pZ2h0IApiZSB0aGUgZmlyc3Qgb25lcyB0
byBoaXQgdGhlc2UgaXNzdWVzLgoKLS0gClBldGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUBy
ZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1I
T1dUTy8=

