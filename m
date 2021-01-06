Return-Path: <SRS0=i8mD=GJ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F5FC433DB
	for <linux-lvm@archiver.kernel.org>; Wed,  6 Jan 2021 01:53:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 866EB2246B
	for <linux-lvm@archiver.kernel.org>; Wed,  6 Jan 2021 01:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 866EB2246B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609898006;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rM02XWZVL4iGQBQwH0vLEzr1r1IjqtIG36AW6kFU170=;
	b=PVHj0kx+mErWGDiBVRb4/bMuHU+tG1lYcRjwHfLxchx5JFH0RRlUukDHTVG5GkJzGqr85e
	wKhLmvs60OpdqoHttjNX12/Ey50eOOTWHCb25IXgZ6juOdHyTpxqXidr19aZPvezRCIDku
	Q92nhzAVn2Cfrd607qhPIEpkqU2RK4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-Q5UydSyaNEqX8VmeP1Q1Lw-1; Tue, 05 Jan 2021 20:53:23 -0500
X-MC-Unique: Q5UydSyaNEqX8VmeP1Q1Lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A966800D55;
	Wed,  6 Jan 2021 01:53:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 915301A7D9;
	Wed,  6 Jan 2021 01:53:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 949AC180954D;
	Wed,  6 Jan 2021 01:53:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1061r2Dc020691 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 5 Jan 2021 20:53:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BCEBE5D735; Wed,  6 Jan 2021 01:53:02 +0000 (UTC)
Received: from agk.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4536362677;
	Wed,  6 Jan 2021 01:52:56 +0000 (UTC)
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1kwy0M-000268-UE; Wed, 06 Jan 2021 01:52:54 +0000
Date: Wed, 6 Jan 2021 01:52:54 +0000
From: Alasdair G Kergon <agk@redhat.com>
To: Phillip Susi <phill@thesusis.net>
Message-ID: <20210106015254.GE5546@agk.fab.redhat.com>
Mail-Followup-To: Phillip Susi <phill@thesusis.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
References: <87im8bch2c.fsf@vps.thesusis.net>
	<20210105204737.GC5546@agk.fab.redhat.com>
	<87v9cbdqzy.fsf@vps.thesusis.net>
Mime-Version: 1.0
In-Reply-To: <87v9cbdqzy.fsf@vps.thesusis.net>
User-Agent: Mutt/1.4.1i
Organization: Red Hat UK Ltd. Registered in England and Wales,
	number 03798903. Registered Office: Amberley Place,
	107-111 Peascod Street, Windsor, Berkshire, SL4 1TE.
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> #libdm-config.c:1061       Setting
>  allocation/mirror_logs_require_separate_pvs to 0

So despite that, it's not letting you have the 'anywhere' for the log
part of the allocation.

However, for what you are doing, maybe you don't need an on-disk mirror
log or can temporarily borrow a little space (add small temporary
loopback PV to the VG?) for it?

>  #metadata/lv_manip.c:2704         Still need 7681 total extents from
>  370508 remaining (0 positional slots):
>  #metadata/lv_manip.c:2707           1 (1 data/0 parity) parallel areas
>  of 7680 extents each
>  #metadata/lv_manip.c:2711           1 metadata area of 1 extents each
>  #metadata/lv_manip.c:2535         Not using free space on existing
>  parallel PV /dev/md1.
>  #metadata/lv_manip.c:3220   Insufficient suitable allocatable extents
>  for logical volume : 7681 more required

Alasdair

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

