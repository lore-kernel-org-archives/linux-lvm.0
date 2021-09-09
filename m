Return-Path: <SRS0=4JFB=N7=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BF3C433EF
	for <linux-lvm@archiver.kernel.org>; Thu,  9 Sep 2021 19:49:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B63B6103C
	for <linux-lvm@archiver.kernel.org>; Thu,  9 Sep 2021 19:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B63B6103C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631216961;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZfkYwlmJXnvEKOXNRFWIyFS/1Cd9pB24amKNlR74bQw=;
	b=aLCHUoGa0rMwkPpdA3WQ+/GDNlUGGpCaKQDwHoAVdoX68PkJGp0sW1MzGUdSkvgFDbY6SB
	CwlBvorQtm95q4IP/f86kk01qnEpyNCncfJhQ/r/jYYN6iE5TcEj1cxrnG3MYacOM9kmbw
	AAtZDB7qVF3eRFmLaXX6zDUiUkgFg0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-kuaEnyyoMY-8GxEbpeBmjA-1; Thu, 09 Sep 2021 15:49:19 -0400
X-MC-Unique: kuaEnyyoMY-8GxEbpeBmjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B8BD8145E5;
	Thu,  9 Sep 2021 19:49:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 345FC6D981;
	Thu,  9 Sep 2021 19:49:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7B334E58F;
	Thu,  9 Sep 2021 19:48:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 189JiNAP030091 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 9 Sep 2021 15:44:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C8366A8E4; Thu,  9 Sep 2021 19:44:23 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 933085D6CF;
	Thu,  9 Sep 2021 19:44:18 +0000 (UTC)
Date: Thu, 9 Sep 2021 14:44:17 -0500
From: David Teigland <teigland@redhat.com>
To: linux-lvm@redhat.com
Message-ID: <20210909194417.GC19437@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-lvm@redhat.com
Cc: zkabelac@redhat.com, bmarzins@redhat.com, prajnoha@redhat.com,
	heming.zhao@suse.com, martin.wilck@suse.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 01:23:33PM +0000, Martin Wilck wrote:
> On Di, 2021-06-08 at 14:29 +0200, Peter Rajnoha wrote:
> > On Mon 07 Jun 2021 16:48, David Teigland wrote:
> > >=20
> > > If there are say 1000 PVs already present on the system, there
> > > could be
> > > real savings in having one lvm command process all 1000, and then
> > > switch
> > > over to processing uevents for any further devices afterward.=A0 The
> > > switch
> > > over would be delicate because of the obvious races involved with
> > > new devs
> > > appearing, but probably feasible.
> >=20
> > Maybe to avoid the race, we could possibly write the proposed
> > "/run/lvm2/boot-finished" right before we initiate scanning in
> > "vgchange
> > -aay" that is a part of the lvm2-activation-net.service (the last
> > service to do the direct activation).
> >=20
> > A few event-based pvscans could fire during the window between
> > "scan initiated phase" in lvm2-activation-net.service's
> > "ExecStart=3Dvgchange -aay..."
> > and the originally proposed "ExecStartPost=3D/bin/touch /run/lvm2/boot-
> > finished",
> > but I think still better than missing important uevents completely in
> > this window.
>=20
> That sounds reasonable. I was thinking along similar lines. Note that
> in the case where we had problems lately, all actual activation (and
> slowness) happened in lvm2-activation-early.service.

I've implemented a solution like this and would like any thoughts,
improvements, or testing to verify it can help:
https://sourceware.org/git/?p=3Dlvm2.git;a=3Dshortlog;h=3Drefs/heads/dev-dc=
t-activation-switch-1

I've taken some direction from the lvm activation generator, but there are
details of that I'm not too familiar with, so I may be missing something
(in particular it has three activation points but I'm showing two below.)
This new method would probably let us drop the activation-generator, since
we could easily configure an equivalent using this new method.

Here's how it works:

uevents for PVs run pvscan with the new option --eventactivation check.
This makes pvscan check if the /run/lvm/event-activation-on file exists.
If not, pvscan does nothing.

lvm-activate-vgs-main.service
. always runs (not generated)
. does not wait for other virtual block device systems to start
. runs vgchange -aay to activate any VGs already present

lvm-activate-vgs-last.service
. always runs (not generated)
. runs after other systems, like multipathd, have started (we want it
  to find as many VGs to activate as possible)
. runs vgchange -aay --eventactivation enable
. the --eventactivation enable creates /run/lvm/event-activation-on,
  which enables the traditional pvscan activations from uevents.
. this vgchange also creates pv online files for existing PVs.
  (Future pvscans will need the online files to know when VGs are
  completed, i.e. for VGs that are partially complete at the point
  of switching to event based actvivation.)

uevents for PVs continue to run pvscan with the new option
--eventactivation check, but the check now sees the event-activation-on
temp file, so they will do activation as they have before.

Notes:

- To avoid missing VGs during the transition to event-based, the vgchange
in lvm-activate-vgs-last will create event-activation-on before doing
anything else.  This means for a period of time both vgchange and pvscan
may attempt to activate the same VG.  These commits use the existing
mechanism to resolve this (the --vgonline option and /run/lvm/vgs_online).

- We could use the new lvm-activate-* services to replace the activation
generator when lvm.conf event_activation=3D0.  This would be done by simply
not creating the event-activation-on file when event_activation=3D0.

- To do the reverse, and use only event based activation without any
lvm-activate-vgs services, a new lvm.conf setting could be used, e.g.
event_activation_switch=3D0 and disabling lvm-activate-vgs services.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

