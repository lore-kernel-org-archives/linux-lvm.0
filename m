Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101290653.f0T6r2h26300@webber.adilger.net>
Subject: Re: [linux-lvm] Help: lvm 0.9.1_beta3 oops (desperate plea)
In-Reply-To: <3A748FE9.BFFD7B9C@nortelnetworks.com> from Joe Harvell at "Jan
 28, 2001 03:32:25 pm"
Date: Sun, 28 Jan 2001 23:53:02 -0700 (MST)
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

Joe Harvell writes:
> I really, really, really need the data that is on this VG.
> 
> So if anyone at Sistina really wants to get to the bottom of this, you
> just got yourself a dedicated beta-tester.  I am an experienced software
> developper with a small amount of Linux device-driver experience.  I can
> provide hexdumps of the relevant portions of the actual partitions.
> I am willing to run any series of tests on this machine to help find
> the root cause of this problem.  Whatever it takes.

Not that I'm from Sistina, but one thing you could start out checking is
in lvm_read_all_pv_of_vg(), and print out the PV list at each step of the
way.  It may be possible that some of the PVs are being removed from the
list, even though they are not supposed to.  The first list, returned
from lvm_read_all_pv(), should be all of the PVs on your system.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
