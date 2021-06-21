Return-Path: <SRS0=0Xx+=LP=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A670C4743C
	for <linux-lvm@archiver.kernel.org>; Mon, 21 Jun 2021 20:00:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF9B6113E
	for <linux-lvm@archiver.kernel.org>; Mon, 21 Jun 2021 20:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDF9B6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624305630;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z4i+pC/bmENEs8E+Eu98M9qUGWehy3+iH41GXCHCZso=;
	b=SInsl3atP8FKar5tUqA1ylZl2RTu6NyooJwQMqguG2WqfFxYxvHVZ9AmtyDDaPrc7+qtWS
	iNkiRwkv8Lcmi/S3LOYjlR28y1s6VJ3TOTlUVtO8K1wpgYCPH+3Bqnv/d26cbdHCBjUjca
	a9g61G8dAT0ejsXpnbOV1CFRZo7wTEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-jfMO6tHnMQ6YtSPFEBC03g-1; Mon, 21 Jun 2021 16:00:27 -0400
X-MC-Unique: jfMO6tHnMQ6YtSPFEBC03g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61BE21B2C9A1;
	Mon, 21 Jun 2021 20:00:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6742760C13;
	Mon, 21 Jun 2021 20:00:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C2B01809C9A;
	Mon, 21 Jun 2021 20:00:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LK091F021316 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 16:00:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3270B190F2; Mon, 21 Jun 2021 20:00:09 +0000 (UTC)
Received: from agk.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0695560C9D;
	Mon, 21 Jun 2021 20:00:01 +0000 (UTC)
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1lvQ5Q-00052x-28; Mon, 21 Jun 2021 21:00:00 +0100
Date: Mon, 21 Jun 2021 21:00:00 +0100
From: Alasdair G Kergon <agk@redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20210621200000.GA21390@agk.fab.redhat.com>
Mail-Followup-To: LVM general discussion and development <linux-lvm@redhat.com>
References: <917d8044-4e7b-e54e-fe69-f60c6703a00f@gmail.com>
	<20210621194823.GA32112@redhat.com>
Mime-Version: 1.0
In-Reply-To: <20210621194823.GA32112@redhat.com>
User-Agent: Mutt/1.4.1i
Organization: Red Hat UK Ltd. Registered in England and Wales,
	number 03798903. Registered Office: Amberley Place,
	107-111 Peascod Street, Windsor, Berkshire, SL4 1TE.
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Possible Bug vgrename
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

On Mon, Jun 21, 2021 at 02:48:23PM -0500, David Teigland wrote:
> On Mon, Jun 21, 2021 at 11:32:12AM -0700, N wrote:
> > Is there a way to temporarily rename (without actually renaming) the volume
> > groups (i.e. like setting a mask for the volume group names), or is there a
> > way to force vgrename to actually make the change even if there is an
> > existing conflict (preferably without a reboot)?
> You can set a device filter the vgrename command so it only sees the
> devices with the VG you want to change, and won't see devices with the
> duplicate name.
> vgrename --config 'devices/filter=["a|/dev/...|", "r|.|"]' vg1 vg2

And look at how the 'vgimportclone' shell script uses filters and
other techniques to set up a segregated environment in which to
modify a VG that isn't being used on the machine.

As extra protection sometimes, you can also tell a command not to talk to 
the kernel dm subsystem by using '--driverloaded n'.

Alasdair

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

