Return-Path: <SRS0=XKGo=OU=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC66EC433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 14:27:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89140600D3
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 14:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89140600D3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633012023;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KlGP+X8fKk7K5qw6wvA6Ij03+tYYfKDdOrWxY8uiFIs=;
	b=iEfQxOzI35nHr056PC7tkV38Yn5bgyeN+K4dUcVPtgd2Fy12s3OJr8f36fyNsYBf+br5IS
	6d2GH55BpOiD6PCCdtPMh+qjpLNF4BWeHhKGGVXbBfbG48KSErD6nB+QZBr4E+db+XoQcg
	YMJ8m3iToYYS5xAeFsXLSJWLSRcpAIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-esE8P83uP_KYHTlBmDlFtw-1; Thu, 30 Sep 2021 10:27:00 -0400
X-MC-Unique: esE8P83uP_KYHTlBmDlFtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1FF21054F90;
	Thu, 30 Sep 2021 14:26:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 978F116A33;
	Thu, 30 Sep 2021 14:26:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50D3C1803B30;
	Thu, 30 Sep 2021 14:26:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18UEQe1X008018 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 30 Sep 2021 10:26:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 36F556060F; Thu, 30 Sep 2021 14:26:40 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B51760854;
	Thu, 30 Sep 2021 14:26:31 +0000 (UTC)
Date: Thu, 30 Sep 2021 09:26:29 -0500
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210930142629.GA32174@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
	<700af71c5293946105c779dbf9e8cd95344fc7af.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <700af71c5293946105c779dbf9e8cd95344fc7af.camel@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 07:22:29AM +0000, Martin Wilck wrote:
> On Wed, 2021-09-29 at 23:39 +0200, Peter Rajnoha wrote:
> > For event-based activation, I'd expect it to really behave in event-
> > based manner, that is, to respond to events as soon as they come and no=
t
> > wait for all the other devices unnecessarily.
>=20
> I may be missing something here. Perhaps I misunderstood David's
> concept. Of course event-based activation is best - in theory.
> The reason we're having this discussion is that it may cause thousands
> of event handlers being executed in parallel, and that we have seen
> cases where this was causing the system to stall during boot for
> minutes, or even forever.=A0The ideal solution for that would  be to
> figure out how to avoid the contention, but I thought you and David had
> given up on that.
>=20
> Heming has shown that the "static" activation didn't suffer from this
> problem. So, to my understanding, David was seeking for a way to
> reconcile these two concepts, by starting out statically and switching
> to event-based activation when we can without the risk of stalling. To
> do that, we must figure out when to switch, and (like it or not) udev
> settle is the best indicator we have.
>=20
> Also IMO David was striving for a solution that "just works"
> efficiently both an small and big systems, without the admin having to
> adjust configuration files.

Right, this is not entirely event based any longer, so there could be some
advantage of an event-based system that we sacrifice.  I think that will
be a good tradeoff for the large majority of cases, and will make a good
default.

> > The use of udev-settle is always a pain - for example, if there's a mou=
nt
> > point defined on top of an LV, with udev-settle as dependency, we pract=
ically
> > wait for all devices to settle. With 'all', I mean even devices which a=
re not
> > block devices and which are not event related to any of that LVM
> > layout and the stack underneath. So simply we could be waiting uselessl=
y and we
> > could increase possibility of a timeout (...for the mount point etc.).

One theoretical advantage of an event-based system is that it reacts
immediately, so you get faster results.  In practice it's often anything
but immediate, largely because of extra work and moving parts in the
event-based scheme, processing each event individually.  So, the simpler
non-event-based method will often be faster I think, and more robust (all
the moving parts are where things break, so best to minimize them.)

You've filled in some interesting details about udev-settle for me, and it
sounds like there are some ideas forming about an alternative, which would
offer us a better way to switch to event-base-mode.  I'd like to be able
to simply replace the systemd-udev-settle dependency with an improved
"new-settle" dependency when that's ready.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

