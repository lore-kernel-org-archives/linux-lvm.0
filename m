Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B43C47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 15:40:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5AC61263
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 15:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E5AC61263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623166814;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=063+eW2YorAlMmHlcuXaeBR6q+jqcoFCljMxIBPNqWU=;
	b=blDxkZY6Gf1FYlYHrgvZDtkIE0ZzgYVqTeCBdq8Hs62AEXk8C+mtzLMW3vYDA7vicJWb1G
	bDvTSvc0osq21PppLAPkOVMpUaE4UJ+jCo0bVdSlXXJ/NiYJdCRR3pIGZjFAT6Q2r2lVNz
	fI+hR8FMsgJGJasPL83ljHfluqaFxJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-Ih9APExRP2SKf4wxcByZqg-1; Tue, 08 Jun 2021 11:40:12 -0400
X-MC-Unique: Ih9APExRP2SKf4wxcByZqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EBB819251C8;
	Tue,  8 Jun 2021 15:39:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E03F60CC6;
	Tue,  8 Jun 2021 15:39:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79D721800BB4;
	Tue,  8 Jun 2021 15:39:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158FddEH016867 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 11:39:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74B8D19D9D; Tue,  8 Jun 2021 15:39:39 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D63DE19C45;
	Tue,  8 Jun 2021 15:39:38 +0000 (UTC)
Date: Tue, 8 Jun 2021 10:39:37 -0500
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210608153937.GA21355@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-lvm@redhat.com
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>, prajnoha@redhat.com,
	Heming Zhao <heming.zhao@suse.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>
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

On Tue, Jun 08, 2021 at 08:26:01AM +0000, Martin Wilck wrote:
> IIUC, 2) is the effect of _pvscan_aa_quick(). 3) is surprising;
> apparently libudev's device detection causes a factor 3 slowdown.
> While 40s is not bad, you can see that event based activation still
> performs far worse than "serial" device detection lvm2-activation-
> early.service.
> 
> Personally, I'm sort of wary about obtain_device_list_from_udev=0
> because I'm uncertain whether it might break multipath/MD detection.
> Perhaps you can clarify that.

Yes, that's an issue, but it's something we've needed to clean up for a
while, and I made a small start on it a while back.

obtain_device_list_from_udev is supposed to only control whether lvm gets
a list of device names from readdir /dev, or from libudev.  My preference
is default 0, readdir /dev.  This avoids the performance problem and makes
lvm less dependent on the vagaries of udev in general.

But, as you and Peter mentioned, obtain_device_list_from_udev also became
entangled with md/mpath detection methods, which is more closely related
to external_device_info_source=udev|none.

I think it would be an improvement to:

. Make obtain_device_list_from_udev only control how we get the device
  list. Then we can easily default to 0 and readdir /dev if it's better.

. Use both native md/mpath detection *and* udev info when it's readily
  available (don't wait for it), instead of limiting ourselves to one
  source of info.  If either source indicates an md/mpath component,
  then we consider it true.

The second point means we are free to change obtain_device_list_from_udev
as we wish, without affecting md/mpath detection.  It may also improve
md/mpath detection overall.

A third related improvement that could follow is to add stronger native
mpath detection, in which lvm uses uses /etc/multipath/wwids, directly or
through a multipath library, to identify mpath components.  This would
supplement the existing sysfs and udev sources, and address the difficult
case where the mpath device is not yet set up.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

