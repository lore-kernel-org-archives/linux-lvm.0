Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l71F38Nu011700
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 11:03:09 -0400
Received: from isp.becroft.co.nz (isp.becroft.co.nz [202.89.33.33])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l71F32iU007163
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 11:03:03 -0400
From: Mario Becroft <mb@gem.win.co.nz>
In-Reply-To: <20070801140944.GA31489@sgi.com>
References: <1185737538.12064.44.camel@server.ak.quickcircuit.co.nz>
	<20070801121713.GY31489@sgi.com>
	<1185971009.13401.146.camel@server.ak.quickcircuit.co.nz>
	<20070801140944.GA31489@sgi.com>
Date: Thu, 02 Aug 2007 03:02:54 +1200
Message-Id: <1185980574.2694.35.camel@server.ak.quickcircuit.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Proper method of snapshotting XFS with external log
	using LVM2
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: David Chinner <dgc@sgi.com>
Cc: linux-xfs@oss.sgi.com, linux-lvm@redhat.com

On Thu, 2007-08-02 at 00:09 +1000, David Chinner wrote:
> [lvm snapshot] hangs on a lock that is held across the xfs_freeze -f ;
> xfs_freeze -u sequence.

Right.

> > I suppose
> > how to fix this is a question for the linux-lvm mailing list.
> 
> IIRC from the last time this came, they'll tell you not to use
> xfs_freeze.

Well, two problems with that:

1. There is no way to atomically create snapshots of two different
volumes (the main filesystem and the log) without using xfs_freeze.

2. I tried without xfs_freeze anyway just to see what would happen, and
actually in kernel 2.6.22.1 if you simply create a snapshot of the main
filesystem volume and destroy it several times in a row (not even
touching the log volume yet) lvcreate hangs.

So it sounds like there is a fundamental problem with the approach, plus
a bug somewhere... I will copy this to linux-lvm.

For the benefit of those reading on linux-lvm, the issue is that I am
trying to snapshot an XFS filesystem with an external log. To do this it
is necessary to snapshot two volumes--the main filesystem volume and the
log volume--while the filesystem is frozen. It is not sufficient to
freeze the filesystem separately for each snapshot creation since its
state might change between the two snapshots. The correct approach is to
use xfs_freeze to freeze the filesystem, then create both snapshots,
then unfreeze it. This used to work 100% reliably with kernel 2.6.16,
device-mapper 1.02.03 and LVM2 2.02.02. With device-mapper 1.02.21 and
LVM2 2.02.27, lvcreate hangs while creating a snapshot of a filesystem
that has been frozen with xfs_freeze. Furthermore, when using kernel
2.6.22.1 (and latest device-mapper and LVM2), even if I do not use
xfs_freeze, lvcreate hangs about 10% of the time when creating a
snapshot. Once in the hung state (whether because xfs_freeze was used or
because of the random hang) it seems impossible to get it unstuck
without rebooting the system.

I guess this is not an XFS-specific problem--it would happen with any
filesystem employing a separate log volume.

I am happy to test any patches that might address this issue... or maybe
even hack one up myself if someone gives me some pointers, but I guess
someone who knows something about LVM should really do it.

-- 
Mario Becroft <mb@gem.win.co.nz>
