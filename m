Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2B0860C5F
	for <linux-lvm@redhat.com>; Tue, 30 Jul 2019 15:12:29 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D08683086211
	for <linux-lvm@redhat.com>; Tue, 30 Jul 2019 15:12:28 +0000 (UTC)
Received: from mail-wm1-f70.google.com ([209.85.128.70])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <julian.klode@canonical.com>) id 1hsTnf-0000hO-BZ
	for linux-lvm@redhat.com; Tue, 30 Jul 2019 15:12:27 +0000
Received: by mail-wm1-f70.google.com with SMTP id u13so12281783wmm.2
	for <linux-lvm@redhat.com>; Tue, 30 Jul 2019 08:12:27 -0700 (PDT)
Date: Tue, 30 Jul 2019 17:12:23 +0200
From: Julian Andres Klode <julian.klode@canonical.com>
Message-ID: <20190730151223.jfxvd2qwaf5jdjsm@jak-t480s>
References: <20190725184901.24234-1-julian.klode@canonical.com>
	<e14a2033-893a-0e0a-4e32-0a62883a9d25@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e14a2033-893a-0e0a-4e32-0a62883a9d25@redhat.com>
Subject: Re: [linux-lvm] [PATCH] Detect systemd at run-time in
	69-dm-lvm-metad.rules
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jul 30, 2019 at 05:02:44PM +0200, Zdenek Kabelac wrote:
> Dne 25. 07. 19 v 20:49 Julian Andres Klode napsal(a):
> > systems might have systemd as their normal init systems, but
> > might not be using it in their initramfs; or like Debian, support
> > different init systems.
> > 
> > Detect whether we are running on systemd by checking for /run/systemd/system
> > and then change the behavior accordingly.
> > 
> 
> 
> Wouldn't it be better to simply disable compiling/using lvmetad on such systems ?

I don't see how this has anything to do with lvmetad. There is no lvmetad
anymore.

> HEAD of 2.03 already dropped lvmetad anyway.
> 
> Do you need any sort of autoactivation in ramdisk ?

Of course we need the PV to be scanned automatically so we can then find
the root partition. The root device finding is event-based, we have a tool
that listens to udev and waits for 30s for the device to appear, and relies
on the events being triggered correctly.

> There is probably higher complexity.
> 
> pvscan was not moved into systemd service just for fun - there have been at
> least 2 major mandatory points why  'pvscan' with autoactivation MUST NOT be
> executed from udev rule directly (udev timeout)
> 
> So the proposed patch must be NAC-ked as it is - as it probably causing way
> more troubles then it solves.

The alternative would be to disable the systemd integration entirely in
Debian and Ubuntu, as Debian requires support for non-systemd inits, and
Ubuntu requires event-based root device finding in initramfs. Surely that's
worse.

-- 
debian developer - deb.li/jak | jak-linux.org - free software dev
ubuntu core developer                              i speak de, en
