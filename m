Message-Id: <199907142305.AA12097@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] RAID and LVM?
Date: Thu, 15 Jul 1999 1:04:58 METDST
In-Reply-To: <Pine.LNX.4.10.9907142327410.30426-100000@hibernia.spin.ie>; from "Paul Jakma" at Jul 14, 99 11:38 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Jakma <paul@clubi.ie>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> I'm wondering: is it possible to run LVM on top of the linux-raid
> patches?

Yes, go ahead.
LVM can run on MD.

> 
> I'd like to carve up my disks into 500MB RAID-5 devices, and then
> build LVM on top of the /dev/md devices instead of the usual
> /dev/sd{a1,b1.. etc} devices.
> 
> Should I try it? or do the 2 patches tread on each others toes? (i
> notice they both touch buffer.c). 

No they don't.
lvm remaps in ll_rw_blk.c before md does.

> 
> if it can't be done, then are there any plans to integrate linux-raid
> and linux-lvm, or change LVM to able to use md devices?
> 
> (LVM and RAID are very complementary... really should be merged)
> 

Regards,
Heinz
--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS/TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
