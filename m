Return-Path: <bluca@comedia.it>
Date: Wed, 10 Jan 2001 23:26:41 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Sanity check: newbie wants strange LVM configuration
Message-ID: <20010110232641.C29141@colombina.comedia.it>
References: <3A52B71A.6944E0C5@symbionsys.com> <20010103093327.A619@66bassett.freeserve.co.uk> <3A5355EF.2060207@liberate.com> <20010103183937.A2027@66bassett.freeserve.co.uk> <3A537FB6.4090408@liberate.com> <20010104094004.A386@66bassett.freeserve.co.uk> <3A5B3CD2.4070801@liberate.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A5B3CD2.4070801@liberate.com>; from cworley@liberate.com on Tue, Jan 09, 2001 at 09:31:14AM -0700
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lvm <linux-lvm@sistina.com>

On Tue, Jan 09, 2001 at 09:31:14AM -0700, Chris Worley wrote:
> until I created the first lv that I realized the problem.  I was able 
> to back-out the LV with lvreduce.  vgreduce was not as kind: it 
> wouldn't let me remove the last PV from the VG.  So, I repartitioned 
you must use vgremove for that.

> Anyway, I made my first temporary 12GB Reiserfs from an LV, and have 
> copied the data from my system drive (this is the first step in 
> converting the current system over to LVM: copy the system drive to a 
> temporary LV... next, I'll boot from the temporary LV and make the old 
> system drive part of the LV, copy the data back, and boot from the new 
> LV).
 Aargh, be careful with LVM terminology, it is tricky :)

> copy data from one disk to another.  Will vgscan automagically figure 
> out the cabling change at boot?
yes

> How does LVM accomplish this same task?  What am I not understanding 
> about LVM?

i believe you have to learn a lot about lvm, please forget all you
know about md, they don't have anithing in common.

now

A PV means physical volume (i.e. a single disk). with linux lvm
it can also be a partition.

The act of creating a PV means writing a header on the disk.

You can create a VG (volume group) which is a collection of PV, you can
have as many PV as you wish in a single VG, but a single PV cannot be part
of more than one VG.

When you create a VG each PV is divided in small (4M default) chunks we call PE
(physical extents), all PE in a PV are numbered starting from 0.

At this point just forget for a while about disks, a VG is to you just
a collection of PE.

You can group some of those PE in something that is called an LV (logical
volume)

An LV is a collection of LE (logical extents), an LE is just a PE, but they
are numbered in the order that they are added to the LV.

let's say for example that you have 4 PV with 1078 PE each
you create VG named vgFOO from these
then you create a 10GB LV from vgFOO

the LV would be structured this way
LE      PV      PE
0       0       0
....    ....    ....
1077    0       1077
....    ....    ....
1078    1       0
....    ....    ....
2155    1       1078
....    ....    ....
2156    2		0
....    ....    ....
2559    2       403

LV do not need to be built of contigous, ordered or in any way related PE.
you can extend, reduce an LV or even move some LE from a PV to another.

Now striping, (i hate it, it is illogical, it has nothing to do with the well ordered structure described above).

when you stripe an LV you tell it on how many different PV you would like
to stripe and how big each stripe is.

striping acts as follow.
1 take the first free PE from the first free PV,
2 take the first free PE from the next free PV,
3 stripe data btw those two pe
4 reiterate from 1 until you cannot find a pair of PE from different PVs.

you can make it do tricks based on which order you pick PE from PVs to
create your LV

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
