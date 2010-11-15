Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAFLloPZ015496
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 16:47:51 -0500
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFLlbrG018458
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 16:47:38 -0500
Received: from soda.linbit (unknown [10.9.9.55])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 3030D1058DE4
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 22:47:36 +0100 (CET)
Date: Mon, 15 Nov 2010 22:47:35 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20101115214735.GF20084@barkeeper1-xen.linbit>
References: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
Subject: Re: [linux-lvm] Move pvmove questions Was: Need help with a
 particular use-case for pvmove.
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Mon, Nov 15, 2010 at 02:53:29PM -0500, Stirling Westrup wrote:
> On Sun, Nov 14, 2010 at 6:52 PM, Stirling Westrup <swestrup@gmail.com> wrote:
> >>
> > Thanks for going through all those steps. It does make the procedure a
> > lot clearer in my mind, and it does look like dd_rescue is the way to
> > go then. I'm going to head off to try it now.
> >
> 
> Okay, I've tried the dd_rescue method that was outlined for me, and it
> failed, although not for any reasons inherent in the method. It seems
> that what is wrong with my 'flakey' drive is not that it has bad
> sectors, but that it has a tendency to heat up when used, and then
> fail all operations until its cooled down.

You can hook up your old drive to the external sata,
and point a fan right at it,
or even use a long eSATA cable and put it in the fridge.  No joke, this
has been done to successfully recover data from failing drives.

> So, I went out and managed to borrow a sata card for my server so that
> I could hook up all five drives at once, and actually have an active
> system while working on it, and now I would like to pvmove all of the
> PE's from the old flakey drive to the replacement.
> 
> pvmove typically reports getting somewhere around 7% done before the
> drive fails, but I would like to know what that represents in terms of
> checkpointed data. The man pages are frustratingly vague on a large
> number of points:
> 
> 1) how do you get a list of PEs on a PV?

I find useful:
# lvs -o +seg_pe_ranges

or, if your lvs does not support that yet,
# lvs --unit 64m --segments -o +devices

use your PE size with lower case unit letter for --units
to have the segment size reported in PE

You may want to also add -O ... to sort the output.


> 2) how often are checkpoints made, and can you control that in any way?

IIRC, pvmove does one PE at a time,
and will checkpoint each of these.
Depending on wether or not you set the PE size explicitly on vgcreate
time, this frequent checkpointing every few MB may slow down things.

> 3) can you request a given number of PEs to be moved? (I googled and
> found someone who claimed to do that in a similar situation, but I
> could find no further details).
> 4) the man page for pvmove says that you can reference a physical
> volume with PhysicalVolume[:PE[-PE]..., but it doesn't say what those
> suffixes mean, nor could I find any man page which explained it.

man page synopsis says:
pvmove  [--abort]  [--alloc  AllocationPolicy]  [-b|--background]
	[-d|--debug]  [-h|--help]  [-i|--interval  Seconds] [--noudevsync]
	[-v|--verbose] [-n|--name LogicalVolume]
	[SourcePhysicalVolume[:PE[-PE]...]
	[DestinationPhysicalVolume[:PE[-PE]...]...]]

So: yes, you can. Like in
pvmove /dev/sda:7-9 /dev/sde:7-9

Ranges given are inclusive, so the above moves the three physical
extents 7,8,9 of PV sda to PV sde. Keep that in mind if you deduce
these ranges from segment start PE number and segment size in PE units:

Both PVs have to be part of the same VG already,
unallocated PEs on source are skipped,
allocated PEs on dest are ignored,
resulting to-be-moved number source PEs must not exceed
resulting available number of dest PEs.

If you give it too much rope, and the destination range contains
allocated blocks, the result may not always match your expectations,
as it usually tries to keep things continguous, even if you don't want
it to, to if you know exactly what you want, don't give it any rope ;-)
(if you are "defragmenting" the physical layout, e.g.)

If you want to pvmove within the same PV, you have to add
"--alloc anywhere".

Does that make sense?

> Basically, I want to attempt to optimize my uses of pvmove to transfer
> as much as possible in as few attempts as possible. Any help would be
> appreciated.

hth,

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD� and LINBIT� are registered trademarks of LINBIT, Austria.
