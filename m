Return-Path: <SRS0=pm0O=PH=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B10C433EF
	for <linux-lvm@archiver.kernel.org>; Tue, 19 Oct 2021 17:19:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B71E861355
	for <linux-lvm@archiver.kernel.org>; Tue, 19 Oct 2021 17:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B71E861355
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634663947;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tUzBsVpMKqh2QH3+UoVGPETB9tseF+GkXQ3vTeugASU=;
	b=NeZlou4evXDKMTT9+M7pHD+S4ldUHWCvNAcaM3lARL1tMub/BxE2T02V4KIEydYk3srSO5
	124cjSc8egiQfwNGpx9DTP4aAqV/atgZy1UwzgzzF9dEEas0S7UsndkvtTuL9Uu5PJwMPg
	VH4CR64KHsz3TVO+cXQG3VQZlebtmsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448--inrgRG9MtuyryRfC1ddDQ-1; Tue, 19 Oct 2021 13:19:03 -0400
X-MC-Unique: -inrgRG9MtuyryRfC1ddDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7233100CCC0;
	Tue, 19 Oct 2021 17:18:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A8C319723;
	Tue, 19 Oct 2021 17:18:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1473F1801241;
	Tue, 19 Oct 2021 17:18:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JHIbAm014348 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 13:18:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DBBDE5BB0D; Tue, 19 Oct 2021 17:18:37 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D42F5BAF0;
	Tue, 19 Oct 2021 17:18:37 +0000 (UTC)
Date: Tue, 19 Oct 2021 12:18:33 -0500
From: David Teigland <teigland@redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20211019171833.GB13881@redhat.com>
References: <20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
	<20210930155542.GB32174@redhat.com>
	<418b2bd497a3a4cd76840b3cceb1955ba7e9ba01.camel@suse.com>
	<20211018150418.GA3917@redhat.com>
	<2e100f5d-6eec-a61b-004d-87b9c100f442@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2e100f5d-6eec-a61b-004d-87b9c100f442@gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-lvm@redhat.com
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 18, 2021 at 11:51:27PM +0200, Zdenek Kabelac wrote:
> The more generic solution with auto activation should likely try to 'active'
> as much found complete VGs as it can at any given moment in time.

> ATM lvm2 suffers when it's being running massively parallel - this has not
> been yet fully analyzed - but there is certainly much better throughput if
> there is limitted amount of 'parallel' executed lvm2 commands.

There a couple of possible bottlenecks that we can analyze separately:

1. the bottleneck of processing 100's or 1000's of uevents+pvscans.
2. the bottleneck of large number of concurrent vgchange -aay vgname.

The lvm-activate-vgs services completely avoid 1 by skipping them all, and
it also avoids 2 with one vgchange -aay *.  So, it seems to be pretty
close to an optimal solution, but I am interested to know more precisely
which bottlenecks we're avoiding.

I believe you're suggesting that bottleneck 1 doesn't really exist, and
that we're mainly suffering from 2.  If that's true, then we could
continue to utilize all the uevents+pvsans, and take advantage of them to
optimize the vgchange -aay commands.

That's an interesting idea, and we actually have the capabilities to try
that right now in my latest dev branch.  The commit "hints: new pvs_online
type" will do just that.  It will use the pvs_online files (created by
each uevent+pvscan) to determine which PVs to activate from.

$ pvs
  PV                 VG Fmt  Attr PSize    PFree   
  /dev/mapper/mpatha mm lvm2 a--  <931.01g <931.00g
  /dev/sdc           cd lvm2 a--  <931.01g  931.00g
  /dev/sdd           cd lvm2 a--  <931.01g <931.01g
$ rm /run/lvm/{pvs,vgs}_online/*
$ vgchange -an
  0 logical volume(s) in volume group "cd" now active
  0 logical volume(s) in volume group "mm" now active
$ vgchange -aay
  1 logical volume(s) in volume group "cd" now active
  3 logical volume(s) in volume group "mm" now active
$ vgchange -an
  0 logical volume(s) in volume group "cd" now active
  0 logical volume(s) in volume group "mm" now active
$ pvscan --cache /dev/sdc
  pvscan[929329] PV /dev/sdc online.
$ pvscan --cache /dev/sdd
  pvscan[929330] PV /dev/sdd online.
$ vgchange -aay --config devices/hints=pvs_online
  1 logical volume(s) in volume group "cd" now active
$ pvscan --cache /dev/mapper/mpatha
  pvscan[929338] PV /dev/mapper/mpatha online.
$ vgchange -aay --config devices/hints=pvs_online
  1 logical volume(s) in volume group "cd" now active
  3 logical volume(s) in volume group "mm" now active

vgchange is activating VGs only from the PVs that have been pvscan'ed.  So
if a large volume of uevents+pvscans is not actually a bottleneck, then it
looks like we could use them to optimize the vgchange commands in the
lvm-activate-vgs services.  I'll set up some tests to see how it compares.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

