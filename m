Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m543NTfM015084
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 23:23:29 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m543NIsS020195
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 23:23:18 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m543NDdJ005115
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 23:23:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m543NDuE015470
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 23:23:13 -0400
Date: Tue, 3 Jun 2008 23:23:13 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of snapshot
	merging
In-Reply-To: <1212548240.29076.215.camel@pc.ilinx>
Message-ID: <Pine.LNX.4.44.0806032300370.15237-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 3 Jun 2008, Brian J. Murrell wrote:

> directly).  How can the snapshot "immediately" become the primary volume
> if that data migration has to happen?

Just point the origin dm device to the snapshot.  Read/write will take
place to the snapshot as normal.  Meanwhile, in the background, blocks
copied from the origin, and blocks written to the snapshot, are copied
back to the origin (leaving out the details of updating other snapshots
for expositional simplicity).  The origin is inaccessible, having been pointed
at the snapshot.  When the origin is in sync, point it back, and it begins
evolving independently of the snapshot.

The origin should be closed (file systems unmounted) for the initial "point
origin to snapshot".  Any file system would be very confused to see 
the disk suddenly revert to a previous state (or even a modified previous
state in case of a read/write snapshot).

A slightly simpler way to do it would be to simply make the origin
inaccessible.  The admin would unmount origin, mount r/w snapshot,
start merge, when merge is finished, umount snapshot, remount origin.  
The purpose of redirecting the origin during the merge is to render
the 2nd unmount-mount unneccessary.

In case of a xen VM, you would destroy VM (don't bother with shutdown) or
otherwise quickly stop VM (maybe want to cleanly shutdown network connections).
Start merge on all LVs mounted by VM.  Boot VM.  If you kept a save of
the VM state with every set of snapshots, you could simply restore the VM
to the saved state after starting the merge.  The effect is that in seconds
the VM is reverted to a previous state.

Naturally, there are other pieces to make this useful.  For instance,
telling applications in the VM to get into a nice state (e.g. between
transactions) before pausing the VM to take the snapshots is helpful.  A
standard databus event of "get ready for snapshot" would be nice.  And then
there is enabling other machines on the network to get a handle on the revert.
You also need something like Zumastor so you can take lots of snapshots,
like every 15 minutes, for lots of choices for where to revert.
And then, you need differential mirroring of the snapshots (supported
by Zumastor) + VM state to a remote datacenter, so the "revert" can take place
on the remote site in case the primary site is nuked.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
