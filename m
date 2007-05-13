Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4D26c4B002161
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 22:06:40 -0400
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4D26UOt021902
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 22:06:33 -0400
Received: from a64.davidb.org ([66.93.32.226])
	by mail.davidb.org with esmtpa (Exim 4.62 #1 (Debian))
	id 1Hn3Ti-0004I0-Aw
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 19:06:30 -0700
Message-ID: <464672A6.3000408@davidb.org>
Date: Sat, 12 May 2007 19:06:30 -0700
From: David Brown <lvm@davidb.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM on SATA/PATA disks
References: <Pine.LNX.4.44.0705122130070.27083-100000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0705122130070.27083-100000@bmsred.bmsi.com>
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

Stuart D. Gathman wrote:

>> How does SATA fit in with all of this?  Is it basically the same
>> limitations on the bus as IDE/PATA, so that you'd really not want to put
>> more than 1 device per bus?
>
> SATA mandates at most 1 disk per channel, making the issue moot.  It is
> still true that there is only one active disk on a bus.  But then there
> is only one disk on a bus.

Newer SATA drives, with proper newer controllers and proper device
driver support will support NCQ (native command queueing), which
allows the drive to re-order requests.  It appears that the Linux ACHI
and Nvidia SATA drivers support this capability in recent kernels.

Of course, any of the re-ordering (SCSI TCQ, or SATA NCQ) requires
filesystem and driver support of write barriers for reliability.
Write barriers are not implement in DM, hence LVM, so there is a
reliability risk in going with this kind of solution.  Depending on
the filesystem this can result in power failures resulting in files
having inconsistent data.

Dave
