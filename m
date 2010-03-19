Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2JNBLo4030185
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2010 19:11:22 -0400
Date: Fri, 19 Mar 2010 19:11:21 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20100319231121.GA31274@redhat.com>
References: <4BA3BEBE.2010204@cfl.rr.com> <20100319192537.GA7345@redhat.com>
	<4BA3EC26.7000302@cfl.rr.com> <20100319222156.GE7345@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20100319222156.GE7345@redhat.com>
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

On Fri, Mar 19 2010 at  6:21pm -0400,
Mike Snitzer <snitzer@redhat.com> wrote:

> On Fri, Mar 19 2010 at  5:27pm -0400,
> Phillip Susi <psusi@cfl.rr.com> wrote:
> 
> > On 3/19/2010 3:25 PM, Mike Snitzer wrote:
> > > Any reason why you'd like to use DOS partitioning (first primary
> > > partition starting at 63rd sector)?
> > 
> > Convention.  I am looking into using GPT instead though.
> > 
> > > Anyway, if you have a recent kernel (e.g. 2.6.33) you'll be in good
> > > shape regardless.  If you create a partition on the device (using DOS
> > > partitions) the kernel _should_ be aware of where the partition starts
> > > and tell you how far you'd have to shift the start of your LVM2 PV data
> > > area to get it perfectly aligned relative to the underlying physical
> > > block size.  Check for example:
> > > # cat /sys/block/sda/sda1/alignment_offset
> > > 
> > > But if your device is using 512b physical_sector_size you'll just have a
> > > 0 for alignment_offset.  Check physical_block_size with:
> > > # cat /sys/block/sda/queue/physical_block_size
> > 
> > 0 alignment, physical block size 512.
> > 
> > > Also verify that your SSD device is naturally aligned (aka
> > > alignment_offset=0); I'd wager it is naturally aligned:
> > > # cat /sys/block/sda/alignment_offset
> > 
> > Kernel thinks so, and based on performance tests it appears so.
> > 
> > > All said, even if you have an older kernel, to manually get what you
> > > want (shift start to account for DOS partition at 63rd sector, align PV
> > > pe_start on a 512K boundary), please try:
> > > # pvcreate --dataalignmentoffset 512b --dataalignment 512K ...
> > 
> > Won't that just add one sector to the start, placing it at sector 1025?
> >  How does an alignment offset of 1 sector account for the partition
> > starting on sector 63?
> 
> The --dataalignmentoffset acts as padding.  I was focused on getting you
> to a power of 2 start (sector 64).  Then from there --dataalignment
> governs the start boundary for the PV data area.
> 
> So you're right, 64*512b + 512K isn't a multiple of 512K :)
> 
> This will get you what you want:
> # pvcreate --dataalignmentoffset 512b --dataalignment 480K /dev/sda1

Alternatively you could do (as long as sysfs has alignment_offset=0):
# pvcreate --dataalignment 480.5K /dev/sda1

or

# pvcreate --dataalignment 961S /dev/sda1
