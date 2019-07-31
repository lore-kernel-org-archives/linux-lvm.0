Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC5E45D9E1
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2019 09:39:25 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F207356E7
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2019 09:39:24 +0000 (UTC)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <julian.klode@canonical.com>) id 1hsl4t-0005pC-Bl
	for linux-lvm@redhat.com; Wed, 31 Jul 2019 09:39:23 +0000
Received: by mail-wr1-f69.google.com with SMTP id g2so33566022wrq.19
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2019 02:39:23 -0700 (PDT)
Date: Wed, 31 Jul 2019 11:39:20 +0200
From: Julian Andres Klode <julian.klode@canonical.com>
Message-ID: <20190731093920.pdu3zvxlo7i55gda@jak-t480s>
References: <20190725184901.24234-1-julian.klode@canonical.com>
	<e14a2033-893a-0e0a-4e32-0a62883a9d25@redhat.com>
	<20190730151223.jfxvd2qwaf5jdjsm@jak-t480s>
	<01707c6d-1fe3-f52e-47de-b8b13502fd0c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01707c6d-1fe3-f52e-47de-b8b13502fd0c@redhat.com>
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

On Wed, Jul 31, 2019 at 11:21:10AM +0200, Zdenek Kabelac wrote:
> Dne 30. 07. 19 v 17:12 Julian Andres Klode napsal(a):
> > On Tue, Jul 30, 2019 at 05:02:44PM +0200, Zdenek Kabelac wrote:
> > > Dne 25. 07. 19 v 20:49 Julian Andres Klode napsal(a):
> > > > systems might have systemd as their normal init systems, but
> > > > might not be using it in their initramfs; or like Debian, support
> > > > different init systems.
> > > > 
> > > > Detect whether we are running on systemd by checking for /run/systemd/system
> > > > and then change the behavior accordingly.
> > > > 
> > > 
> > > 
> > > Wouldn't it be better to simply disable compiling/using lvmetad on such systems ?
> > 
> > I don't see how this has anything to do with lvmetad. There is no lvmetad
> > anymore.
> 
> The whole point of 'service' for 'pvscan' is to postone activation of DM
> devices outside of udev rule processing.
> 
> So whatever is replacing systemd service in your's systemd-less system must
> provide similar functionality.
> 
> There is currently no way to accept autoactivation capability within
> udev-rule processing.

This has nothing to do with the part of the message you are replying too, and
is nonsense. The code to run pvscan directly is shipped, the change just moves
the decision whether to do that from compile-time to run-time.

> 
> > > HEAD of 2.03 already dropped lvmetad anyway.
> > > 
> > > Do you need any sort of autoactivation in ramdisk ?
> > 
> > Of course we need the PV to be scanned automatically so we can then find
> > the root partition. The root device finding is event-based, we have a tool
> > that listens to udev and waits for 30s for the device to appear, and relies
> > on the events being triggered correctly.
> 
> There is nothing for finding - if you pass root LV into your ramdisk the
> proper command to activate such LV  is   'lvchange -ay vgname/lvname'
> 
> Dracut uses pretty 'navive' algorithm to run such command with whenever any
> new device is found - it's added into lvm2 filters of visible device - once
> it succeeds - it can proceed....
> For the 'initramdisk' functionality this is IMHO good enough.
> (Although there are several very ugly hacks in this code we would like to drop...)

That's a nasty hack.

-- 
debian developer - deb.li/jak | jak-linux.org - free software dev
ubuntu core developer                              i speak de, en
