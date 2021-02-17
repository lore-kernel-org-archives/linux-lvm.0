Return-Path: <SRS0=sZ9l=HT=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B861C433DB
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Feb 2021 15:39:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA11964D9F
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Feb 2021 15:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA11964D9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-SlgoMRP5P62P3CPoYnKFuQ-1; Wed, 17 Feb 2021 10:39:52 -0500
X-MC-Unique: SlgoMRP5P62P3CPoYnKFuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D69D100CCC2;
	Wed, 17 Feb 2021 15:39:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 679375D72F;
	Wed, 17 Feb 2021 15:39:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E903E58074;
	Wed, 17 Feb 2021 15:39:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HDn8ZD031086 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 08:49:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 752741043DE7; Wed, 17 Feb 2021 13:49:08 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7105B10500B6
	for <linux-lvm@redhat.com>; Wed, 17 Feb 2021 13:49:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E6C6186E124
	for <linux-lvm@redhat.com>; Wed, 17 Feb 2021 13:49:06 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-502-MN6O1qs-NZCpNmwZnFRagw-1;
	Wed, 17 Feb 2021 08:49:02 -0500
X-MC-Unique: MN6O1qs-NZCpNmwZnFRagw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A5F24B760;
	Wed, 17 Feb 2021 13:49:01 +0000 (UTC)
Message-ID: <9416b5505fa2c7e726c470d99168f28d20c136ce.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Christian Hesse <list@eworm.de>
Date: Wed, 17 Feb 2021 14:49:00 +0100
In-Reply-To: <20210217130329.7de41147@leda>
References: <20210211111623.34968-1-list@eworm.de>
	<f18dff7a-050a-d41d-c643-4616522ba4a0@suse.com>
	<ae893a3606dd32b07cab16bd538c132af555c956.camel@suse.com>
	<20210217130329.7de41147@leda>
User-Agent: Evolution 3.38.2
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Wed, 17 Feb 2021 10:30:32 -0500
Cc: LVM general discussion and development
	<linux-lvm@e1890.dsca.akamaiedge.net>, Heming Zhao <heming.zhao@suse.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] [PATCH 1/1] pvscan: wait for udevd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-02-17 at 13:03 +0100, Christian Hesse wrote:
> 
> Let's keep this in mind. Now let's have a look at udevd startup: It
> signals
> being ready by calling sd_notifyf(), but it loads rules and applies
> permissions before doing so [0].
> Even before we have some code about handling events and monitoring
> stuff.

It loads the rules, but events will only be processed after entering
sd_event_loop(), which happens after the sd_notify() call.

Anyway, booting the system with "udev.log-priority=debug" might provide
further insight. Oleksandr, could you try that (without the After=
directive)?

> So I guess pvscan is started in initialization phase before udevd
> signals
> being ready. And obviously there is any kind of race condition.

Right. Some uevent might arrive between the creation of the monitor
socket in monitor_new() and entering the event loop. Such event would
be handled immediately, and possibly before systemd receives the
sd_notify message, so a race condition looks possible.

> 
> With the ordering "After=" in `lvm2-pvscan@.service` the service
> start is
> queued at initialization phase, but actual start and pvscan execution
> is
> delayed until udevd signaled being ready.
> 
> > But in general, I think this needs deeper analysis. Looking at
> > https://bugs.archlinux.org/task/69611, the workaround appears to
> > have
> > been found simply by drawing an analogy to a previous similar case.
> > I'd like to understand what happened on the arch system when the
> > error
> > occured, and why this simple ordering directive avoided it.
> 
> As said I can not reproduce it myself... Oleksandr, can you give more
> details?
> Possibly everything from journal regarding systemd-udevd.service (and
> systemd-udevd.socket) and lvm2-pvscan@*.service could help.
> 
> > 1. How had the offending pvscan process been started? I'd expect
> > that
> > "pvscan" (unlike "lvm monitor" in our case) was started by an udev
> > rule. If udevd hadn't started yet, how would that udev rule have be
> > executed? OTOH, if pvscan had not been started by udev but by
> > another
> > systemd service, than *that* service would probably need to get the
> > After=systemd-udevd.service directive.
> 
> To my understanding it was started from udevd by a rule in
> `69-dm-lvm-metad.rules`.
> 
> (BTW, renaming that rule file may make sense now that lvm2-metad is
> gone...)
> 
> > 2. Even without the "After=" directive, I'd assume that pvscan
> > wasn't
> > started "before" systemd-udevd, but rather "simultaneously" (i.e.
> > in
> > the same systemd transaction). Thus systemd-udevd should have
> > started
> > up while pvscan was running, and pvscan should have noticed that
> > udevd
> > eventually became available. Why did pvscan time out? What was it
> > waiting for? We know that lvm checks for the existence of
> > "/run/udev/control", but that should have become avaiable after
> > some
> > fractions of a second of waiting.
> 
> I do not think there is anything starting pvscan before udevd.

I agree. The race described above looks at least possible.
I would go one step further and say that *every* systemd service that
might be started from an udev rule should have an "After=systemd-
udevd.service".

Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

