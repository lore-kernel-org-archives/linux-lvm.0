Return-Path: <SRS0=PyMc=JC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40468C433B4
	for <linux-lvm@archiver.kernel.org>; Mon,  5 Apr 2021 15:41:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F4866124C
	for <linux-lvm@archiver.kernel.org>; Mon,  5 Apr 2021 15:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F4866124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=reox.at
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-K3ki7QKjM7-5UzU5rXIT4A-1; Mon, 05 Apr 2021 11:41:38 -0400
X-MC-Unique: K3ki7QKjM7-5UzU5rXIT4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A899685405A;
	Mon,  5 Apr 2021 15:41:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BB75614FF;
	Mon,  5 Apr 2021 15:40:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B3D51809C84;
	Mon,  5 Apr 2021 15:40:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 135Fepow016398 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 5 Apr 2021 11:40:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C6571111C99; Mon,  5 Apr 2021 15:40:51 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 685641111C98
	for <linux-lvm@redhat.com>; Mon,  5 Apr 2021 15:40:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA73F802D1B
	for <linux-lvm@redhat.com>; Mon,  5 Apr 2021 15:40:48 +0000 (UTC)
Received: from midgard.reox.at (midgard.reox.at [176.9.78.130]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-278-nMtBzPWHN4WpVL83Ld01bQ-1;
	Mon, 05 Apr 2021 11:40:23 -0400
X-MC-Unique: nMtBzPWHN4WpVL83Ld01bQ-1
Received: from 127.0.0.1 (localhost [127.0.0.1])
	by midgard.reox.at (Postfix) with ESMTPSA id 57C7412006D;
	Mon,  5 Apr 2021 17:40:21 +0200 (CEST)
Date: Mon, 5 Apr 2021 17:40:20 +0200
From: Sebastian Bachmann <hello@reox.at>
To: teigland@redhat.com
Message-ID: <20210405154020.yuscn36x37g64ly7@helios>
References: <20210404181856.6hevvwxwyflsm373@helios>
	<20210405150822.GB31914@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210405150822.GB31914@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] move dm-integrity metadata to another PV
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

On Mon, Apr 05, 2021 at 10:08:22AM -0500, David Teigland wrote:
> On Sun, Apr 04, 2021 at 08:18:56PM +0200, Sebastian Bachmann wrote:
> > Hello,
> > 
> > I played around with the new dm-integrity integration in lvm. Unfortunately, it
> > is very slow, as the checksums has to be written and read on - which is the
> > price to pay obviously.
> > 
> > I thought that it might be a good idea to move the metadata to a fast disk,
> > i.e., a SSD, however that is not possible and I get an error message on pvmove:
> > 
> > # pvmove -n r10_int_rimage_0_imeta /dev/sdd /dev/sda2
> >   Unable to pvmove device used for raid with integrity.
> > 
> > I could not find a reason why this should not be done in theory, thus I guess
> > that this is simply not supported by LVM right now?
> > Or is there another reason why you should keep the metadata always on the same
> > device?
> 
> The original implementation allowed a specific device, e.g. an ssd, to
> hold all the integrity metadata.  Integrity metadata for all raid images
> lived on one device, so there was some doubt that anyone would want to use
> it, and the option was dropped.  That option could also be used with
> linear+integrity.  Without raid, corrupt data found by integrity couldn't
> be recovered, so linear+integrity was also disabled.  Given those
> limitations, I'm curious how useful you'd find a dedicated integrity
> metadata device, and/or using integrity with a linear LV?

Ah okay, I did not knew that it was already considered.

So the worst case would be, that the SSD and an HDD gets corrupted at the same
time and you would not be able to recover the integrity data and would not
detect the corruption on the disk. For a RAID, you would still see that there is
a corruption but for linear you would not know that there was a corruption,
right?

Right now, I have a RAID without any integrity, thus enabling it on
another disk is in any case an improvement. I think loosing the SSD with the
integrity data is in that case not as bad as having slow reading/writing.

For the linear case, I would say it would be still useful. For example, you
would be able to know that something is wrong and could start to investigate.
I guess it would be a bad idea to put too much faith in that setup though.
How is this implemented for example on btrfs?

Maybe having a RAID of the metadata would be an option...

But I have not thought that through fully, so maybe there is something that I
missed.

Best,
Sebastian

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

