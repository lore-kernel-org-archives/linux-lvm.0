Return-Path: <SRS0=u9pG=LW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61818C2B9F4
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 16:49:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7DCD616EA
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 16:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7DCD616EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-iqJx-lcnOXueERNIVuti8w-1; Mon, 28 Jun 2021 12:49:36 -0400
X-MC-Unique: iqJx-lcnOXueERNIVuti8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 139BC8015F8;
	Mon, 28 Jun 2021 16:49:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B73719C46;
	Mon, 28 Jun 2021 16:49:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65B8C1809C99;
	Mon, 28 Jun 2021 16:49:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SGmFot014338 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 12:48:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A0AD6E1CA; Mon, 28 Jun 2021 16:48:15 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54E4E63A51
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 16:48:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D35FA800BED
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 16:48:12 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-290-P2sPmwYHNmqlSEgRnZBsUA-1; Mon, 28 Jun 2021 12:48:09 -0400
X-MC-Unique: P2sPmwYHNmqlSEgRnZBsUA-1
Received: by mail-lf1-f52.google.com with SMTP id k10so33698671lfv.13;
	Mon, 28 Jun 2021 09:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UskZ5P+xTmeCFmdofAhMqrelRGmkfQGNR2m/YVSqKwc=;
	b=TgjkOuHs0vaZfSz30/D0NZvgxB22uUmPYLLrrbX9egl3XpynA+WC5ZNsmr/+9YEf/X
	2TqLHsZMeyCBLV0RxK5K1pi7A/H7Yh4Q5k3O8DVg3kcrnYsOijGDldmTJqXF+/5RQ9HF
	B87Mng9of11uBYRPVZ2BUKBNSQjVwoymmCwbW1J4cLDdT79KIE8nz2rGeDk7+STrV8WY
	w/ZVrHRV0jnSlB5i5CwRisD5f6w2ze+V6aSJeoxGmgKYp9I83MI38R01Z77bWUDG3IbM
	9Sq1PWdloXz/VGiIcMRIBFFYrWkjlBqK8dj4Mj+NFRC4jnzyhwovPG6VB5lm2GdfEMH/
	ZO/w==
X-Gm-Message-State: AOAM530cLtvwpJGM4AEDT9M0mULauN1TMXWqC3gRlBSEcA4TBYqA6DyG
	TZgUmvOL37ZQ02ShosOP0OOLKAJ8CQgKsZHPFC+TvyGnMBK5nQ==
X-Google-Smtp-Source: ABdhPJzPs4rDa+yFBIOVi4dPBANpldaXUIIXA8DNMAsFq1by7Pd3R37eXZc41Kj3DmpfSEzd0rp7UhEfP6wek3qwLkI=
X-Received: by 2002:a05:6512:110b:: with SMTP id
	l11mr11092783lfg.255.1624898887792; 
	Mon, 28 Jun 2021 09:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAGnHSE=HRk+x4tcVdPuZFtnBGai3dP5KC6wHpeX1adAXq_mftQ@mail.gmail.com>
	<20210628150827.GA23977@redhat.com>
In-Reply-To: <20210628150827.GA23977@redhat.com>
From: Tom Yan <tom.ty89@gmail.com>
Date: Tue, 29 Jun 2021 00:47:56 +0800
Message-ID: <CAGnHSEkJVVKdMyF_Dj2aTT5zqKiwr65WZdAZyq6_JKO3Q63n+A@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Well, it doesn't really change the game:

[root@archlinux ~]# rm /run/lvm/pvs_online/*
[root@archlinux ~]# lvs | grep meh
  meh        green rwi---r--- 512.00m
[root@archlinux ~]# pvscan --cache -aay 8\:2
  pvscan[36958] PV /dev/sda2 online, VG green incomplete (need 1).
[root@archlinux ~]# pvscan --cache -aay 8\:16
  pvscan[36959] PV /dev/sdb online, VG green is complete.
  pvscan[36959] VG green skip autoactivation.
[root@archlinux ~]# rm /run/lvm/pvs_online/*
[root@archlinux ~]# pvscan --cache -aay 8\:16
  pvscan[36964] PV /dev/sdb online, VG green incomplete (need 1).
[root@archlinux ~]# pvscan --cache -aay 8\:2
  pvscan[36965] PV /dev/sda2 online, VG green is complete.
  pvscan[36965] VG green skip autoactivation.
[root@archlinux ~]# lvs | grep meh
  meh        green rwi---r--- 512.00m

Regards,
Tom

On Mon, 28 Jun 2021 at 23:08, David Teigland <teigland@redhat.com> wrote:
>
> On Sun, Jun 27, 2021 at 09:01:43PM +0800, Tom Yan wrote:
> > [tom@archlinux ~]$ sudo pvscan --cache -aay /dev/sdb
> >   pvscan[2066] PV /dev/sdb online, VG green is complete.
> >   pvscan[2066] VG green skip autoactivation.
>
> The "skip autoactivation" means that the VG has already been activated
> by a prior pvscan, so it's not being activated again.  This state is kept
> in /run/lvm/vgs_online/<vgname>.  The files under /run need to be cleared
> by reboot.  The first pvscan to activate the VG creates that temp file
> (during startup there's often a race among multiple pvscans to activate
> the same VG, and the temp file ensures that only one of them does it.)
>
> > So is this some kind of bug/regression? Or is it intended for some
> > reason? What I expect would be, when the command is run with any of
> > the legs of such an LV as the device, it will check whether all legs
> > of it are available and if so, the LV will be activated.
>
> The files under /run/lvm/pvs_online/ record which PVs have appeared during
> startup; they are created by the pvscan for each device.  pvscan uses
> these to know when the VG is complete and the LVs can be activated.
>
> To test this out manually, remove all the files in pvs_online and
> vgs_online, and run pvscan --cache -aay $dev for each device in your VG.
> You should find that the final pvscan will activate the VG.
>
> Dave
>

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

