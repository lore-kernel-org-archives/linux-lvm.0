Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4EFO7RV016852
	for <linux-lvm@redhat.com>; Mon, 14 May 2007 11:24:10 -0400
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4EFO6Y8008418
	for <linux-lvm@redhat.com>; Mon, 14 May 2007 11:24:06 -0400
Received: from a64.davidb.org ([66.93.32.226])
	by mail.davidb.org with esmtpa (Exim 4.62 #1 (Debian))
	id 1HncP8-0006rl-08
	for <linux-lvm@redhat.com>; Mon, 14 May 2007 08:24:06 -0700
Message-ID: <46487F15.4070108@davidb.org>
Date: Mon, 14 May 2007 08:24:05 -0700
From: David Brown <lvm@davidb.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM on SATA/PATA disks
References: <Pine.LNX.4.44.0705122130070.27083-100000@bmsred.bmsi.com>	<464672A6.3000408@davidb.org>
	<46481E32.4060808@redhat.com>
In-Reply-To: <46481E32.4060808@redhat.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Bryn M. Reeves wrote:
> David Brown wrote:
> > Of course, any of the re-ordering (SCSI TCQ, or SATA NCQ) requires
> > filesystem and driver support of write barriers for reliability.
> > Write barriers are not implement in DM, hence LVM, so there is a
>
> Only the dm-mpath and dm-snap targets treat barrier bios specially (they
> return EOPNOTSUPP). Other dm targets pass the barriers on to the
> underlying devices unchanged.

A simple lvm volume, mounted with XFS gives the following kernel
message:

 Filesystem "dm-11": Disabling barriers, not supported by the underlying
device
XFS mounting filesystem dm-11

so I'm fairly sure that the write barriers don't work.  This is the
2.6.20 kernel.  XFS is the only filesystem nice enough to warn you
that the result might not be as reliable.

Dave
