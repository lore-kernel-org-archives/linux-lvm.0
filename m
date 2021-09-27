Return-Path: <SRS0=Y+sl=OR=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A91C433FE
	for <linux-lvm@archiver.kernel.org>; Mon, 27 Sep 2021 10:01:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E93660F6C
	for <linux-lvm@archiver.kernel.org>; Mon, 27 Sep 2021 10:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E93660F6C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632736877;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k7D9em7tUVd3f+bMeno7TMgg44SW8sQWbxL4RK72Wcc=;
	b=MmzNRkU79xDoSDiEHONQfJzy88UWlSNKYnz9wWNk9tz3gGgAUzeR7KhMfi9fyedJMQA53b
	y35WhJmD0gNgB4NHGgVSg+8OaKVqDPIPxSw7KYJbCb4Y8x7Ie1feiKk+RF9y8HLN77furZ
	Jb/CqLPjVEBn1CODZzklRycNTeQqzh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-auSgJcA1MsuLw192-38EQA-1; Mon, 27 Sep 2021 06:01:15 -0400
X-MC-Unique: auSgJcA1MsuLw192-38EQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58D431006AA2;
	Mon, 27 Sep 2021 10:01:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F8B81972D;
	Mon, 27 Sep 2021 10:01:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0263C4EA2A;
	Mon, 27 Sep 2021 10:00:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18RA0mri029360 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 27 Sep 2021 06:00:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35E0C63F48; Mon, 27 Sep 2021 10:00:48 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F01A63F29
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2021 10:00:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8400800B24
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2021 10:00:41 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
	[209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-84-JIgVt1ArP26gZfe5BRah3g-1; Mon, 27 Sep 2021 06:00:38 -0400
X-MC-Unique: JIgVt1ArP26gZfe5BRah3g-1
Received: by mail-ed1-f71.google.com with SMTP id
	1-20020a508741000000b003da559ba1eeso7036885edv.13
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2021 03:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=/EVlUGpDsx9uVPOV1KJX1c6jLSF5qcx/kzwDDKTW8ao=;
	b=LqOwcC8R28YB3T3XKwMEoHUBnGpZjPmlPJL4xvYdfhZttPbkOnM/Dm/23hpaD3UqBE
	ZyYqgdgWvkta0D2STG+WRLQQ2mRaKukFOO9WyWJGl6sNxI0QDlRziMpR3DK723gYNuCf
	pwu1506RCQNqsPOOBZ5rxGuWugcTgK5xJnrVxGMTV3/PRySxTfjPEN0G14UWVYcLA15h
	PGCo9a795NylbdgwZEYYVwc4ad0TXT+fwyfQFzdTqBDRA3+IjCijZ0uxpmoV9C46aNNO
	THbgsqhTd7kBchrYjzPncCxonkrei/CRkP+x8UAyQHYj/qWdwlykNZ/n6FNtZftoMCAc
	4fRw==
X-Gm-Message-State: AOAM533puUP83qbXt1bOJOZIRxBt7OzfstG7X6SeXB9uijAsG8VezAAX
	nvknSoIvRq5ijdW+/+AP21Ap46ruA2iab4m9dkzAyACBTiyYTs1aopzhNPgbfF9+TeQJzq/4tQf
	pk31Ave3aLDAWLdii
X-Received: by 2002:a17:906:1757:: with SMTP id
	d23mr10281887eje.102.1632736837114; 
	Mon, 27 Sep 2021 03:00:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiyh/q7xJrOYuOTvB99ItsFP0dQxg0Z05RCVMx7YqruWvXK0n2ajCm+C7PN9oJ+lL73nvu4Q==
X-Received: by 2002:a17:906:1757:: with SMTP id
	d23mr10281866eje.102.1632736836857; 
	Mon, 27 Sep 2021 03:00:36 -0700 (PDT)
Received: from alatyr-rpi.brq.redhat.com (nat-pool-brq-t.redhat.com.
	[213.175.37.10])
	by smtp.gmail.com with ESMTPSA id h26sm4005340edz.1.2021.09.27.03.00.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Sep 2021 03:00:36 -0700 (PDT)
Date: Mon, 27 Sep 2021 12:00:32 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
To: David Teigland <teigland@redhat.com>
Message-ID: <20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210909194417.GC19437@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Cc: zkabelac@redhat.com, bmarzins@redhat.com, martin.wilck@suse.com,
	heming.zhao@suse.com, linux-lvm@redhat.com
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

Hi!

the patches and logic looks promising, there's just one thing I'm
worried about...

On Thu 09 Sep 2021 14:44, David Teigland wrote:
> I've implemented a solution like this and would like any thoughts,
> improvements, or testing to verify it can help:
> https://sourceware.org/git/?p=lvm2.git;a=shortlog;h=refs/heads/dev-dct-activation-switch-1
> 
> I've taken some direction from the lvm activation generator, but there are
> details of that I'm not too familiar with, so I may be missing something
> (in particular it has three activation points but I'm showing two below.)
> This new method would probably let us drop the activation-generator, since
> we could easily configure an equivalent using this new method.
> 
> Here's how it works:
> 
> uevents for PVs run pvscan with the new option --eventactivation check.
> This makes pvscan check if the /run/lvm/event-activation-on file exists.
> If not, pvscan does nothing.
> 
> lvm-activate-vgs-main.service
> . always runs (not generated)
...
> lvm-activate-vgs-last.service
> . always runs (not generated)
...
> - We could use the new lvm-activate-* services to replace the activation
> generator when lvm.conf event_activation=0.  This would be done by simply
> not creating the event-activation-on file when event_activation=0.

...the issue I see here is around the systemd-udev-settle:

  - the setup where lvm-activate-vgs*.service are always there (not
    generated only on event_activation=0 as it was before with the
    original lvm2-activation-*.service) practically means we always
    make a dependency on systemd-udev-settle.service, which we shouldn't
    do in case we have event_activation=1.

  - If we want to make sure that we run our "non-event-based activation"
    after systemd-udev-settle.service, we also need to use
    "After=systemd-udev-settle.service" (the "Wants" will only make the
    udev settle service executed, but it doesn't order it with respect
    to our activation services, so it can happen in parallel - we want
    it to happen after the udev settle).

Now the question is whether we really need the systemd-udev-settle at
all, even for that non-event-based lvm activation. The udev-settle is
just to make sure that all the udev processing and udev db content is
complete for all triggered devices. But if we're not reading udev db and
we're OK that those devices might be open in parallel to lvm activation
period (e.g. because there's blkid scan done on disks/PVs), we should be
OK even without that settle. However, we're reading some info from udev db,
right? (like the multipath component state etc.)

-- 
Peter

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

