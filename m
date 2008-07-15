Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6FKafND017859
	for <linux-lvm@redhat.com>; Tue, 15 Jul 2008 16:36:41 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6FKaUNI019314
	for <linux-lvm@redhat.com>; Tue, 15 Jul 2008 16:36:31 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m6FKaPU6017302
	for <linux-lvm@redhat.com>; Tue, 15 Jul 2008 16:36:25 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m6FKaPKQ028455
	for <linux-lvm@redhat.com>; Tue, 15 Jul 2008 16:36:25 -0400
Date: Tue, 15 Jul 2008 16:36:25 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] UPS shutdown on system with lvm volume for root
In-Reply-To: <E1KIplT-0007TT-Py@mendel.bio.caltech.edu>
Message-ID: <Pine.LNX.4.44.0807151627280.28299-100000@bmsred.bmsi.com>
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

On Tue, 15 Jul 2008, David Mathog wrote:

> Is a similar command necessary for lvm? Or will the lvm volume have been
> remounted readonly "automagically" by this section of the halt script,
> which precedes the above changes by a couple of lines?
> 
> # Remount read only anything that's left mounted.
> # echo $"Remounting remaining filesystems readonly"
> mount | awk '{ print $3 }' | while read line; do
> fstab-decode mount -n -o ro,remount $line
> done

The above makes all mounted filesystems readonly, including those on logical
volumes.  There is no "mounting" for LVM itself.  Under normal operations, the
metadata does not change.  If the system is in the middle of a pvmove - well -
making the metadata suddenly readonly won't exactly help matters.  Ideally, LVM
should update metadata in a manner that leaves it consistent should the system
crash in the middle.  The current LVM strives toward that goal.  But there
shouldn't be any LVM updating going on during a shutdown.  There is no
LVM metadata updated in normal operations.

Snapshots will update the COW table.  Mounting the filesystems read-only 
should freeze that.  And again, COW updates are designed to be interruptable.

> It is important that the logical volume is shut down nicely on a power
> failure event, since it takes a very long time to fsck it, and that

Even if you lose power before the mount readonly, you don't need a full fsck
for journalled filesystems.

If you are using Xen, then virtual machines may be updating their filesystems.
The standard shutdown for Xen will either shutdown each VM or suspend each
VM to disk.  Suspending to disk is actually the fastest approach.

You don't need to worry about swap.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
