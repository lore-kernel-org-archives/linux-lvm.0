Return-Path: <SRS0=mJoT=IW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC540C433C1
	for <linux-lvm@archiver.kernel.org>; Wed, 24 Mar 2021 09:08:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4154C619A3
	for <linux-lvm@archiver.kernel.org>; Wed, 24 Mar 2021 09:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4154C619A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616576908;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7GVzmIZlxNMx3WWptO/56WHN2+KVIOlz5LWIbI+55Ck=;
	b=XeOnWcjHuZK/93VdqtmMFMWvde398tAN0V6tGChgE+776uM4Uux8GhbNZgW+A8wHV1QT1Z
	c5Cxl0EiEA0awX+PpQP0Oe1e7/GQkO9VOnwtc9gYp6eUnf4BTpcMmhhCLWng+6u+RDCe04
	WM07fOwXujAlqbnqr8CiB8mhNXjjHm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-IaZbdvyXPB-SmaE1PrwuqQ-1; Wed, 24 Mar 2021 05:08:25 -0400
X-MC-Unique: IaZbdvyXPB-SmaE1PrwuqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A114180FCA8;
	Wed, 24 Mar 2021 09:08:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38CC810023B2;
	Wed, 24 Mar 2021 09:08:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0EDF1809C83;
	Wed, 24 Mar 2021 09:07:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12O97h4S018377 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 24 Mar 2021 05:07:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E490010023B2; Wed, 24 Mar 2021 09:07:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDA211007606;
	Wed, 24 Mar 2021 09:07:40 +0000 (UTC)
Received: from zmail23.collab.prod.int.phx2.redhat.com
	(zmail23.collab.prod.int.phx2.redhat.com [10.5.83.28])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 547D64BB7B;
	Wed, 24 Mar 2021 09:07:40 +0000 (UTC)
Date: Wed, 24 Mar 2021 05:07:40 -0400 (EDT)
From: Zdenek Kabelac <zkabelac@redhat.com>
To: Zhao Heming <heming.zhao@suse.com>
Message-ID: <147078353.43143.1616576860174.JavaMail.zimbra@redhat.com>
In-Reply-To: <1616562549-25903-1-git-send-email-heming.zhao@suse.com>
References: <1616562549-25903-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.194.24, 10.4.195.2]
Thread-Topic: stable-2.02 - lvresize: deny operation on swap dev without force
	option
Thread-Index: Jlgyk/VozLtaEvS0ZZNdcOsnMFl4IA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-lvm@redhat.com
Cc: teigland@redhat.com, linux-lvm@redhat.com
Subject: Re: [linux-lvm] [PATCH] [PATCH] stable-2.02 - lvresize: deny
 operation on swap dev without force option
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



----- Original Message -----
From: "Zhao Heming" <heming.zhao@suse.com>
To: linux-lvm@redhat.com, zkabelac@redhat.com, teigland@redhat.com
Cc: "Zhao Heming" <heming.zhao@suse.com>
Sent: Wednesday, March 24, 2021 6:09:09 AM
Subject: [PATCH] [PATCH] stable-2.02 - lvresize: deny operation on swap dev without force option

When lvmetad is active on system and some memory pages of lvmetad
swapout, user may issue lvextend/lvresize on swap LV. The resize
operation will suspend & resume swap device (by reload dm table).
After suspended swap device, lvmetad will be in UN status for waiting
swapin pages from suspended swap dev. lvmetad will hung, then
lvresize will fail to conection to lvmetad. then the resize operation
will fail, lvresize leaves suspended swap, the logic dead lock is
happending.

 
Hi

It seems there is something wrong elsewhere.
There should be no contact to lvmetad while ANY devices are in suspend state.
Maybe something got reshuffled into wrong place.

Can you please provide  'lvextend -vvvvv'  when it hangs ?

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

