Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5BKZkjQ032129
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2008 16:35:46 -0400
Received: from wa-out-1112.google.com (wa-out-1112.google.com [209.85.146.179])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5BKZDEL002893
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2008 16:35:13 -0400
Received: by wa-out-1112.google.com with SMTP id j32so2488339waf.7
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2008 13:35:12 -0700 (PDT)
Message-ID: <8a28830e0806111335mf16052amca601c7c7b03c891@mail.gmail.com>
Date: Wed, 11 Jun 2008 13:35:12 -0700
From: "Sharif Ibrahim" <ibrash@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] 
	Using snapshots for online, incremental userspace backup
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

I'm trying to do incremental backups with LVM by reading the COW
device from userspace but am having some trouble.

A description of how the backup procedure works may be helpful... the
first (full) backup is pretty standard: create a read-only snapshot of
the origin and do a full copy from it to the backup device (in my
particular case, an LV of the same size in a different PV/VG).  The
snapshot is not deleted after the backup is taken but instead is used
to track all changes made since the backup.

For the incremental backup:
1.  Create a new read-only snapshot alongside the old one (this will
be the consistent source for the backup)
2.  For each disk_exception in the old snapshot COW file:
     a. Copy the data at the old_chunk address from the new snapshot
to the corresponding location on the backup device
3.  Replace old snapshot with new (remove old, rename new)

At the end of this procedure the backup device and the remaining
snapshot should once again be identical.  My reasoning is that as long
as all old snapshot exceptions that occurred before the new snapshot
was created are accessible via the COW device, it's possible to read
through it and see a disk_exception for at least every chunk that was
changed between when the old and new snapshots were taken and then use
those to update the backup device to the new snapshot state.  There
may also be disk_exceptions for new exceptions made since the new
snapshot was taken but their presence doesn't hurt anything.

Unfortunately, when I do this with volumes beneath mounted filesystems
(tested with ReiserFS and ext3), the backup device and the snapshot
often end up differing (as reported by cmp).  That leads me to believe
that not everything in the exception table up to the new snapshot
creation has been flushed out to the COW device accessible in
userspace and/or some sort of caching is keeping me from reading it.
I've experimented with various combinations of sync, blockdev
--flushbufs, dmsetup suspend, echo 1 > /proc/sys/vm/drop_caches and
O_DIRECT to prevent this but haven't been able to get it to work
reliably for mounted devices.

If my problem is not getting a recent enough exception table, is there
some way (dmsetup, ioctl, whatever) to force LVM to flush out the
current snapshot exception table to the COW device accessible in
userspace?  Or is there some other explanation I'm missing here?   I'm
reasonably confident my code works from some tests done while writing
random data to block devices (though I can't rule out my tests just
being insufficiently clever to trigger the issue).  Biggest difference
between the tests and reality is probably that all test writes are
done from userspace and kernel FS code isn't involved but I'm not sure
whether that would matter.

Thanks,

 - Sharif
