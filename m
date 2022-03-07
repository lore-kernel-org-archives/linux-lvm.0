Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363FCC4332F
	for <linux-lvm@archiver.kernel.org>; Mon,  7 Mar 2022 16:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646670302;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7kJjXopQNxrYEVSDFv9YiBsf2Md8Pi5HqTE3VpjDYi0=;
	b=gQ1MMwcbEVgUualVqbrKpysnlmHk2Yn82Bumhys4+MsWhZIVvG4LXjr2bg+UI+fBSzmOGY
	aWCY8JkEENDIx2SH3DuFQoT/PX4pczBrChSSzeTFZK+ljOBr6rAsfr2b5JXjhL4yIGa91C
	CTSSQaSzhQGkWsO6fv33TGeCXCcFFNE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-_LCEIkDgO3qa1MBO23LMGQ-1; Mon, 07 Mar 2022 11:24:09 -0500
X-MC-Unique: _LCEIkDgO3qa1MBO23LMGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1931380281C;
	Mon,  7 Mar 2022 16:24:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 142972166B44;
	Mon,  7 Mar 2022 16:24:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 40BAD19305AC;
	Mon,  7 Mar 2022 16:24:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 48C9019305AA
 for <linux-lvm@listman.corp.redhat.com>; Mon,  7 Mar 2022 16:23:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D89C986B92; Mon,  7 Mar 2022 16:23:58 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EE8186B9E;
 Mon,  7 Mar 2022 16:23:55 +0000 (UTC)
Date: Mon, 7 Mar 2022 10:23:53 -0600
From: David Teigland <teigland@redhat.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Message-ID: <20220307162353.GA15974@redhat.com>
References: <fec7624b-29de-0a04-0856-fa17800f3c30@invisiblethingslab.com>
MIME-Version: 1.0
In-Reply-To: <fec7624b-29de-0a04-0856-fa17800f3c30@invisiblethingslab.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: Re: [linux-lvm] LVM fast mode
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 07, 2022 at 09:55:08AM -0500, Demi Marie Obenour wrote:
> Would it be possible to have a fast, but less-safe mode for lvm2?
> Right now lvm2 always enumerates every single block device on
> the system, which is hugely wasteful when one knows exactly which
> block devices are the PVs that will be affected by the operation.

You can do this by listing the PVs you know are needed with the --devices
option (or using a filter on older versions.)

> know what they are doing, and that know that e.g. clustering is not
> in use.  Using this in conjunction with clustering is a bug in the
> application.  

lvm won't be doing any cluster-related activity unless you have enabled
lvmlockd and have created a shared vg.

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

