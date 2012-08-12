Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7CFV7Uq028225
	for <linux-lvm@redhat.com>; Sun, 12 Aug 2012 11:31:07 -0400
Received: from mx1.internecto.net (polaris.internecto.net [176.9.245.29])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7CFV4gX027252
	for <linux-lvm@redhat.com>; Sun, 12 Aug 2012 11:31:05 -0400
Date: Sun, 12 Aug 2012 17:31:01 +0200
From: Mark van Dijk <lists+linux-lvm@internecto.net>
Message-ID: <20120812173101.12e69553@internecto.net>
In-Reply-To: <mailman.3621.1344778916.2882.linux-lvm@redhat.com>
References: <mailman.3621.1344778916.2882.linux-lvm@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Getting 'incorrect semaphore state' on self
 configured server kernel
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
To: linux-lvm@redhat.com
Cc: Scott Merrilees <scott@merrilees.net>

> >>> # lvcreate -L100M -n foobar -v array 
> >>> /dev/array/foobar: not found: device not cleared
> >>> Aborting. Failed to wipe start of new LV.
> >>> semid 983040: semop failed for cookie 0xd4d19ee: incorrect
> >>> semaphore state Failed to set a proper state for notification
> >>> semaphore identified by cookie value 223156718 (0xd4d19ee) to
> >>> initialize waiting for incoming notifications.
> >> 
> >> I appreciate all help I can get.
> >> 
> >
> > I still haven't solved this.. who is willing to lend me a hand
> > please?
>
> A diff -u of a working kernel config vs a non-working config would
> possibly help.
> --
> Scott Merrilees

(I'm replying to a digest so sorry if the formatting is a bit off. I
disabled digests for now.)

Scott, thanks for your suggestion. I followed it, changed more settings
just for testing, and still can't get it to work without these errors.

So I tried to build a kernel, same version and same config on a
different distribution, this time I chose AlpineLinux. And lo, the
errors are not occurring there.

This makes me suspicious about Archlinux's udev version and/or methods,
but the question about why their own kernel doesn't have these issues
remains.

What to try next? Where to look?

-- 
Stay in touch,
Mark van Dijk.                  ,------------------------------------
-------------------------------'            Sun Aug 12 15:21 UTC 2012
Today is Prickle-Prickle, the 5th day of Bureaucracy in the YOLD 3178
Celebrate Zaraday
