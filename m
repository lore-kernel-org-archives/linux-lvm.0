Return-Path: <SRS0=nGWe=GI=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2274CC433DB
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Jan 2021 16:23:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2DF322C9D
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Jan 2021 16:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2DF322C9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609863785;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Bfx9YiMeGd8bH2hn6Jseg/hV5cqwSm5u0lIxfbHy4ag=;
	b=iLyIl8Cnlf5o3USvMd3PvhX8y0z27nq9YyCqO6SJ32br1w5bvla3ElvLMZm5k41+yH3SsH
	Bv4WOhVSl3n9zY8qOD/YMxYkpoST5/BWF5Kx6DlAuXZqrakDe1R837fBXtwqXzGG4Uatv1
	dNCYhRziDRYUR55yL2T8BwXUMINh/uw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-RxN1txQBNG-4C-t-lqcrEw-1; Tue, 05 Jan 2021 11:23:03 -0500
X-MC-Unique: RxN1txQBNG-4C-t-lqcrEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F20CD180A086;
	Tue,  5 Jan 2021 16:22:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A36560855;
	Tue,  5 Jan 2021 16:22:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0E785002C;
	Tue,  5 Jan 2021 16:22:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 105GMcNp023292 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 5 Jan 2021 11:22:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CFBEF7092B; Tue,  5 Jan 2021 16:22:38 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7274E2B394;
	Tue,  5 Jan 2021 16:22:35 +0000 (UTC)
Date: Tue, 5 Jan 2021 10:22:33 -0600
From: David Teigland <teigland@redhat.com>
To: Songmin Li <lisongmin9@gmail.com>
Message-ID: <20210105162233.GC26820@redhat.com>
References: <CACOXiSRtQDy5gBKveWdUrA+qV7bm_U20TnKqupWhuCHbMm4sOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACOXiSRtQDy5gBKveWdUrA+qV7bm_U20TnKqupWhuCHbMm4sOA@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-lvm@redhat.com
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] there is a vgextend sagfault with missing pv which
 is resolved on master, can we backport it to 2.02 branch
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 01, 2021 at 05:49:49PM +0800, Songmin Li wrote:
> Can we backport this commit to 2.02 branch so we can repair lvm on disk
> fault?

Hi, pushed that here
https://sourceware.org/git/?p=lvm2.git;a=commit;h=b98c3346350b7c270140c1f21fda0436876e16e8

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

