Return-Path: <SRS0=Ecxi=OT=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE5DC433EF
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 06:42:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9FA0613CD
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 06:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9FA0613CD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632897766;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hzbJnRNXsXSLabwTqKVCmYh1L1DKJYvyJgx5oKZUXuE=;
	b=OoWwBBhdVS4Bp861CNHR5LjomHTrYliG28E7wVD+j5iow9xkl9DBeDGT6ZH0uk7A8atSAa
	Y7GzniE0O4nn0k3Prz1gyA/3fRVE51S0/w6+Jf/8R8Jo4ZEdZ5pvoQGagzXnmhP1KfZw0U
	KK2YIe2pZBXnV7WyyQeYGwzkIa2uzMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-OjZiGyVfM2OPU6-n0GvzNw-1; Wed, 29 Sep 2021 02:42:44 -0400
X-MC-Unique: OjZiGyVfM2OPU6-n0GvzNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7CBB1006AA6;
	Wed, 29 Sep 2021 06:42:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1579360877;
	Wed, 29 Sep 2021 06:42:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5C5B4EA2A;
	Wed, 29 Sep 2021 06:42:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18SI3T7d028736 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 28 Sep 2021 14:03:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D25060C9F; Tue, 28 Sep 2021 18:03:29 +0000 (UTC)
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61C1360C13;
	Tue, 28 Sep 2021 18:03:29 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18SI3Mw5002025; 
	Tue, 28 Sep 2021 13:03:22 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18SI3Ljt002024;
	Tue, 28 Sep 2021 13:03:21 -0500
Date: Tue, 28 Sep 2021 13:03:21 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: David Teigland <teigland@redhat.com>
Message-ID: <20210928180321.GG3087@octiron.msp.redhat.com>
References: <20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
	<20210928155609.GE11549@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210928155609.GE11549@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Wed, 29 Sep 2021 02:42:14 -0400
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 28, 2021 at 10:56:09AM -0500, David Teigland wrote:
> On Tue, Sep 28, 2021 at 03:16:08PM +0000, Martin Wilck wrote:
> > Hm. This would mean that the switch to event-based PV detection could
> > happen before "udev settle" ends. A coldplug storm of uevents could
> > create 1000s of PVs in a blink after event-based detection was enabled.
> > Wouldn't that resurrect the performance issues that you are trying to
> > fix with this patch set?
> 
> Possibly, I'm unsure how this looks in practice, so I need to try it.
> When the device node exists will make a difference, not only when the
> uevent occurs.
> 
> > > Otherwise, when the devices file is not used,
> > > md: from reading the md headers from the disk
> > > mpath: from reading sysfs links and /etc/multipath/wwids
> > 
> > Ugh. Reading sysfs links means that you're indirectly depending on
> > udev, because udev creates those. It's *more* fragile than calling into
> > libudev directly, IMO.
> 
> I meant /sys/dev/block/... (some of those files are links).
> We don't look at /dev symlinks created by udev.
> 
> > Using /etc/multipath/wwids is plain wrong in
> > general. It works only on distros that use "find_multipaths strict",
> > like RHEL. Not to mention that the path can be customized in
> > multipath.conf.
> 
> Right, it's not great and I held off for a couple years adding that.
> As a practical matter it can at least help.  There's a constant stream
> of problems with mpath component detection, so anything that can help I'm
> interested in.  I expect we could be more intelligent understanding
> multipath config to handle more cases.
> 
> > multipathd does listen to uevents (only "udev" events, not "kernel").
> > But that doesn't help us on startup. Currently we try hard to start up
> > after coldplug is finished. multipathd doesn't have a concurrency issue
> > like LVM2 (at least I hope so; it handles events with just two threads,
> > a producer and a consumer). The problem is rather that dm devices
> > survive the initramfs->rootfs switch, while member devices don't (see
> > above).
> 
> The other day I suggested that multipath devices not be set up in
> the initramfs at all.  If the root fs requires mpath, then handle that
> as a special one-off setup.  Then the transition problems go away.
> But, I know basically nothing about this, so I won't be surprised if
> there are reasons it's done this way.


If you don't need the device to pivot to the real filesystem and LVM,
MD, etc. don't activate those devices in the initramfs, you don't need
to include the multipath module when building the initramfs in dracut.
Many existing setups with multipath already work this way. The problem
we need to solve is the setups that DO need the multipath device to
exist before other devices get stacked on top or filesystems get
mounted in the initramfs.

-Ben

> 
> Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

