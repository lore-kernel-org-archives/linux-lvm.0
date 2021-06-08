Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DDCC47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 12:29:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52CD61352
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 12:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C52CD61352
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623155385;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QLDr6MJYy7J34ZWCgLUz0r2wktRXdE2q7Gc80Jsdvw0=;
	b=hSjURG8+jWbCiwENb4rWeVR0HLlO5+3ks4X8UfF4POd0dbBs9RXK6AZvCcPn++kmh7rtc3
	N3ZVulh4oero5N7An47LlVo/zJPFThuMlZMpzZduSkDWMmf6g6A18f3mgWbZaiHySRJCgm
	QGYyZRbudDIr0X8Rr3AKHbj5BSLrqGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-_KhDWRG_N_Gk4mbX28jkRA-1; Tue, 08 Jun 2021 08:29:44 -0400
X-MC-Unique: _KhDWRG_N_Gk4mbX28jkRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE23F8B0BEA;
	Tue,  8 Jun 2021 12:29:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5708319C66;
	Tue,  8 Jun 2021 12:29:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 778535F98A;
	Tue,  8 Jun 2021 12:29:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158CT6iA029874 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 08:29:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C5C38428A; Tue,  8 Jun 2021 12:29:06 +0000 (UTC)
Received: from alatyr-rpi.brq.redhat.com (unknown [10.43.17.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E6CC70F79;
	Tue,  8 Jun 2021 12:29:04 +0000 (UTC)
Date: Tue, 8 Jun 2021 14:29:01 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210607214835.GB8181@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-lvm@redhat.com
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>, Martin Wilck <martin.wilck@suse.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon 07 Jun 2021 16:48, David Teigland wrote:
> On Mon, Jun 07, 2021 at 03:48:30PM +0000, Martin Wilck wrote:
> > On So, 2021-06-06 at 14:15 +0800, heming.zhao@suse.com wrote:
> > > 
> > > 1. During boot phase, lvm2 automatically swithes to direct activation
> > > mode
> > > ("event_activation = 0"). After booted, switch back to the event
> > > activation mode.
> > > 
> > > Booting phase is a speical stage. *During boot*, we could "pretend"
> > > that direct
> > > activation (event_activation=0) is set, and rely on lvm2-activation-
> > > *.service
> > > for PV detection. Once lvm2-activation-net.service has finished, we
> > > could
> > > "switch on" event activation.
> > 
> > I like this idea. Alternatively, we could discuss disabling event
> > activation only in the "coldplug" phase after switching root (i.e.
> > between start of systemd-udev-trigger.service and lvm2-
> > activation.service), because that's the critical time span during which
> > 1000s of events can happen simultaneously.
> 
> If there are say 1000 PVs already present on the system, there could be
> real savings in having one lvm command process all 1000, and then switch
> over to processing uevents for any further devices afterward.  The switch
> over would be delicate because of the obvious races involved with new devs
> appearing, but probably feasible.

Maybe to avoid the race, we could possibly write the proposed
"/run/lvm2/boot-finished" right before we initiate scanning in "vgchange
-aay" that is a part of the lvm2-activation-net.service (the last
service to do the direct activation).

A few event-based pvscans could fire during the window between
"scan initiated phase" in lvm2-activation-net.service's "ExecStart=vgchange -aay..."
and the originally proposed "ExecStartPost=/bin/touch /run/lvm2/boot-finished",
but I think still better than missing important uevents completely in
this window.

Peter

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

