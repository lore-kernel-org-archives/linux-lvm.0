Return-Path: <SRS0=XKGo=OU=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B3BC433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 15:56:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B57861411
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 15:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B57861411
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633017362;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JnqB54jjhTVcAi4iDjbEiBaeGR03uFn7UYQrLCkUNGw=;
	b=YW4cxLBScs1HSHcinnS+utGJE/dY4ifuQN+Hl3lCmKzUr6DzsQok21Rwp1fd/ADe2RdArN
	gt3UCNpgCcWFn7Zn6nWjdk2WtVJY0btSGLx4Hx5dmHDdmRpkzRm+/pVGQzklmMg5M2GNXy
	dG0GKTf+A2oqEfeNg233aqdiX5RAFBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-UYxDU-G_P868Qj5DAsaiHw-1; Thu, 30 Sep 2021 11:56:00 -0400
X-MC-Unique: UYxDU-G_P868Qj5DAsaiHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C367B100CCC0;
	Thu, 30 Sep 2021 15:55:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C90EF60BE5;
	Thu, 30 Sep 2021 15:55:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A13F94EA2A;
	Thu, 30 Sep 2021 15:55:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18UFtjeL015647 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 30 Sep 2021 11:55:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AB2F55C3DF; Thu, 30 Sep 2021 15:55:45 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E4E05C1A1;
	Thu, 30 Sep 2021 15:55:45 +0000 (UTC)
Date: Thu, 30 Sep 2021 10:55:42 -0500
From: David Teigland <teigland@redhat.com>
To: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <20210930155542.GB32174@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 29, 2021 at 11:39:52PM +0200, Peter Rajnoha wrote:
> Hmm, thinking about this, I've just realized one more important and related
> thing here I didn't realize before - the LVM regex filters! These may contain
> symlink names as one can find them in /dev. But for those symlinks, we need
> to be sure that the rules are already applied. This practically means that:

At least at RH we're enabling the devices file by default (meaning no
filter) in the same timeframe that we're looking at these activation
services.  So, I don't think this is a big factor.

>   - For non-event-based activation, we need udev-settle (so we're sure
>     all the rules are applied for all devices we might be scanning).
> 
>   - For event-based activation, we need to be sure that we use "RUN"
>     rule, not any of "IMPORT{program}" or "PROGRAM" rule. The difference
>     is that the "RUN" rules are applied after all the other udev rules are
>     already applied for current uevent, including creation of symlinks. And
>     currently, we have IMPORT{program}="pvscan..." in our rule,
>     unfortunately...

That's pretty subtle, I'm wary about propagating such specific and
delicate behavior, seems fragile.

> The nodes are already there, the symlinks could be missing because the
> udev rules haven't been processed yet.
> 
> Non-event-based LVM activation needs to wait for settle for sure (because
> there's full scan across all devices).
> 
> Event-based LVM activation just needs to be sure that:
> 
>   - the pvscan only scans the single device (the one for which there's
>     the uevent currently being processed),
> 
>   - the pvscan should be called in a way that we have all the symlinks
>     in place so the regex filter still works for symlinks (== putting
>     the pvscan onto a RUN exec queue).

I think we're looking at a udev-settle dependency (or alternative) for all
cases, best to just make that explicit and consistent, and isolated in one
place.  I'm not really seeing a downside to that.  Then, focus efforts on
refining a replacement.  If the subtle dependencies are spread around then
it's hard to extract and improve the unwanted parts.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

