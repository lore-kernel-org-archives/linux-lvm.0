Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1D1E60852
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2019 10:41:39 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23FA0308FEDF
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2019 10:41:38 +0000 (UTC)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <julian.klode@canonical.com>) id 1hsm36-0001WS-Nb
	for linux-lvm@redhat.com; Wed, 31 Jul 2019 10:41:36 +0000
Received: by mail-wr1-f69.google.com with SMTP id e8so33356594wrw.15
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2019 03:41:36 -0700 (PDT)
Date: Wed, 31 Jul 2019 12:41:34 +0200
From: Julian Andres Klode <julian.klode@canonical.com>
Message-ID: <20190731104134.7jsaxfaywjoutm7o@jak-t480s>
References: <20190725184901.24234-1-julian.klode@canonical.com>
	<e14a2033-893a-0e0a-4e32-0a62883a9d25@redhat.com>
	<20190730151223.jfxvd2qwaf5jdjsm@jak-t480s>
	<01707c6d-1fe3-f52e-47de-b8b13502fd0c@redhat.com>
	<20190731093920.pdu3zvxlo7i55gda@jak-t480s>
	<37de8264-a02e-a1b9-e297-c64ac35833fb@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37de8264-a02e-a1b9-e297-c64ac35833fb@redhat.com>
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

On Wed, Jul 31, 2019 at 12:22:38PM +0200, Zdenek Kabelac wrote:
> Dne 31. 07. 19 v 11:39 Julian Andres Klode napsal(a):
> > > > I don't see how this has anything to do with lvmetad. There is no lvmetad
> > > > anymore.
> > > 
> > > The whole point of 'service' for 'pvscan' is to postone activation of DM
> > > devices outside of udev rule processing.
> > > 
> > > So whatever is replacing systemd service in your's systemd-less system must
> > > provide similar functionality.
> > > 
> > > There is currently no way to accept autoactivation capability within
> > > udev-rule processing.
> > 
> > This has nothing to do with the part of the message you are replying too, and
> > is nonsense. The code to run pvscan directly is shipped, the change just moves
> > the decision whether to do that from compile-time to run-time.
> 
> As long as 'pvscan' is executed with 'auto-activation' option - it can't be
> run from udev rule.   Any proposal for this needs to first resolve,
> how to ensure udev will not try to kill running command in the middle of work.
> 
> Until this is resolved - proposal of this can't be accepted upstream.

Again: The code is already there. I'm just moving the decision what to pick from
compile-time to run-time. This is entirely orthogonal to whether the existing code
works well or not.

-- 
debian developer - deb.li/jak | jak-linux.org - free software dev
ubuntu core developer                              i speak de, en
