Return-Path: <SRS0=/fcx=LL=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EF5C2B9F4
	for <linux-lvm@archiver.kernel.org>; Thu, 17 Jun 2021 15:32:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3EB4613E2
	for <linux-lvm@archiver.kernel.org>; Thu, 17 Jun 2021 15:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3EB4613E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623943923;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UxDC/Swp5sFE7Lk4BDgfVdB4zlBiJxWhHdTvO/2P9jw=;
	b=UVScTR/Xv7qDfWDqS8MULmMz7JCyXGQE6ma/9TQPbKBUacXvYUW7FSPPfLOug9D1gDuwRx
	TRztsmzAERCBa+q0LblPvA/MXSRYpI/LwnqKlqopwSESLCLk2Np754hjHjbcMyX4xphlz0
	csrZu8fFNauwarqBuS0ObvEyRNVcicE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-2vOehiLVOrGwUQjv8gLrPQ-1; Thu, 17 Jun 2021 11:31:57 -0400
X-MC-Unique: 2vOehiLVOrGwUQjv8gLrPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D080180B731;
	Thu, 17 Jun 2021 15:31:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A929F9808;
	Thu, 17 Jun 2021 15:31:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C161F1809CAD;
	Thu, 17 Jun 2021 15:31:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15HFRn6T017875 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 17 Jun 2021 11:27:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59B585C224; Thu, 17 Jun 2021 15:27:49 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83A395C1D1;
	Thu, 17 Jun 2021 15:27:45 +0000 (UTC)
Date: Thu, 17 Jun 2021 10:27:43 -0500
From: David Teigland <teigland@redhat.com>
To: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <20210617152743.GA25086@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
	<20210608153937.GA21355@redhat.com>
	<20210615170354.GA357@redhat.com>
	<ce60635c-320a-be17-4c9e-a6c6b1afdeba@suse.com>
	<20210616163816.GA5811@redhat.com>
	<c5c40605-9859-4086-9717-7381b0309a2c@suse.com>
MIME-Version: 1.0
In-Reply-To: <c5c40605-9859-4086-9717-7381b0309a2c@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-lvm@redhat.com
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>, prajnoha@redhat.com,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Discussion: performance issue on event activation
 mode
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 17, 2021 at 11:46:55AM +0800, heming.zhao@suse.com wrote:
> the booting time out problem cause by two side:
> 1> libudev take much time
> 2> thousands of lvm2-pvscan@.service running on the same time
> 
> the new patch or existing code (with obtain_device_list_from_udev=0) can avoid <1>.
> but <2> is still not to avoid. (direct activation can avoid it)

Thanks, I'll set up a similar test, hopefully we can avoid such extreme
delays with the current activation mechanism.  I expect we'll also look at
combining a fixed lvm-activation service followed by uevent-driven
activations, which should be more efficient.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

