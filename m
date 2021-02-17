Return-Path: <SRS0=3Cdo=HU=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_ADSP_ALL,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F0EC433E0
	for <linux-lvm@archiver.kernel.org>; Thu, 18 Feb 2021 08:30:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82E2E60295
	for <linux-lvm@archiver.kernel.org>; Thu, 18 Feb 2021 08:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82E2E60295
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=natalenko.name
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-u6S7q7M8NrGJ3fyee_B01w-1; Thu, 18 Feb 2021 03:30:47 -0500
X-MC-Unique: u6S7q7M8NrGJ3fyee_B01w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D98406D4E0;
	Thu, 18 Feb 2021 08:30:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7264E6F968;
	Thu, 18 Feb 2021 08:30:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCA5F18095CB;
	Thu, 18 Feb 2021 08:30:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HJC6A2019759 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 14:12:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8718F20CA487; Wed, 17 Feb 2021 19:12:06 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 819AE20CA486
	for <linux-lvm@redhat.com>; Wed, 17 Feb 2021 19:12:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 287AC92B002
	for <linux-lvm@redhat.com>; Wed, 17 Feb 2021 19:12:04 +0000 (UTC)
Received: from vulcan.natalenko.name (vulcan.natalenko.name
	[104.207.131.136]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-398-w6WLn_HMOCSfPXLV9yribw-1; Wed, 17 Feb 2021 14:12:00 -0500
X-MC-Unique: w6WLn_HMOCSfPXLV9yribw-1
Received: from localhost (kaktus.kanapka.ml [151.237.229.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	by vulcan.natalenko.name (Postfix) with ESMTPSA id 7EEF3999FFA;
	Wed, 17 Feb 2021 20:11:53 +0100 (CET)
Date: Wed, 17 Feb 2021 20:11:52 +0100
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20210217191152.qib75yvdvmxdmauq@spock.localdomain>
References: <20210211111623.34968-1-list@eworm.de>
	<f18dff7a-050a-d41d-c643-4616522ba4a0@suse.com>
	<ae893a3606dd32b07cab16bd538c132af555c956.camel@suse.com>
	<20210217130329.7de41147@leda>
	<9416b5505fa2c7e726c470d99168f28d20c136ce.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <9416b5505fa2c7e726c470d99168f28d20c136ce.camel@suse.com>
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
X-Mailman-Approved-At: Thu, 18 Feb 2021 03:30:19 -0500
Cc: Oleksandr Natalenko <oleksandr@redhat.com>,
	LVM general discussion and development
	<linux-lvm@e1890.dsca.akamaiedge.net>, Christian Hesse <list@eworm.de>,
	Heming Zhao <heming.zhao@suse.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello.

On Wed, Feb 17, 2021 at 02:49:00PM +0100, Martin Wilck wrote:
> On Wed, 2021-02-17 at 13:03 +0100, Christian Hesse wrote:
> > 
> > Let's keep this in mind. Now let's have a look at udevd startup: It
> > signals
> > being ready by calling sd_notifyf(), but it loads rules and applies
> > permissions before doing so [0].
> > Even before we have some code about handling events and monitoring
> > stuff.
> 
> It loads the rules, but events will only be processed after entering
> sd_event_loop(), which happens after the sd_notify() call.
> 
> Anyway, booting the system with "udev.log-priority=debug" might provide
> further insight. Oleksandr, could you try that (without the After=
> directive)?

Yes.

pvscan: http://ix.io/2PLK
udev: http://ix.io/2PLL
lvm: http://ix.io/2PLM

Let me know if I can collect something else.

Thanks.

-- 
  Oleksandr Natalenko (post-factum)

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

