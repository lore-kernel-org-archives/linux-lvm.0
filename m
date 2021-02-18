Return-Path: <SRS0=/SaV=HV=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD76C433E0
	for <linux-lvm@archiver.kernel.org>; Fri, 19 Feb 2021 08:18:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2175F61481
	for <linux-lvm@archiver.kernel.org>; Fri, 19 Feb 2021 08:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2175F61481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613722699;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HTZji2faDvVmnMDOgx93fZW6OztslpxNSIN1CiioQ3I=;
	b=WhxWi0nXhy1YhcesHsoT3zTuKEat+gEvySeXA7KbM7WlLT/+iEhNTIdNoDl2616+3jGLhr
	NYZslaWHDUHAsUpT+GGSdORTbcE2EnUovfKl4v1SaSwh+mvo+i+FBDthXDNw+DpINsjwxp
	I2VDEreT8CjpT2JoXlTQLf3vrI3YqJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-_iAkhwHVP1SY7ChnaIn1Pg-1; Fri, 19 Feb 2021 03:18:17 -0500
X-MC-Unique: _iAkhwHVP1SY7ChnaIn1Pg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82749192AB78;
	Fri, 19 Feb 2021 08:18:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D28E860BE5;
	Fri, 19 Feb 2021 08:18:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63CBB18095CD;
	Fri, 19 Feb 2021 08:18:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11IFUGV4004592 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 10:30:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B73C510AF420; Thu, 18 Feb 2021 15:30:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B03C910AF426
	for <linux-lvm@redhat.com>; Thu, 18 Feb 2021 15:30:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6678181DA5C
	for <linux-lvm@redhat.com>; Thu, 18 Feb 2021 15:30:14 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-307-KIf4lepfOg2DtNMPRJLfSA-1; Thu, 18 Feb 2021 10:30:12 -0500
X-MC-Unique: KIf4lepfOg2DtNMPRJLfSA-1
Received: by mail-wr1-f69.google.com with SMTP id x1so1087182wrg.22
	for <linux-lvm@redhat.com>; Thu, 18 Feb 2021 07:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=Us4vwKaCxlAq00ZXk8xeAQD0GF/rmMoV7sII4S6iFgE=;
	b=UO/R1y6Bu37IM7SDR7VG3tffAcXJXUMDLNJQEUaXxQoo6fwJ0upQwVyP+cUlo4XhZc
	NjP5GS1lbHNz2MUOIsmKTVHSUtHHHpSPysbgCWKeeEraAzEmAM2evIlgyncta9Od/u7v
	ZAc9kPpc2tZDMlrt44se72K0ffy5AMs8Jgh1ofn+eItNfDZiGUaSnsly3rhpD6JDDYdK
	MBlscRW3W20HJlUxCQFEAF8yXtYN1f5hpyD1ub4zvPcgcNIpXqxwxfY9Nm9Gc7SvjGVA
	ywxDO0Exb/bBIgUF4FhlssmYkn5IZMRHg7S+oMC8jm66IwftsZYVUT5/nV3mro1yV1LC
	CIoA==
X-Gm-Message-State: AOAM532c1qxk6jJUZ0au605CTnZlZJMA7OGXoco8I8hJqUCqKbj2uzFs
	Gt/gPTb2+xQItdeseRhS9iaVv7mKDQEjMusN3PFoyAS5LlelTtObtb9r7je8Cm2Ty2qlWP+4cTr
	yfWcCqjbaFEvU1+w/
X-Received: by 2002:a1c:e905:: with SMTP id q5mr4199657wmc.84.1613662211246;
	Thu, 18 Feb 2021 07:30:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnGnRIbYZVDaddu/luMsAswhYRC3XETPUwiTAmJzn5XJjwNk1ay0dzNw6gVr9cBe7uvP68Lw==
X-Received: by 2002:a1c:e905:: with SMTP id q5mr4199635wmc.84.1613662210990;
	Thu, 18 Feb 2021 07:30:10 -0800 (PST)
