Date: Tue, 24 Oct 2000 18:40:45 +0200 (CEST)
From: Holger Rauch <Holger.Rauch@heitec.de>
Reply-To: Holger Rauch <Holger.Rauch@heitec.de>
Subject: Re: [linux-lvm] swap lv
In-Reply-To: <20001024224017.E27491@ist.flinders.edu.au>
Message-ID: <Pine.LNX.4.21.0010241826130.24309-100000@miami.datech2.er.heitec.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Phillips <mark@ist.flinders.edu.au>
Cc: linux-lvm@msede.com

Hi!

First of all, thanks a lot for your quick reply!

On Tue, 24 Oct 2000, Mark Phillips wrote:

> Holger Rauch [Holger.Rauch@heitec.de] wrote:
> 
> > Is it possible to have only one swap partition that resides on an LV? If
> > so, how can this be achieved? Are swap LVs resizable?
> 
> I'm not quite sure what you mean by your first question.

What I mean is whether the swap partition residing on an LV may be the
only swap partition that's found on the system. Or do I need a normal swap
partition that resides on a "real" partition?
  
> But yes, you
> can have a single lv which acts as a swap partition.  You need to
> create the partition.  Then use mkswap on it, and then mount it as
> swap.  For example, I have the line:
> 
> /dev/main_vg/swap_lv    none   swap    sw     0   0
> 
> in my /etc/fstab file.
> 
> As for resizing a swap partition.  What I would do is as follows.
> First unmount your swap partition so that you are not using it
> anymore.  Then delete the partition.  Then create it again, making it
> a different size.  Then run mkswap again and mount it again.
>
> (Not that I have actually tried this myself, but I don't see why it
> wouldn't work.)

Isn't there a danger that while the swap LV is unmounted one can run out
of memory? What I mean is that there is almost always a small amount of
swap space that's used by the system. When I really unmount the swap
partition, I'm taking this space away from the system and I'm afraid that 
this will cause unexpected results.

Greetings,

	Holger
