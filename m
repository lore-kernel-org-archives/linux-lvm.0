Return-Path: <SRS0=pm0O=PH=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDEFC433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 19 Oct 2021 06:04:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D93A60F25
	for <linux-lvm@archiver.kernel.org>; Tue, 19 Oct 2021 06:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D93A60F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buadh-brath.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-Xyq7g0pnMmuRoQ7GMZWNYA-1; Tue, 19 Oct 2021 02:04:13 -0400
X-MC-Unique: Xyq7g0pnMmuRoQ7GMZWNYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FD198042C3;
	Tue, 19 Oct 2021 06:04:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C50535F4EE;
	Tue, 19 Oct 2021 06:04:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 878ED1806D03;
	Tue, 19 Oct 2021 06:03:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IJjQ9t025552 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 15:45:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FB0C40D1B9E; Mon, 18 Oct 2021 19:45:26 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BEE940D1B9D
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 19:45:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17675802A67
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 19:45:26 +0000 (UTC)
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-591-sojziZYoM7O6iUa5EVR3og-1; Mon, 18 Oct 2021 15:45:24 -0400
X-MC-Unique: sojziZYoM7O6iUa5EVR3og-1
Received: from [69.133.187.32] (helo=buadh-brath.com)
	by friday.buadh-brath.com with esmtp (Exim 4.89)
	(envelope-from <bdmc@mail.buadh-brath.com>) id 1mcYZX-0004ww-KS
	for linux-lvm@redhat.com; Mon, 18 Oct 2021 19:45:23 +0000
Received: by buadh-brath.com (Postfix, from userid 1000)
	id 614AC201C0; Mon, 18 Oct 2021 15:45:08 -0400 (EDT)
Date: Mon, 18 Oct 2021 15:45:08 -0400
From: Brian McCullough <bdmc@buadh-brath.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20211018194508.GC28815@bdmcc-us.com>
References: <20211018021719.GA16936@bdmcc-us.com>
	<CAAMCDedrphwa+RRr1PHLD0SXi8fEDM87zV82302T=twRa5qBZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAMCDedrphwa+RRr1PHLD0SXi8fEDM87zV82302T=twRa5qBZA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 19 Oct 2021 02:03:39 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 18, 2021 at 09:49:44AM -0500, Roger Heflin wrote:
> You will need a lvm backup file for the pvcreate --uuid I believe (there
> may be some option to get around needing the backup file).
> 
> That will put the header back on if you either have an lvm backup and/or
> archive file, you might also need a vgcfgrestore afterwards depending on if
> anything else is missing.
> 
> I have never done it, but it looks possible to make a lvm backup file by
> reading it directly off the disk with dd, so that you will have a file that
> pvcreate is ok with, that is if there is no way to force it without a
> backup file.
> 
> But, this should get the pv back showing up with whatever sectors that you
> successfully recovered.

Thank you, Roger.

I might be able to do that on the original machine, which won't boot at
the moment because of this failure, but I have been using a working
machine so far to use ddrestore etc.

Yes, as you said, I was able to use dd to copy off the vgconfig data
into a file.  So you think that I might be able to use that as the
reference in pvcreate?  That makes some sense.

I started this out asking ( but not clearly ) whether the data on the
disk appeared to be in the correct place and whether what was there was
correct, but I think that I answered that for myself with the
comparison to the working PV partition.


Thanks again,
Brian

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

