Return-Path: <SRS0=u9pG=LW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BEDC2B9F4
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 08:59:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52D246195B
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 08:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52D246195B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-DsHlryDyMNW8NwlFGsfKYg-1; Mon, 28 Jun 2021 04:59:37 -0400
X-MC-Unique: DsHlryDyMNW8NwlFGsfKYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9D33804300;
	Mon, 28 Jun 2021 08:59:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 683D919C46;
	Mon, 28 Jun 2021 08:59:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2D0E1809C99;
	Mon, 28 Jun 2021 08:59:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15S8xGCN004417 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 04:59:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D640202813E; Mon, 28 Jun 2021 08:59:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08B20201EF0B
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 08:59:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06E1A8007D3
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 08:59:13 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-516-bJSJrqBxM-G_cyFRnIN0aw-1; Mon, 28 Jun 2021 04:59:10 -0400
X-MC-Unique: bJSJrqBxM-G_cyFRnIN0aw-1
Received: by mail-lj1-f169.google.com with SMTP id a6so686798ljq.3
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 01:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=A46BVb6myzrl+TQqKT5gcmBQhCwQM7PTCyAUZvW/xjQ=;
	b=fqGTAP/bLGpAUYjjr5fHQIjDhX0tYlaWk3BdPa0zwv0TMBdZC5CUxyr8W4NueqiPCT
	N4BDD4aHnza0iY0iuQLuXJjPW4PFMSrqvIOYbDroVtfRsQXJcgIuqq2BDvcIIud+f3EU
	i6yMM3oS7Q6dpMwqL55AS6PQCUgUUdtQqhz/9CrJ6EN+mPAPGRvMZZ2DKC/zgSugVVn/
	WsQnunXorDfGjPN9SYhViC7RtF+CYzWmiL6IZ7QKe2h/iwe9JXBuD+/11klYB60f2Si8
	oB/tLYPntr2y3cJYGmXj94srjjxmFREOsdqwhP8H+Jhiy4leZT4yslHf/pp7yuBJM88e
	yurw==
X-Gm-Message-State: AOAM532VT+J3XxBEDtM++FMcyW6Q4AaBzOKacsRUS/hC/CJkOb9ME5AH
	q0uzTGx0cZgv/ROouAAXuDz2wDPS4P9LP8teOuhWDQ0tm/XSbA==
X-Google-Smtp-Source: ABdhPJyG77ZBw6oTEkkS0NSqbHHQnRuCjVmpnis3GSxfpQU3zkwp4d5BJ+1LXRvvlOJLXw49HNZJlTTp85ur/nGvCzA=
X-Received: by 2002:a2e:8596:: with SMTP id b22mr2451451lji.63.1624870748410; 
	Mon, 28 Jun 2021 01:59:08 -0700 (PDT)
MIME-Version: 1.0
From: Tom Yan <tom.ty89@gmail.com>
Date: Mon, 28 Jun 2021 16:58:57 +0800
Message-ID: <CAGnHSEkfvZEaU_tWz0si3cD3gYwiXRT3-ijM7kMsNuWp=_UHoQ@mail.gmail.com>
To: linux-lvm@redhat.com
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
Subject: [linux-lvm] Problem with pvscan --cache -aay $pv
 (lvm2-pvscan@.service) on raid type LV
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

Hi,

I notice that `pvscan --cache -aay $pv` will not activate LV(s) of
raid type even when all of its/their legs are up. Only `pvscan --cache
-aay` (without a PV specified) will activate such LV(s). Is it some
kind of bug / regression?

[tom@archlinux ~]$ sudo lvchange -an /dev/green/meh
[tom@archlinux ~]$ sudo lvs green/meh
  LV   VG    Attr       LSize   Pool Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  meh  green rwi---r--- 512.00m
[tom@archlinux ~]$ sudo pvscan --cache -aay /dev/sda2
  pvscan[5800] PV /dev/sda2 online, VG green is complete.
  pvscan[5800] VG green skip autoactivation.
[tom@archlinux ~]$ sudo pvscan --cache -aay /dev/sdb
  pvscan[5802] PV /dev/sdb online, VG green is complete.
  pvscan[5802] VG green skip autoactivation.
[tom@archlinux ~]$ sudo lvs green/meh
  LV   VG    Attr       LSize   Pool Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  meh  green rwi---r--- 512.00m
[tom@archlinux ~]$ sudo pvscan --cache -aay
  pvscan[5806] PV /dev/sda2 online, VG green incomplete (need 1).
  pvscan[5806] PV /dev/sdb online, VG green is complete.
  pvscan[5806] VG green run autoactivation.
  5 logical volume(s) in volume group "green" now active
[tom@archlinux ~]$ sudo lvs green/meh
  LV   VG    Attr       LSize   Pool Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  meh  green rwi-a-r--- 512.00m
100.00

What I expect is that, if the command is run on any of the legs, such
LV will be activated as long as all of the legs are up.

Regards,
Tom

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

