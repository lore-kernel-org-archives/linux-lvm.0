Return-Path: <SRS0=nYqM=HY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D0AC433DB
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 08:51:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D8464E61
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 08:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6D8464E61
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-LtzSBUq8PxKY7mm4PK4zfQ-1; Mon, 22 Feb 2021 03:51:25 -0500
X-MC-Unique: LtzSBUq8PxKY7mm4PK4zfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A66941020C20;
	Mon, 22 Feb 2021 08:51:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA9F360C0F;
	Mon, 22 Feb 2021 08:51:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B563A4E58D;
	Mon, 22 Feb 2021 08:51:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11J9MMUM023679 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 04:22:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9C15511FC8D; Fri, 19 Feb 2021 09:22:22 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96893120ECE
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2021 09:22:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C0FC8007D9
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2021 09:22:20 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-434-JGQm7v_gPtOrAyrWtm8WcQ-1;
	Fri, 19 Feb 2021 04:22:18 -0500
X-MC-Unique: JGQm7v_gPtOrAyrWtm8WcQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 82540AEDA;
	Fri, 19 Feb 2021 09:22:16 +0000 (UTC)
Message-ID: <d23747147bb305d5067f6958cdb776f1307e403b.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Oleksandr Natalenko <oleksandr@redhat.com>
Date: Fri, 19 Feb 2021 10:22:15 +0100
In-Reply-To: <20210218153009.z66cp4j7ptukk4zs@butterfly.localdomain>
References: <20210211111623.34968-1-list@eworm.de>
	<f18dff7a-050a-d41d-c643-4616522ba4a0@suse.com>
	<ae893a3606dd32b07cab16bd538c132af555c956.camel@suse.com>
	<20210217130329.7de41147@leda>
	<20210217133826.u4gglfsowqfvxdff@spock.localdomain>
	<ea269d6255c4cd48bb60771aa7e4204e4f70db8a.camel@suse.com>
	<20210218153009.z66cp4j7ptukk4zs@butterfly.localdomain>
User-Agent: Evolution 3.38.2
MIME-Version: 1.0
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
X-Mailman-Approved-At: Mon, 22 Feb 2021 03:50:14 -0500
Cc: LVM general discussion and development
	<linux-lvm@e1890.dsca.akamaiedge.net>, Christian Hesse <list@eworm.de>,
	Heming Zhao <heming.zhao@suse.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] [PATCH 1/1] pvscan: wait for udevd
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-02-18 at 16:30 +0100, Oleksandr Natalenko wrote:
> > 
> > So what's timing out here is the attempt to _stop_ pvscan. That's
> > curious. It looks like a problem in pvscan to me, not having
> > reacted to
> > a TERM signal for 30s.
> > 
> > It's also worth noting that the parallel pvscan process for device
> > 9:0
> > terminated correctly (didn't hang).
> 
> Yes, pvscan seems to not react to SIGTERM. I have
> DefaultTimeoutStopSec=30s, if I set this to 90s, pvscan hangs for 90s
> respectively.
> 

Good point. That allows us to conclude that pvscan may hang on exit
when udevd isn't available at the time (has been already stopped). That
positively looks like an lvm problem. The After= is a viable
workaround, nothing more and nothing less. We'd need to run pvscan with
increased debug/log level to figure out why it doesn't stop. Given that
you have a workaround, I'm not sure if it's worth the effort for you.

What strikes me more in your logs is the fact that systemd proceeds
with switching root even though the pvscan@253:2 service hasn't
terminated yet. That looks a bit fishy, really. systemd should have
KILLed pvscan before proceeding.

Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

