Return-Path: <SRS0=nGmI=NY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0423EC432BE
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 14:20:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A073E610D2
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 14:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A073E610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630592443;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yjd8W6vszuWtKu9LzDh0a60n/FAJvivRP2WvrC3gzA0=;
	b=HhIuZ/Bo2n8NkUelvFKuoQRlSryQPpEZx5GbsS3KaVGvpRtoK+bf7ledPZTlr4LLvH11gj
	W/NJOPlQumwtG1F8bhJIwjnbttKksdEsqcPvOEE7OSMXlxxwkv7D3K1TZ5bx+Q5l/aCoQF
	/U2mHIvQp+/kSDr0+HCFl4C6WGbu8Ws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-1W2N0rMfP-i8QHkIWeocMA-1; Thu, 02 Sep 2021 10:20:41 -0400
X-MC-Unique: 1W2N0rMfP-i8QHkIWeocMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E64D6DF8A0;
	Thu,  2 Sep 2021 14:20:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EAE95D9F0;
	Thu,  2 Sep 2021 14:20:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 899CB1809C98;
	Thu,  2 Sep 2021 14:20:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 182EBwql004794 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 2 Sep 2021 10:11:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1DBB6060F; Thu,  2 Sep 2021 14:11:58 +0000 (UTC)
Received: from [10.40.193.87] (unknown [10.40.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF41860853;
	Thu,  2 Sep 2021 14:11:54 +0000 (UTC)
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Jean-Michel Pollion <jmp-lvm2@ookaze.fr>
References: <079c89596cbea06f80874fdc3ffe8cfe05841c4d.camel@ookaze.fr>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <d864434e-0823-9082-00a4-605d17862310@redhat.com>
Date: Thu, 2 Sep 2021 16:11:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <079c89596cbea06f80874fdc3ffe8cfe05841c4d.camel@ookaze.fr>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] LVM tools segfault since 2.03.12
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 02. 09. 21 v 9:34 Jean-Michel Pollion napsal(a):
> Hello,
> 
> I have the lvm2 tools segfaulting since 2.03.12 with a message of
> unsorted commands in cmds.h.
> It turns out that in my locale and on my setup, the LANG=C setting
> before "sort -u" in tools/Makefile.in is not enough, I had to patch and
> add LC_COLLATE=C too, or the rules will not count the underscore while
> sorting, causing the segfault in the code (command.c IIRC).
> This broke the boot on some of my servers, so I think it's a rather big
> problem that perhaps can't be caught in reproducible builds.
> Can this be corrected upstream or should I just modify my build
> environment for LVM2?
>


Hi

Interesting - can you send a patch to Makefile  to include LC_COLLATE=C
in case it does fixes your problem.

Although LANG=C should IMHO set all LC_XXX settings - so it can be also a bug 
in glibc process ??

What locales are used in your environment ?

Can you attache resulting sorted  cmds.h in your environment ?

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

