Return-Path: <SRS0=Ecxi=OT=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19CEC433FE
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 21:40:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 326E3613CE
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 21:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 326E3613CE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632951628;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Slp+V0Dbd76zMHPJJqVpRgUsRAaGvT6NP1de0OG0xRg=;
	b=C6IyuRRpp1LUKoXIl+/K5ivTXVX/5r1pUARYLvzbwR1r2qs1ckUbqHcfBgd0UtDj41b8bz
	xtyVZ6hsBjx0caBEoPfFIeOAqUabmiWBlHSQsz/A9lIpe9DAbZXJ1ZGNsSD65eIwrKn379
	uN/QqFzqYEzPg1sK/tNbF3sEQVwJ6Sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-pZr__TCOPmKrSPzNbXgZng-1; Wed, 29 Sep 2021 17:40:26 -0400
X-MC-Unique: pZr__TCOPmKrSPzNbXgZng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42A4D8015C7;
	Wed, 29 Sep 2021 21:40:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D40A5D9C6;
	Wed, 29 Sep 2021 21:40:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0BE9D4E58F;
	Wed, 29 Sep 2021 21:40:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18TLe2Af018806 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 29 Sep 2021 17:40:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFDD4EE84F; Wed, 29 Sep 2021 21:40:01 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA270175B5
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2021 21:39:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EF7E802E5E
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2021 21:39:59 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
	[209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-493-N7Toog3ZMOWUsXemWCed5A-1; Wed, 29 Sep 2021 17:39:57 -0400
X-MC-Unique: N7Toog3ZMOWUsXemWCed5A-1
Received: by mail-ed1-f70.google.com with SMTP id
	x26-20020a50f19a000000b003da81cce93bso3907238edl.19
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2021 14:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=MFaeJetgshmo9srlIksss24svSXtlPPz4QGiMlyRyFw=;
	b=aly5oyTK2JfNhOpz6nkuB7FvfmCqy7kfQmaNFNprPx7prNyrgm3rAtpxwPAukOuwIL
	eccn1TEmQ1Whiy3efWITCN5Y17azjuce+TqRAUR07jNDZzq5cU+6/k8S0/SGuwTmh+ul
	x0KWYz0/jxLFDOQJYcEEA+Wp6tfeOTdXxsq8XMlYREKXpIPFBi5zmuuMqv61OXwc7acv
	0Q9iIQoaQq0Ycq7ah5J86GoYYPT4e/hw2n8CjDEFsBYBYgW1w2N4rOJkM+hFSz0Hsa74
	jQBGrZIw5G967c3EupE1/Q0xsV1uY/ALHOByc4d7P4vBPzT4wPhTcH3xCOjpiyt4n5bl
	bgAA==
X-Gm-Message-State: AOAM530+ZFOUq/h63AGwPKloVzgf1+kh0zczLHY5lpJ1wf2veiBPgprP
	UfOmTzs0ETvvOucvDCG6YCkIG7be6NSeWxlVJh1cEeY0UoE/PVaQEGobzZaNNt9wdxEaqC56BKH
	++IM4L9A8wihoA0JR
X-Received: by 2002:a17:906:5a97:: with SMTP id
	l23mr2428092ejq.541.1632951596472; 
	Wed, 29 Sep 2021 14:39:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhNtQtADQjPvXfgGu9KWyXGm0spkjR5ad5cMcHf7YTpm920Mshz1tDIAq2vjtlhFi15khoZg==
X-Received: by 2002:a17:906:5a97:: with SMTP id
	l23mr2428067ejq.541.1632951596241; 
	Wed, 29 Sep 2021 14:39:56 -0700 (PDT)
Received: from alatyr-rpi.brq.redhat.com (nat-pool-brq-t.redhat.com.
	[213.175.37.10])
	by smtp.gmail.com with ESMTPSA id b3sm538020edx.55.2021.09.29.14.39.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Sep 2021 14:39:55 -0700 (PDT)
Date: Wed, 29 Sep 2021 23:39:52 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
To: David Teigland <teigland@redhat.com>
Message-ID: <20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210927153822.GA4779@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon 27 Sep 2021 10:38, David Teigland wrote:
> On Mon, Sep 27, 2021 at 12:00:32PM +0200, Peter Rajnoha wrote:
> > > - We could use the new lvm-activate-* services to replace the activation
> > > generator when lvm.conf event_activation=0.  This would be done by simply
> > > not creating the event-activation-on file when event_activation=0.
> > 
> > ...the issue I see here is around the systemd-udev-settle:
> 
> Thanks, I have a couple questions about the udev-settle to understand that
> better, although it seems we may not need it.
> 
> >   - the setup where lvm-activate-vgs*.service are always there (not
> >     generated only on event_activation=0 as it was before with the
> >     original lvm2-activation-*.service) practically means we always
> >     make a dependency on systemd-udev-settle.service, which we shouldn't
> >     do in case we have event_activation=1.
> 
> Why wouldn't the event_activation=1 case want a dependency on udev-settle?
> 

For event-based activation, I'd expect it to really behave in event-based
manner, that is, to respond to events as soon as they come and not wait
for all the other devices unnecessarily.

The use of udev-settle is always a pain - for example, if there's a mount
point defined on top of an LV, with udev-settle as dependency, we practically
wait for all devices to settle. With 'all', I mean even devices which are not
block devices and which are not event related to any of that LVM layout and
the stack underneath. So simply we could be waiting uselessly and we
could increase possibility of a timeout (...for the mount point etc.).

With the settle in play, we'd have this sequence/ordering with the
services/executions:

systemd-udev-settle.service --> lvm-activate-vgs-main.service -->
lvm-activate-vgs-last.service --> event-based pvscans

> >   - If we want to make sure that we run our "non-event-based activation"
> >     after systemd-udev-settle.service, we also need to use
> >     "After=systemd-udev-settle.service" (the "Wants" will only make the
> >     udev settle service executed, but it doesn't order it with respect
> >     to our activation services, so it can happen in parallel - we want
> >     it to happen after the udev settle).
> 
> So we may not fully benefit from settling unless we use After (although
> the benefits are uncertain as mentioned below.)
> 
> > Now the question is whether we really need the systemd-udev-settle at
> > all, even for that non-event-based lvm activation. The udev-settle is
> > just to make sure that all the udev processing and udev db content is
> > complete for all triggered devices. But if we're not reading udev db and
> > we're OK that those devices might be open in parallel to lvm activation
> > period (e.g. because there's blkid scan done on disks/PVs), we should be
> > OK even without that settle. However, we're reading some info from udev db,
> > right? (like the multipath component state etc.)
> 
> - Reading the udev db: with the default external_device_info_source=none
>   we no longer ask the udev db for any info about devs.  (We now follow
>   that setting strictly, and only ask udev when source=udev.)

Hmm, thinking about this, I've just realized one more important and related
thing here I didn't realize before - the LVM regex filters! These may contain
symlink names as one can find them in /dev. But for those symlinks, we need
to be sure that the rules are already applied. This practically means that:

  - For non-event-based activation, we need udev-settle (so we're sure
    all the rules are applied for all devices we might be scanning).

  - For event-based activation, we need to be sure that we use "RUN"
    rule, not any of "IMPORT{program}" or "PROGRAM" rule. The difference
    is that the "RUN" rules are applied after all the other udev rules are
    already applied for current uevent, including creation of symlinks. And
    currently, we have IMPORT{program}="pvscan..." in our rule,
    unfortunately...

So what if someone defines an LVM regex filter that accepts only the
symlink name which is just to be created based on udev rules we're
processing right now?

(The nodes under /dev are OK because they're created in devtmpfs as
soon as the devices are created in kernel, but those symlinks in /dev
are always created by udev based on udev rules.)

> 
> - Concurrent blkid and activation: I can't find an issue with this
>   (couldn't force any interference with some quick tests.)
> 
> - I wonder if After=udev-settle could have an incidental but meaningful
>   effect of more PVs being in place before the service runs?
> 

The nodes are already there, the symlinks could be missing because the
udev rules haven't been processed yet.

Non-event-based LVM activation needs to wait for settle for sure (because
there's full scan across all devices).

Event-based LVM activation just needs to be sure that:

  - the pvscan only scans the single device (the one for which there's
    the uevent currently being processed),

  - the pvscan should be called in a way that we have all the symlinks
    in place so the regex filter still works for symlinks (== putting
    the pvscan onto a RUN exec queue).

> I'll try dropping udev-settle in all cases to see how things look.
> 
> Dave
> 

-- 
Peter

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

