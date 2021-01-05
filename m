Return-Path: <SRS0=nGWe=GI=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D30C433DB
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Jan 2021 20:48:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E713822262
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Jan 2021 20:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E713822262
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609879690;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=18ULwPVfsGJ05JXtWxn84PY6VNNE4Rz0h2i+1+8Z4vM=;
	b=IZTuuBvsFe55T6ytnnWwS1Uvr3AtGhNVeG4vBA00bIQ9GgMIAe8MPhNceg09ZllBSXHa/G
	8zZYdKi9VxxLB4mpliMLApXO0QgWhrhI/wlPCLSSS1z1HqKt1UguvzmM/EMy35rkk/p7lM
	9nhKaUqyzRR8Q5Hy6tQ4BITR/tItcv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-l1OEDo2QMF-XvineTVTJhA-1; Tue, 05 Jan 2021 15:48:08 -0500
X-MC-Unique: l1OEDo2QMF-XvineTVTJhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A468A10054FF;
	Tue,  5 Jan 2021 20:48:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3316071C9E;
	Tue,  5 Jan 2021 20:47:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5BF718095C7;
	Tue,  5 Jan 2021 20:47:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 105KljaC021965 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 5 Jan 2021 15:47:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3193A60BFA; Tue,  5 Jan 2021 20:47:45 +0000 (UTC)
Received: from agk.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E854A60BE5;
	Tue,  5 Jan 2021 20:47:38 +0000 (UTC)
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1kwtEv-00020w-Ne; Tue, 05 Jan 2021 20:47:37 +0000
Date: Tue, 5 Jan 2021 20:47:37 +0000
From: Alasdair G Kergon <agk@redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20210105204737.GC5546@agk.fab.redhat.com>
Mail-Followup-To: LVM general discussion and development <linux-lvm@redhat.com>
References: <87im8bch2c.fsf@vps.thesusis.net>
Mime-Version: 1.0
In-Reply-To: <87im8bch2c.fsf@vps.thesusis.net>
User-Agent: Mutt/1.4.1i
Organization: Red Hat UK Ltd. Registered in England and Wales,
	number 03798903. Registered Office: Amberley Place,
	107-111 Peascod Street, Windsor, Berkshire, SL4 1TE.
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Mirror allocation policy
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 05, 2021 at 02:31:00PM -0500, Phillip Susi wrote:
> How can I forge it to make the mirror on a single pv?  

If --alloc anywhere isn't doing the trick, you'll need to dig into
the -vvvv output to try to understand why.  There might be
a config option setting getting in the way disabling the choice you want
it to make, or if it's an algorithmic issue you might try to coax it to
do the right thing by removing whatever choice it has in the allocation
by specifying the actual pv:extent ranges it must use on the command line.

Alasdair

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

