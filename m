Return-Path: <SRS0=qNHw=FD=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1836CC63777
	for <linux-lvm@archiver.kernel.org>; Sun, 29 Nov 2020 00:19:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72BB5207CD
	for <linux-lvm@archiver.kernel.org>; Sun, 29 Nov 2020 00:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72BB5207CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=colorremedies.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-YZzJLfZrPCWXnH9peKYM9A-1; Sat, 28 Nov 2020 19:19:00 -0500
X-MC-Unique: YZzJLfZrPCWXnH9peKYM9A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8C1A1005D60;
	Sun, 29 Nov 2020 00:18:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49E4460BD9;
	Sun, 29 Nov 2020 00:18:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D69D24BB7B;
	Sun, 29 Nov 2020 00:18:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AT0ITOQ008655 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 28 Nov 2020 19:18:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F2D0F1111A6D; Sun, 29 Nov 2020 00:18:28 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF1761111A6C
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2020 00:18:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CCD7858EEC
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2020 00:18:26 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-168-k_oQAeR-O7uDh6AfuhHcGQ-1; Sat, 28 Nov 2020 19:18:23 -0500
X-MC-Unique: k_oQAeR-O7uDh6AfuhHcGQ-1
Received: by mail-wr1-f54.google.com with SMTP id k14so9972248wrn.1
	for <linux-lvm@redhat.com>; Sat, 28 Nov 2020 16:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=G1cfFLbZnbbTa5/y+1905UW2/TB4hN59KjBJ5n0Jvnc=;
	b=Xo7J4JdS4ViPRzL/0EzrhWIGsC/nYdHO+RFNU/99qSkaL32PLMmAaSJ5CEWBOPnMuK
	fwfrid1Nb8vXA3sNUDvkHkq0x9/e6DX2gBzk/O6KcJIUNsRRulzd2P/fN5bH6y/9UihN
	nTRqXsqqbLBN1ncO18hY2VsCqVQKrOBjPPrn5CeABvCudmFkPabUAhDLyZH8qhLR1SQ4
	Ss36dpEIysHekCuKwjydMJzwvm+FXBwxC94eQYA3467Fgt89UspB13osl2ln1C/D9htc
	lKnfI8Hfa0Q6ZNdHhKrH93g6KDuEnrmHrh9m/16hstHcwculrn1gzLRsxMAoQbIU5lnW
	ow2g==
X-Gm-Message-State: AOAM530cZAxQdJ+02UHGmF3LPqNvhsRMItvZfdcZTERmL+sab+v76KVg
	atJgr3E9cQCXff1z3GRNm0GhRzigAOA4y+NuAPWY5CDA9yzd0Q==
X-Google-Smtp-Source: ABdhPJxEr74BUdqZhoe2WNDurytXBv62s7gF1U46/qrnuK8I/elMJdbvUagU6Mz59I/fyCzEa6i+DkP9he6sJexXNh0=
X-Received: by 2002:a5d:488d:: with SMTP id g13mr20057796wrq.274.1606609102443;
	Sat, 28 Nov 2020 16:18:22 -0800 (PST)
MIME-Version: 1.0
From: Chris Murphy <lists@colorremedies.com>
Date: Sat, 28 Nov 2020 17:18:06 -0700
Message-ID: <CAJCQCtS8jzLJrFnG=+dAyimOHZMHka9zyKEeF5JzOjufv3YPqw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
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
Subject: [linux-lvm] swap on thin-provisioning
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
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

Is it expected that swap on a thin volume should work? I'm guessing
the answer is no because mkswap doesn't come with any sort of
allocation request that would set the LE to PE mapping.

What about a swapfile (on ext4 or XFS) onr a thin volume? In this
case, I'd expect fallocate would set the LE to PE mapping, and it
should work. But does it work for both paging and hibernation files?

And what's the implication if the thin volume were to be snapshot?

Thanks,

-- 
Chris Murphy

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

