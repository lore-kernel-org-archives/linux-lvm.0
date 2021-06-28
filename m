Return-Path: <SRS0=u9pG=LW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CE0C11F64
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 17:53:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE86061C3D
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 17:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE86061C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-Hv5z3YDCPayAzjlLmgQbIA-1; Mon, 28 Jun 2021 13:52:56 -0400
X-MC-Unique: Hv5z3YDCPayAzjlLmgQbIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 569759F92E;
	Mon, 28 Jun 2021 17:52:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D919160C57;
	Mon, 28 Jun 2021 17:52:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4128A1809C99;
	Mon, 28 Jun 2021 17:52:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SHqWlc019477 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 13:52:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C302821449DC; Mon, 28 Jun 2021 17:52:32 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEB0821449DA
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 17:52:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 672D518A01A9
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 17:52:29 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-288-1GYOK0JSMSKRjGLJgIpxUg-1; Mon, 28 Jun 2021 13:52:25 -0400
X-MC-Unique: 1GYOK0JSMSKRjGLJgIpxUg-1
Received: by mail-lf1-f49.google.com with SMTP id q16so19933060lfr.4;
	Mon, 28 Jun 2021 10:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gYSbaJeiW/JUvunk5w9ZznT0+Sz1yqdzNQdUy7IlQEI=;
	b=tOncbtCym9gJBZ1z0W3x/RQdiYWiXYK2zp41PJsa7V+3eswqyCOafrw9r+qGui9+1z
	WyQid60j1BJ8yu0NJ4NxKbWEWKBO7JQM+6++sarZSEjdSL0PVXJiV18+bN7WQA2ExvwC
	xUTp6tchhuHKZcZ1rTVraE2plxDlGTQweO4pbn2enp0gPLPMI5wOpPbbCfyugxJ9c6lt
	HVxNb+XUmfj834K+fHTsy0x01KQEVjg3PrFltxXZJ3pfv8b85yTLKpB/SRdXk1FNRJJf
	JbSAU2fXy99GulsvTS9UoxgUvuiuMaAtKZ5+oUTMQLAlNeemgJ9gEoqz8VLNpU8XT8WJ
	UFzg==
X-Gm-Message-State: AOAM533Oqy/7sugPBA5+iZuh10XNUhYlEVw3kdDzO+PeijxGUY7MHM3b
	83YYQfvsXXvG7kkkSYCnQg3jZN1zerR+FG53wkQsOYgLATI/qQ==
X-Google-Smtp-Source: ABdhPJwuSpbXq9oOAqxtk6VuK2KNC0/F3aJO0JuRvWnuiPZ4xsqvI+FVkwT94ClM1uNBTn/PQOopKU0ZlY8aE0c757A=
X-Received: by 2002:a05:6512:110b:: with SMTP id
	l11mr11266502lfg.255.1624902743274; 
	Mon, 28 Jun 2021 10:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAGnHSE=HRk+x4tcVdPuZFtnBGai3dP5KC6wHpeX1adAXq_mftQ@mail.gmail.com>
	<20210628150827.GA23977@redhat.com>
	<CAGnHSEkJVVKdMyF_Dj2aTT5zqKiwr65WZdAZyq6_JKO3Q63n+A@mail.gmail.com>
	<CAGnHSEnF0W310X6YWUWtEKXAJP6HbFwJyQBJH=hN0sA1OCcDUw@mail.gmail.com>
In-Reply-To: <CAGnHSEnF0W310X6YWUWtEKXAJP6HbFwJyQBJH=hN0sA1OCcDUw@mail.gmail.com>
From: Tom Yan <tom.ty89@gmail.com>
Date: Tue, 29 Jun 2021 01:52:12 +0800
Message-ID: <CAGnHSE=27fwhVS9w21U_o=ppd4EiqbbhJg68bXZgB5koxPKmwg@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi again(x2),

Never mind, I figured it out:
https://bugs.archlinux.org/task/71385

Sorry for the noise.

Regards,
Tom

On Tue, 29 Jun 2021 at 01:25, Tom Yan <tom.ty89@gmail.com> wrote:
>
> Hi again,
>
> I just noticed that, `pvscan --cache -aay $device` does work as
> expected if I remove `/run/lvm/vgs_online/green`. I still couldn't
> figure out why it doesn't work on boot though. (I do notice that Arch
> by default uses the "legacy" way (run the pvscan commands with a udev
> rule RUN directly; but that does not explain the problem either.)
>
> So are there any circumstances that vg(s) will be populated into
> /run/lvm/vgs_online/ without all the "legs" being up? Or circumstances
> that only the non-multi-leg LVs will be activated?
>
> Regards,
> Tom
>
> On Tue, 29 Jun 2021 at 00:47, Tom Yan <tom.ty89@gmail.com> wrote:
> >
> > Well, it doesn't really change the game:
> >
> > [root@archlinux ~]# rm /run/lvm/pvs_online/*
> > [root@archlinux ~]# lvs | grep meh
> >   meh        green rwi---r--- 512.00m
> > [root@archlinux ~]# pvscan --cache -aay 8\:2
> >   pvscan[36958] PV /dev/sda2 online, VG green incomplete (need 1).
> > [root@archlinux ~]# pvscan --cache -aay 8\:16
> >   pvscan[36959] PV /dev/sdb online, VG green is complete.
> >   pvscan[36959] VG green skip autoactivation.
> > [root@archlinux ~]# rm /run/lvm/pvs_online/*
> > [root@archlinux ~]# pvscan --cache -aay 8\:16
> >   pvscan[36964] PV /dev/sdb online, VG green incomplete (need 1).
> > [root@archlinux ~]# pvscan --cache -aay 8\:2
> >   pvscan[36965] PV /dev/sda2 online, VG green is complete.
> >   pvscan[36965] VG green skip autoactivation.
> > [root@archlinux ~]# lvs | grep meh
> >   meh        green rwi---r--- 512.00m
> >
> > Regards,
> > Tom
> >
> > On Mon, 28 Jun 2021 at 23:08, David Teigland <teigland@redhat.com> wrote:
> > >
> > > On Sun, Jun 27, 2021 at 09:01:43PM +0800, Tom Yan wrote:
> > > > [tom@archlinux ~]$ sudo pvscan --cache -aay /dev/sdb
> > > >   pvscan[2066] PV /dev/sdb online, VG green is complete.
> > > >   pvscan[2066] VG green skip autoactivation.
> > >
> > > The "skip autoactivation" means that the VG has already been activated
> > > by a prior pvscan, so it's not being activated again.  This state is kept
> > > in /run/lvm/vgs_online/<vgname>.  The files under /run need to be cleared
> > > by reboot.  The first pvscan to activate the VG creates that temp file
> > > (during startup there's often a race among multiple pvscans to activate
> > > the same VG, and the temp file ensures that only one of them does it.)
> > >
> > > > So is this some kind of bug/regression? Or is it intended for some
> > > > reason? What I expect would be, when the command is run with any of
> > > > the legs of such an LV as the device, it will check whether all legs
> > > > of it are available and if so, the LV will be activated.
> > >
> > > The files under /run/lvm/pvs_online/ record which PVs have appeared during
> > > startup; they are created by the pvscan for each device.  pvscan uses
> > > these to know when the VG is complete and the LVs can be activated.
> > >
> > > To test this out manually, remove all the files in pvs_online and
> > > vgs_online, and run pvscan --cache -aay $dev for each device in your VG.
> > > You should find that the final pvscan will activate the VG.
> > >
> > > Dave
> > >

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

