Date: Wed, 25 Oct 2000 06:58:49 +0930
From: Mark Phillips <mark@ist.flinders.edu.au>
Subject: Re: [linux-lvm] swap lv
Message-ID: <20001025065849.G27491@ist.flinders.edu.au>
References: <20001024224017.E27491@ist.flinders.edu.au> <Pine.LNX.4.21.0010241826130.24309-100000@miami.datech2.er.heitec.net>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0010241826130.24309-100000@miami.datech2.er.heitec.net>; from Holger.Rauch@heitec.de on Tue, Oct 24, 2000 at 06:40:45PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Holger Rauch <Holger.Rauch@heitec.de>
Cc: linux-lvm@msede.com

Holger Rauch [Holger.Rauch@heitec.de] wrote:

> First of all, thanks a lot for your quick reply!

No worries!

> What I mean is whether the swap partition residing on an LV may be
> the only swap partition that's found on the system. Or do I need a
> normal swap partition that resides on a "real" partition?

No, you should be able to manage with only the LV swap partition.  LV
stuff is almost as "real" as a physical partition.  As far as
utilities like mount, mkswap etc are concerned, it is real!

The only exception to this would be if you ever wanted to boot with a
kernel that didn't support LVM.  I don't know why you would want to do
this, but if you did, it obviously wouldn't be able to see your LVM
swap partition.

> > As for resizing a swap partition.  What I would do is as follows.
> > First unmount your swap partition so that you are not using it
> > anymore.  Then delete the partition.  Then create it again, making it
> > a different size.  Then run mkswap again and mount it again.
> >
> > (Not that I have actually tried this myself, but I don't see why it
> > wouldn't work.)
> 
> Isn't there a danger that while the swap LV is unmounted one can run out
> of memory? What I mean is that there is almost always a small amount of
> swap space that's used by the system. When I really unmount the swap
> partition, I'm taking this space away from the system and I'm afraid that 
> this will cause unexpected results.

How much RAM do you have?  I've got 64M RAM so when I was setting my
system up with LVM stuff, I quite happily ran without swap for a
while.  But even if you had much less RAM you should be able to do it.
All you need to ensure is that you aren't using much memory.  For
example, kill X and do your swap changeovers in console mode.  Without
X running, you could probably survive, even with only 8Meg or so.

And if you had 4Meg or something, or you had more RAM but wanted to
run X, you could still do so, as follows.  Create a temporary swap
file.  Turn it on.  Then do your changes to the swap partition.  When
finished, turn the swap file off and delete it.

Oh, and there was the other suggestion, that instead of resizing your
LV partition, if you want to make it bigger, you could just create an
extra LV swap partition and have two swap partitions.  This would work
fine, though I think a single partition is neater.

Cheers,

Mark.

-- 
_/~~~~~~~~\___/~~~~~~\____________________________________________________
____/~~\_____/~~\__/~~\__________________________Mark_Phillips____________
____/~~\_____/~~\________________________________mark@ist.flinders.edu.au_
____/~~\HE___/~~\__/~~\APTAIN_____________________________________________
____/~~\______/~~~~~~\____________________________________________________
__________________________________________________________________________
        "They told me I was gullible ... and I believed them!" 
