Return-Path: <SRS0=rBOY=M6=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9A0C4338F
	for <linux-lvm@archiver.kernel.org>; Sat,  7 Aug 2021 11:43:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 470A0610A6
	for <linux-lvm@archiver.kernel.org>; Sat,  7 Aug 2021 11:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 470A0610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-hIFhSIt_Of-OZjjmF8zVDA-1; Sat, 07 Aug 2021 07:43:38 -0400
X-MC-Unique: hIFhSIt_Of-OZjjmF8zVDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2B1AEC1A0;
	Sat,  7 Aug 2021 11:43:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A110960853;
	Sat,  7 Aug 2021 11:43:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E0D48180BAD0;
	Sat,  7 Aug 2021 11:43:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 177Bh6c1009882 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 7 Aug 2021 07:43:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5424104085F; Sat,  7 Aug 2021 11:43:06 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C07761112C2E
	for <linux-lvm@redhat.com>; Sat,  7 Aug 2021 11:43:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E53F8101A529
	for <linux-lvm@redhat.com>; Sat,  7 Aug 2021 11:43:03 +0000 (UTC)
Received: from mr024msb.fastweb.it (mr024msb.fastweb.it [85.18.95.100])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-523-ah_PbpotOZisXS78ub33lQ-1; Sat, 07 Aug 2021 07:43:01 -0400
X-MC-Unique: ah_PbpotOZisXS78ub33lQ-1
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvtddrjeefgdegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhtefuvfghgfeupdfqfgfvnecuuegrihhlohhuthemuceftddtnecunecujfgurhepggffhffvufgfkfigtgfgsehtjehjtddtredvnecuhfhrohhmpefiihhonhgrthgrnhcuffgrnhhtihcuoehgrdgurghnthhisegrshhshihomhgrrdhitheqnecuggftrfgrthhtvghrnhepleduheefjedtvefghfefheefueefgeekteefjeevveffvedvvdehveejgedtveevnecuffhomhgrihhnpegrshhshihomhgrrdhithenucfkphepleefrdeifedrheehrdehjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehplhhuthhonhgvrdgrshhshihomhgrrdhithdpihhnvghtpeelfedrieefrdehhedrheejpdhmrghilhhfrhhomhepghdruggrnhhtihesrghsshihohhmrgdrihhtpdhrtghpthhtoheplhhinhhugidqlhhvmhesrhgvughhrghtrdgtohhm
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from plutone.assyoma.it (93.63.55.57) by mr024msb.fastweb.it
	(5.8.715.01) id 605862BF0E5561CD for linux-lvm@redhat.com;
	Sat, 7 Aug 2021 13:40:00 +0200
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id DB860DC6A65B
	for <linux-lvm@redhat.com>; Sat,  7 Aug 2021 13:39:59 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 07 Aug 2021 13:39:59 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: linux-lvm@redhat.com
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <7956b86706382158e1fddb3c4bfbfde3@assyoma.it>
X-Sender: g.danti@assyoma.it
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
Subject: [linux-lvm] How to check if thin volume or snapshot was ever
	activated
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dear all,
as you know, a thin snapshot does have the "k" (skip activation) flag 
set, so one has to force activation by ignoring the flag (or removing 
the flag itself).

I wonder: can we detect if a volume/snapshot was *ever* activated? My 
reasoning is that a never-activated snapshot surely did not receive any 
application writes, so it can be safely removed (ignoring snapshot 
retention policy).

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

