Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6UKe5a17565
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2004 16:40:05 -0400
Received: from li2-47.members.linode.com (li2-47.members.linode.com
	[69.56.173.47])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6UKe4e1006859
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2004 16:40:04 -0400
Received: from rnortman by li2-47.members.linode.com with local (Exim 3.35 #1
	(Debian)) id 1BqeAY-0001jT-00
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2004 20:39:58 +0000
Date: Fri, 30 Jul 2004 15:39:58 -0500
From: Randall Nortman <linux-lvm-list@wonderclown.com>
Message-ID: <20040730203958.GE4108@li2-47.members.linode.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 segfault w/devfs on amd64
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

The LVM2 tools (e.g., vgscan) segfault on an x86_64/amd64 system if
devfs is used, unless /dev/md* are filtered out.  Also, after the
first attempt has segfaulted, subsequent attempts will hang, consuming
100% of CPU until killed; this continues until the system is
rebooted.  I can reproduce this reliably on a Gentoo system.

I have tracked the segfault down to line 71 of lib/filters/filter.c,
which in my version of the source is:

[...]
  if (!(((int *) f->private)[MAJOR(dev->dev)])) {
[...]

It appears that the code assumes that all device major numbers will be
< 256, and does not check that this is true before indexing that
array, and so when the device major number is >=256, as it can be with
devfs and also, I believe, udev, there is a segmentation fault.  I'm
not sure what's causing subsequent invocations to hang; I didn't
bother to dig into that.

Even though devfs is officially deprecated, I believe this issue
should definitely be fixed, since it could happen also with udev.
Shall I file a bug, or is this a known issue?

I initially filed this as a bug against Gentoo, which can be viewed
at: http://bugs.gentoo.org/show_bug.cgi?id=58798


Thanks,

Randall Nortman
