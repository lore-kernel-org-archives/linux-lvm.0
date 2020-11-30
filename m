Return-Path: <SRS0=nNlY=FE=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8226DC5519F
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 08:44:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 864582076E
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 08:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 864582076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-ijpY1s3oOLiUhZ2t16MH0A-1; Mon, 30 Nov 2020 03:44:02 -0500
X-MC-Unique: ijpY1s3oOLiUhZ2t16MH0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C4F2805BE0;
	Mon, 30 Nov 2020 08:43:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ABEF60862;
	Mon, 30 Nov 2020 08:43:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 930174A7C6;
	Mon, 30 Nov 2020 08:43:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AU8delc001471 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 03:39:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E9E3520296A9; Mon, 30 Nov 2020 08:39:39 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3D4E20296A5
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2020 08:39:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBB7E858295
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2020 08:39:35 +0000 (UTC)
Received: from mr014msb.fastweb.it (mr014msb.fastweb.it [85.18.95.103])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-36-fRrxua2cMtGldJIAYy4h-A-1; Mon, 30 Nov 2020 03:39:32 -0500
X-MC-Unique: fRrxua2cMtGldJIAYy4h-A-1
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedujedrudehledguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhtefuvfghgfeupdcuqfgfvfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvufgjfhgfkfigtgfgsehtjehjtddtredvnecuhfhrohhmpefiihhonhgrthgrnhcuffgrnhhtihcuoehgrdgurghnthhisegrshhshihomhgrrdhitheqnecuggftrfgrthhtvghrnhepvdffvedtueevleehudekffeileeuhfdvtdeigfeukefgvddvhfelhefgkeffgfdtnecuffhomhgrihhnpegrshhshihomhgrrdhithenucfkphepleefrdeifedrheehrdehjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehplhhuthhonhgvrdgrshhshihomhgrrdhithdpihhnvghtpeelfedrieefrdehhedrheejpdhmrghilhhfrhhomhepoehgrdgurghnthhisegrshhshihomhgrrdhitheqpdhrtghpthhtohepoehlihhnuhigqdhlvhhmsehrvgguhhgrthdrtghomhequcfqtfevrffvpehrfhgtkedvvdenlhhinhhugidqlhhvmhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepoehsrhgvhigrnhefvdesghhmrghilhdrtghomhequcfqtfevrffvpehrfhgtkedvvdenshhrvgihrghnfedvsehgmhgrihhlrdgtohhm
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from plutone.assyoma.it (93.63.55.57) by mr014msb.fastweb.it
	(5.8.208) id 5F04F0540CCD24A5; Mon, 30 Nov 2020 09:39:28 +0100
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id 8E278C02B9A3;
	Mon, 30 Nov 2020 09:39:28 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 30 Nov 2020 09:39:28 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CAMaziXu_=POwe7Q4da4=zxYXzF=2x9y00eJYpUPcoQD=LWB=gA@mail.gmail.com>
References: <CAJCQCtS8jzLJrFnG=+dAyimOHZMHka9zyKEeF5JzOjufv3YPqw@mail.gmail.com>
	<608365664c2a18db4e756f524c0e76da@assyoma.it>
	<CAMaziXu_=POwe7Q4da4=zxYXzF=2x9y00eJYpUPcoQD=LWB=gA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <47ce0a49d173897f3d56458eef9f2dc8@assyoma.it>
X-Sender: g.danti@assyoma.it
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
Cc: Sreyan Chakravarty <sreyan32@gmail.com>
Subject: Re: [linux-lvm] swap on thin-provisioning
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2020-11-29 16:12 Sreyan Chakravarty ha scritto:
> 
> What about a swap file allocated with dd??

If thinpool metadata can be paged out (which I don't know for sure), 
swap on thinvol can potentially deadlock.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

