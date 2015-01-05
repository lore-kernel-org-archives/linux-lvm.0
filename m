Received: from localhost (vpn1-5-74.ams2.redhat.com [10.36.5.74])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t059Z5T3030426
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2015 04:35:05 -0500
Date: Mon, 5 Jan 2015 09:35:05 +0000
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20150105093504.GB11818@debian>
References: <54A3DC94.3000209@nethuis.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54A3DC94.3000209@nethuis.nl>
Subject: Re: [linux-lvm] lvmcache in writeback mode
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

On Wed, Dec 31, 2014 at 12:23:00PM +0100, Pim van den Berg wrote:
> But... when I look at the CPU usage of the VM there is 8-10% Wait-IO
> (this also matches the 2 graphs mentioned above almost 1-on-1):
> http://pommi.nethuis.nl/wp-content/uploads/2014/12/lvmcache-vm-load.png
> 
> This is equal to having no SSD cache at all or bcache in
> writethrough mode. I was expecting ~1% Wait-IO.
> 
> How can this be explained?
> 
> From the stats its clear that the pattern of "Network Packets",
> being NFS traffic, matches the lvmcache "Write hits" pattern. Does
> lvmcache in writeback mode still wait for its data to be written to
> the HDD? Does "Write hits" mean something different? Is "dmsetup
> status" giving me wrong information? Or do I still have to set some
> lvmcache settings to make this work as expected?

I think your expectations of writeback mode are correct, but to spell
it out here some pseudo code.

In writeback mode:

   if block is on ssd
      write to ssd, complete bio once written
      increment write hit counter
   else
      write to origin and complete
      increment write miss counter

writethrough mode:

   if block on ssd
      write to ssd, then origin, complete
      increment write hit counter
   else
      write to origin and complete
      increment write miss counter


Some things that can slow down IOs:

- Changing a mapping due to the promotion or demotion of a block
  requires and metadata commit. (Check LVM2 has put the metadata on
  the ssd rather than spindle).

- REQ_DISCARD.  This is an expensive operation.  I advise people to
  periodically use fstrim rather than having the fs do it
  automatically when it deletes files.

- Background writeback IO could possibly be interferring with incoming
  writes.  eg, if a dirty block is being written back when a write to
  that block comes in then the write will be stalled.  Looking at the
  code I can see we're being very agressive about writing everything
  back irrespective of how recently the block was hit.  It would be
  trivial to change it to only writeback after a number of policy
  'ticks'.  I'll do some experiments ...

- Joe
