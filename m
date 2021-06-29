Return-Path: <SRS0=ZuGZ=LX=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F75FC11F67
	for <linux-lvm@archiver.kernel.org>; Tue, 29 Jun 2021 22:32:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20C6361D92
	for <linux-lvm@archiver.kernel.org>; Tue, 29 Jun 2021 22:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20C6361D92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-_yS_CZhZPTWx5SF8_Y0-zg-1; Tue, 29 Jun 2021 18:32:51 -0400
X-MC-Unique: _yS_CZhZPTWx5SF8_Y0-zg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B445100CCC5;
	Tue, 29 Jun 2021 22:32:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFC705D6A1;
	Tue, 29 Jun 2021 22:32:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CA904EA2A;
	Tue, 29 Jun 2021 22:32:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15TMWEZa003223 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 29 Jun 2021 18:32:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0FA03100BFD6; Tue, 29 Jun 2021 22:32:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B2991011013
	for <linux-lvm@redhat.com>; Tue, 29 Jun 2021 22:32:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E97D8007BB
	for <linux-lvm@redhat.com>; Tue, 29 Jun 2021 22:32:11 +0000 (UTC)
Received: from mr023msb.fastweb.it (mr023msb.fastweb.it [85.18.95.105])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-266-D-srce1mP-KKoedOOG7Skg-1; Tue, 29 Jun 2021 18:32:08 -0400
X-MC-Unique: D-srce1mP-KKoedOOG7Skg-1
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduledrfeeiuddgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfetuffvhgfguedpqfgfvfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvufgjfhgfkfigtgfgsehtjehjtddtredvnecuhfhrohhmpefiihhonhgrthgrnhcuffgrnhhtihcuoehgrdgurghnthhisegrshhshihomhgrrdhitheqnecuggftrfgrthhtvghrnhephfekhefggfdtuefhvdegueeitddtffelvdeujeevtdfgfeffvddufedvueduveevnecuffhomhgrihhnpehlkhhmlhdrohhrghdpshhpihhnihgtshdrnhgvthdprghsshihohhmrgdrihhtnecukfhppeelfedrieefrdehhedrheejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghlohepphhluhhtohhnvgdrrghsshihohhmrgdrihhtpdhinhgvthepleefrdeifedrheehrdehjedpmhgrihhlfhhrohhmpehgrdgurghnthhisegrshhshihomhgrrdhithdprhgtphhtthhopehlihguohhnghdriihhohhnghesshhushgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqlhhvmhesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhishhtshestgholhhorhhrvghmvgguihgvshdrtghomh
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from plutone.assyoma.it (93.63.55.57) by mr023msb.fastweb.it
	(5.8.715.01) id 60B1376B033D5EBB; Wed, 30 Jun 2021 00:32:05 +0200
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id 2DDDAD7E284B;
	Wed, 30 Jun 2021 00:32:05 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 30 Jun 2021 00:32:05 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CAJCQCtQLTPqdcsG0b9gckteBu8_7vkbAta=tD5f8EjO=NCdyWw@mail.gmail.com>
References: <ba88aa20-e176-0a07-5578-20afb39e0950@suse.com>
	<2d5ff29e-2836-0407-ce76-271255487baa@redhat.com>
	<d59d7b98-3eb6-4d7d-a0f0-f1d82af143f5@suse.com>
	<b0c22aef-8a9-73e6-db74-c24633c3496@gathman.org>
	<35d4978f0aa1c0a78c8c618557ba15e5@assyoma.it>
	<CAJCQCtQLTPqdcsG0b9gckteBu8_7vkbAta=tD5f8EjO=NCdyWw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <1899553bb4075cb4c10eca46ea0b6f8a@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
Cc: Zhong Lidong <lidong.zhong@suse.com>,
	Chris Murphy <lists@colorremedies.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2021-06-29 01:00 Chris Murphy ha scritto:
> Pretty sure it's fixed since 4.14.
> https://lkml.org/lkml/2019/2/10/23

Hi Chris, the headline states "harden against duplicate fsid". Does it 
means that the issue is "only" less likely or it was really solved?

> It's not inherently slow, it's a tracking cost problem as very large
> numbers of extents accumulate. And it also depends on the write
> pattern of the guest file system. If you use Btrfs in a guest on a
> host using Btrfs, it's a lot more competitive. There's certainly room
> for improvement, possibly with some hinting to avoid writing out a
> metric ton of 4KiB blocks as other file systems are prone to doing,
> where btrfs can turn these into  largely sequential writes, they lose
> any locality optimization the guest file system expects for subsequent
> reads. A lot of the locality issue is a factor on rotational devices.
> When talking about hundreds of thousands of extents per VM file, this
> has a noticeable impact on even SSDs, but the much reduced latency
> makes it tolerable for some scenarios.

I think the main issue stems for btrfs striking to have 4K CoW extents.
ZFS has a default 128K recordsize that, while commanding a fair 
read/modify/write overhead, works much better with HDDs (for SSDs one 
can lower recordize to 16K or 32K).
XFS with reflink does something similar, doing CoW at 128K block 
granularity (we had a similar discussion in the past: 
https://www.spinics.net/lists/linux-xfs/msg35679.html)

> But I've seen similar problems with VM's on LVM thinp when making many
> snapshots and incurring cow, however temporary (like a btrfs nodatacow
> file that's subject to snapshots or reflink copies; or a backing file
> on xfs likewise reflink copied). There really isn't much better we can
> do than LVM thick in this regard. And if that's the standard bearer,
> it's not much different if you fallocate a nodatacow file.

If I remember correctly thin LVM minimum chunk size should be 64K, 
making it much less prone to fragmentation. Moreover, it only CoW when a 
snapshot if overwritten for the first time (ZFS reallocates at each 
write and I think btrfs does something similar).

In a distant past, I benchmarked a virtual machine running on btrfs over 
a fallocated+nocow files and the result was quite bleak. Maybe things 
have improved more than I can imagine... time for some more benchmark I 
suppose! Do you have any to share?

> Some databases are cow friendly, notably rocksdb. And sqlite with wal
> enabled is at least not cow unfriendly. The worst offender seems to be
> postgresql but I haven't seen any benchmarking since the multiple
> kernel series of fsync work done on btrfs to improve the performance
> of databases in general; that was kernel 5.8 through 5.11.

Yeah, both PostgreSQL and MySQL tend to be slow on btrfs.

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

