Return-Path: <SRS0=XKGo=OU=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F704C433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 16:05:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0DB1613A9
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 16:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0DB1613A9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633017955;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/Lxy8hrmt9xCeju/K8IQLkod8oFp4X3Q6Aqp2EOZCqc=;
	b=U2XbXmYPlvN9kJ9zLTYcxzJNMogJIt3SksTiAw1VGfjE7S+amnzbazC5VUeq7DOz34c0iF
	MdRag7XLYzhGs28lFOV8OVJ/9uznYuA9aDV6RhKOO5NILS1pjbLYvdkw1U4B7jgGAFHeQr
	FqNkbVYbNF68E8InNgM82nLV7gqTpEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-WDSYB9s9Pg-dduu5SNXqrA-1; Thu, 30 Sep 2021 12:05:52 -0400
X-MC-Unique: WDSYB9s9Pg-dduu5SNXqrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C91783DBC1;
	Thu, 30 Sep 2021 16:05:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F18061346F;
	Thu, 30 Sep 2021 16:05:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A16C4EA2A;
	Thu, 30 Sep 2021 16:05:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18UG5ddj016668 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 30 Sep 2021 12:05:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 717E85BAE5; Thu, 30 Sep 2021 16:05:39 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 231AB60877;
	Thu, 30 Sep 2021 16:05:00 +0000 (UTC)
Date: Thu, 30 Sep 2021 11:04:58 -0500
From: David Teigland <teigland@redhat.com>
To: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <20210930160458.GC32174@redhat.com>
References: <20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
	<20210928174246.GF3087@octiron.msp.redhat.com>
	<20210929220653.p45cvgzdhlbnp4gy@alatyr-rpi.brq.redhat.com>
	<e8459ca73b148e9ba20cbde0041f6e5f4093699d.camel@suse.com>
	<b379a1cb-25fe-24b7-cc4b-40800057ed7d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b379a1cb-25fe-24b7-cc4b-40800057ed7d@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-lvm@redhat.com
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 30, 2021 at 01:29:07PM +0200, Peter Rajnoha wrote:
> If we see this udev settle as the key point, then I think we should probably
> concentrate on enhancing systemd/udev to provide this functionality (and
> primarily the udevadm trigger functionality and waiting for related
> synthesized events). I think the infrastructure to accomplish this is
> already there. It just needs suitable user-space changes (the udevadm
> trigger).

I think it would be nice if the waiting/settling concept was generalized a
little more than we have now, to make it easier to improve or replace the
implementation, either as we find better mechanisms or as user needs vary.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

