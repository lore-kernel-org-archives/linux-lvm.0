Return-Path: <SRS0=Ecxi=OT=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA5CC433F5
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 22:07:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F8A761406
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 22:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F8A761406
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632953247;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EqGdRBocJ47g7DRDBxk3O+Sb80vIgKLj2UNwIbkRFxI=;
	b=bE/MBoaDWNWZm/2bcRNoPaagOLa3X3rJJ6SJrSZO+24WqSt3cby6Nfm6nd6FY0nydOKDi8
	YfxPV/84Mj4xC3nahud1fU2lg/XIZCb71FmMUNMBGSU2IsQMIs6idcoL9t9FtvNKiuLIBF
	8hkPxdBcQZQVf/QEi0IXcX83GPtxUsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-angjIs_0MV-9HQCdjh_9Hg-1; Wed, 29 Sep 2021 18:07:25 -0400
X-MC-Unique: angjIs_0MV-9HQCdjh_9Hg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30AAF3E776;
	Wed, 29 Sep 2021 22:07:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D57960862;
	Wed, 29 Sep 2021 22:07:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2BB61800B9C;
	Wed, 29 Sep 2021 22:07:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18TM78je020776 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 29 Sep 2021 18:07:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70B73F00CD; Wed, 29 Sep 2021 22:07:08 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66707F11F7
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2021 22:07:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 995E3800B26
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2021 22:07:04 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
	[209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-251-wuFmvAEsNi-xYk2BcvoAVw-1; Wed, 29 Sep 2021 18:06:57 -0400
X-MC-Unique: wuFmvAEsNi-xYk2BcvoAVw-1
Received: by mail-ed1-f72.google.com with SMTP id
	d11-20020a50cd4b000000b003da63711a8aso3944252edj.20
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2021 15:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=tH7JiQUBlvarBjL9CNcENaA9FTLbu9C+TOl4jWpdaxs=;
	b=nPkN8tmZOgGECG4VXmXQCEqGS/XLrKsE6QBlJ1xr6sEW5Kbs2G5hACLsumeQ3C7R9A
	ApsZXB15N1ovb2lXXhbRdJ63OfRL5CizceAqTcO5M/b67bPnq2C4u7f/i5BN4KOr/XdL
	bXghzb3H8hiPHyFPjCwRvAqTVTl6Zd6RJZU9Ag7dUBbPdwXtxfEfYRmIq9hbRfD/jEdB
	NCBExYUF1G1tMciIgSBQ0SXIDChYxs5qqvEXcj2c71ebZbYKfzlCWIuUckvYKOapthuc
	qHGzpRhpoRm4nr4Oo3ArUBd0GSIAPl11bMkDNbLi9ZjVPPaRvdE5YVwCeshRCCLW6yep
	sH7A==
X-Gm-Message-State: AOAM53332ONjCrh0cq0JzyFUjlXKwyV9sMJbQ88eNC1vjv+hGU0KXOks
	37lUcXMuCCgJRzKSlYKo7obuSQx6XBFDUcWC6DpP4AZOVbb7iLODLKUZMgFoi5yOaXGVcLCaZrA
	3T3RFaRcxn8db8UIF
X-Received: by 2002:a50:da8f:: with SMTP id q15mr2852848edj.139.1632953216848; 
	Wed, 29 Sep 2021 15:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy0p+VsJbBApwTrjpeBGwWEU24EiM50MlE4n+RoualMnPnXKrAErRPbCD2MSuvzYfZKuYmrA==
X-Received: by 2002:a50:da8f:: with SMTP id q15mr2852825edj.139.1632953216685; 
	Wed, 29 Sep 2021 15:06:56 -0700 (PDT)
Received: from alatyr-rpi.brq.redhat.com (nat-pool-brq-t.redhat.com.
	[213.175.37.10]) by smtp.gmail.com with ESMTPSA id
	lb12sm580327ejc.28.2021.09.29.15.06.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Sep 2021 15:06:56 -0700 (PDT)
Date: Thu, 30 Sep 2021 00:06:53 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Message-ID: <20210929220653.p45cvgzdhlbnp4gy@alatyr-rpi.brq.redhat.com>
References: <20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
	<20210928174246.GF3087@octiron.msp.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210928174246.GF3087@octiron.msp.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
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

On Tue 28 Sep 2021 12:42, Benjamin Marzinski wrote:
> On Tue, Sep 28, 2021 at 03:16:08PM +0000, Martin Wilck wrote:
> > I have pondered this quite a bit, but I can't say I have a concrete
> > plan.
> > 
> > To avoid depending on "udev settle", multipathd needs to partially
> > revert to udev-independent device detection. At least during initial
> > startup, we may encounter multipath maps with members that don't exist
> > in the udev db, and we need to deal with this situation gracefully. We
> > currently don't, and it's a tough problem to solve cleanly. Not relying
> > on udev opens up a Pandora's box wrt WWID determination, for example.
> > Any such change would without doubt carry a large risk of regressions
> > in some scenarios, which we wouldn't want to happen in our large
> > customer's data centers.
> 
> I'm not actually sure that it's as bad as all that. We just may need a
> way for multipathd to detect if the coldplug has happened.  I'm sure if
> we say we need it to remove the udev settle, we can get some method to
> check this. Perhaps there is one already, that I don't know about. If

The coldplug events are synthesized and as such, they all now contain
SYNTH_UUID=<UUID> key-value pair with kernel>=4.13:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-uevent

I've already tried to proposee a patch for systemd/udev that would mark
all uevents coming from the trigger (including the one used at boot for
coldplug) with an extra key-value pair that we could easily match in rules,
but that was not accepted. So right now, we could detect that
synthesized uevent happened, though we can't be sure it was the actual
udev trigger at boot. For that, we'd need the extra marks. I can give it
another try though, maybe if there are more people asking for this
functionality, we'll be at better position for this to be accepted.

-- 
Peter

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

