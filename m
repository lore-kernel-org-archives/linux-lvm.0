Return-Path: <SRS0=6f4W=JH=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA74FC433B4
	for <linux-lvm@archiver.kernel.org>; Sat, 10 Apr 2021 00:33:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3279161108
	for <linux-lvm@archiver.kernel.org>; Sat, 10 Apr 2021 00:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3279161108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-VMdCNqQ9Nv-FzS8quTqqLw-1; Fri, 09 Apr 2021 20:33:35 -0400
X-MC-Unique: VMdCNqQ9Nv-FzS8quTqqLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 763E11922025;
	Sat, 10 Apr 2021 00:33:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 684211007604;
	Sat, 10 Apr 2021 00:33:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 184065534A;
	Sat, 10 Apr 2021 00:33:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13A0X9pq014593 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 20:33:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3BD5D1194E05; Sat, 10 Apr 2021 00:33:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 379541194E04
	for <linux-lvm@redhat.com>; Sat, 10 Apr 2021 00:33:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD46A101A52C
	for <linux-lvm@redhat.com>; Sat, 10 Apr 2021 00:33:06 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-174-67SKi_m1M8CKqMfjGrGbNg-1; Fri, 09 Apr 2021 20:33:04 -0400
X-MC-Unique: 67SKi_m1M8CKqMfjGrGbNg-1
Received: by mail-lf1-f41.google.com with SMTP id d12so12325471lfv.11
	for <linux-lvm@redhat.com>; Fri, 09 Apr 2021 17:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=uAjdx8SesCIFCoVQucXQwM0Sb4WcY02AYQlj2rbBC+4=;
	b=N8ye4IEkex3yemqUjOZ/qTYwe/+7EZdWu1ksXROYD0iju127tvuSfMHP5pQGymluml
	RxSkfmT5a55upkHfrXc1aOZ7AmaXyrgx2E9vD7Yp5qQ5Z4TkyvlLITV6hIVrpx85lMIh
	s/EJO8uZuIV3YeqULXsTtUjmqT8cnn26kjC8GKfprFTwpEp+wDrE8EnU2/qPX9l39rRZ
	Vkd5xc4dgeqs5H4csrBGZPwlhNKspHJVmJVoS3LOMqYNLSzCVR84etigVkWdoeW/PP54
	FVInQ77LxMwjL9Qf1ly5o6vKF8rPKgtIXpWlBkenX8EkiiE+GNfu19yaEJCNbFy5IPz4
	waUA==
X-Gm-Message-State: AOAM5310OUwgbaRfkbFjHrXAs7ckHkze+AaBLnjC5xzrUJHz+njGtPNQ
	FYJVre8MCf0ETyFvfW91FiJ2J8iDjpArMCodemclM9waAgqo6w==
X-Google-Smtp-Source: ABdhPJx+14y4CIbU4PtbCUbutReJQCZ783/+aFy/PBtqGhn30hVifuTsKhEuoNjIiqbD+MRDa3w+TM0egE+vgHC8eNY=
X-Received: by 2002:ac2:58d8:: with SMTP id u24mr11777143lfo.67.1618014783002; 
	Fri, 09 Apr 2021 17:33:03 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?UMOpdGVyIFPDoXJrw7Z6aQ==?= <xmisterhu@gmail.com>
Date: Sat, 10 Apr 2021 02:32:52 +0200
Message-ID: <CAP1D0fSHaWQ_PsAFYRn2WnboAgQCKOAg2jLbDoWKz0U7z8yoHA@mail.gmail.com>
To: linux-lvm@redhat.com
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
Subject: [linux-lvm] Possible bug with concurrent RAID syncs on the same
	underlying devices
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Up until now I was having 8 mdadm RAID6 arrays which are sharing the
same 6 different sized devices with 1TB partitions, like:
md0: sda1 sdb1 sdc1...
md1: sda2 sdb2 sdc2...
.
.
.
md7: sda8 sdb8 sde5 sdd7...

It was set up like this so I can efficiently use the space from
different sized disks.

Since lvmraid has support for integrity on lvmraid devices, I backed
up everything and trying to recreate a similar structure with lvmraid
and integrity enabled.

In the past when multiple mdadm arrays needed to resync, they would
wait for each other to finish before, because mdadm detected those
arrays shared the same disks.

Now when I was trying to recreate the arrays I realized that the
initial lvmraid syncs doesn't wait for each other.
This means I can't recreate the whole structure in one go as it would
trash the IO on these HDDs.

I don't know if this is on purpose, because I haven't tried lvmraid
before, but I know lvmraid uses md under the hood, and I'm thinking
that this might be a bug, because the md code in kernel can't detect
the underlying devices through the integrity layer.

But I think it might worth to get fixed, as even with just 3 raid6
lvmraids and sync speed reduced to 10M by dev.raid.speed_limit_max
sysctl I get a pretty high load:

[root@hp ~] 2021-04-10 02:07:38
# lvs
  LV   VG      Attr       LSize  Pool Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  root pve     rwi-aor--- 29,25g
100,00
  md0  raid6-0 rwi-a-r--- <3,61t
40,54
  md1  raid6-1 rwi-a-r--- <2,71t
8,54
  md2  raid6-2 rwi-a-r--- <3,61t                                    1,01
[root@hp ~] 2021-04-10 02:30:46
# pvs -S vg_name=raid6-0
  PV         VG      Fmt  Attr PSize   PFree
  /dev/sda3  raid6-0 lvm2 a--  931,50g 4,00m
  /dev/sdb1  raid6-0 lvm2 a--  931,50g 4,00m
  /dev/sdd6  raid6-0 lvm2 a--  931,50g 4,00m
  /dev/sde6  raid6-0 lvm2 a--  931,50g 4,00m
  /dev/sdf1  raid6-0 lvm2 a--  931,50g 4,00m
  /dev/sdg4  raid6-0 lvm2 a--  931,50g 4,00m
[root@hp ~] 2021-04-10 02:35:39
# uptime
 02:35:40 up 1 day, 29 min,  4 users,  load average: 138,20, 126,23, 135,60

Although this is just due to the insane amount of integrity kworker
processes, and the system is pretty usable, I think it would be much
nicer to only have 1 sync running on the same physical device at a
time.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

