Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA672C47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 15:20:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 766C360E08
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 15:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 766C360E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623165609;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gdQgvEYHSGOzRqj0DguxLbL+QxgjlbJ+Ep8mllGsraY=;
	b=T8/PCn0g7M3EEJKAvy9a9i/rnb3qgInfxXHhQm+AKQgsh6kbzDad5PBpzVCUmei/xVMX8i
	59IgITF8pU7CpT5kdg7U3h1BMtylrAx/iX4e5DGQhwNe5cnbiiIqNCPyEj6czuEakxPHuo
	qtzCJRChQd8w11VUbqMG/BRNl0AlUU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-O-MHRmQ5P4iaD7FRVVWCrg-1; Tue, 08 Jun 2021 11:20:06 -0400
X-MC-Unique: O-MHRmQ5P4iaD7FRVVWCrg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 277E0101F7CF;
	Tue,  8 Jun 2021 15:19:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A835B5D6DC;
	Tue,  8 Jun 2021 15:19:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB7B31800BB4;
	Tue,  8 Jun 2021 15:19:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158FJdDe014558 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 11:19:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0CF35C1D5; Tue,  8 Jun 2021 15:19:39 +0000 (UTC)
Received: from alatyr-rpi.brq.redhat.com (unknown [10.43.17.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DD985C1BB;
	Tue,  8 Jun 2021 15:19:35 +0000 (UTC)
Date: Tue, 8 Jun 2021 17:19:32 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210608151931.npwffccjw3owsk6b@alatyr-rpi.brq.redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210608134139.iocq5if2hbodrns7@alatyr-rpi.brq.redhat.com>
	<fa7d4756-e084-8811-da40-de95e95a1ae1@redhat.com>
	<20210608135648.gr5xfwma2f3jschr@alatyr-rpi.brq.redhat.com>
	<be2c97261639e35096a990aabeb2422f16472bd0.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <be2c97261639e35096a990aabeb2422f16472bd0.camel@suse.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-lvm@redhat.com
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue 08 Jun 2021 14:48, Martin Wilck wrote:
> On Di, 2021-06-08 at 15:56 +0200, Peter Rajnoha wrote:
> > 
> > The issue is that we're relying now on udev db records that contain
> > info about mpath and MD components - without this, the detection (and
> > hence filtering) could fail in certain cases. So if go without
> > checking
> > udev db, that'll be a step back. As an alternative, we'd need to call
> > out mpath and MD directly from LVM2 if we really wanted to avoid
> > checking udev db (but then, we're checking the same thing that is
> > already checked by udev means).
> 
> Recent multipath-tools ships the "libmpathvalid" library that
> could be used for this purpose, to make the logic comply with what
> multipathd itself uses. It could be used as an alternative to libudev
> for this part of the equation.

Ah, yes, sure! Still, we have the MD in play...

Out of curiosity - if you disable mpath and MD component detection in
lvm.conf, can you still hit the issue? (Of course, if you're not using
any of the two in your stack.)

Peter

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

