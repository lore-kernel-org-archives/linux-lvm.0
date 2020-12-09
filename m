Return-Path: <SRS0=oYOT=FN=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68315C4361B
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 23:52:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0174923B51
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 23:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0174923B51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607557974;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AiRE/RTY7AxvPoaN6GCy6h2+qhIBSh3/hxrX9k5KLP8=;
	b=NZb+VDa4jZXy3+yhwi2SLhLyDZprqExGraYChvm/GUNhd4taCtusc7edhfU9K0mBlxiwIh
	9HSGRKXeADijjVsC2uVVz3BtfYpb+6VBocGbrNYob8VkGrHSDXdHFhS8qye2fHGs+vsaz8
	WcagYLK38i8PsJ9opPmhM33d07CHweE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-eR5bFRhAN-aaghF_SJW6rw-1; Wed, 09 Dec 2020 18:52:52 -0500
X-MC-Unique: eR5bFRhAN-aaghF_SJW6rw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F96F801817;
	Wed,  9 Dec 2020 23:52:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 727D019C78;
	Wed,  9 Dec 2020 23:52:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9189B180954D;
	Wed,  9 Dec 2020 23:52:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B9NqSnl019433 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 9 Dec 2020 18:52:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 91DFB60BF3; Wed,  9 Dec 2020 23:52:28 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C6AF60BF1;
	Wed,  9 Dec 2020 23:52:25 +0000 (UTC)
Date: Wed, 9 Dec 2020 17:52:23 -0600
From: David Teigland <teigland@redhat.com>
To: Dennis Schridde <devurandom@gmx.net>
Message-ID: <20201209235223.GA17623@redhat.com>
References: <4384449.LvFx2qVVIh@monk> <5900102.lOV4Wx5bFT@monk>
	<20201209193051.GC15208@redhat.com> <11903480.O9o76ZdvQC@monk>
	<20201209204525.GD15208@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209204525.GD15208@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-lvm@redhat.com
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] cache_check --clear-needs-check-flag does not clear
 needs_check flag?
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> I suspect the cache itself is fine and we're just missing a way to clear
> that flag in the cache metadata.  I'm looking for a workaround for that
> until we can sort out a complete fix.

The proper fix is here
https://sourceware.org/git/?p=lvm2.git;a=commit;h=9fe7aba251ff24c14277dfdf9be2d861a7699230

(A test for that using actual flagged metadata is still needed.)

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

