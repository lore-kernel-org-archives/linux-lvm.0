Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964DCC433EF
	for <linux-lvm@archiver.kernel.org>; Thu,  5 May 2022 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651759707;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ylZbJX1wtSF08rHxIRW+A2/0Zvs2+Kb97+x+BxIxGQ0=;
	b=YXXGyucGvaulHBuHLSYXW7XNl40Sq+eUKzOPABxf5HtOePMdEJjf0SFbWbYTEA0AaA+a/N
	BppXNTqRf62/TR7SrZEDAJk8mTlOau/pZ4VsMEIMsQJnwQsvO33pZQ/k1VL5FKLQh7/YiR
	O7RcgbgwbymIqU6k/oDat9V04y2hsnw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-jsjA2DZzPlmZQ2qiWVOJXQ-1; Thu, 05 May 2022 10:08:23 -0400
X-MC-Unique: jsjA2DZzPlmZQ2qiWVOJXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62337299E74B;
	Thu,  5 May 2022 14:08:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC6484010A18;
	Thu,  5 May 2022 14:08:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 72CC61947047;
	Thu,  5 May 2022 14:08:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 95D731947046
 for <linux-lvm@listman.corp.redhat.com>; Thu,  5 May 2022 14:08:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3B1472167D60; Thu,  5 May 2022 14:08:01 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D76482166B18;
 Thu,  5 May 2022 14:07:54 +0000 (UTC)
Date: Thu, 5 May 2022 09:07:53 -0500
From: David Teigland <teigland@redhat.com>
To: Zhiyong Ye <yezhiyong@bytedance.com>
Message-ID: <20220505140753.GA30224@redhat.com>
References: <8d9bb1b4-9f79-d557-e3d9-2b8e5f53e751@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <8d9bb1b4-9f79-d557-e3d9-2b8e5f53e751@bytedance.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [linux-lvm] vgcreate doesn't work with lvmlockd running
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-lvm@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 05, 2022 at 02:08:36PM +0800, Zhiyong Ye wrote:
> root@n151-143-035:~# lvmlockd -V
> lvmlockd version: 2.03.02(2) (2018-12-18)
> root@n151-143-035:~# sanlock -V
> sanlock 3.6.0 (built Jul 11 2018 12:44:29)

> It is mentioned in the main page under "creating the first sanlock VG"
> that the first VG is created to get the global lock, so I create the VG
> directly:
> 
> root@n151-143-035:~# vgcreate --lock-type sanlock --shared test
> /dev/mapper/mpatha1 --verbose

This is correct.

>   Enabling sanlock global lock
>     Wiping signatures on new PV /dev/mapper/mpatha1.
>     Set up physical volume for "/dev/mapper/mpatha1" with 2147483648
> available sectors.
>     Zeroing start of device /dev/mapper/mpatha1.
>     Writing physical volume data to disk "/dev/mapper/mpatha1".
>   Physical volume "/dev/mapper/mpatha1" successfully created.
>     Adding physical volume '/dev/mapper/mpatha1' to volume group 'test'
>     Archiving volume group "test" metadata (seqno 0).
>     Creating logical volume lvmlock
>     Creating volume group backup "/etc/lvm/backup/test" (seqno 2).
>     Activating logical volume test/lvmlock.
>     activation/volume_list configuration setting not defined: Checking only
> host tags for test/lvmlock.
>     Creating test-lvmlock
>     Loading table for test-lvmlock (254:1).
>     Resuming test-lvmlock (254:1).
>   /dev/test/lvmlock: not found: device not cleared
>   Aborting. Failed to wipe start of new LV.

This looks like a bug, and it does look familiar.  I'd guess that section
of code is missing a call to synchronize with udev (sync_local_dev_names).
Unfortunately your version of lvm (and sanlock) are old enough that it's
hard to say immediately if it's fixed.  The best option would be trying
newer versions where it's most likely been fixed.

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

