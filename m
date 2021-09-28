Return-Path: <SRS0=pEn1=OS=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87368C433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 28 Sep 2021 15:56:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D06360F0F
	for <linux-lvm@archiver.kernel.org>; Tue, 28 Sep 2021 15:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D06360F0F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632844611;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SavM99ud9WGpf81o/exdORy9Nshlv3wUSxJtIGbXRAA=;
	b=PgVZwZxFEmhM3Km24mq40ch6M1huPYCDcUQeAkYIe2wCSPB6ReLnbq1NYvd/1YM/wfkI+p
	w+xOcOXoMYNq24cmDUm3q7jo8ovM9eE2DocIIo1AXoxnDxrermWlx/YF63YbR6mlBjtZxk
	5cOnORZYkquNdaM9wTez0jnMxZYmT8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-nCFu93tPNzO1kR2wK2XjlQ-1; Tue, 28 Sep 2021 11:56:49 -0400
X-MC-Unique: nCFu93tPNzO1kR2wK2XjlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 318AE835DE4;
	Tue, 28 Sep 2021 15:56:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39A785FC13;
	Tue, 28 Sep 2021 15:56:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF3ED4E58F;
	Tue, 28 Sep 2021 15:56:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18SFuRCr017294 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 28 Sep 2021 11:56:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB23060E1C; Tue, 28 Sep 2021 15:56:27 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADA0760C4A;
	Tue, 28 Sep 2021 15:56:16 +0000 (UTC)
Date: Tue, 28 Sep 2021 10:56:09 -0500
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210928155609.GE11549@redhat.com>
References: <d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-lvm@redhat.com
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
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

On Tue, Sep 28, 2021 at 03:16:08PM +0000, Martin Wilck wrote:
> Hm. This would mean that the switch to event-based PV detection could
> happen before "udev settle" ends. A coldplug storm of uevents could
> create 1000s of PVs in a blink after event-based detection was enabled.
> Wouldn't that resurrect the performance issues that you are trying to
> fix with this patch set?

Possibly, I'm unsure how this looks in practice, so I need to try it.
When the device node exists will make a difference, not only when the
uevent occurs.

> > Otherwise, when the devices file is not used,
> > md: from reading the md headers from the disk
> > mpath: from reading sysfs links and /etc/multipath/wwids
> 
> Ugh. Reading sysfs links means that you're indirectly depending on
> udev, because udev creates those. It's *more* fragile than calling into
> libudev directly, IMO.

I meant /sys/dev/block/... (some of those files are links).
We don't look at /dev symlinks created by udev.

> Using /etc/multipath/wwids is plain wrong in
> general. It works only on distros that use "find_multipaths strict",
> like RHEL. Not to mention that the path can be customized in
> multipath.conf.

Right, it's not great and I held off for a couple years adding that.
As a practical matter it can at least help.  There's a constant stream
of problems with mpath component detection, so anything that can help I'm
interested in.  I expect we could be more intelligent understanding
multipath config to handle more cases.

> multipathd does listen to uevents (only "udev" events, not "kernel").
> But that doesn't help us on startup. Currently we try hard to start up
> after coldplug is finished. multipathd doesn't have a concurrency issue
> like LVM2 (at least I hope so; it handles events with just two threads,
> a producer and a consumer). The problem is rather that dm devices
> survive the initramfs->rootfs switch, while member devices don't (see
> above).

The other day I suggested that multipath devices not be set up in
the initramfs at all.  If the root fs requires mpath, then handle that
as a special one-off setup.  Then the transition problems go away.
But, I know basically nothing about this, so I won't be surprised if
there are reasons it's done this way.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

