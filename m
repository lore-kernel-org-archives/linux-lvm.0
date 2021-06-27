Return-Path: <SRS0=u9pG=LW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114E7C2B9F4
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 09:53:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A148D61C5B
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 09:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A148D61C5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-GmkUzCkAMH6YwrMaYytCxg-1; Mon, 28 Jun 2021 05:53:18 -0400
X-MC-Unique: GmkUzCkAMH6YwrMaYytCxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51C295074E;
	Mon, 28 Jun 2021 09:53:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8BD319C87;
	Mon, 28 Jun 2021 09:53:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83DBE1801258;
	Mon, 28 Jun 2021 09:53:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15RD22b8011131 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 27 Jun 2021 09:02:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ADDEE2168695; Sun, 27 Jun 2021 13:02:02 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A934A216868E
	for <linux-lvm@redhat.com>; Sun, 27 Jun 2021 13:02:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B1A980158D
	for <linux-lvm@redhat.com>; Sun, 27 Jun 2021 13:02:00 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-218-EaZycZlxML6oYZgcnDHwiQ-1; Sun, 27 Jun 2021 09:01:56 -0400
X-MC-Unique: EaZycZlxML6oYZgcnDHwiQ-1
Received: by mail-lf1-f46.google.com with SMTP id f30so26469783lfj.1
	for <linux-lvm@redhat.com>; Sun, 27 Jun 2021 06:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CenOW1FM5WBGoQdkr2b8sVqaedIzuXPPn3NrmVt6ubU=;
	b=IAxL/t2dqiBkBei/dLZXJaIe7aPfKL3r2utXAa5ahoeVECZwDqySJbyQMXVXzjoL64
	D3wiR8etgs2eb9Sfn8mwjhheVx0ZbK/IJK/Zbr63di8NfoRnr9kJsc1/heWmgHwX4ivY
	MlUulzxiZZ1Qou3E+DqPM1we2K40j3MTT/wom8eC+1ZAKWVRAo1htrW72wctwwTL65kE
	5+LWEzTnXnK/zs5Z6B6dfZJftCXavMq/0pxBJ4eW31NLD9QhVMM9NkNKKHcAyls8OP/M
	Nj7hJ5ArYo/ob7wYIcMjsG6/jiv0pI8pWjTnz7DTLf1lEKhbjq8kXSRsgj7eOoNXS5W4
	2l0g==
X-Gm-Message-State: AOAM530XubIaUcPcewuiq+OSZWK7NKJNMvhI/bHxxWcYdonOgPKKNxW7
	Zmwe/uc9vwqmxf5/BzWqsCUK2yFMUCQlFPOpw3upxfHw1Hkqxw==
X-Google-Smtp-Source: ABdhPJx1IrpPiyDJClDrBWXa3AQTYHLfHL2O2AMuwTplLKiyAOKqJy4vJZS6lETA4UA7dns7juHm3/zqQWKqkxEPVco=
X-Received: by 2002:a19:fc14:: with SMTP id a20mr11934138lfi.86.1624798914825; 
	Sun, 27 Jun 2021 06:01:54 -0700 (PDT)
MIME-Version: 1.0
From: Tom Yan <tom.ty89@gmail.com>
Date: Sun, 27 Jun 2021 21:01:43 +0800
Message-ID: <CAGnHSE=HRk+x4tcVdPuZFtnBGai3dP5KC6wHpeX1adAXq_mftQ@mail.gmail.com>
To: linux-lvm@redhat.com
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
X-Mailman-Approved-At: Mon, 28 Jun 2021 05:52:46 -0400
Subject: [linux-lvm] pvscan --cache -aay $device does not activate LV with
	multiple "legs"
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

Hi,

I notice that LV with multiple legs (i.e. type raid or similar) is not
auto activated after boot.

After finding out that the activation of LVs mainly relies on
lvm2-pvscan@.service (and the udev rules that make the PVs want their
own instances), wondering whether the issue is due to a race condition
or so, I run the command `pvscan --cache -aay $device` (where $device
is in the form of $major:$minor). It seems that it's simply because
the device-specific run of the command will not activate such LV(s)
anyway:

[tom@archlinux ~]$ sudo lvchange -an /dev/green/meh
[tom@archlinux ~]$ sudo lvs | grep meh
  meh      green rwi---r--- 512.00m
[tom@archlinux ~]$ sudo pvscan --cache -aay /dev/sda2
  pvscan[2064] PV /dev/sda2 online, VG green is complete.
  pvscan[2064] VG green skip autoactivation.
[tom@archlinux ~]$ sudo pvscan --cache -aay /dev/sdb
  pvscan[2066] PV /dev/sdb online, VG green is complete.
  pvscan[2066] VG green skip autoactivation.
[tom@archlinux ~]$ sudo lvs | grep meh
  meh      green rwi---r--- 512.00m

However, if I run the command without a device specified, such LV will
be activated:

[tom@archlinux ~]$ sudo pvscan --cache -aay
  pvscan[2071] PV /dev/sda2 online, VG green incomplete (need 1).
  pvscan[2071] PV /dev/sdb online, VG green is complete.
  pvscan[2071] VG green run autoactivation.
  5 logical volume(s) in volume group "green" now active
[tom@archlinux ~]$ sudo lvs | grep meh
  meh      green rwi-a-r--- 512.00m
100.00

So is this some kind of bug/regression? Or is it intended for some
reason? What I expect would be, when the command is run with any of
the legs of such an LV as the device, it will check whether all legs
of it are available and if so, the LV will be activated.

Regards,
Tom

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

