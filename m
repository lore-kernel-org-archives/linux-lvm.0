Message-Id: <199911052352.AA15485@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Is LVM work ongoing?
Date: Sat, 06 Nov 1999 0:51:01 MET
In-Reply-To: <Pine.LNX.4.10.9911051146040.1112-100000@cdm-24-019.tca.net>; from "mschout@gkg.net" at Nov 5, 99 11:55 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mschout@gkg.net
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi Mike.

> 
> Hi.
> 
> I posted earlier this week about problems using LVM 0.7 with 2.2.12 on top of a
> raid5 device using the latest software raid patches (19990824).  After hours of
> searching newsgroups and mailing list archives, it appears that either 1)
> nobody else has tried this, or 2) it just plain does not work.

Simply i didn't have the time do keep up with the recent raid patches 8*(

> 
> I also notice that there has not been any new RAID patches or any new LVM
> patches in quite some time.  The latest news on http://linux.msede.com/lvm is
> one month ago.  The latest kernel patch is about 3 months old, and conflicts
> with the raid patches out of the box.  I know alan cox included the LVM patches
> in 2.2.10-acX somewhere along the line, but I notice that he has backed LVM out
> of his patches, and does not even have it on the list of features he is
> considering adding anymore.

Linus has the LVM driver patch for 2.3.x and everybody is waiting for
it to show up in the stock kernel...

BTW: Alan promised to push it to Linus but he never did 8*(

> Also, the traffic on the mailing list is very
> light, so it appears that not much is going on in terms of development
> with LVM.

I am almost the single developer ;*)

These days i'm working on snapshot logical volume support
but my time is limited...

> 
> I would love to try to fix some of the problems I am seeing, but I dont have
> enough of an understanding of what is happening that is causing the problems I
> am seeing (hang in mkfs).  My guess is that something is terribly wrong in
> either ll_rw_blk.c, or md.c..  But since the machine just hangs with no ooops,
> panic, or anything else, its kind of hard to know what is going on.  If I knew
> more about what is going on in ll_rw_blk.c, I might take a stab at trying to
> unravel this, but I am not familiar with it yet.
> 
> And I dont want to spend weeks trying to dig into this if LVM has been
> abandoned and will never make it into the kernel.

See above and push Linus 8*)

> So is LVM work still going
> on,

YES!

> or is it pretty much on the shelf for now?    If there is still work going
> on, I may try to dig into this probelm, but I dont want to waste my time
> otherwise :).

Go ahead.
Your help is welcome.

> 
> Thanks,
> Mike
> 
> 

Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
