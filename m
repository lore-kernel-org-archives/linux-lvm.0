Return-Path: <SRS0=uBxV=GB=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9FBC433DB
	for <linux-lvm@archiver.kernel.org>; Tue, 29 Dec 2020 19:04:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20515207BD
	for <linux-lvm@archiver.kernel.org>; Tue, 29 Dec 2020 19:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20515207BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609268644;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6Yb7YZ2s0VX4sVVdL63pJj6WKTGz3Z4PDNpBnwsM9/g=;
	b=Wl5PeD7LUClUvHbzZVXTDRwclqtuAgkXKzOTLwLqEOq6aS5Vbpgb1/aVTq9PX/56ycuWV9
	aBebAOL6KE4F87lcDfj/89bdAzIUBNlIkBQ2qhdW4t8J8z8gPL9OPKLEk80Df92PuIyu72
	YTFuina3Y7w58LqR8fsiUGgYdBXZqXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-b968mrojMGuNNLXnRyf6IQ-1; Tue, 29 Dec 2020 14:04:02 -0500
X-MC-Unique: b968mrojMGuNNLXnRyf6IQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8673110051CE;
	Tue, 29 Dec 2020 19:03:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A43151001281;
	Tue, 29 Dec 2020 19:03:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF71A180954D;
	Tue, 29 Dec 2020 19:03:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BTJ3AwL032500 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 29 Dec 2020 14:03:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BDDF4277BE; Tue, 29 Dec 2020 19:03:10 +0000 (UTC)
Received: from [10.40.192.30] (unknown [10.40.192.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C64AE155;
	Tue, 29 Dec 2020 19:03:06 +0000 (UTC)
To: "heming.zhao@suse.com" <heming.zhao@suse.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
References: <5ecbb2ae-0378-1891-80d0-791a525f0ae2@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: Red Hat
Message-ID: <ef6aad1d-4041-2e4d-846d-00ca2f60662b@redhat.com>
Date: Tue, 29 Dec 2020 20:03:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <5ecbb2ae-0378-1891-80d0-791a525f0ae2@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] discuss: about master branch vgcreate parameter
	"--clustered"
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 28. 12. 20 v 9:35 heming.zhao@suse.com napsal(a):
> Hello,
> 
> On master branch, clvmd had been removed, the "-c | --clustered" is deprecated.
> 
> ```
> ~> sudo vgcreate -c n vg1 /dev/sda
> The clustered option is deprecated, see --shared.
> Run `vgcreate --help' for more information.
> ~> echo $?
> 3
> ```
> 
> It looks the -c is useless, it only shows deprecated info and exit.
> Is it possible to remove the -c from lvm code?
> 


Command keeps this option for backward compatibility.
So when the option is no longer supported - it should print the 'old usage'
was replaced with something else.

I don't quite understand why would you want to remove this logic
since we would report 'Invalid argument' anyway?

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

