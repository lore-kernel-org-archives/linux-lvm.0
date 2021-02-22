Return-Path: <SRS0=nYqM=HY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23D6C433E0
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 09:57:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46AE264EBE
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 09:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46AE264EBE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613987877;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DvFdXtWHWvhqLVPUrCJYbS3WWSQZH2JzHdUM8Z0Bf2U=;
	b=FMxy7fP5Ft+EVwS+VEZJpd4AM1MU1N1OfqRl/ivXbtfp5Huzq07rA6otfX9oYzUXwAkq+L
	f+w8o4JuaHi5R7RZW+eCxVH3ItRfCXbgHALoYLf9gy38MqUMklx4NCKp7I0MUSk3OZqDnS
	qtx8Bh8OKmLP0Nk9yAcfBfF36fXY9G4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-8ceVeEK6Nz-lpALXIMbXVg-1; Mon, 22 Feb 2021 04:57:55 -0500
X-MC-Unique: 8ceVeEK6Nz-lpALXIMbXVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98C98CE646;
	Mon, 22 Feb 2021 09:57:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A86535D9CC;
	Mon, 22 Feb 2021 09:57:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB08A57DFC;
	Mon, 22 Feb 2021 09:57:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11M9vaoe003169 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 22 Feb 2021 04:57:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 66ECB60C13; Mon, 22 Feb 2021 09:57:36 +0000 (UTC)
Received: from [10.40.195.160] (unknown [10.40.195.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A8AA60C0F;
	Mon, 22 Feb 2021 09:57:28 +0000 (UTC)
To: Martin Wilck <mwilck@suse.com>,
	LVM general discussion and development <linux-lvm@redhat.com>,
	David Teigland <teigland@redhat.com>
References: <20210211111623.34968-1-list@eworm.de>
	<f18dff7a-050a-d41d-c643-4616522ba4a0@suse.com>
	<ae893a3606dd32b07cab16bd538c132af555c956.camel@suse.com>
	<20210217130329.7de41147@leda>
	<20210217133826.u4gglfsowqfvxdff@spock.localdomain>
	<ea269d6255c4cd48bb60771aa7e4204e4f70db8a.camel@suse.com>
	<20210219163722.GA13644@redhat.com>
	<22b3cc5b-24fb-a684-be90-1f767d5ac678@redhat.com>
	<f627b3e7a0d16f31ec68cb07b3454e977e8fe1d0.camel@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: Red Hat
Message-ID: <bcb2eb82-46b3-8e6b-c9b6-56442b4f63a3@redhat.com>
Date: Mon, 22 Feb 2021 10:57:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f627b3e7a0d16f31ec68cb07b3454e977e8fe1d0.camel@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"

Dne 21. 02. 21 v 21:23 Martin Wilck napsal(a):
> On Fri, 2021-02-19 at 23:47 +0100, Zdenek Kabelac wrote:
>>
>> Right time is when switch is finished and we have rootfs with /usr
>> available - should be ensured by=A0 lvm2-monitor.service and it
>> dependencies.
>=20
> While we're at it - I'm wondering why dmeventd is started so early. dm-
> event.service on recent installments has only "Requires=3Ddm-
> event.socket", so it'll be started almost immediately after switching
> root. In particular, it doesn't wait for any sort of device
> initialization or udev initialization.

Hi

Dmeventd alone does not depend on lvm2 in any way - it's the lvm2 plugin wh=
ich=20
then does all the 'scanning' for VGs/LVs and gets loaded when lvm2 connects=
 to=20
monitoring socket. That's also why dmeventd belongs to dm subsystem.

Dmeventd is nothing else then a process to check DM devices periodically - =
and=20
can be used by i.e. dmraid or others...

So as such it doesn't need any devices - but it needs to be initialized ear=
ly=20
so it can accept connections from tools like lvm2 and starts to monitor a=
=20
device without delaying command (as lvm2 wait for confirmation device is=20
monitored).

> I've gone through the various tasks that dmeventd is responsible for,
> and I couldn't see anything that'd be strictly necessary during early
> boot. I may be overlooking something of course. Couldn't the monitoring

As said - during ramdisk boot - monitor shall not be used (AFAIK - dracut i=
s=20
supposed to use disabled monitoring in it's modified copy of lvm.conf withi=
n=20
ramdisk)

But we want to switch to monitoring ASAP when we switch to rootfs - so the=
=20
'unmonitored' window is as small as possible - there are still same 'grey'=
=20
areas in the correct logic thought...

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

