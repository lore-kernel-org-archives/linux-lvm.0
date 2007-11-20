Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAKBDd2S016313
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 06:13:39 -0500
Received: from mailrelay02.solcon.nl (mailrelay02.solcon.nl [212.45.32.108])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAKBD8bf002191
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 06:13:08 -0500
Received: from [62.163.86.220] (helo=[192.168.0.122])
	by mailrelay02.solcon.nl with esmtp (Exim 4.60)
	(envelope-from <svh@dds.nl>) id 1IuR2L-0000Bq-8V
	for linux-lvm@redhat.com; Tue, 20 Nov 2007 12:13:01 +0100
From: "S. J. van Harmelen" <svh@dds.nl>
Date: Tue, 20 Nov 2007 12:13:03 +0100
Message-Id: <1195557183.6329.54.camel@sanderbal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM snapshots in a iSCSI and XenSource environment
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
To: linux-lvm@redhat.com

Hi list,

In advance my excusses for this radar long post (although it's easy
readable ;), but I want to make sure that I understand it correctly so I
don't end up making a very costly mistake.

I have a storage server (Debian Etch) with mutlipath-tools running and
on top of that I use IET iscsi-target software to export the multipathed
device to a XenSource server.

XenSource creates a PV on the entire exported disk, and then creates a
few LV's when I create some virtual machines.

Now I would like to take snapshots of these virtual machines as a
backup. So I want to take a snapshot every day, but hold them for only
one day. These are quite static machines, so I need want several
snapshots per machine. Just one in case something happens or a bad
adjustment is made.

I asume that when I drop the snapshot just before creating the new one,
all changes are merged back to the original volume. Correct? While this
merging is happening, does the disk then becomes unavailable to the
virtual machine, or doesn't the virtual machine doesn't notice the
merge?

Also I was wondering if it's a smart idea to create a PV and a LV (both
spanning the whole disk) on the storage server, and then exporting the
LV true iSCSI to the XenSource server. In that way I can take the
snapshots on to storage server directly.

Questions that I think of then are if it's not a problem that XenSource
then creates a new PV and some LV's in je LV I created adn exported on
the storage server. Is that a problem, or should this work fine?

And another question is how I can then restore a single LV Xen created,
from the snapshot of the LV that spans the whole disk on the storage
server? In that case I can not just revert to the old disk before taking
the snapshot, because then all the LV's created by Xen will be set back
to that point, and not just the LV that went bad.

Last question... Without creating a PV and a LV on the storage server
and just letting XenSource create what it needs to provision the virtual
machines, I can still see the PV and the LV's Xen created on the storage
server. Could I take the snapshots from there, although the PV and LV's
where not created here?

Hope someone can tell me what the best option is, and if all this is
possible?

Thanks!!

Sander
