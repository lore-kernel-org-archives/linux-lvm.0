Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101242108.f0OL87Q22724@webber.adilger.net>
Subject: Re: [linux-lvm] Debugging help.
In-Reply-To: <Pine.LNX.4.30.0101240945020.9779-100000@beefcake.hdqt.valinux.com>
 "from Jay Weber at Jan 24, 2001 09:58:23 am"
Date: Wed, 24 Jan 2001 14:08:07 -0700 (MST)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Jay Webber writes:
> Any suggestions on what to turn on debugging wise?  I'm currently
> utilizing SysRq and kdb v1.5 on stock 2.2.18 with LVM patches applied from
> 0.9.1beta2 using the PATCHES/README instructions.  All I manage to get
> after the system hangs, using SysRq's PrintPC or dropping into kdb
> (manually) and doing a backtrace, is reference to cpu_idle and
> init_task_union.  This leads me to believe the system is just sitting in
> an indefinate idle loop state?
> 
> I've also initially tried enabling the debug code in lvm-snap.c but it's
> not much help since the box hangs and the info that may be output from it
> is stuck in buffer and SysRq Sync don't manage to drop it to disk for me
> after hanging.
> 
> Any clues, suggestions, hints, pointers?

One option is to use a serial console (preferrably to another PC) to capture
the debugging info.  Unfortunately, like me, you are using a VAIO which
doesn't have a serial port.  I've also used a patch "kmsgdump" which
allows you to save the syslog to floppy.  However, I haven't used it at
the same time as kdb, so there may be conflicts.  Both appear on the
console after an OOPS, so I'm not sure what would happen.

> Nobody else sees this problem?  I'm currently reproducing this on my Vaio
> laptop using a loop device attached file as the simulated disk, but will
> use another box with real disks here shortly and double check. Granted,
> this problem surfaced on another box to start with. :)

So far I haven't been using snapshots.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
