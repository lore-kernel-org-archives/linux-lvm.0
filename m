Return-Path: <SRS0=ZuGZ=LX=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40678C11F66
	for <linux-lvm@archiver.kernel.org>; Tue, 29 Jun 2021 07:36:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD40961DBC
	for <linux-lvm@archiver.kernel.org>; Tue, 29 Jun 2021 07:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD40961DBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=colorremedies.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-LSUaIhpjOJ63gUxpd-_5Pw-1; Tue, 29 Jun 2021 03:36:13 -0400
X-MC-Unique: LSUaIhpjOJ63gUxpd-_5Pw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E69201084F54;
	Tue, 29 Jun 2021 07:36:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C442A60854;
	Tue, 29 Jun 2021 07:36:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 02F594EA2A;
	Tue, 29 Jun 2021 07:35:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SN0f80010243 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 19:00:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9620D201B077; Mon, 28 Jun 2021 23:00:41 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 919C6201B069
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 23:00:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D23A80B718
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 23:00:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-174-NhWA7BbANc2XAF-24P8SOg-1; Mon, 28 Jun 2021 19:00:35 -0400
X-MC-Unique: NhWA7BbANc2XAF-24P8SOg-1
Received: by mail-wm1-f53.google.com with SMTP id
	u8-20020a7bcb080000b02901e44e9caa2aso1067700wmj.4
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 16:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jhr6hNbZ0D4MYrWBKMDnflszYMXcZexdW+KfNqTbXhY=;
	b=EVIPzoPr/JfkSkB1wD9GJxvv2fGCn0mt+aZKbYGgnFbEM+K3dqjLpR+wIzB9G+IwwZ
	fVja0a/4FKSnmbtn2JqP9H2PwLlXasN2vc1/zCkjNNRAbAOV64nzYplfYvXs6DO+Jj7i
	2ni06/ThWOAqYi7AkhzdDncr4Giw5odOEFouKiHgozx/Cb1S9saMhx2dEJTH0sYxgq5f
	ktSbbuocYunzRwhSE12BhsA8a1p6eq2KlcxkIE42TDqwBNORVIdyBiBdbiAeQqdWidnC
	KSI3ikZBT/SdomwSqwA85Jz2vieH1V1NqjehNPDVNp7sP/92Mc4dnB9Zduzu327EEVJc
	WupA==
X-Gm-Message-State: AOAM532fQQVxospP30I97uCv80RqECWlSIGXJc404Jp35G1cSzPrr89Z
	bQWoMm0Q2HLeWWctW6Nj9fQaQ2vHi+Msco+qau+CkdIyZd6yMzoNdyY=
X-Google-Smtp-Source: ABdhPJwRLSi4lccwRXzNl6DOh//E8jOIlGzQhqUr67t64UnX4ZzPDvq0i3iaSS6+1l1K1m9whThkUmABkF4fV0rgxHI=
X-Received: by 2002:a05:600c:3589:: with SMTP id
	p9mr19578520wmq.182.1624921234503; 
	Mon, 28 Jun 2021 16:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <ba88aa20-e176-0a07-5578-20afb39e0950@suse.com>
	<2d5ff29e-2836-0407-ce76-271255487baa@redhat.com>
	<d59d7b98-3eb6-4d7d-a0f0-f1d82af143f5@suse.com>
	<b0c22aef-8a9-73e6-db74-c24633c3496@gathman.org>
	<35d4978f0aa1c0a78c8c618557ba15e5@assyoma.it>
In-Reply-To: <35d4978f0aa1c0a78c8c618557ba15e5@assyoma.it>
From: Chris Murphy <lists@colorremedies.com>
Date: Mon, 28 Jun 2021 17:00:18 -0600
Message-ID: <CAJCQCtQLTPqdcsG0b9gckteBu8_7vkbAta=tD5f8EjO=NCdyWw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
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
X-Mailman-Approved-At: Tue, 29 Jun 2021 03:34:07 -0400
Cc: Zhong Lidong <lidong.zhong@suse.com>
Subject: Re: [linux-lvm] Does LVM have any plan/schedule to support btrfs in
	fsadm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 28, 2021 at 1:33 AM Gionatan Danti <g.danti@assyoma.it> wrote:
>
> Il 2021-06-28 05:28 Stuart D Gathman ha scritto:
> > Yes.  I like the checksums in metadata feature for enhanced integrity
> > checking.
>
> Until recently btrfs has issue when a LVM snapshot was mounted. It is
> now solved?

Pretty sure it's fixed since 4.14.
https://lkml.org/lkml/2019/2/10/23


> That said, for rewrite-heavy workload (virtual machines, databases, etc)
> btrfs is very slow (and disabling CoW is not a solution for me, as it
> also disables checksum, compression, etc).

It's not inherently slow, it's a tracking cost problem as very large
numbers of extents accumulate. And it also depends on the write
pattern of the guest file system. If you use Btrfs in a guest on a
host using Btrfs, it's a lot more competitive. There's certainly room
for improvement, possibly with some hinting to avoid writing out a
metric ton of 4KiB blocks as other file systems are prone to doing,
where btrfs can turn these into  largely sequential writes, they lose
any locality optimization the guest file system expects for subsequent
reads. A lot of the locality issue is a factor on rotational devices.
When talking about hundreds of thousands of extents per VM file, this
has a noticeable impact on even SSDs, but the much reduced latency
makes it tolerable for some scenarios.

But I've seen similar problems with VM's on LVM thinp when making many
snapshots and incurring cow, however temporary (like a btrfs nodatacow
file that's subject to snapshots or reflink copies; or a backing file
on xfs likewise reflink copied). There really isn't much better we can
do than LVM thick in this regard. And if that's the standard bearer,
it's not much different if you fallocate a nodatacow file.

Some databases are cow friendly, notably rocksdb. And sqlite with wal
enabled is at least not cow unfriendly. The worst offender seems to be
postgresql but I haven't seen any benchmarking since the multiple
kernel series of fsync work done on btrfs to improve the performance
of databases in general; that was kernel 5.8 through 5.11.


-- 
Chris Murphy

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

