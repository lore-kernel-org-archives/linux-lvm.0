Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1BNvii06333
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2004 18:57:44 -0500
From: "Dale Gallagher" <foobar@mighty.co.za>
Subject: Re: [linux-lvm] advice sought on setting up new system
Message-ID: <web-232397902@mail01.infosat.net>
In-Reply-To: <200402062021.i16KL7m26084@ecstasy.winternet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Wed Feb 11 18:57:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thanks for the response Ken - I've been swamped, so
appologies for the belated reply.

On Fri, 6 Feb 2004 Ken Fuchs wrote:
> The location of the extents of a logical volume can
> have a great impact on its I/O performance:
> 
> 1) LVM does its best to make the logical extents
> physically contiguous, but pvmove(8) can be used to
> improve this as the need arises.
> 
> 2) Here's an often neglected fact:  The performance of
> the outer cylinders of almost any hard drive (larger
> than a few GB) is usually about double that of the
> inner cylinders of the same drive.

Surely under hardware raid this doesn't apply, as the
location of the data is mirrored/striped across many
disks, so the physical location of data is no longer
obvious?

> 3) LVM striping can also be used to improve I/O
> performance over two or more spindles (disks).
> Avoid LVM striping over two physical volumes on
> the same spindle (disk), since this reduces
> performance as the system waits for seeks between
> these two physical volumes (for a simple sequential
> access).

Now by using harware raid, theoretically there may
well be an additional performance gain (increasing in
proportion to the number of spindles of course). 

My original primary concern is the performance impact
the system will experience, particularly if I append
logical extents which are non-contiguous to a LV. Say
for example, the original setup was:

PEs(0-100) for LV /dev/mapper/v0-var-qmail-queue
PEs (101-1000) for LV /dev/mapper/v0-home-mail

And then I find at a later stage that my queue is too
small, so append PEs (1001-1100) to the original LV
/dev/mapper/v0-var-qmail-queue.

Will the performance impact be noticeable, taking into
consideration that each file written to the queue is
synced, together with hardware raid and U320 SCSI disks?

I know, it's difficult to assume things up-front, but
I don't want to rush into using LVM for the wrong
reasons... on that note, with hardware raid and the
setup I posted originally, what are the clear practical
benefits of using LVM, other than reducing the possible
future need to sym-link directories onto other file-
systems?

I have LVM2/Linux-2.6.1 running on my laptop, but that's
the only experience I have with LVM, so do not really
know whether or not to go with it in a production
environment, as I haven't the experience.

Anyone care to enlighten me further?  I'm not entirely
convinced that LVM is the right way to go yet.  Why
_should_ I use it?  Will the benefits out-weigh the
negative aspects?

Thanks.
Dale
