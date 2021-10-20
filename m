Return-Path: <SRS0=MfZM=PI=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FABC433EF
	for <linux-lvm@archiver.kernel.org>; Wed, 20 Oct 2021 15:27:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 816F86135F
	for <linux-lvm@archiver.kernel.org>; Wed, 20 Oct 2021 15:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 816F86135F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634743630;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5X9731iYZ4EWKKQ9rM3vNHpPqftXuwaI/KstyaS37hc=;
	b=Xvkc1FmFV0kBmm8jc+VFMdFjF/VTEQGxGLpmj7K1Bt0LoRMJ8+1fR3tLA6IRS/hFAHjGUu
	hZvF2A21/Xb3dkWd9HRe2yoHHpdazISq7yiyZ0q6rUuPYt+NqTtnnF4N6b8bTha4upMrVn
	R3RWGsGNdsb9Fciyk9/F5q4X1xetIqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-cFxbf2CMP--wSjciZbPYTw-1; Wed, 20 Oct 2021 11:27:07 -0400
X-MC-Unique: cFxbf2CMP--wSjciZbPYTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE2948066F5;
	Wed, 20 Oct 2021 15:27:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9926B5BB0D;
	Wed, 20 Oct 2021 15:26:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CC6D4ED2B;
	Wed, 20 Oct 2021 15:26:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KEosix032407 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 10:50:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D5E919D9F; Wed, 20 Oct 2021 14:50:54 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7920A19D9B;
	Wed, 20 Oct 2021 14:50:48 +0000 (UTC)
Date: Wed, 20 Oct 2021 09:50:46 -0500
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20211020145046.GA22742@redhat.com>
References: <20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
	<20210930155542.GB32174@redhat.com>
	<418b2bd497a3a4cd76840b3cceb1955ba7e9ba01.camel@suse.com>
	<20211018150418.GA3917@redhat.com>
	<ec784347cc8cf3530533701fd85c0e7825fd8a93.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <ec784347cc8cf3530533701fd85c0e7825fd8a93.camel@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-lvm@redhat.com
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 20, 2021 at 02:40:25PM +0000, Martin Wilck wrote:
> > I began trying to use RUN several months ago and I think I gave up
> > trying to find a way to pass values from the RUN program back into the
> > udev rule (possibly by writing values to a temp file and then doing
> > IMPORT{file}).=A0
>=20
> That can't work, because RUN is executed *after* all rules have been
> processed. That's documented in the man page. I don't quite understand
> what you're trying to achieve.

I was just providing some background history after you and Peter both
mentioned the idea of using RUN instead of IMPORT.  That is, I gave up
trying to use RUN many months ago because it wouldn't work, while IMPORT
actually does what we need, to produce the vgname variable inside the
rule.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

