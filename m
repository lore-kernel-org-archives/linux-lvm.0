Return-Path: <SRS0=qGvz=H4=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11138C433DB
	for <linux-lvm@archiver.kernel.org>; Fri, 26 Feb 2021 08:43:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7037B64E6C
	for <linux-lvm@archiver.kernel.org>; Fri, 26 Feb 2021 08:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7037B64E6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614328982;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dgiRFWaeC7yk0ZHGjTdkmWf/OVO0mmBJASZgmc+QUkQ=;
	b=Kc5obGQs0m5HZOWoc07RTtHybgLyn1PsNP7i9isA8hoTWT30lsjry3ce1fYEezPRYiyLF/
	0J6Angb9gRZebGSARUzri+s+LymoRl+XVVvbV1L/AAsYTL/pj8E/QCOgDLSuLhy71mRCVl
	9hC9n942l67vWh/a25+crYY2Ylss/IM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-j8dLWdpbMxOsMQi1xtvSwg-1; Fri, 26 Feb 2021 03:42:59 -0500
X-MC-Unique: j8dLWdpbMxOsMQi1xtvSwg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93AD418B62A3;
	Fri, 26 Feb 2021 08:42:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D84A1E16B;
	Fri, 26 Feb 2021 08:42:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FF8518095CB;
	Fri, 26 Feb 2021 08:42:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11PGpva5002087 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 25 Feb 2021 11:51:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 358F1200BFC5; Thu, 25 Feb 2021 16:51:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3036A2126C9E
	for <linux-lvm@redhat.com>; Thu, 25 Feb 2021 16:51:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD452100AFE2
	for <linux-lvm@redhat.com>; Thu, 25 Feb 2021 16:51:54 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-387-YXaECOBUOkuLUZY8r3cU_g-1; Thu, 25 Feb 2021 11:51:53 -0500
X-MC-Unique: YXaECOBUOkuLUZY8r3cU_g-1
Received: by mail-wr1-f72.google.com with SMTP id e13so3217123wrg.4
	for <linux-lvm@redhat.com>; Thu, 25 Feb 2021 08:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:user-agent:in-reply-to:references
	:mime-version:content-transfer-encoding:subject:reply-to:to:cc:from
	:message-id;
	bh=khs4umA35UWOdHlHLkEUpB3Lvwk4AuLuUs8ukWg9bIg=;
	b=BRnSGc6EObExFDFLmXEFDqtTktmYQg7SIw4BK80jUHejlixGovIZqHGWcWzpHOlh1u
	n4dbMC2JajRsHLQaoSkc2Yp3lwJ9RPdnzS9/JnCNg3vtNKVdHJj6t7bQm6PdyvI0tM79
	Ee+chASXWJ2HrRzhnrhyzdv/2x2MD/YCUkbuBFl/A+KPaAkfZeVI68u2nZqewrg7uxnP
	XcHZrPmv08wM1Di7w8mUXNlnIs5vYfBvLq0D50lYcDq9GeB8JC90vEBxceGK6oVXsLDN
	/rib33/tUAUOnlR8nWPt6G9iGY3Ss1W3bVCVjGjQXhWvUo0QiBgwFgGSomEsdalFSW00
	RaQw==
X-Gm-Message-State: AOAM532gAArKJpxKRfin3tlFx5TXpP9R6pjl+4uYpviL0U4cZfaxTip8
	NzbCDQs7uMimtOYxNYcRTFiEea1hXS9nKcjX4Xv0y5tOXdUbhcWeDOyw2dp++31IpfDV9dWP/4a
	9vIHE720mFRW+aYfG
X-Received: by 2002:a1c:e388:: with SMTP id a130mr4131506wmh.187.1614271911992;
	Thu, 25 Feb 2021 08:51:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8h+mXniBjXGptvGsFG3rQqF4no88vu1fro+jiQ2PfbhGB0a7y9OIRLIzf5W6X2LBZPAKh5Q==
