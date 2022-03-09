Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D1AC433EF
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Mar 2022 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646843827;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Fx/NXeQZGMrNUelC8IOGibLI1ULBqUfuGcvG1976/Rk=;
	b=gXhlAF0o89xep7RW5w/oEUOahadR2h6qYDD5luxOduj37h/IyX7VLhVjcgycfjdGynE8H8
	wOCsnH0eSWObWwX0IwlOtz1M4qWfCIVAI12vDjEggcUvVsjIjksyVX5DplZyoWru/Zo0Je
	qEpC0yfaXzsobdqyNoQLQzmFK/gjk0Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-ef-qufXnN6uIivEOmEeEng-1; Wed, 09 Mar 2022 11:35:58 -0500
X-MC-Unique: ef-qufXnN6uIivEOmEeEng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52121899EC1;
	Wed,  9 Mar 2022 16:35:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31D4540CFD01;
	Wed,  9 Mar 2022 16:35:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AA4DC1953544;
	Wed,  9 Mar 2022 16:35:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6DB251953540
 for <linux-lvm@listman.corp.redhat.com>; Wed,  9 Mar 2022 16:27:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 197F5838C0; Wed,  9 Mar 2022 16:27:18 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20AF883799;
 Wed,  9 Mar 2022 16:27:13 +0000 (UTC)
Date: Wed, 9 Mar 2022 10:27:11 -0600
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20220309162711.GA5819@redhat.com>
References: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Peter Rajnoha <prajnoha@redhat.com>,
 LVM general discussion and development <linux-lvm@redhat.com>,
 Heming Zhao <heming.zhao@suse.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 09, 2022 at 04:29:27PM +0100, Martin Wilck wrote:
> Hi David, hi Peter,
> 
> we have recently updated LVM2 on openSUSE Factory, and are using the
> autoactivation feature now. We also use
> 'external_device_info_source="udev"' by default, because according to
> our experience it is the only way to make LVM device detection work
> reliably with multipath devices.
> 
> With these settings, we see lots of "Udev database has incomplete
> information about device ..." messages:
> 
> > [   12.377563] apollon systemd-udevd[810]: sda5: Processing device (SEQNUM=2787, ACTION=add)
> > [   12.412723] apollon systemd-udevd[810]: sda5: /usr/lib/udev/rules.d/69-dm-lvm.rules:82 Importing properties from results of '/usr/sbin/lvm pvscan --cache --listvg --checkcomplete --vgonline --autoactivation event --udevoutput --journal=output /dev/sda5'
> > [   12.412767] apollon systemd-udevd[810]: sda5: Starting '/usr/sbin/lvm pvscan --cache --listvg --checkcomplete --vgonline --autoactivation event --udevoutput --journal=output /dev/sda5'
> > [   12.413041] apollon systemd-udevd[810]: Successfully forked off '(spawn)' as PID 882.
> > [   12.419458] apollon lvm[882]: Udev database has incomplete information about device /dev/sda5.
> 
> This is no surprise, because 69-dm-lvm.rules contains
> 
> IMPORT{program}="/usr/sbin/lvm pvscan --cache --listvg --checkcomplete --vgonline --autoactivation event --udevoutput --journal=output $env{DEVNAME}"
> ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="/usr/bin/systemd-run --no-block --property DefaultDependencies=no --unit lvm-activate-$env{LVM_VG_NAME_COMPLETE} (LVM_EXEC)/lvm vgchange -aay --autoactivation event $env{LVM_VG_NAME_COMPLETE}"
> 
> These rules are executed by udev while it is processing an "add" event
> for a PV. At that time, the udev data base doesn't contain an entry for
> this PV yet, because the entry is added only after the uevent is fully
> processed.

Right, this pvscan needs to avoid getting info from udev, regardless of
what's set in lvm.conf.  We don't use udev for external_device_info_source
here so I missed that and will add a fix.

> Shouldn't "pvscan" be run in a RUN+= statement instead? Obviously if we
> do this, the lvm-activate-$VG unit must be started in some other way
> (e.g. by calling systemd-run directly from pvscan).

IMPORT is needed to import LVM_VG_NAME_COMPLETE from the pvscan output
into the udev rule so we know which VG to activate.

> In the cases we have observed so far, the VGs were assembled correctly
> despite these warnings. We aren't certain if this was by luck only. In
> any case, the messages irritate users.
> 
> Or are we getting this completely wrong, and the new autoactivation
> feature should not be used with external_device_info_source="udev" at
> all? 

right

> If that's the case, how is multipath component detection supposed
> to work?

There are multiple ways that it's avoided, some apply in different
situations:

- 69-dm-lvm.rules will often not even be called on a multipath component
  device because udev has already figured out it's a component (I'd need
  some reminding about exactly when/how this happens.)

- if 69-dm-lvm.rules is called on a multipath component, that device will
  not exist in the lvm devices file, so pvscan will ignore it.

- if 69-dm-lvm.rules is called on a multipath component, and there's no
  devices file, then filter-mpath checking sysfs holder info will
  often detect and ignore it.

- if all three of those don't catch it, then filter-mpath will also
  check if the component wwid is listed in /etc/multipath/wwids and
  ignore the device if it is.

If all four of those methods fail to exclude a multipath component, then
an LV could be activated using the component.  While this isn't good, it
can be corrected by running lvchange --refresh.  I'd like to get any
details of that happening to see if we can improve it.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

