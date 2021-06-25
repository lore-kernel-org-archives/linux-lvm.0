Return-Path: <SRS0=uSn1=LT=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1A3C2B9F4
	for <linux-lvm@archiver.kernel.org>; Fri, 25 Jun 2021 10:57:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D12C061459
	for <linux-lvm@archiver.kernel.org>; Fri, 25 Jun 2021 10:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D12C061459
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624618672;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZDJJOhnlpsc1ufAKaZnIyGFj26OvfYmcfA4EZkZ6wGw=;
	b=Tcj8p6oyOVce1B7XB48btaexZBHHiaOiqfUxzgH8v7sQ6R5MgxtpbcITquQTSBtmcg8cVd
	5uceVkMKjO9OBAbCEnZ/CxOgi+xoVtwE7i8G/OJpocfQLT4RG6zD9tnp5PPhPPFDZGYW2M
	PzZ6PwvXULTzyPlCu2nXENVukjVRcuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-qCwwstgcNCS3Ci3Re3vBTQ-1; Fri, 25 Jun 2021 06:57:51 -0400
X-MC-Unique: qCwwstgcNCS3Ci3Re3vBTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A25A802B7E;
	Fri, 25 Jun 2021 10:57:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6FA360864;
	Fri, 25 Jun 2021 10:57:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD5B51809C99;
	Fri, 25 Jun 2021 10:57:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15PAvSVV032301 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 25 Jun 2021 06:57:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6F70421F; Fri, 25 Jun 2021 10:57:28 +0000 (UTC)
Received: from [10.40.195.18] (unknown [10.40.195.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0C0B69FAF;
	Fri, 25 Jun 2021 10:57:24 +0000 (UTC)
To: "heming.zhao@suse.com" <heming.zhao@suse.com>,
	LVM general discussion and development <linux-lvm@redhat.com>,
	David Teigland <teigland@redhat.com>
References: <ba88aa20-e176-0a07-5578-20afb39e0950@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <2d5ff29e-2836-0407-ce76-271255487baa@redhat.com>
Date: Fri, 25 Jun 2021 12:57:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ba88aa20-e176-0a07-5578-20afb39e0950@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Does LVM have any plan/schedule to support btrfs in
	fsadm
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDI1LiAwNi4gMjEgdiA3OjI4IGhlbWluZy56aGFvQHN1c2UuY29tIG5hcHNhbChhKToKPiBI
ZWxsbyBaZGVuZWsgJiBEYXZpZCwKPgo+IEZyb20gVVJMOiBodHRwczovL2ZlZG9yYXByb2plY3Qu
b3JnL3dpa2kvQnRyZnMKPiBUaGUgYnRyZnMgYmVjb21lcyBkZWZhdWx0IGZpbGVzeXN0ZW0gZm9y
IGRlc2t0b3BzLgo+Cj4gRG8gd2UgaGF2ZSBhbnkgcGxhbiB0byBhZGQgYnRyZnMgY29kZSBmb3Ig
c2NyaXB0cy9mc2FkbS5zaD8KPgo+IElmIHRoZSBhbnN3ZXIgaXMgeWVzLiBJIGNvdWxkIHNoYXJl
IGEgc3VzZSBzcGVjaWFsIHBhdGNoLCB0aGlzIHBhdGNoCj4gaGFkIGJlZW4gcnVuIGFib3V0IDQg
eWVhcnMgaW4gc3VzZSBwcm9kdWN0cy4KCgpIaQoKSWYgeW91IGhhdmUgc29tZSBwYXRjaGVzIHBy
b3ZpZGVkIHdpdGggc29tZSBnb29kIHVzYWJsZSB0ZXN0aW5nIChsdm0yIHRlc3QgCnN1aXRlKcKg
IC0gaXQgY291bGQgYmUgcG9zc2libHkgbWVyZ2VkLgoKT24gdGhlIG90aGVyIGhhbmQgaGVscGlu
Zy9zdWdnZXN0aW5nIHVzZXJzIHRvIHVzZSBCdHJmcyBvbiB0b3Agb2YgbHZtMiBoYXMgCmFsc28g
aXRzIGxvZ2ljYWwgJ3F1ZXN0aW9uJyBtYXJrcy7CoCBTaW5jZcKgIGJ0cmZzIHVzZXJzIHNob3Vs
ZCBwcm9iYWJseSBiZSAKYXZvaWRpbmcgcGxhY2luZyAnYW5vdGhlcicgbGF5ZXIgYmV0d2VlbiBy
ZWFsIGh3IC0gd2hlbiBidHJmcyBzaG91bGQgYmUgbW9zdGx5IApjYXBhYmxlIGhhbmRsaW5nIGx2
bTIgZmVhdHVyZXMgaW4gaXRzICd2ZXJ5IG93bicgd2F5LiBFYWNoIGxheWVyIGhhcyBpdCdzIG93
biAKbWVhc3VyYWJsZSBjb3N0cy4gQW5kIHllYWggd2UgZG8gbm90IHdhbnQgdG8gYmUgaW52b2x2
ZWQgaW50byBidHJmcyByZWxhdGVkIApyZWNvdmVyeSBjYXNlcywgYXMgd2Ugc2ltcGx5IG5ldmVy
IHVuZGVyc3Rvb2QgaXRzIGhhbmRsaW5nIG9mIGF0dGFjaGVkIGRpc2tzLgoKUmVnYXJkcwoKWmRl
bmVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8g
YXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8=

