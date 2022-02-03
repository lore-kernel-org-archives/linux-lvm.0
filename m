Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B004FC433F5
	for <linux-lvm@archiver.kernel.org>; Thu,  3 Feb 2022 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643901934;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IaxPiO8+/6VI+3EG8AbdqyrHW8sZlKUSl4guyaR9kAY=;
	b=iCXtniS7uSQmQo/bfEKPubnnMRPFhncqxsgjknjGbNLvNQG/EBNxmjKXr7jLKM0v1VPSz0
	fykHoVcuvk1gPUCVDnTYans+WiNbZLUIlDDYicizvGHqGeJfrM1r1an/eRuiDypbCIgKsY
	aQYIgHFG5KZBUYISNqyrtHTfZ5Kj92Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-7fCF-BWaO6Sb6A3MpstaAw-1; Thu, 03 Feb 2022 10:25:30 -0500
X-MC-Unique: 7fCF-BWaO6Sb6A3MpstaAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CBC551081;
	Thu,  3 Feb 2022 15:25:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21D4570D46;
	Thu,  3 Feb 2022 15:25:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F5761809CB8;
	Thu,  3 Feb 2022 15:25:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 213FP45V013935 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 3 Feb 2022 10:25:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2BE8D798C4; Thu,  3 Feb 2022 15:25:04 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E32B798CF;
	Thu,  3 Feb 2022 15:24:55 +0000 (UTC)
Date: Thu, 3 Feb 2022 09:24:53 -0600
From: David Teigland <teigland@redhat.com>
To: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <20220203152453.GA29864@redhat.com>
References: <6d7e7954-8123-76e1-b02a-61621c02148d.ref@yahoo.co.uk>
	<6d7e7954-8123-76e1-b02a-61621c02148d@yahoo.co.uk>
MIME-Version: 1.0
In-Reply-To: <6d7e7954-8123-76e1-b02a-61621c02148d@yahoo.co.uk>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] lvmdevices - impossible to remove/cleanup device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 10:20:41AM +0000, lejeczek wrote:
> Hi guys.
>=20
> What is the issue here?
>=20
> -> $ lvs
> =A0 Devices file sys_wwid eui.6479a73050830000 PVID none last seen on
> /dev/nvme1n1p4 not found.

That device was added to the lvm devices file at some point (see
/etc/lvm/devices/system.devices), but the device no longer exists.
If that device won't be reattached or if you don't want lvm to use it,
then it should be removed from system.devices.

> -> $ lvmdevices --deldev /dev/nvme1n1 ; echo $?
> =A0 Devices file sys_wwid eui.6479a73050830000 PVID none last seen on
> /dev/nvme1n1p4 not found.
> =A0 Device not found in devices file.

That's the right idea, but two issues,

1. lvmdevices --deldev is missing the ability to remove a missing device
   by name (or by wwid), and that will be fixed.
2. when that's fixed, you'd need to use the name /dev/nvme1n1p4

Until that's fixed, edit system.devices and remove that line.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

