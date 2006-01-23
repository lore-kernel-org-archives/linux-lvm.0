Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0NM2M114088
	for <linux-lvm@redhat.com>; Mon, 23 Jan 2006 17:02:22 -0500
Received: from out-of-band.media.mit.edu (out-of-band.media.mit.edu
	[18.85.16.22])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0NM2G2v002459
	for <linux-lvm@redhat.com>; Mon, 23 Jan 2006 17:02:16 -0500
Message-Id: <200601232202.RAA22420@out-of-band.media.mit.edu>
From: f-lvm@media.mit.edu
Subject: [linux-lvm] pvcreate can't use entire disk?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Date: Mon, 23 Jan 2006 22:02:23 -0000
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: f-lvm@media.mit.edu

[Please keep me CC'ed.  Tnx.]

I've been using LVM2 under Ubuntu Breezy for several months now; the
original partitioning & volume groups were created by its installer.
I've just decided to add a second disk, and I'm having problems with
what should have been the simplest step, namely pvcreate.

My new disk is /dev/hdd.  But doing "pvcreate /dev/hdd" complains
"Device /dev/hdd not found."  The disk is surely online:  I can
do, e.g., "strings /dev/hdd | head -1" and get "LILO" because this
disk was originally a random non-LVM'ed disk from another machine.
I would have -expected- pvcreate to complain about a partition table
existing (at which point I would have zeroed it and tried again), but
not to complain that the entire disk doesn't exist.

What's the problem here?  I'd rather not have to repartition the
(several) partions on the device into one, and then use just that
single partition, when I logically wanted the entire disk to just be
part of my VG.  (Though if that's the only way to get pvcreate to
behave, I can do so.)  But the howto at tldp.org very clearly states
that this should just work (it uses /dev/hdb as its example; but that
shouldn't matter :), and the manpage for pvcreate both talks about
whole disks, and includes whole disks in its example at the end.

What's the problem here?  What should I do?  Thanks!

P.S.  pvcreate --version claims LVM version 2.01.04 (2005-02-09),
library version 1.01.03 (2005-06-13), and driver version 4.4.0.
