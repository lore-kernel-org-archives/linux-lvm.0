Return-Path: <jay@lazy.accessus.net>
Date: Tue, 28 Nov 2000 19:58:47 -0600 (CST)
From: Jay Weber <jay@lazy.accessus.net>
Subject: Re: [linux-lvm] Re: LVM 0.9 Problem
In-Reply-To: <20001128013149.I20735@srv.t-online.de>
Message-ID: <Pine.OSF.4.21.0011281950500.24692-100000@lazy.accessus.net>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 28 Nov 2000, Heinz J. Mauelshagen wrote:

> "vgdisplay -D" always tell's you that, because the active flag is never
> set on disk.

Right, understood now. :)

> > When I ran
> > vgchange -ay again (which say's it's already active) the Oops showed up.
> 
> If your first "vgscan && vgchange -ay" went o.k. the "it's already active"
> message is o.k. as well.
> The Oops nevertheless isn't ;-(
> 
> Anyway: you didn't tell if you are still able to access your VG after
>         an initial boot time "vgscan && vgchange -ay"?

Nope, I still can't access the volume group, running vgdisplay vg0 just
tells me there are no volumes.  I've setup kdb and started going through
to see what's really going on, but I'll have to resume this tomorrow when
I head back into werk.

> With one of my recent mails I submitted a patch to lvm.c which fixes
> tampering the name of the PV.
> Maybe this flaw triggeres the problem you see too.
> 
> Could you please test that patch as well and report if it helps.

I tried to find the above patch you're referring to (I really did) but I
couldn't dig it up in my archive here or the older msede archive.  I'd be
glad to try it out still though, any pointers? :) 

I've also tried recreating the above scenario with no luck.  An odd event
occured in that all my disks on the hardware controller went DEAD at the
time I ran into above problems.  So I reseated everything, swapped out a
known bad backplane in the unit I was working on (which typically caused
this problem) and I still have the issue aftewards.  I'm curious as to if
maybe I've still some kind of hardware issue going on thats being
reflected in LVM.  Any thoughts?

Thanks again.
