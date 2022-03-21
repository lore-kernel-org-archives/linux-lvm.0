Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2D4C433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 21 Mar 2022 16:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647881105;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=13zWrfaMi82ogDEyXypIaGgSMXvAPikLIBJDMdi6iHw=;
	b=Zt9diL0bqeXReI1B1EYm+WBzvk7SZSfDF4TkZ6YnrfzU93IavOSFBIswkmuLZbWKFqfG4P
	knAx+3E0SdvU/RwflU0qkNwzw5nuPM3Q7VXuM5dTPuqZmfZZRz3PiIZ27VT8+B8Xh1gs17
	zABDKu8g+BIg9864dy1ydYaEh6ArTro=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-OVuFOmrtNSi9CumhgG0-cA-1; Mon, 21 Mar 2022 12:44:43 -0400
X-MC-Unique: OVuFOmrtNSi9CumhgG0-cA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F37C85A5BC;
	Mon, 21 Mar 2022 16:44:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 672FC403D186;
	Mon, 21 Mar 2022 16:44:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0CC521947BBC;
	Mon, 21 Mar 2022 16:44:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 43C7219451ED
 for <linux-lvm@listman.corp.redhat.com>; Mon, 21 Mar 2022 16:44:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 33319C23DC2; Mon, 21 Mar 2022 16:44:33 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA612C15D4F;
 Mon, 21 Mar 2022 16:44:32 +0000 (UTC)
Date: Mon, 21 Mar 2022 11:44:31 -0500
From: David Teigland <teigland@redhat.com>
To: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <20220321164431.GA23151@redhat.com>
References: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
 <97c2e9f9-0959-c5ed-230a-9d4089577410@suse.com>
MIME-Version: 1.0
In-Reply-To: <97c2e9f9-0959-c5ed-230a-9d4089577410@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 21, 2022 at 04:57:09PM +0800, heming.zhao@suse.com wrote:
> ```
> Mar 10 10:27:54 Mobile-PC systemd[1]: Stopped target Local File Systems.
> Mar 10 10:27:55 Mobile-PC systemd[1]: Reached target Local File Systems.
> Mar 10 10:27:55 Mobile-PC lvm[658]:   Udev database has incomplete information about device /dev/nvme0n1.
> Mar 10 10:27:55 Mobile-PC lvm[658]:   /dev/nvme0n1: Failed to get external handle [udev].
> Mar 10 10:27:55 Mobile-PC lvm[658]:   Udev database has incomplete information about device /dev/sda.
> Mar 10 10:27:55 Mobile-PC lvm[658]:   /dev/sda: Failed to get external handle [udev].
> ```

Since vgchange --monitor runs during startup, it should also override any
udev settings to disable them, like pvscan does:

  init_obtain_device_list_from_udev(0);
  init_external_device_info_source(DEV_EXT_NONE);

(Those are the default settings we use, so we don't see this.)


> In my understand, lvm2-monitor.service does the "clean up" job, which will complete the
> monitor job for thin/mirror/others LVs, which was created during initrd phase. (because
> lvm_scan doesn't have ability to start monitoring.)
> on current lvm2-monitor.service, the dependency asks this service start as early as possible:
> ```
> After=dm-event.socket dm-event.service
> ```
> It makes monitor service start too early, and triggers libudev not ready issue.
> 
> 
> To fix above issue, we find a workaround:
> ```
> - After=dm-event.socket dm-event.service
> + After=dm-event.socket dm-event.service sysinit.target
> ```

Yes, I think starting it later would be better.  I don't know enough about
these systemd targets to comment on how well that change would work.  I've
not given much attention to lvm2-monitor, but I've also wished it would
start later.

> And maybe there is another workaround (not verify):
> ```
> -ExecStart=@SBINDIR@/lvm vgchange --monitor y
> 
> +ExecStart=@SBINDIR@/lvm vgchange --config 'devices { external_device_info_source="none" \
> obtain_device_list_from_udev=0}' --monitor y
> ```

Let's patch vgchange monitor as mentioned above.

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

