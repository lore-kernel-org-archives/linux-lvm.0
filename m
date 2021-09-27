Return-Path: <SRS0=Y+sl=OR=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6F9C433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 27 Sep 2021 15:39:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8570360EBB
	for <linux-lvm@archiver.kernel.org>; Mon, 27 Sep 2021 15:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8570360EBB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632757171;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x5JqPXlo25DEcrxLW8/811D56z0CLZACS6A8oes8okM=;
	b=OhaoT7nLdzlh3D51jfoXffbXXA72sUpYrh3FmSHGilh45kbtRf3X5IkyuZZ7hXn6mTZ+jt
	ftUesg9a6OT5ln4II2BgcMsfSYSocBsChgbheAVdyqG8yFBmiHKbq83TokNrUnNSbalrNu
	1E2gYyT0SvE+L+Xlgup4gFxclIV85CM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-zLGmnmQsOzOBnuS64jpWHQ-1; Mon, 27 Sep 2021 11:39:30 -0400
X-MC-Unique: zLGmnmQsOzOBnuS64jpWHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E3D4100C62E;
	Mon, 27 Sep 2021 15:39:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03E095D740;
	Mon, 27 Sep 2021 15:39:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A06994EA2A;
	Mon, 27 Sep 2021 15:38:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18RFcU81026248 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 27 Sep 2021 11:38:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7FC61100164A; Mon, 27 Sep 2021 15:38:30 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 043AD100238C;
	Mon, 27 Sep 2021 15:38:29 +0000 (UTC)
Date: Mon, 27 Sep 2021 10:38:22 -0500
From: David Teigland <teigland@redhat.com>
To: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <20210927153822.GA4779@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-lvm@redhat.com
Cc: zkabelac@redhat.com, bmarzins@redhat.com, martin.wilck@suse.com,
	heming.zhao@suse.com, linux-lvm@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 27, 2021 at 12:00:32PM +0200, Peter Rajnoha wrote:
> > - We could use the new lvm-activate-* services to replace the activation
> > generator when lvm.conf event_activation=0.  This would be done by simply
> > not creating the event-activation-on file when event_activation=0.
> 
> ...the issue I see here is around the systemd-udev-settle:

Thanks, I have a couple questions about the udev-settle to understand that
better, although it seems we may not need it.

>   - the setup where lvm-activate-vgs*.service are always there (not
>     generated only on event_activation=0 as it was before with the
>     original lvm2-activation-*.service) practically means we always
>     make a dependency on systemd-udev-settle.service, which we shouldn't
>     do in case we have event_activation=1.

Why wouldn't the event_activation=1 case want a dependency on udev-settle?

>   - If we want to make sure that we run our "non-event-based activation"
>     after systemd-udev-settle.service, we also need to use
>     "After=systemd-udev-settle.service" (the "Wants" will only make the
>     udev settle service executed, but it doesn't order it with respect
>     to our activation services, so it can happen in parallel - we want
>     it to happen after the udev settle).

So we may not fully benefit from settling unless we use After (although
the benefits are uncertain as mentioned below.)

> Now the question is whether we really need the systemd-udev-settle at
> all, even for that non-event-based lvm activation. The udev-settle is
> just to make sure that all the udev processing and udev db content is
> complete for all triggered devices. But if we're not reading udev db and
> we're OK that those devices might be open in parallel to lvm activation
> period (e.g. because there's blkid scan done on disks/PVs), we should be
> OK even without that settle. However, we're reading some info from udev db,
> right? (like the multipath component state etc.)

- Reading the udev db: with the default external_device_info_source=none
  we no longer ask the udev db for any info about devs.  (We now follow
  that setting strictly, and only ask udev when source=udev.)

- Concurrent blkid and activation: I can't find an issue with this
  (couldn't force any interference with some quick tests.)

- I wonder if After=udev-settle could have an incidental but meaningful
  effect of more PVs being in place before the service runs?

I'll try dropping udev-settle in all cases to see how things look.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

