Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qATE47i5006312
	for <linux-lvm@redhat.com>; Thu, 29 Nov 2012 09:04:08 -0500
Received: from zimbra.linbit.com (zimbra.linbit.com [212.69.161.123])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qATE42It010842
	for <linux-lvm@redhat.com>; Thu, 29 Nov 2012 09:04:03 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.linbit.com (Postfix) with ESMTP id 7DF091B40FB
	for <linux-lvm@redhat.com>; Thu, 29 Nov 2012 15:04:01 +0100 (CET)
Received: from zimbra.linbit.com ([127.0.0.1])
	by localhost (zimbra.linbit.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2h39vxRoEtM for <linux-lvm@redhat.com>;
	Thu, 29 Nov 2012 15:04:01 +0100 (CET)
Received: from soda.linbit (tuerlsteher.linbit.com [86.59.100.100])
	by zimbra.linbit.com (Postfix) with ESMTP id 5C9731B435D
	for <linux-lvm@redhat.com>; Thu, 29 Nov 2012 15:04:01 +0100 (CET)
Date: Thu, 29 Nov 2012 15:04:01 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20121129140401.GE674@soda.linbit>
References: <1045065586.477.16.camel@dev-ehopper.tiecommerce.com>
	<20030214172615.GA2438@fib011235813.fsnet.co.uk>
	<loom.20121128T142616-703@post.gmane.org>
	<50B6183E.9020404@redhat.com> <k97k9f$6kf$1@ger.gmane.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <k97k9f$6kf$1@ger.gmane.org>
Subject: Re: [linux-lvm] How to handle Bad Block relocation with LVM?
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
To: linux-lvm@redhat.com

On Thu, Nov 29, 2012 at 07:26:24AM -0500, Brian J. Murrell wrote:
> On 12-11-28 08:57 AM, Zdenek Kabelac wrote:
> > 
> > Sorry, no automated tool.
> 
> Pity,
> 
> > You could possibly pvmove separated PEs manually with set of pvmove
> > commands.
> 
> So, is the basic premise to just find the PE that is sitting on a bad
> block and just pvmove it into an LV created just for the purpose of
> holding PEs that are on bad blocks?
> 
> So what happens when I pvmove a PE out of an LV?  I take it LVM moves
> the data (or at least tries in this case) on the PE being pvmoved onto
> another PE before moving it?
> 
> Oh, but wait.  pvmove (typically) moves PEs between physical volumes.
> Can it be used to remap PEs like this?

So what do you know?
You either know that pysical sector P on some physical disk is broken.
Or you know that logical sector L in some logical volume is broken.

If you do
pvs --unit s --segment -o vg_name,lv_name,seg_start,seg_size,seg_start_pe,pe_start,seg_pe_ranges

That should give you all you need to transform them into each other,
and to transform the sector number to PE number.

Having the PE number, you can easily do
pvmove /dev/broken:PE /dev/somewhere-else

Or with alloc anywhere even elsewhere on the same broken disk.
# If you don't have an other PV available,
# but there are free "healthy" extents on the same PV:
# pvmove --alloc anywhere /dev/broken:PE /dev/broken
Which would likely not be the smartest idea ;-)

You should then create one LV named e.g. "BAD_BLOCKS",
which you would create/extend to cover that bad PE,
so that won't be re-allocated again later:
lvextend VG/BAD_BLOCKS -l +1 /dev/broken:PE

Better yet, pvchange -an /dev/broken,
so it won't be used for new LVs anymore,
and pvmove /dev/broken completely to somewhere else.

So much for the theory, how I would try to do this.
In case I would do this at all.
Which I probably won't, if I had an other PV available.

	;-)

I'm unsure how pvmove will handle IO errors, though.

> > But I'd strongly recommend to get rid of such broken driver quickly then
> > you loose any more data - IMHO it's the most efficient solution cost &
> > time.

Right.

	Lars
