Return-Path: <SRS0=jKdR=JJ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CBAC433B4
	for <linux-lvm@archiver.kernel.org>; Mon, 12 Apr 2021 18:48:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 180D66128D
	for <linux-lvm@archiver.kernel.org>; Mon, 12 Apr 2021 18:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 180D66128D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618253300;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BJITUE7eybwCPqB3KNoK1ERuSSkRWWL2RCbs0/6422g=;
	b=EmO6rOclgYO+kdbrFuM29tOz9x1ZFGGrZ7Xw+GvFeCGcJid9g41btHroCRU42m9ShgZlDX
	GkpFyAPzaoqtq+rQkq/uKWShnnBm9a2DB4hFlNRZ3TmcstSEZdmI+ffuo0QO/Kp0RmMmL6
	/6yAOjxgvuEaWsqU/hH5Xbu7wQLpcVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-nh5uKLQ4NOavDZiEJ4VLtA-1; Mon, 12 Apr 2021 14:48:17 -0400
X-MC-Unique: nh5uKLQ4NOavDZiEJ4VLtA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F4A5107ACCD;
	Mon, 12 Apr 2021 18:48:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41B2F5DEAD;
	Mon, 12 Apr 2021 18:48:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E85761806D0E;
	Mon, 12 Apr 2021 18:47:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13CIllkF023041 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 14:47:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E686B50DE3; Mon, 12 Apr 2021 18:47:47 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE86B50DD4;
	Mon, 12 Apr 2021 18:47:43 +0000 (UTC)
Date: Mon, 12 Apr 2021 13:47:42 -0500
From: David Teigland <teigland@redhat.com>
To: =?iso-8859-1?Q?P=E9ter_S=E1rk=F6zi?= <xmisterhu@gmail.com>
Message-ID: <20210412184742.GH10314@redhat.com>
References: <CAP1D0fSHaWQ_PsAFYRn2WnboAgQCKOAg2jLbDoWKz0U7z8yoHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP1D0fSHaWQ_PsAFYRn2WnboAgQCKOAg2jLbDoWKz0U7z8yoHA@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-lvm@redhat.com
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Possible bug with concurrent RAID syncs on the same
 underlying devices
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 10, 2021 at 02:32:52AM +0200, P=E9ter S=E1rk=F6zi wrote:
> Although this is just due to the insane amount of integrity kworker
> processes, and the system is pretty usable, I think it would be much
> nicer to only have 1 sync running on the same physical device at a
> time.

Create one at a time, waiting for integrity init to finish between them
(sync_percent 100 on each integrity image you see in lvs -a.)
I have some doubt that the end result will perform well enough given the
way you're using the partitions.
Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

