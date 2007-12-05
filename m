Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lB53Bk9n004754
	for <linux-lvm@redhat.com>; Tue, 4 Dec 2007 22:11:46 -0500
Received: from out-of-band.media.mit.edu (out-of-band.media.mit.edu
	[18.85.1.38])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lB53BPUO009239
	for <linux-lvm@redhat.com>; Tue, 4 Dec 2007 22:11:25 -0500
Date: Tue, 4 Dec 2007 22:11:25 -0500 (EST)
Message-Id: <200712050311.WAA26761@out-of-band.media.mit.edu>
From: f-lvm@media.mit.edu
In-reply-to: <Pine.LNX.4.44.0712041137500.9363-100000@bmsred.bmsi.com>
	(stuart@bmsi.com)
Subject: [linux-lvm] moving a logical volume between servers
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

    > Date: Tue, 4 Dec 2007 11:46:56 -0500 (EST)
    > From: "Stuart D. Gathman" <stuart@bmsi.com>

    > Oh, and once I reversed the src and dst :-(  Now I have a co-worker check
    > before I press enter.

See my PS.

    > PS.  It would be possible for LVM to flag PEs newly added to an LV as
    > "uninitialized".  Attempts to read uninitialized data could result in
    > a read error.  This would catch a lot of fat finger mistakes - if it
    > didn't break too much stuff in the process.  Maybe just flag the entire LV
    > "write only" until the first write, and subsequent first reads would
    > return zeroes for security reasons.  There should be a flag to disable
    > all this in case the LV is created for data recovery purposes.

Would it be possible to use "blockdev --setro" on the source volume,
so nothing (well, except things that bypass the kernel or whatever)
can write to it?  I haven't tried this; is there a gotcha?

Of course, this assumes that something else isn't legitimately writing
to the source LV while you're copying it, but presumably that would
lead to a corrupted copy anyway and it'd be good to catch that early...

P.S.  This is why I bitterly resent the disappearance of write-protect
switches when hard disks transitioned from being removable media (like
those washing-machine-sized 300MB drives with their 12-platter disks)
to integrated units.  How hard could it -be- to put a write-protect
jumper on the disk, or have some IDE/SATA/etc command that will
-definitely- write-lock the disk and for which userspace tools
exist to manipulate this?  [Yeah, yeah, I know that none of this
applies in an LVM context.  But I've done my share of dd'ing whole
drives in the past.]

Lacking these, write-lock requires active (and relatively sophisticated)
electronics that can play man-in-the-middle on the cable.  That's
expensive and prone to obsolescence, although it apparently is a
good moneymaker for companies selling such things to people who have
to do forensics on drives and be able to state in court that their
analysis system couldn't have written to it...

Not being able to write-lock disks means I've had to be very, very
careful in a number of situations when I wished I didn't have to worry
so much about shooting myself in the foot.
