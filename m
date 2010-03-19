Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2JJPcUl009618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2010 15:25:38 -0400
Date: Fri, 19 Mar 2010 15:25:37 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20100319192537.GA7345@redhat.com>
References: <4BA3BEBE.2010204@cfl.rr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BA3BEBE.2010204@cfl.rr.com>
Subject: Re: [linux-lvm] Data alignment
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Mar 19 2010 at  2:13pm -0400,
Phillip Susi <psusi@cfl.rr.com> wrote:

> I have been trying to get my logical volume to be aligned to a 512 KB
> boundary on my SSD so it lines up with the flash erase block.  I thought
> I could do this with pvcreate --dataalign 1024, but this caused the data
> to be aligned to a 1024 sector boundary within the partition, which
> itself starts on sector 63.  I then thought the --dataalignoffsest
> switch would help, but specifying 63 there caused the data to be moved
> to sector 1087.  I tried giving it -63, but was told that a negative
> number is not allowed.  Why not?  How can I get the data to start on
> sector 1024-63 of the partition so it ends up on pysical sector 1024 of
> the disk?

Which kernel and lvm2 are you using?

I'm assuming you have a recent lvm2 given the flags you're referring
to.  But being precise when asking such questions is helpful.

Any reason why you'd like to use DOS partitioning (first primary
partition starting at 63rd sector)?

Anyway, if you have a recent kernel (e.g. 2.6.33) you'll be in good
shape regardless.  If you create a partition on the device (using DOS
partitions) the kernel _should_ be aware of where the partition starts
and tell you how far you'd have to shift the start of your LVM2 PV data
area to get it perfectly aligned relative to the underlying physical
block size.  Check for example:
# cat /sys/block/sda/sda1/alignment_offset

But if your device is using 512b physical_sector_size you'll just have a
0 for alignment_offset.  Check physical_block_size with:
# cat /sys/block/sda/queue/physical_block_size

Also verify that your SSD device is naturally aligned (aka
alignment_offset=0); I'd wager it is naturally aligned:
# cat /sys/block/sda/alignment_offset

New versions of LVM2 (>= 2.02.51) support detecting alignment attributes
from the kernel.  But the newer LVM2 is the better (there have been a
few related fixes over the LVM2 releases, as recently as 2.02.62).

All said, even if you have an older kernel, to manually get what you
want (shift start to account for DOS partition at 63rd sector, align PV
pe_start on a 512K boundary), please try:
# pvcreate --dataalignmentoffset 512b --dataalignment 512K ...

You'll note that the pe_start may not be where you'd first expect
(e.g. sector 1024-63); but it _should_ be aligned how you'd want it (on
a native 512K boundary).  The reason for this is LVM reserves space at
the beginning of the PV.  Check pe_start with:
# pvs -o+pe_start

Mike
