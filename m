Return-Path: <SRS0=iYY7=ON=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1560EC433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 23 Sep 2021 21:49:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C34A61152
	for <linux-lvm@archiver.kernel.org>; Thu, 23 Sep 2021 21:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C34A61152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-XYiP1uQaNpOrz0YKk_8KnA-1; Thu, 23 Sep 2021 17:49:21 -0400
X-MC-Unique: XYiP1uQaNpOrz0YKk_8KnA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0479A362F8;
	Thu, 23 Sep 2021 21:49:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73BC8652A1;
	Thu, 23 Sep 2021 21:49:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EFBE4E58E;
	Thu, 23 Sep 2021 21:49:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18NLmtYW003557 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 23 Sep 2021 17:48:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A7CC320A8C0B; Thu, 23 Sep 2021 21:48:55 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A32FC207ADA7
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2021 21:48:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2EFE811E7A
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2021 21:48:52 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-126-dXrK-gg3MVWst-IhCXgRCw-1; Thu, 23 Sep 2021 17:48:51 -0400
X-MC-Unique: dXrK-gg3MVWst-IhCXgRCw-1
Received: by mail-qt1-f182.google.com with SMTP id l13so7672578qtv.3
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2021 14:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WOShu9Mj9a/D/cNoBPogrrLp1BaXAC5XPE5ul6rbMMo=;
	b=beBJPXcl0X7qsYE7mau3pswdJ6CcNeajWYXBjfgjcrUw9Ss8fXlLwVswuxl6oipy/t
	Es28MqLQDMJeeWTvyxtGNwuimx4Qqjh2/o98NNJoERREeWvlK4KmuLZ3fNNWzjZotFoO
	Yzh/sWpP+otz1+jgqi1AFV4aKJPnj03CMl+b4kgyZ1ozAf2CUfmNHX+vwh3PiuAGki36
	Vg50VBb78x2EQV/TZwz6/YfIOiZKGDoZ70Qb+n56qMVGCIsdtgoHmHhbH+kQRUi0U8kH
	lkK7rkWwRtyc7hACEegfP7dgcCd5d95X/i8qbbGZK8tUeLcQvs7gfbyZ2WKLxReBfH9k
	herg==
X-Gm-Message-State: AOAM533Gxi02Jh0T4FdAOQL1a/AuAKB77QiI2OTQOXu89Ex/MUbRfRk7
	7iHcW99xR4h8ALDB2vFjb+GN9OF/GUOvtN9peo+Bk6EJ
X-Google-Smtp-Source: ABdhPJy2Cn9U8tsFSuwgx5ep0HdVAL+16G0QBUQPyhIs3DhHRWeDRyylcGbLeqM47cTmrI05/OgR1D/z+mMHywsqZFQ=
X-Received: by 2002:a05:622a:283:: with SMTP id
	z3mr967678qtw.324.1632433730434; 
	Thu, 23 Sep 2021 14:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAFrGbuU63mCLDc47aiY6PuEf4C1B=CL3Dh1=GB+p_rRWkV8S4g@mail.gmail.com>
	<CAFrGbuWKxbB=2Q6QygfN5mLh1MU7ztwXOouiRF2ynP-BcjhfXA@mail.gmail.com>
	<bd2ffcd6-e067-8152-fd2f-6d5036cb2ec6@redhat.com>
In-Reply-To: <bd2ffcd6-e067-8152-fd2f-6d5036cb2ec6@redhat.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Thu, 23 Sep 2021 16:48:39 -0500
Message-ID: <CAAMCDecFLoJ6ait9uUP0nQkYXZnMoPNre6v_1uBj=tGE_APtvg@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
Cc: alessandro macuz <alessandro.macuz@gmail.com>
Subject: Re: [linux-lvm] " Failed to find physical volume <ZFS block device"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If you have lvmetad running and in use then the lvm commands ask it
what the system has on it.

I have seen on random boots fairly separated systems (rhel7 versions,
and many years newer fedora systems) at random fail to find one or
more pv.s

I have disabled it at home, and in my day job we have also disabled
(across 20k+ systems) as we confirmed it had inconsistency issues
several times on a variety of our newest installs.

Stopping lvmetad and/or restarting it would generally fix it.    But
it was a source of enough random issues(often failure to mount on a
boot, so often issues that resulted in page-outs to debug)  and did
not speed things up much enough to be worth it even on devices with
>2000 SAN volumes.

On Thu, Sep 23, 2021 at 8:52 AM Zdenek Kabelac <zkabelac@redhat.com> wrote:
>
> Dne 22. 09. 21 v 18:48 alessandro macuz napsal(a):
> > fdisk correctly identifies the extended partition as 8e.
> > I wonder which kind of data lvmdiskscan and pvs use in order to list LVM
> > physical volumes.
> > Does PVS check some specific metadata within the partition without just
> > relying on the type of partition displayed by fdisk?
> >
> >
>
> Hi
>
> Yes - PVs do have header signature keeping information about PV attributes
> and also has the storage area to keep lvm2 metadata.
>
> Partition flags known to fdisk are irrelevant.
>
>
> Regards
>
> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

