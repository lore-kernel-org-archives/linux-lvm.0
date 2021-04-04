Return-Path: <SRS0=hIx7=JB=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C24C433ED
	for <linux-lvm@archiver.kernel.org>; Sun,  4 Apr 2021 18:27:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF9116128A
	for <linux-lvm@archiver.kernel.org>; Sun,  4 Apr 2021 18:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF9116128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=reox.at
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-hvwp7OwmO3uH5ivTp5Ae1g-1; Sun, 04 Apr 2021 14:27:32 -0400
X-MC-Unique: hvwp7OwmO3uH5ivTp5Ae1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25C0E612A3;
	Sun,  4 Apr 2021 18:27:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BEC32C15B;
	Sun,  4 Apr 2021 18:27:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F7BB4BB7C;
	Sun,  4 Apr 2021 18:27:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 134IR08P030182 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 4 Apr 2021 14:27:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A2E552ED76; Sun,  4 Apr 2021 18:27:00 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CE559E6B
	for <linux-lvm@redhat.com>; Sun,  4 Apr 2021 18:26:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB9A2800B28
	for <linux-lvm@redhat.com>; Sun,  4 Apr 2021 18:26:57 +0000 (UTC)
Received: from midgard.reox.at (midgard.reox.at [176.9.78.130]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-586-IgDUd7Q5PmaxLnWuRp7ZyQ-1;
	Sun, 04 Apr 2021 14:26:55 -0400
X-MC-Unique: IgDUd7Q5PmaxLnWuRp7ZyQ-1
Received: from 127.0.0.1 (localhost [127.0.0.1])
	by midgard.reox.at (Postfix) with ESMTPSA id ADA8812006D
	for <linux-lvm@redhat.com>; Sun,  4 Apr 2021 20:18:59 +0200 (CEST)
Date: Sun, 4 Apr 2021 20:18:56 +0200
From: Sebastian Bachmann <hello@reox.at>
To: linux-lvm@redhat.com
Message-ID: <20210404181856.6hevvwxwyflsm373@helios>
MIME-Version: 1.0
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
Subject: [linux-lvm] move dm-integrity metadata to another PV
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I played around with the new dm-integrity integration in lvm. Unfortunately, it
is very slow, as the checksums has to be written and read on - which is the
price to pay obviously.

I thought that it might be a good idea to move the metadata to a fast disk,
i.e., a SSD, however that is not possible and I get an error message on pvmove:

# pvmove -n r10_int_rimage_0_imeta /dev/sdd /dev/sda2
  Unable to pvmove device used for raid with integrity.

I could not find a reason why this should not be done in theory, thus I guess
that this is simply not supported by LVM right now?
Or is there another reason why you should keep the metadata always on the same
device?

Best,
Sebastian

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

