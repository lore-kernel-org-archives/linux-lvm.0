Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102201830.f1KIUia13131@webber.adilger.net>
Subject: Re: [linux-lvm] Startup Script trouble in RH6.2
In-Reply-To: <3A9282FC.104A2BFF@lmco.com> from Jeffrey B Layton at "Feb 20, 2001
 09:45:16 am"
Date: Tue, 20 Feb 2001 11:30:43 -0700 (MST)
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Jeff Layton writes:
> I created the lvm script and the symlinks as indicated in the FAQ
> (a symlink from /etc/rc.d/rc3.d/S20lvm to /etc/rc.d/init.d/lvm).

The faq is wrong, IMHO.  The LVM startup should be done as early as
possible.  If it is in run level 3, this is "network server level",
so far to late if you have any local LVM filesystems.

> What I did to get around this was to modify rc.sysinit.  I'd rather
> not do this. Does anyone have any suggestions how to get around this?

No, this is the correct place.  Unfortunately, the current startup
doesn't let you split rc.sysinit any further.

> However, if the suggested alternative is to modify rc.sysinit,
> where in the script should I put the lvm startyp? Should it be
> after loading the modules, but before adding the RAID devices?

I put it after RAID startup, since it is possible to build LVM
devices on top of MD devices (modulo MD bugs in the code that keep
showing up).  It is also possible to build MD on top of LVM, but
this is much less commonly done.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
