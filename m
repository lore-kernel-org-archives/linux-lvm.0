Message-ID: <390EA5FC.CBC9F9A2@msede.com>
Date: Tue, 02 May 2000 11:55:08 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] RH 6.2 kernel problem with 0.8i
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message ...

-------- Original Message --------
Message-ID: <390E294C.698DDB17@t-online.de>
Date: Tue, 02 May 2000 03:03:08 +0200
From: Heinz.Mauelshagen@t-online.de (Heinz Mauelshagen)
Subject: Re: [linux-lvm] RH 6.2 kernel problem with 0.8i
References: <20000501194313.A25404@omnifarious.mn.org>


"Eric M. Hopper" wrote:

>         I figured out my problem.  It's the RAID patches that RH adds.
>
>         RH adds a LOT of patches to the stock kernel.  Someone suggested
> grabbing a stock kernel and using that, but a lot of the RH patches are
> ones I really want, and I don't want to sift through them carefully
> figuring out which ones.
>
>         So, I grabbed the kernel source RPM, used rpm2cpio on it,
> unpacked the cpio, and then used patch -R (what a wonderful tool) to
> reverse the patches I didn't want out of the kernel source tree RH
> ships.
>
>         After that, the LVM patches applied just fine.  I only wanted
> RAID0 anyway, and LVM does that just fine by itself.  :-)

O.k.

>
>
>         It works beautifully!
>
>         The only thing I could ask for (and it is something that would
> be complicated to dp) is to allow the root filesystem to be a logical
> volume.

Yes, it is partially supported by the lvmcreate_nitrd(8) tool
contained
in the lvm distribution which creates a initial ram disk enabling
volume
group activation and change of the root filesystem from the initial
ram disk
to a logical volume containing a root filesystem.
Nevertheless there's no support to setup the contents of the root
filesystem
in the logical volume an the lilo configuration file.

>
>
>         A graphical (say tk or Python based) manager might be nice to,
> but there are already several people working on that.

>
>         Thanks a LOT for providing such a neat, useful tool.  Virtual
> memory for hard drives.  It's great!
>
>         One question...
>
>         Is the warning about moving the physical extents of a mounted
> logical volume based on hard evidence, or uneasiness?

The reason for this message is, that a power loss or a system damage
can cause a LVM metadata (VGDA) inconsistency which will force the
administrator
to restore the VGDA from a backup copy in /etc/lvmconf/.
Another rason is. that buffers contained in the buffer cache
which are not written to the physical volumes can get lost in this
case as well.


>
>
>         As I recall from Hans's talk, there shouldn't be any problem.  I
> think I remember that the blocks are locked from being read or written
> to while they're being moved.

Yes, they are locked and after the data move and metadata update, they
are unlocked

for further access again.

> And besides, the buffer cache entries
> point at the logical volume anyway.

Correct.

>
>
> Have fun (if at all possible),

You as well ;-{)

Heinz
