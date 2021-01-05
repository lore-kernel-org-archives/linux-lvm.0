Return-Path: <SRS0=nGWe=GI=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5A5C433E0
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Jan 2021 21:16:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A790E22D6E
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Jan 2021 21:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A790E22D6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-02gXHtBFPTmioiFN7kc65Q-1; Tue, 05 Jan 2021 16:16:25 -0500
X-MC-Unique: 02gXHtBFPTmioiFN7kc65Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13F9E1800D41;
	Tue,  5 Jan 2021 21:16:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FD8053C9F;
	Tue,  5 Jan 2021 21:16:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07D3418095C7;
	Tue,  5 Jan 2021 21:16:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 105LG7n3023921 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 5 Jan 2021 16:16:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B6BB32026D76; Tue,  5 Jan 2021 21:16:07 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0E002026DE4
	for <linux-lvm@redhat.com>; Tue,  5 Jan 2021 21:16:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B12F82DFE2
	for <linux-lvm@redhat.com>; Tue,  5 Jan 2021 21:16:05 +0000 (UTC)
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-347-yFLt3UsnPYu6S0_JUf0eeA-1; Tue, 05 Jan 2021 16:16:02 -0500
X-MC-Unique: yFLt3UsnPYu6S0_JUf0eeA-1
Received: from localhost (localhost [127.0.0.1])
	by vps.thesusis.net (Postfix) with ESMTP id 11878244B5;
	Tue,  5 Jan 2021 16:16:02 -0500 (EST)
Received: from vps.thesusis.net ([127.0.0.1])
	by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qvaNqqtgAUAK; Tue,  5 Jan 2021 16:16:01 -0500 (EST)
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id A1E91244B2; Tue,  5 Jan 2021 16:16:01 -0500 (EST)
References: <87im8bch2c.fsf@vps.thesusis.net>
	<20210105204737.GC5546@agk.fab.redhat.com>
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: LVM general discussion and development <linux-lvm@redhat.com>
Date: Tue, 05 Jan 2021 16:10:55 -0500
In-reply-to: <20210105204737.GC5546@agk.fab.redhat.com>
Message-ID: <87v9cbdqzy.fsf@vps.thesusis.net>
MIME-Version: 1.0
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
Cc: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Mirror allocation policy
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Alasdair G Kergon writes:

> On Tue, Jan 05, 2021 at 02:31:00PM -0500, Phillip Susi wrote:
>> How can I forge it to make the mirror on a single pv?  
>
> If --alloc anywhere isn't doing the trick, you'll need to dig into
> the -vvvv output to try to understand why.  There might be
> a config option setting getting in the way disabling the choice you want
> it to make, or if it's an algorithmic issue you might try to coax it to

I'm not seeing a whole lot here other than what appears to be this flat
out refusal to use extents from the same pv:

#metadata/lv_manip.c:2535         Not using free space on existing
 parallel PV /dev/md1.

Limiting the allocation to two specific extent ranges does not help either.

Full log:

#libdm-config.c:1061       Setting
 allocation/mirror_logs_require_separate_pvs to 0
 #metadata/lv_manip.c:3439         Adjusted allocation request to 7681
 logical extents. Existing size 0. New size 7681.
 #metadata/lv_manip.c:3442         Mirror log of 1 extents of size 8192
 sectors needed for region size 4096.
 #libdm-config.c:1061       Setting allocation/maximise_cling to 1
 #metadata/pv_map.c:54         Allowing allocation on /dev/md1 start PE
 2561 length 23039
 #metadata/pv_map.c:54         Allowing allocation on /dev/md1 start PE
 128000 length 347469
 #metadata/lv_manip.c:2321         Parallel PVs at LE 0 length 7680:
 /dev/md1
 #metadata/lv_manip.c:3186         Trying allocation using contiguous
 policy.
 #metadata/lv_manip.c:2788         Areas to be sorted and filled
 sequentially.
 #metadata/lv_manip.c:2704         Still need 7681 total extents from
 370508 remaining (0 positional slots):
 #metadata/lv_manip.c:2707           1 (1 data/0 parity) parallel areas
 of 7680 extents each
 #metadata/lv_manip.c:2711           1 metadata area of 1 extents each
 #metadata/lv_manip.c:2535         Not using free space on existing
 parallel PV /dev/md1.
 #metadata/lv_manip.c:3186         Trying allocation using cling policy.
 #metadata/lv_manip.c:2783         Cling_to_allocated is set
 #metadata/lv_manip.c:2786         1 preferred area(s) to be filled
 positionally.
 #metadata/lv_manip.c:2704         Still need 7681 total extents from
 370508 remaining (1 positional slots):
 #metadata/lv_manip.c:2707           1 (1 data/0 parity) parallel areas
 of 7680 extents each
 #metadata/lv_manip.c:2711           1 metadata area of 1 extents each
 #metadata/lv_manip.c:2535         Not using free space on existing
 parallel PV /dev/md1.
 #metadata/lv_manip.c:3186         Trying allocation using normal
 policy.
 #metadata/lv_manip.c:2783         Cling_to_allocated is set
 #metadata/lv_manip.c:2788         Areas to be sorted and filled
 sequentially.
 #metadata/lv_manip.c:2704         Still need 7681 total extents from
 370508 remaining (0 positional slots):
 #metadata/lv_manip.c:2707           1 (1 data/0 parity) parallel areas
 of 7680 extents each
 #metadata/lv_manip.c:2711           1 metadata area of 1 extents each
 #metadata/lv_manip.c:2535         Not using free space on existing
 parallel PV /dev/md1.
 #metadata/lv_manip.c:2783         Cling_to_allocated is not set
 #metadata/lv_manip.c:2788         Areas to be sorted and filled
 sequentially.
 #metadata/lv_manip.c:2704         Still need 7681 total extents from
 370508 remaining (0 positional slots):
 #metadata/lv_manip.c:2707           1 (1 data/0 parity) parallel areas
 of 7680 extents each
 #metadata/lv_manip.c:2711           1 metadata area of 1 extents each
 #metadata/lv_manip.c:2535         Not using free space on existing
 parallel PV /dev/md1.
 #metadata/lv_manip.c:3220   Insufficient suitable allocatable extents
 for logical volume : 7681 more required
 

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

