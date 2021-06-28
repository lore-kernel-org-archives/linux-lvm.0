Return-Path: <SRS0=u9pG=LW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5316AC2B9F4
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 15:09:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F00DF613FD
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 15:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F00DF613FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624892940;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i0BtFlwlj1pV2O/mizQdmQnYt+Q9+XuVxSKaKybdjn4=;
	b=f8E+kvBgY3jnHGPUEQONvW3sL8AbU+bC9+xc2xLUHRSW+7UgB9xk1wPJ1C0M3QP1ZwceqU
	2C4o0hU2WKP/OydbvF6lX3TOXYLjwSt34YbqwnRC7SifOpH/WJACmU8DqC8s6jDC5XAaTP
	8pHeDQ5bQEfBd/3ct8XC3MNh4EYysi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-uTb1BoPaNFqRFcImN35foQ-1; Mon, 28 Jun 2021 11:08:58 -0400
X-MC-Unique: uTb1BoPaNFqRFcImN35foQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A75C800C78;
	Mon, 28 Jun 2021 15:08:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49C5227068;
	Mon, 28 Jun 2021 15:08:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 424CD4EA37;
	Mon, 28 Jun 2021 15:08:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SF8W8r005660 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 11:08:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AE41860875; Mon, 28 Jun 2021 15:08:32 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2773160843;
	Mon, 28 Jun 2021 15:08:29 +0000 (UTC)
Date: Mon, 28 Jun 2021 10:08:27 -0500
From: David Teigland <teigland@redhat.com>
To: Tom Yan <tom.ty89@gmail.com>
Message-ID: <20210628150827.GA23977@redhat.com>
References: <CAGnHSE=HRk+x4tcVdPuZFtnBGai3dP5KC6wHpeX1adAXq_mftQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGnHSE=HRk+x4tcVdPuZFtnBGai3dP5KC6wHpeX1adAXq_mftQ@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-lvm@redhat.com
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] pvscan --cache -aay $device does not activate LV
 with multiple "legs"
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

On Sun, Jun 27, 2021 at 09:01:43PM +0800, Tom Yan wrote:
> [tom@archlinux ~]$ sudo pvscan --cache -aay /dev/sdb
>   pvscan[2066] PV /dev/sdb online, VG green is complete.
>   pvscan[2066] VG green skip autoactivation.

The "skip autoactivation" means that the VG has already been activated
by a prior pvscan, so it's not being activated again.  This state is kept
in /run/lvm/vgs_online/<vgname>.  The files under /run need to be cleared
by reboot.  The first pvscan to activate the VG creates that temp file
(during startup there's often a race among multiple pvscans to activate
the same VG, and the temp file ensures that only one of them does it.)

> So is this some kind of bug/regression? Or is it intended for some
> reason? What I expect would be, when the command is run with any of
> the legs of such an LV as the device, it will check whether all legs
> of it are available and if so, the LV will be activated.

The files under /run/lvm/pvs_online/ record which PVs have appeared during
startup; they are created by the pvscan for each device.  pvscan uses
these to know when the VG is complete and the LVs can be activated.

To test this out manually, remove all the files in pvs_online and
vgs_online, and run pvscan --cache -aay $dev for each device in your VG.
You should find that the final pvscan will activate the VG.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

