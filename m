Message-Id: <200402062021.i16KL7m26084@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <20040206124830.GA2127@samadhi.local> (message from Dale
	Gallagher on Fri, 6 Feb 2004 14:48:30 +0200)
Subject: Re: [linux-lvm] advice sought on setting up new system
References: <20040206124830.GA2127@samadhi.local>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Feb  6 15:14:02 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Dale Gallagher wrote:

>The primary goal here is for flexibility and I/O performance - the
>hardware RAID takes care of availability/redundancy, together with
>backup media.

The location of the extents of a logical volume can have a great impact
on its I/O performance:

1) LVM does its best to make the logical extents physically contiguous,
   but pvmove(8) can be used to improve this as the need arises.

2) Here's an often neglected fact:  The performance of the outer
   cylinders of almost any hard drive (larger than a few GB) is usually
   about double that of the inner cylinders of the same drive.  (This is
   due to the fact that there are about twice as many sectors per track
   on the outside of the platter as there are on the inside of the
   platter and thus data moves past the read/write heads about twice as
   fast on the outer cylinders as the inner cylinders.)

   Therefore, to improve I/O performance, try to create often used
   logical volumes first as LVM tends to allocate lower physical extents
   first.  Otherwise, use pvmove(8) to move the more frequently accessed
   extents to the fastest (lowest) physical extents of the fastest LVM
   physical volume.  It is best to use (almost) whole disks as LVM
   physical volumes, since smaller physical volumes (partitions) would be
   either fast, average, or slow and not the full spectrum of fast
   through slow.  The least accessed logical extents should be moved to
   the highest numbered (slow) physical extents of the slowest disks.

3) LVM striping can also be used to improve I/O performance over two or
   more spindles (disks).  Avoid LVM striping over two physical volumes
   on the same spindle (disk), since this reduces performance as the
   system waits for seeks between these two physical volumes (for a
   simple sequential access).

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
