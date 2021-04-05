Return-Path: <SRS0=PyMc=JC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667F0C433ED
	for <linux-lvm@archiver.kernel.org>; Mon,  5 Apr 2021 15:09:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3CD5613B1
	for <linux-lvm@archiver.kernel.org>; Mon,  5 Apr 2021 15:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3CD5613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617635387;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i38RhxOVFFDev1x+K3MLkOou+kO2rHu6XCBzYQ4TxFY=;
	b=ChLvtUhjQKMynxQAhT/GOKv0EW4+8guPVKCHfaZu+AphopKWMDmLynxE0w9+36l4YDdDzN
	vwox4JsS7Q97dX7RUJsPAkC4LAEsujaVq5TOUxFGMgMJ3Hp4ODv8JkkhmJCOS9wXDEUhrH
	q9iqCJWtFP4VIm4t5H3un8suyp+IxOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-8jDnQW4TNDG8PhXLbEmY0Q-1; Mon, 05 Apr 2021 11:09:44 -0400
X-MC-Unique: 8jDnQW4TNDG8PhXLbEmY0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D386C801814;
	Mon,  5 Apr 2021 15:09:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0553819715;
	Mon,  5 Apr 2021 15:09:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A64CD4BB7C;
	Mon,  5 Apr 2021 15:09:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 135F8T8e012575 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 5 Apr 2021 11:08:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 954245C3DF; Mon,  5 Apr 2021 15:08:29 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23CDE5C257;
	Mon,  5 Apr 2021 15:08:24 +0000 (UTC)
Date: Mon, 5 Apr 2021 10:08:22 -0500
From: David Teigland <teigland@redhat.com>
To: Sebastian Bachmann <hello@reox.at>
Message-ID: <20210405150822.GB31914@redhat.com>
References: <20210404181856.6hevvwxwyflsm373@helios>
MIME-Version: 1.0
In-Reply-To: <20210404181856.6hevvwxwyflsm373@helios>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 04, 2021 at 08:18:56PM +0200, Sebastian Bachmann wrote:
> Hello,
> 
> I played around with the new dm-integrity integration in lvm. Unfortunately, it
> is very slow, as the checksums has to be written and read on - which is the
> price to pay obviously.
> 
> I thought that it might be a good idea to move the metadata to a fast disk,
> i.e., a SSD, however that is not possible and I get an error message on pvmove:
> 
> # pvmove -n r10_int_rimage_0_imeta /dev/sdd /dev/sda2
>   Unable to pvmove device used for raid with integrity.
> 
> I could not find a reason why this should not be done in theory, thus I guess
> that this is simply not supported by LVM right now?
> Or is there another reason why you should keep the metadata always on the same
> device?

The original implementation allowed a specific device, e.g. an ssd, to
hold all the integrity metadata.  Integrity metadata for all raid images
lived on one device, so there was some doubt that anyone would want to use
it, and the option was dropped.  That option could also be used with
linear+integrity.  Without raid, corrupt data found by integrity couldn't
be recovered, so linear+integrity was also disabled.  Given those
limitations, I'm curious how useful you'd find a dedicated integrity
metadata device, and/or using integrity with a linear LV?

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

