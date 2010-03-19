Message-ID: <4BA3EC26.7000302@cfl.rr.com>
Date: Fri, 19 Mar 2010 17:27:02 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4BA3BEBE.2010204@cfl.rr.com> <20100319192537.GA7345@redhat.com>
In-Reply-To: <20100319192537.GA7345@redhat.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Mike Snitzer <snitzer@redhat.com>

On 3/19/2010 3:25 PM, Mike Snitzer wrote:
> Any reason why you'd like to use DOS partitioning (first primary
> partition starting at 63rd sector)?

Convention.  I am looking into using GPT instead though.

> Anyway, if you have a recent kernel (e.g. 2.6.33) you'll be in good
> shape regardless.  If you create a partition on the device (using DOS
> partitions) the kernel _should_ be aware of where the partition starts
> and tell you how far you'd have to shift the start of your LVM2 PV data
> area to get it perfectly aligned relative to the underlying physical
> block size.  Check for example:
> # cat /sys/block/sda/sda1/alignment_offset
> 
> But if your device is using 512b physical_sector_size you'll just have a
> 0 for alignment_offset.  Check physical_block_size with:
> # cat /sys/block/sda/queue/physical_block_size

0 alignment, physical block size 512.

> Also verify that your SSD device is naturally aligned (aka
> alignment_offset=0); I'd wager it is naturally aligned:
> # cat /sys/block/sda/alignment_offset

Kernel thinks so, and based on performance tests it appears so.

> All said, even if you have an older kernel, to manually get what you
> want (shift start to account for DOS partition at 63rd sector, align PV
> pe_start on a 512K boundary), please try:
> # pvcreate --dataalignmentoffset 512b --dataalignment 512K ...

Won't that just add one sector to the start, placing it at sector 1025?
 How does an alignment offset of 1 sector account for the partition
starting on sector 63?