X-Received: by 2002:a1c:e388:: with SMTP id a130mr4131487wmh.187.1614271911788;
	Thu, 25 Feb 2021 08:51:51 -0800 (PST)
Received: from [172.29.29.6] (kaktus.kanapka.ml. [151.237.229.131])
	by smtp.gmail.com with ESMTPSA id
	h2sm11018935wrq.81.2021.02.25.08.51.51
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 25 Feb 2021 08:51:51 -0800 (PST)
Date: Thu, 25 Feb 2021 17:51:49 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <20210222140417.4f890bec@leda>
References: <20210211111623.34968-1-list@eworm.de>
	<f18dff7a-050a-d41d-c643-4616522ba4a0@suse.com>
	<ae893a3606dd32b07cab16bd538c132af555c956.camel@suse.com>
	<20210217130329.7de41147@leda>
	<20210217133826.u4gglfsowqfvxdff@spock.localdomain>
	<ea269d6255c4cd48bb60771aa7e4204e4f70db8a.camel@suse.com>
	<20210219163722.GA13644@redhat.com>
	<22b3cc5b-24fb-a684-be90-1f767d5ac678@redhat.com>
	<f627b3e7a0d16f31ec68cb07b3454e977e8fe1d0.camel@suse.com>
	<bcb2eb82-46b3-8e6b-c9b6-56442b4f63a3@redhat.com>
	<20210222140417.4f890bec@leda>
MIME-Version: 1.0
To: Christian Hesse <list@eworm.de>, Zdenek Kabelac <zkabelac@redhat.com>
From: Oleksandr Natalenko <oleksandr@redhat.com>
Message-ID: <2CF04C3C-DC08-4F1F-969B-061F328B7093@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11PGpva5002087
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Fri, 26 Feb 2021 03:42:34 -0500
Cc: Oleksandr Natalenko <oleksandr@redhat.com>,
	linux-lvm@e1890.dsca.akamaiedge.net, David Teigland <teigland@redhat.com>,
	LVM general discussion and development <linux-lvm@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Heming Zhao <heming.zhao@suse.com>
Subject: Re: [linux-lvm] [PATCH 1/1] pvscan: wait for udevd
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: oleksandr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 22 February 2021 14:04:17 CET, Christian Hesse <list@eworm.de> wrote:
>Zdenek Kabelac <zkabelac@redhat.com> on Mon, 2021/02/22 10:57:
>> > I've gone through the various tasks that dmeventd is responsible
>for,
>> > and I couldn't see anything that'd be strictly necessary during
>early
>> > boot. I may be overlooking something of course. Couldn't the
>monitoring  
>> 
>> As said - during ramdisk boot - monitor shall not be used (AFAIK -
>dracut
>> is supposed to use disabled monitoring in it's modified copy of
>lvm.conf
>> within ramdisk)
>
>I could not find anything in dracut that modifies lvm.conf, but looks
>like
>dracut calls the lvm commands with `--ignoremonitoring`.
>
>To date this is not handled in lvm2's mkinitcpio hook... Wondering if
>that would help. Oleksandr, you could undo the udev workaround, then
>apply
>the following diff to /usr/lib/initcpio/install/lvm2, regenerate the
>initramfs and retry?
>
>--- lvm2_install	(revision 408582)
>+++ lvm2_install	(working copy)
>@@ -34,6 +34,7 @@
>     add_file "/usr/lib/udev/rules.d/95-dm-notify.rules"
>add_file "/usr/lib/initcpio/udev/11-dm-initramfs.rules"
>"/usr/lib/udev/rules.d/11-dm-initramfs.rules"
>     add_file "/etc/lvm/lvm.conf"
>+    sed -i '/^\smonitoring =/s/1/0/' "${BUILDROOT}/etc/lvm/lvm.conf"
> 
>     # this udev rule is specific for systemd and non-systemd systems
>     if command -v add_systemd_unit >/dev/null; then

Hi.

This changes nothing, sorry. The issue is still there.
-- 
  Best regards,
    Oleksandr Natalenko (post-factum)
    Principal Software Maintenance Engineer


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

