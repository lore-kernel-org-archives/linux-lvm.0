Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C5BC433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 24 Mar 2022 19:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648148490;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XpQ9kKun8vTxcdajB5OSW/A1FY4D1G58oMjUYg9biJ0=;
	b=LWp2bVPQv7a+q+ZW4JnZxIcuLg4tzDMS4/MB0w6LZNBXqc3825aZhkdFSM4800HoAh0aS4
	nTYlNSFv0scFoR7sQznvBDA9rXBND2EZAF9tOQe9FDt8Wi2XTu2c4u3OKjN/0HpZPoLfo3
	2QcvDGIL3686gg/1c+CSxv74eB16txQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-qPcP4vH1NECQvidOnZYKbw-1; Thu, 24 Mar 2022 15:01:29 -0400
X-MC-Unique: qPcP4vH1NECQvidOnZYKbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0335495470B;
	Thu, 24 Mar 2022 19:01:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F6611454535;
	Thu, 24 Mar 2022 19:01:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D2B88194034E;
	Thu, 24 Mar 2022 19:01:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D13831940341
 for <linux-lvm@listman.corp.redhat.com>; Thu, 24 Mar 2022 19:01:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 561B01454535; Thu, 24 Mar 2022 19:01:17 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C611142B94D;
 Thu, 24 Mar 2022 19:01:17 +0000 (UTC)
Date: Thu, 24 Mar 2022 14:01:15 -0500
From: David Teigland <teigland@redhat.com>
To: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <20220324190115.GA22107@redhat.com>
References: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
 <97c2e9f9-0959-c5ed-230a-9d4089577410@suse.com>
 <20220321164431.GA23151@redhat.com>
 <a4df63ee-1381-de03-7490-bb1d51fa1e0e@suse.com>
 <89c9ea9d0a5e04071b5bfc00994332d6f9068438.camel@suse.com>
 <9bacb637-77ce-5870-2f3c-9618ccceff81@suse.com>
MIME-Version: 1.0
In-Reply-To: <9bacb637-77ce-5870-2f3c-9618ccceff81@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [linux-lvm] LVM autoactivation and udev
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
Cc: Peter Rajnoha <prajnoha@redhat.com>, Martin Wilck <mwilck@suse.com>,
 LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 24, 2022 at 04:26:33PM +0800, heming.zhao@suse.com wrote:
> Your concern is may right, "vgchange --monirtor y" will call lvmcache_label_scan() to search
> active VGs , meanwhile libudev hasn't done on some devs. And then vgchange will output
> some warning which can be ignored but may irritate users.
> 
> In theory, if "vgchange --monitor y" only handles the VGs which created during initrd phase
> can avoid this problem.

I'm adding this to the _vgchange_monitoring() function:
+ init_obtain_device_list_from_udev(0);
+ init_external_device_info_source(DEV_EXT_NONE);
so we won't need to add --config... to vgchange in lvm2-monitor.

This means that the vgchange monitor will not use udev, avoiding the
warnings and stalls caused when udev is slow and uninitialized.

Concerns about lvm commands using native detection, instead of udev info,
should be a thing of the past, assuming we're talking about the most
recent upstream code.  If you still see problems with that please let me
know.

It shouldn't matter when vgchange --monitor runs, or if it tries to
monitor all visible VGs.  It would be nice to do it more efficiently,
looking only at VGs that are unmonitored, or better looking only at VGs
for LVs that use monitoring (it's a wasteful step for many if not most
users.)  I don't see a good way of doing that at the moment.  It would
also be nice start the monitoring after most autoactivations are done, to
avoid any interference, but again I don't see a good way to do it right
now.

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

