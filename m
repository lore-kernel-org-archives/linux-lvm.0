Return-Path: <SRS0=rCee=QG=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D4AC433F5
	for <linux-lvm@archiver.kernel.org>; Fri, 19 Nov 2021 16:13:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F407D61B30
	for <linux-lvm@archiver.kernel.org>; Fri, 19 Nov 2021 16:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F407D61B30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-AG5Czn9qPLeNimiO53gtpQ-1; Fri, 19 Nov 2021 11:13:16 -0500
X-MC-Unique: AG5Czn9qPLeNimiO53gtpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33760100C661;
	Fri, 19 Nov 2021 16:13:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DEEF56A8A;
	Fri, 19 Nov 2021 16:13:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2F0C1832E81;
	Fri, 19 Nov 2021 16:12:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AJGCo9V023999 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 19 Nov 2021 11:12:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8B3B740CFD17; Fri, 19 Nov 2021 16:12:50 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85A2740CFD15
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2021 16:12:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EFBB802814
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2021 16:12:50 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-349-ctPGCGW_OVKpkWstD8wTug-1; Fri, 19 Nov 2021 11:12:48 -0500
X-MC-Unique: ctPGCGW_OVKpkWstD8wTug-1
Received: by mail-qt1-f176.google.com with SMTP id q14so9910098qtx.10
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2021 08:12:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=w9eqrJ9pTzwfDDhXBL+mn2OBKCMAO1YmWc7f7WKQaPo=;
	b=5MuPv/V3hYV68m+IymcI2iEfD8J4kNaJT6bze5LFqE7xIzF3iwuy9ai8P+vtv5yrUZ
	A/zZFc3kNPwE+6igNqBOjuuk1VR+Zg2Y9sniwxmN6rfL9d6DgfAu2LHgFzR4DplLkf/r
	X8HBplTmndmZ2sBfN9/owgbGw7xyCfT2r95REEKnOlkJ9PT+mXdaEXTw+3g2I2LAeg0B
	KamfWiQeBcdnfyxNbPQi1kzT+1NOxNwHo9w6s5K7/Gvb5V/pw7syE0NSdyd9Ix5iA1Bk
	6/58SkIp+Y9HjiTN3+g+WtJJjpr78W1b7tq31pLK85ZMwZAgImFw12qLpbVcE5IX/QAd
	aTNg==
X-Gm-Message-State: AOAM5328I/q4KObHvq6appwIHje17Iz95z/Vo9AsF+lZCs2u0vnydR7P
	AE7V/meieJM2Nvc047catqwvDYspI2kQ2qoan6hp9KVdMNE=
X-Google-Smtp-Source: ABdhPJwgKNpInfs45+adPSs/WVRNECcJTM93yTZj27npJLp5pwZqNab12wkNj/LaoRb7E3e/EJgcAY0xqGMqM7YDbIg=
X-Received: by 2002:a05:622a:1115:: with SMTP id
	e21mr7246867qty.315.1637338367994; 
	Fri, 19 Nov 2021 08:12:47 -0800 (PST)
MIME-Version: 1.0
From: Roger Heflin <rogerheflin@gmail.com>
Date: Fri, 19 Nov 2021 10:12:37 -0600
Message-ID: <CAAMCDeesdTdPdsO5nwOCC+r2FcFZL+UtbEZDC9XucLyP=Gh0Cw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] Have tested dm-raid/lv mirroring with block guard on
 one leg but not the other, it fails to mirror the disk
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I have tested dm-raid/lv mirroring and block guard on one leg but not
on the other and it initially seems to copy/mirror the device and then
random lv's start dropping the new block guard leg and set the refresh
attribute on the lv.   About this time we also start getting severe
filesystem corruption.  All that is being done is mirror the boot disk
to a SAN(block guard) lun and then split off that lun, and there is
breakage in the 10-30 minute window that takes.

I have tried on 2 vendor kernels and I have tried with fedora 35
(5.14.10-300) and all fail with similar overall results but slightly
different error messages in dmesg.

The redhat clone 7.9 kernel said this:  "tag#0 Add. Sense: Logical
block guard check failed", none of the other kernels had that good of
a message.   Fedora 35 got a DID_TRANSPORT_DISRUPTED and an io error
messages against a sector.    The other vendor kernel got basic IO
errors similar to what you get if you had a bad sector.

Any idea if it can be made to work?  Or made to refuse and error in lvm?

I have the commands used and /etc/lvm/archive/* entries for the device
and dmesg from the fedora kernel since it is almost a current
kernel.org kernel.   On  the vendor kernels we tried echo 0 to the
read_verify integrity entries on multipath and the underlying devices
and lvm seemed re-enable read_verify on the devices it built above the
devices it was disabled on when it was setting up/doing the mirroring,
we did not try that on the fedora kernel.

thoughts?

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

