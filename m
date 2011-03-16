Date: Wed, 16 Mar 2011 18:55:39 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110316225539.GA3662@redhat.com>
References: <4D7E4689.9060300@cox.net> <20110314171726.GA18249@redhat.com>
	<4D812183.6000901@cfl.rr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4D812183.6000901@cfl.rr.com>
Subject: Re: [linux-lvm] Advanced Format disks mixed with regular disks?
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
To: Phillip Susi <psusi@cfl.rr.com>
Cc: Ron Johnson <ron.l.johnson@cox.net>, LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Mar 16 2011 at  4:45pm -0400,
Phillip Susi <psusi@cfl.rr.com> wrote:

> On 3/14/2011 1:17 PM, Mike Snitzer wrote:
> > Both LVM2 and Device Mapper have been updated to accommodate stacking
> > such a mix of drives.
> > 
> > See this for a bit more detail:
> > http://people.redhat.com/msnitzer/docs/io-limits.txt
> > 
> > Particularly, the "Stacking I/O Limits" section.
> > 
> > The concern raised for partial (4k) writes to the 512b drive was
> > discussed a bit more here: http://lkml.org/lkml/2010/2/22/295
> 
> Unfortunately this does not help with the WD EARS model drives ( are
> there any other 4kb sector drives on the market now? ), since they lie
> and report that they have 512 byte sectors.

I'm not following what you're saying.  The kernel's blk_stack_limits()
infrastructure accounts for "desktop" class 4K devices too (4K physical,
512b logical) -- as does DM and lvm2.

If given:

"desktop" class drive:
physical_block_size=4096
logical_block_size=512
minimum_io_size=4096
optimal_io_size=0

conventional 512 drive:
physical_block_size=512
logical_block_size=512
minimum_io_size=512
optimal_io_size=0

Stacking these drives would result in a logical device that has:

physical_block_size=4096
logical_block_size=512
minimum_io_size=4096
optimal_io_size=0

And yes, there are native 4K "enterprise" class drives (4K physical, 4K
logical) in the market.

Mike
