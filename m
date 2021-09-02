Return-Path: <SRS0=nGmI=NY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_ADSP_ALL,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E52C4320A
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 07:48:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7DBA610A4
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 07:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7DBA610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ookaze.fr
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-MQUrSSiKMAeL0RF0r3Bxdw-1; Thu, 02 Sep 2021 03:48:35 -0400
X-MC-Unique: MQUrSSiKMAeL0RF0r3Bxdw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D56791883522;
	Thu,  2 Sep 2021 07:48:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 137225B826;
	Thu,  2 Sep 2021 07:48:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCF4F1809C98;
	Thu,  2 Sep 2021 07:48:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1827iDnj023704 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 2 Sep 2021 03:44:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B32241014B25; Thu,  2 Sep 2021 07:44:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF2601014600
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2021 07:44:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1056800963
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2021 07:44:10 +0000 (UTC)
Received: from ookaze.fr (82-65-226-53.subs.proxad.net [82.65.226.53])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-266-wpzzokrtNia7W66G9iuZQg-1; Thu, 02 Sep 2021 03:44:08 -0400
X-MC-Unique: wpzzokrtNia7W66G9iuZQg-1
Message-ID: <079c89596cbea06f80874fdc3ffe8cfe05841c4d.camel@ookaze.fr>
From: Jean-Michel Pollion <jmp-lvm2@ookaze.fr>
To: linux-lvm@redhat.com
Date: Thu, 02 Sep 2021 09:34:20 +0200
Organization: Deva Team
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1827iDnj023704
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm]  LVM tools segfault since 2.03.12
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

Hello,

I have the lvm2 tools segfaulting since 2.03.12 with a message of
unsorted commands in cmds.h.
It turns out that in my locale and on my setup, the LANG=C setting
before "sort -u" in tools/Makefile.in is not enough, I had to patch and
add LC_COLLATE=C too, or the rules will not count the underscore while
sorting, causing the segfault in the code (command.c IIRC).
This broke the boot on some of my servers, so I think it's a rather big
problem that perhaps can't be caught in reproducible builds.
Can this be corrected upstream or should I just modify my build
environment for LVM2?

Thanks


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

