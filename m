Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1CKfai04550
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 15:41:36 -0500
Received: from ecstasy.winternet.com (CPE-65-25-248-192.mn.rr.com [65.25.248.192])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1CKfab00602
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 15:41:36 -0500
Message-Id: <200402122050.i1CKoRQ24001@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <web-232397902@mail01.infosat.net> (foobar@mighty.co.za)
Subject: Re: [linux-lvm] advice sought on setting up new system
References: <web-232397902@mail01.infosat.net>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 12 15:41:01 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

>Ken Fuchs wrote:

>> 2) Here's an often neglected fact:  The performance of
>> the outer cylinders of almost any hard drive (larger
>> than a few GB) is usually about double that of the
>> inner cylinders of the same drive.

Dale Gallagher wrote:

>Surely under hardware raid this doesn't apply, as the
>location of the data is mirrored/striped across many
>disks, so the physical location of data is no longer
>obvious?

Hardware RAID just makes the physical location of the data
just a little harder to determine.  Hardware RAID simply
transforms n disks of the same size into a larger virtual
disk.  Hardware RAID will almost certainly combine the
outer (lowest) cylinders of all disks together to form
the lowest cylinders of the virtual disk and similarly
it will combine the inner (highest) cylinders of all
disks to form the highest cylinders of the virtual disk.
Thus, the lowest cylinders of the hardware RAID virtual
disk will be about twice as fast as the highest cylinders
of the virtual disk in exactly the same way it would
apply to any individual disk in the array.  Of course
the hardware RAID performance will be much better than
a single drive, depending on the actual application.

However, it is possible (though very unlikely) that a
hardware RAID is set up in a way that eliminates the
performance differential between lower and higher
cylinders for example by matching lower cylinders of
the odd drives with higher cylinders of the even
drives.  This is an unlikely set up, since the maximum
performance of such a RAID would be the same as the
average performance of a normal hardware RAID or only
67% of the maximum performance of a normal RAID.

Thus, for the typical hardware RAID, one would want to
allocate low physical extents to logical volumes needing
high performance and higher physical extents to logical
volumes with lower performance demands.

>> 3) LVM striping can also be used to improve I/O
>> performance over two or more spindles (disks).
>> Avoid LVM striping over two physical volumes on
>> the same spindle (disk), since this reduces
>> performance as the system waits for seeks between
>> these two physical volumes (for a simple sequential
>> access).

>Now by using hardware raid, theoretically there may
>well be an additional performance gain (increasing in
>proportion to the number of spindles of course). 

Yes, there should be a significant performance increase
depending on the application and how well its data
accesses are distributed over all spindles in the RAID.

However, multiple simultaneous applications may cause
more long seeks and in unlikely worst case scenarios,
RAID can even perform worst than a like number of
independent hard drives, if for example every access
requires a (long) seek on all actuators in the RAID.

>My original primary concern is the performance impact
>the system will experience, particularly if I append
>logical extents which are non-contiguous to a LV. Say
>for example, the original setup was:

>PEs(0-100) for LV /dev/mapper/v0-var-qmail-queue
>PEs (101-1000) for LV /dev/mapper/v0-home-mail

>And then I find at a later stage that my queue is too
>small, so append PEs (1001-1100) to the original LV
>/dev/mapper/v0-var-qmail-queue.

>Will the performance impact be noticeable, taking into
>consideration that each file written to the queue is
>sync-ed, together with hardware raid and U320 SCSI disks?

For sequential queue access, the physical extent gap should
have no noticeable impact on performance.  The performance
impact on an application doing random access on a logical
volume with a large physical extent gap could be noticeable.

>I know, it's difficult to assume things up-front, but
>I don't want to rush into using LVM for the wrong
>reasons... on that note, with hardware raid and the
>setup I posted originally, what are the clear practical
>benefits of using LVM, other than reducing the possible
>future need to sym-link directories onto other file-
>systems?

Not all applications perform properly when symbolic links
are used in this fashion.

Hard drives can be added and removed from the volume group(s)
as needed to increase capacity and remove old drives.
Logical volumes or parts of them can be resized smaller or
larger and moved between and within physical volumes to
facilitate removal of a drive or act on a performance
consideration.

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
