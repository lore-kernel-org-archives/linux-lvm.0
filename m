Date: Sat, 17 Apr 1999 16:40:46 +0100 (GMT)
From: Tony Rogers <tony@racsys.demon.co.uk>
Subject: Re: [linux-lvm] System locks solid under LVM
In-Reply-To: <199904170101.AA30624@mailgate1b.telekom.de>
Message-ID: <Pine.LNX.4.04.9904171639320.10428-100000@racsys.demon.co.uk>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com



On Sat, 17 Apr 1999, Heinz Mauelshagen wrote:

> > 
> > Hello everyone,
> > 
> 
> Hello Tony.
> 
> I'll ask some questions about issues i don't quite understand and i'll try
> to give you some hints/statements which might be helpfull to find
> the problem(s).
> 
> 
Hello,

Thanks for your prompt reply.

My Work machine is using Redhat 5.1 with kernel 2.0.34.

I have not applied the patches to either machine. I will try this on
my home machine ASAP. It didn't look important, as I didn't get the
invalid protocol message.

My test LV is as reported by lvdisplay. There are more than 1 PVs AND
more than 1 disk:

--- Logical volume ---
LV Name               /dev/vg1/lv2
VG Name               vg1
LV Write Access       read/write
LV Status             available
LV #                  2
# open                0
LV Size               1.46 GB
Current LE            375
Allocated LE          375
Allocation            next free
Read ahead sectors    120
Block device          58:0

   --- Distribution of logical volume on 4 physical volumes  ---
   PV Name                  PE on PV     reads      writes
   /dev/sdb9                125          0          0        
   /dev/sdc9                66           0          0        
   /dev/sdb10               172          0          0        
   /dev/sdc10               12           0          0        

<snip of detailed report>
======== E N D  O F  L V D I S P L A Y ==========================

I think the memory timing is OK, it's not been a problem before, and
as I mentioned it seems to be OK except under LVM.

As far as interrupts are concerned, there is always that possibility!
But again, it's OK except under LVM, and I have been careful to make
sure it is stable without the Volume Manager.

I used to want to stripe the data under one controller to try to get
some extra performance, but I would rather have the flexibility of
resizeable partitions, so I might try repartitioning my hard disk, to
enable me to use larger partitions, if that would make it more
reliable. 

What do you think about this?

Many thanks, once again.

Tony Rogers
===========
