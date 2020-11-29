Return-Path: <SRS0=qNHw=FD=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6643C5519F
	for <linux-lvm@archiver.kernel.org>; Sun, 29 Nov 2020 12:53:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B930C2080C
	for <linux-lvm@archiver.kernel.org>; Sun, 29 Nov 2020 12:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B930C2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-pbzEvPrlO8-P8oa0teRYCQ-1; Sun, 29 Nov 2020 07:53:08 -0500
X-MC-Unique: pbzEvPrlO8-P8oa0teRYCQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FB121842141;
	Sun, 29 Nov 2020 12:53:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8E3960C04;
	Sun, 29 Nov 2020 12:52:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 247784BB7B;
	Sun, 29 Nov 2020 12:52:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ATCqegl022087 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 29 Nov 2020 07:52:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3988E1132B; Sun, 29 Nov 2020 12:52:40 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 344E611321
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2020 12:52:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6D8D811E76
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2020 12:52:36 +0000 (UTC)
Received: from mr013msb.fastweb.it (mr013msb.fastweb.it [85.18.95.104])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-468-f1g1zoYcM5WcSY8Ckc4wZQ-1; Sun, 29 Nov 2020 07:52:33 -0500
X-MC-Unique: f1g1zoYcM5WcSY8Ckc4wZQ-1
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedujedrudehkedggeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfetuffvhgfguedpucfqfgfvnecuuegrihhlohhuthemuceftddtnecunecujfgurhepggffhffvufgjfhgfkfigtgfgsehtjehjtddtredvnecuhfhrohhmpefiihhonhgrthgrnhcuffgrnhhtihcuoehgrdgurghnthhisegrshhshihomhgrrdhitheqnecuggftrfgrthhtvghrnhepvdffvedtueevleehudekffeileeuhfdvtdeigfeukefgvddvhfelhefgkeffgfdtnecuffhomhgrihhnpegrshhshihomhgrrdhithenucfkphepleefrdeifedrheehrdehjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehplhhuthhonhgvrdgrshhshihomhgrrdhithdpihhnvghtpeelfedrieefrdehhedrheejpdhmrghilhhfrhhomhepoehgrdgurghnthhisegrshhshihomhgrrdhitheqpdhrtghpthhtohepoehlihhnuhigqdhlvhhmsehrvgguhhgrthdrtghomhequcfqtfevrffvpehrfhgtkedvvdenlhhinhhugidqlhhvmhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepoehlihhsthhssegtohhlohhrrhgvmhgvughivghsrdgtohhmqecuqfftvefrvfeprhhftgekvddvnehlihhsthhssegtohhlohhrrhgvmhgvughivghsrdgtohhm
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from plutone.assyoma.it (93.63.55.57) by mr013msb.fastweb.it
	(5.8.208) id 5F4CF1900853CBD2; Sun, 29 Nov 2020 13:52:30 +0100
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id 00FF7C09A802;
	Sun, 29 Nov 2020 13:52:29 +0100 (CET)
MIME-Version: 1.0
Date: Sun, 29 Nov 2020 13:52:29 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CAJCQCtS8jzLJrFnG=+dAyimOHZMHka9zyKEeF5JzOjufv3YPqw@mail.gmail.com>
References: <CAJCQCtS8jzLJrFnG=+dAyimOHZMHka9zyKEeF5JzOjufv3YPqw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <608365664c2a18db4e756f524c0e76da@assyoma.it>
X-Sender: g.danti@assyoma.it
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
Cc: Chris Murphy <lists@colorremedies.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2020-11-29 01:18 Chris Murphy ha scritto:
> What about a swapfile (on ext4 or XFS) onr a thin volume? In this
> case, I'd expect fallocate would set the LE to PE mapping, and it
> should work. But does it work for both paging and hibernation files?

If things did not change, fallocate does *not* allocate PE space (ie: 
they are not passed down to the underlying thin pool).

Moreover, I expect for a memory-starved machine to page out pool 
metadata (right?) so I would not use a thin volume for swap.

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
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

