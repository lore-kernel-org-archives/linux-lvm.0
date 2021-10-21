Return-Path: <SRS0=7RWj=PJ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8677FC433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 21 Oct 2021 06:13:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE8C6611EF
	for <linux-lvm@archiver.kernel.org>; Thu, 21 Oct 2021 06:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE8C6611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bdmcc-us.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-bZGVeevXM0WsIVtxoQaeHg-1; Thu, 21 Oct 2021 02:13:48 -0400
X-MC-Unique: bZGVeevXM0WsIVtxoQaeHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75B62802B52;
	Thu, 21 Oct 2021 06:13:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 419065DD68;
	Thu, 21 Oct 2021 06:13:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 804601819AC2;
	Thu, 21 Oct 2021 06:13:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19L6Dc1H019004 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 02:13:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 308D510070B8; Thu, 21 Oct 2021 06:13:38 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C8AA10073A5
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2021 06:13:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65C57801E6E
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2021 06:13:35 +0000 (UTC)
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-278-DIuea9L5OZG1hB8vWlxHkQ-1; Thu, 21 Oct 2021 02:13:33 -0400
X-MC-Unique: DIuea9L5OZG1hB8vWlxHkQ-1
Received: from [69.133.187.32] (helo=buadh-brath.com)
	by friday.buadh-brath.com with esmtp (Exim 4.89)
	(envelope-from <bdmc@mail.buadh-brath.com>) id 1mdRKW-00035F-A4
	for linux-lvm@redhat.com; Thu, 21 Oct 2021 06:13:32 +0000
Received: by buadh-brath.com (Postfix, from userid 1000)
	id 8C964201C0; Thu, 21 Oct 2021 02:13:12 -0400 (EDT)
Date: Thu, 21 Oct 2021 02:13:12 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20211021061312.GA15347@bdmcc-us.com>
References: <20211018021719.GA16936@bdmcc-us.com>
	<CAAMCDedrphwa+RRr1PHLD0SXi8fEDM87zV82302T=twRa5qBZA@mail.gmail.com>
	<20211018194508.GC28815@bdmcc-us.com>
	<CAAMCDeeTwESRvs5jPNuTXn-q7Fse1xqAc+yd-0swjc7NrAyqAw@mail.gmail.com>
	<20211020133828.GE9096@bdmcc-us.com>
	<CAAMCDec9HehohCFxCXDd7d+5DVW1DuJ4KVY7Vu1J0x+6ZxUW=w@mail.gmail.com>
	<CAAMCDedAPFz+EL3MBcOKebZXqB4pSxUCuvhW4DUfjiLX3tznMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAMCDedAPFz+EL3MBcOKebZXqB4pSxUCuvhW4DUfjiLX3tznMQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Subject: Re: [linux-lvm] Recovering "broken" disk ( 17th )
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 20, 2021 at 01:04:44PM -0500, Roger Heflin wrote:
> replying to my last email.

Thank you for your help, Roger.  I will answer with more detail when the
sun comes around to my side of the planet, but will say that this is a
"secondary" VG, so your suggestion of changing fstab is very attractive.


B

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

