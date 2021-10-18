Return-Path: <SRS0=tbfx=PG=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23709C433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 15:04:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8924460E0C
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 15:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8924460E0C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569488;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o6cMmKTm/xTp8awcQahR0ySM1vhSOKIz9MTb+j+iDYE=;
	b=YsfQK7tvY1jY+enq95pWjQUWy2bnTfwUi0gS55DAdtygBYnpyoHmRzjaD85Gg1KWTI3BUf
	5qDBtav9Gid3I1nHc8NVbYDxCj6YEu/+RourgTxiQQ1PVeHAMQpzn0JA03CHTnKBakZ3JS
	C5wALjJ7vG9Oo7K80L2AGeZekZnzbX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-BQhOav6jP1qcvv6ayZvSOQ-1; Mon, 18 Oct 2021 11:04:45 -0400
X-MC-Unique: BQhOav6jP1qcvv6ayZvSOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6099DCC626;
	Mon, 18 Oct 2021 15:04:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 582121803E;
	Mon, 18 Oct 2021 15:04:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AEFEA4EA2A;
	Mon, 18 Oct 2021 15:04:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IF4LRG029685 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 11:04:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C723F4180; Mon, 18 Oct 2021 15:04:20 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F9FB60657;
	Mon, 18 Oct 2021 15:04:20 +0000 (UTC)
Date: Mon, 18 Oct 2021 10:04:18 -0500
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20211018150418.GA3917@redhat.com>
References: <d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
	<20210930155542.GB32174@redhat.com>
	<418b2bd497a3a4cd76840b3cceb1955ba7e9ba01.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <418b2bd497a3a4cd76840b3cceb1955ba7e9ba01.camel@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-lvm@redhat.com
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 18, 2021 at 06:24:49AM +0000, Martin Wilck wrote:
> I'd like to second Peter here, "RUN" is in general less fragile than
> "IMPORT{PROGRAM}". You should use IMPORT{PROGRAM}" if and only if 
> 
>  - the invoked program can work with incomplete udev state of a device
>    (the progrem should not try to access the device via
>    libudev, it should rather get properties either from sysfs or the
>    uevent's environment variables)
>  - you need the result or the output of the program in order to proceed
>    with rules processing.

Those are both true in this case.  I can't say I like it either, but udev
rules force hacky solutions on us.  I began trying to use RUN several
months ago and I think I gave up trying to find a way to pass values from
the RUN program back into the udev rule (possibly by writing values to a
temp file and then doing IMPORT{file}).  The udev rule needs the name of
the VG to activate, and that name comes from the pvscan.  For an even
uglier form of this, see the equivalent I wrote for dracut:
https://github.com/dracutdevs/dracut/pull/1567/files

The latest version of the hybrid service+event activation is here
https://sourceware.org/git/?p=lvm2.git;a=shortlog;h=refs/heads/dev-dct-activation-switch-7

I've made it simple to edit lvm.conf to switch between:
- activation from fixed services only
- activation from events only
- activation from fixes services first, then from events

There are sure to be tradeoffs, we know that many concurrent activations
from events are slow, and fixed services which are more serialized could
be delayed from slow devices.  I'm still undecided on the best default
setting, i.e. which will work best for most people, and would welcome any
thoughts or relevant experience.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