Received: from localhost (kaktus.kanapka.ml. [151.237.229.131])
	by smtp.gmail.com with ESMTPSA id
	s14sm9581653wrw.88.2021.02.18.07.30.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 18 Feb 2021 07:30:10 -0800 (PST)
Date: Thu, 18 Feb 2021 16:30:09 +0100
From: Oleksandr Natalenko <oleksandr@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20210218153009.z66cp4j7ptukk4zs@butterfly.localdomain>
References: <20210211111623.34968-1-list@eworm.de>
	<f18dff7a-050a-d41d-c643-4616522ba4a0@suse.com>
	<ae893a3606dd32b07cab16bd538c132af555c956.camel@suse.com>
	<20210217130329.7de41147@leda>
	<20210217133826.u4gglfsowqfvxdff@spock.localdomain>
	<ea269d6255c4cd48bb60771aa7e4204e4f70db8a.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <ea269d6255c4cd48bb60771aa7e4204e4f70db8a.camel@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Fri, 19 Feb 2021 03:17:49 -0500
Cc: LVM general discussion and development
	<linux-lvm@e1890.dsca.akamaiedge.net>, Christian Hesse <list@eworm.de>,
	Heming Zhao <heming.zhao@suse.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] [PATCH 1/1] pvscan: wait for udevd
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi.

(will comment only on what I can comment, dropping the rest)

On Thu, Feb 18, 2021 at 04:19:01PM +0100, Martin Wilck wrote:
> > I'm not sure this issue is reproducible with any kind of LVM layout.
> > What I have is thin-LVM-on-LUKS-on-LVM:
>=20
> I saw MD in your other logs...?

FWIW, one of the machines have soft RAID, another does not, the issue
is reproducible regardless of whether there's soft RAID or not.

> > Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 pvscan[643] VG sys run
> > autoactivation.
> > Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 /usr/bin/dmeventd: stat faile=
d:
> > No such file or directory
>=20
> What's going on here? pvscan trying to start dmeventd ? Why ? There's a
> dedicated service for starting dmeventd (lvm2-monitor.service). I can
> see that running dmeventd makes sense as you have thin pools, but I'm
> at a loss why it has to be started at that early stage during boot
> already.
>=20
> This is a curious message, it looks as if pvscan was running from an
> environment (initramfs??) where dmeventd wasn't available. The message
> is repeated, and after that, pvscan appears to hang...

Not sure either. FWIW, real root is on a thin volume (everything is,
in fact, except /boot and swap).

> > Feb 10 17:24:26 archlinux lvm[720]:=A0=A0 pvscan[720] PV /dev/md0 onlin=
e.
> > Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 /usr/bin/dmeventd: stat faile=
d:
> > No such file or directory
> > Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 WARNING: Failed to monitor
> > sys/pool.
> > Feb 10 17:24:56 spock systemd[1]: lvm2-pvscan@253:2.service: State
> > 'stop-sigterm' timed out. Killing.
> > Feb 10 17:24:56 spock systemd[1]: lvm2-pvscan@253:2.service: Killing
> > process 643 (lvm) with signal SIGKILL.
> > Feb 10 17:24:56 spock systemd[1]: lvm2-pvscan@253:2.service: Main
> > process exited, code=3Dkilled, status=3D9/KILL
> > Feb 10 17:24:56 spock systemd[1]: lvm2-pvscan@253:2.service: Failed
> > with result 'timeout'.
> > Feb 10 17:24:56 spock systemd[1]: Stopped LVM event activation on
> > device 253:2.
>=20
> So what's timing out here is the attempt to _stop_ pvscan. That's
> curious. It looks like a problem in pvscan to me, not having reacted to
> a TERM signal for 30s.
>=20
> It's also worth noting that the parallel pvscan process for device 9:0
> terminated correctly (didn't hang).

Yes, pvscan seems to not react to SIGTERM. I have
DefaultTimeoutStopSec=3D30s, if I set this to 90s, pvscan hangs for 90s
respectively.

--=20
  Best regards,
    Oleksandr Natalenko (post-factum)
    Principal Software Maintenance Engineer

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

