Return-Path: <SRS0=/SaV=HV=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AE9C433E0
	for <linux-lvm@archiver.kernel.org>; Fri, 19 Feb 2021 22:48:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C4564DF0
	for <linux-lvm@archiver.kernel.org>; Fri, 19 Feb 2021 22:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C4564DF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613774910;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mFMt8AOOMyVIoF4TOVzHOC7tJPwVhH28VY6vYu4CpPc=;
	b=azaxXwPCP/WXTK9hAtAcG6bfPm9LPnhJpIXYGuVh9cGyWzfWue7jLVITwOdktcKKtUVCXj
	F7OCVLIC6o1x+uwoKf9DV14uiu/wlPYbOLNne13w2XvxhM9ZHEfEEmnX8uhU+LbAG8XAmk
	9KQJu4lsyIipcja4PJGdXCVr/AVvRzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-Cyzkr8p8PaiVhANnXcUl2A-1; Fri, 19 Feb 2021 17:48:28 -0500
X-MC-Unique: Cyzkr8p8PaiVhANnXcUl2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B93FFC297;
	Fri, 19 Feb 2021 22:48:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 991F55D720;
	Fri, 19 Feb 2021 22:48:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5086F18095CB;
	Fri, 19 Feb 2021 22:48:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11JMm4dh026758 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 17:48:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5C4D619635; Fri, 19 Feb 2021 22:48:04 +0000 (UTC)
Received: from [10.40.195.58] (unknown [10.40.195.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D0F713470;
	Fri, 19 Feb 2021 22:47:54 +0000 (UTC)
To: LVM general discussion and development <linux-lvm@redhat.com>,
	David Teigland <teigland@redhat.com>, Martin Wilck <mwilck@suse.com>
References: <20210211111623.34968-1-list@eworm.de>
	<f18dff7a-050a-d41d-c643-4616522ba4a0@suse.com>
	<ae893a3606dd32b07cab16bd538c132af555c956.camel@suse.com>
	<20210217130329.7de41147@leda>
	<20210217133826.u4gglfsowqfvxdff@spock.localdomain>
	<ea269d6255c4cd48bb60771aa7e4204e4f70db8a.camel@suse.com>
	<20210219163722.GA13644@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: Red Hat
Message-ID: <22b3cc5b-24fb-a684-be90-1f767d5ac678@redhat.com>
Date: Fri, 19 Feb 2021 23:47:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219163722.GA13644@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-lvm@redhat.com
Cc: Oleksandr Natalenko <oleksandr@redhat.com>,
	linux-lvm@e1890.dsca.akamaiedge.net, Christian Hesse <list@eworm.de>,
	Heming Zhao <heming.zhao@suse.com>
Subject: Re: [linux-lvm] [PATCH 1/1] pvscan: wait for udevd
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"

Dne 19. 02. 21 v 17:37 David Teigland napsal(a):
> On Thu, Feb 18, 2021 at 04:19:01PM +0100, Martin Wilck wrote:
>>> Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 pvscan[643] VG sys run
>>> autoactivation.
>>> Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 /usr/bin/dmeventd: stat faile=
d:
>>> No such file or directory
>>
>> What's going on here? pvscan trying to start dmeventd ? Why ? There's a
>> dedicated service for starting dmeventd (lvm2-monitor.service). I can
>> see that running dmeventd makes sense as you have thin pools, but I'm
>> at a loss why it has to be started at that early stage during boot
>> already.
>>
>> This is a curious message, it looks as if pvscan was running from an
>> environment (initramfs??) where dmeventd wasn't available. The message
>> is repeated, and after that, pvscan appears to hang...
>=20
> I've found that when pvscan activates a VG, there's a bit of code that
> attempts to monitor any LVs that are already active in the VG.  Monitorin=
g
> means interacting with dmeventd.  I don't know why it's doing that, it
> seems strange, but the logic around monitoring in lvm seems ad hoc and in
> need of serious reworking.  In this case I'm guessing there's already an
> LV active in "sys", perhaps from direct activation in initrd, and when
> pvscan activates that VG it attempts to monitor the already active LV.

The existing design for lvm2 rootfs using was like:

Activate 'LV' within ramdisk by dracut - which discovers rootfs VG/LV
and activates it (by rather 'brute-force' naive approach).

Such activation is WITHOUT monitoring - as ramdisk is without 'dmeventd'
and we do not want to 'lock' the binary from ramdisk into memory.

So once the system switches to rootfs - 'vgchange --monitor y' enables=20
monitoring for all activated LVs from ramdisk and process continues.

Event based activation within ramdisk is a 3rd. party initiative by Arch li=
nux=20
and thus needs to be 'reinvented' with its own problems that arise from thi=
s.

So far - in lvm2 the current dracut method is more maintainable.

> Another missing piece in lvm monitoring is that we don't have a way to
> start lvm2-monitor/dmeventd at the right time (I'm not sure anyone even
> knows when the right time is), so we get random behavior depending on if
> it's running or not at a given point.  In this case, it looks like it
> happens to not be running yet.  I sometimes suggest disabling lvm2-monito=
r
> and starting it manually once the system is up, to avoid having it
> interfere during startup.

Right time is when switch is finished and we have rootfs with /usr
available - should be ensured by  lvm2-monitor.service and it dependencies.

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

