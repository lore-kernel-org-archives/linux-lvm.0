Date: Thu, 8 Jun 2000 10:34:15 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
Message-ID: <20000608103415.A3935@gruyere.muc.suse.de>
References: <200006080022.CAA16063@e35.marxmeier.com> <Pine.LNX.4.21.0006080135510.26807-100000@fogarty.jakma.org> <20000608102321.A9694@jadzia.josv.com>
Mime-Version: 1.0
In-Reply-To: <20000608102321.A9694@jadzia.josv.com>; from josv@osp.nl on Thu, Jun 08, 2000 at 10:23:21AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jos Visser <josv@osp.nl>
Cc: Paul Jakma <paul@clubi.ie>, Michael Marxmeier <mike@msede.com>, jan@gondor.com, ak@suse.de, linux-lvm@msede.com

On Thu, Jun 08, 2000 at 10:23:21AM +0200, Jos Visser wrote:
> I have followed only part of this thread, but the gest I get is that
> people want to take an LVM snapshot of a file system, and the issue
> at hand is the status of the file system after the sync. I would like
> to make some remarks based on my experience with other volume managers
> and file systems. If all or most of this is already a piece of cake
> for you, please ignore it, but I reckon that there will be people
> on the list (or reading the archives) that will find this useful.
> 
> 1) To be useful the snapshot must be "atomic", which means that the
>    snapshotted LV contains an image which conforms to the orginal at
>    a certain time. Since creating the snapshot usually involves some
>    copying of data blocks (to put it mildly) during which you do not
>    pause the entire system, a smart mechanism must be created to 
>    maintain this "illusion" of atomicity. 

The problem is that it is not enough to sync the file systems to
get an atomic copy; you must sync all applications too. For example
consider a database that uses user space journaling using fsync:
to make its disk files consistent after the snapshot it requires
both the log write and the data write. When one is missing the
log needs to be replayed, which requires writes.

>    The Veritas eXtended File System (vxfs) has a built-in snapshot
>    system which works kind-a interesting. Instead of doing a full
>    block device copy of the file system, it uses an "overflow"
>    block device where it saves the originals of a changed block
>    in the original block device. When looking at the snapshot, the
>    vxfs first checks the overflow area if a copy of the requested
>    block is available there. If it is, that block is returned, if
>    it isn't, the block is read from the underlying original since
>    it obviously hasn't been changed since the creation of the
>    snapshot (otherwise the original would have been present in the
>    overflow area). In the worst case the overflow area must be as
>    big as the original, but in typical cases it needs only be
>    10% of the size of the original. After system reboot, the
>    snapshot copy is gone.

This is basically how the current LVM snapshot mechanism works.  The 
overflow blocks are configurable.  The snapshots are gone after a reboot.

> 
>    I would guess that such a volatile snapshot facility could be
>    made into a generic feature available for every block device!

Yes, it's called LVM @)

> 5) So, ideally we would need an "application quiesce" in which
>    we can instruct the application to update its ondisk image
>    by making all necessary changes to its disk data (flush()ing)
>    and informing the operating system of its quiesced state, 
>    upon which the OS could make the snapshot and free the
>    application to make changes again. Unix just does not support
>    this particular model of application/OS interaction. And,

There is an easy workaround: make the snapshots writeable and allow
an application ``fsck'' or log replay in the snapshot
(if it can't handle that it is not crash safe anyways)


-Andi
