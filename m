Return-Path: <SRS0=u9pG=LW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24AEC2B9F4
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 07:32:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 400A661582
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 07:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 400A661582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-mSd57wHPOcOkexABUWtFoQ-1; Mon, 28 Jun 2021 03:32:33 -0400
X-MC-Unique: mSd57wHPOcOkexABUWtFoQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DBEA1927804;
	Mon, 28 Jun 2021 07:32:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35F955D6AD;
	Mon, 28 Jun 2021 07:32:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 222921809C99;
	Mon, 28 Jun 2021 07:32:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15S7W8dA030420 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 03:32:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95BDC21602A4; Mon, 28 Jun 2021 07:32:08 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D7DA21602A7
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 07:32:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A19D9676E5
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 07:32:04 +0000 (UTC)
Received: from mr024msb.fastweb.it (mr024msb.fastweb.it [85.18.95.100])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-248-KBmvAtDtPOuVJBn8zJ7Cyg-1; Mon, 28 Jun 2021 03:31:57 -0400
X-MC-Unique: KBmvAtDtPOuVJBn8zJ7Cyg-1
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduledrfeehfedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhtefuvfghgfeupdfqfgfvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvffujghffgfkgigtgfesthejjhdttdervdenucfhrhhomhepifhiohhnrghtrghnucffrghnthhiuceoghdruggrnhhtihesrghsshihohhmrgdrihhtqeenucggtffrrghtthgvrhhnpedvffevtdeuveelhedukeffieeluefhvddtiefgueekgfdvvdfhleehgfekfffgtdenucffohhmrghinheprghsshihohhmrgdrihhtnecukfhppeelfedrieefrdehhedrheejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghlohepphhluhhtohhnvgdrrghsshihohhmrgdrihhtpdhinhgvthepleefrdeifedrheehrdehjedpmhgrihhlfhhrohhmpehgrdgurghnthhisegrshhshihomhgrrdhithdprhgtphhtthhopehlihguohhnghdriihhohhnghesshhushgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqlhhvmhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepshhtuhgrrhhtsehgrghthhhmrghnrdhorhhgpdhrtghpthhtohepthgvihhglhgrnhgusehrvgguhhgrthdrtghomhdprhgtphhtthhopeiikhgrsggvlhgrtgesrhgvughhrghtrdgtohhm
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from plutone.assyoma.it (93.63.55.57) by mr024msb.fastweb.it
	(5.8.715.01) id 605862BF0AEBF1AC; Mon, 28 Jun 2021 09:29:19 +0200
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id 7A316C00DC84;
	Mon, 28 Jun 2021 09:29:19 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 28 Jun 2021 09:29:19 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <b0c22aef-8a9-73e6-db74-c24633c3496@gathman.org>
References: <ba88aa20-e176-0a07-5578-20afb39e0950@suse.com>
	<2d5ff29e-2836-0407-ce76-271255487baa@redhat.com>
	<d59d7b98-3eb6-4d7d-a0f0-f1d82af143f5@suse.com>
	<b0c22aef-8a9-73e6-db74-c24633c3496@gathman.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <35d4978f0aa1c0a78c8c618557ba15e5@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
Cc: Stuart, Zhong Lidong <lidong.zhong@suse.com>,
	David Teigland <teigland@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
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

Il 2021-06-28 05:28 Stuart D Gathman ha scritto:
> Yes.  I like the checksums in metadata feature for enhanced integrity
> checking.

Until recently btrfs has issue when a LVM snapshot was mounted. It is 
now solved?

> It seems too complicated to have anytime soon - but when a filesystem
> detects corruption, and is on an LVM (or md) RAID1 layer, an ioctl to
> read alternate mirror branches to see which (if any) has the correct
> data would allow recovery.  Btrfs does this if it is doing the
> mirroring, but then you lose all the other features from LVM or md
> raid10, including running other filesystems and efficient virtual
> disks for
> virtual machines.

For this to work, LVM should be able to identify the corrupted data. 
Without checksum, how can you do that? The solution is to use 
dm-integrity under the RAID layer. It works pretty well, letting apart 
the big performance drop in the default (journaled) configuration 
(bitmap is faster, but leave a small window for corruption to happen 
undetected).

That said, for rewrite-heavy workload (virtual machines, databases, etc) 
btrfs is very slow (and disabling CoW is not a solution for me, as it 
also disables checksum, compression, etc).

> We eventually got DISCARD operations to pass to lower layers.
> Dealing with mirror branches should really be a thing too.

As said above, the issue is not to read from the mirror leg separately; 
rather, to detect *which* mirror leg contains valid data.

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

