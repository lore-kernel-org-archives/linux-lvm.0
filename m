Message-Id: <199904170101.AA30624@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] System locks solid under LVM
Date: Sat, 17 Apr 1999 2:59:48 METDST
In-Reply-To: <Pine.LNX.3.96.990416151027.26530A-100000@websrv.afsuk.gecfs>; from "Tony Rogers" at Apr 16, 99 4:20 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Rogers <tony@racsys.demon.co.uk>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> Hello everyone,
> 

Hello Tony.

I'll ask some questions about issues i don't quite understand and i'll try
to give you some hints/statements which might be helpfull to find
the problem(s).


> My difficulties with LVM
> ========================
> Overview
> --------
> I have been playing with LVM for some time now, with mixed results. I
> have a machine at work which has LVM 0.6 installed. Although this is
> not utilised heavily, it works fine.

Which Linux version do you have on this work machine?
Did you install LVM patch lvm_0.6-patch-15031999a.gz with
each LVM installation?

> 
> On the other hand, I have a machine at home, also using LVM 0.6, which
> has SERIOUS problems. In simple terms, the computer locks solid when
> it comes under moderate load. I can trigger this VERY easily, but
> don`t know how best to debug the situation.
> 
> I have just joined the mailing list, and noticed some mention of lock
> ups, but the feeling seemed to be that if the underlying system was
> OK, the LVM should be fine. I`m not convinced that this is true in my
> case.
> 
> As is usual with hobby configurations, I have lots of I/O cards installed,
> and have done my best to eliminate hardware / other system causes  as a
> source of the problem.
> 
> My configuration
> ----------------
> I am using Redhat 5.2, initially with Kernel 2.0.36, but have now
> upgraded to 2.2.2 in an attempt to get the latest drivers for my hardware.
> 

2.2.x stresses hardware more than 2.0.x did and can therefore show
up problems which didn't show up with 2.0.x.

> I have two Ethernet cards (ISA & PCI), two SCSI cards (ISA & PCI), a
> sound card (ISA) and a video card (PCI).
> 
> The SCSI controller is a Diamond Fireport 40, and it is this
> controller which hosts two partitioned Fireball 6.4G drives. It is
> parts of these drives which have LVM configured for them.
> 
> Detailed description
> --------------------
> Because it is so easy to push the system over, I decided that I needed
> to find out how to make the system stable again!
> 
> I now have two Kernels to play with. Both are 2.2.2, one with LVM
> built in, and the other without the LVM patches.
> 
> This allows the following three scenarios:
> 1) Clean kernel - No LVM of any kind.
> 2) LVM Kernel - Not using LVM.
> 3) LVM Kernel - Using LVM.
> 
> In order to load the system, all I do is copy the contents of one
> filesystem to that on another partition, either native ext2 or ext2 on
> a Logical Volume (depending on the test).
> 
> My LVM configuration is as follows:
> 
> One Volume Group comprising 4 PVs on 2 SCSI drives. There are 7
> Logical volumes in this group, but I do my testing on one of ~1.5G capacity.

Is this LV spread over more than one PV and if so over more than one disk?
You can check that for eg. with "lvdisplay -v /dev/YourVG/YourLV".

> 
> I experimented with striping the LVs, but decided to settle on a
> `straight` linear LV for the purposes of the tests.
> 
> The results of my testing (over a couple of weeks) seem to show the
> following:
> 
> Case 1 - Clean Kernel. Solid, even with two simultaneous bulk copies
> AND an archive to tape, at the same time.
> 
> Case 2 - LVM Kernel - Not using LVM. Pretty solid. A couple of  lock ups.

???
This should be fully transparent and shouldn't cause any harm.
If now LV access takes place at all, the code in ll_rw_block.c is
not used at all.

> 
> Case 3 - LVM Kernel - Using LVM. Falls over almost every time within
> seconds or minutes. It lasted over an hour once only.

If you spread the test LV(s) over more than one PV and/or more
than one disk, you might have more I/O per second to different disks
pushing your configuration over the edge. This would be a problem of the
scsi subsystem which is only forced to the surface by the imposed
load. With older kernels, i was able to force solid locks by doing
mke2fs on large LVs (>15G). This problem never showed up with smaller
disk partitions of 2G.

Could you please check, if for eg. there is to rigid memory timing
setup in your test box.

It is possible, that you do have some kind of interrupt conflict, which
only shows up at a specific high I/O rate?

> 
> Plea for help
> -------------
> I really want to keep using LVM (it is the way forward!), and am
> prepared to make quite some effort to make it work for me.
> 
> The problem I have, is that the machine seems to lock SOLID with no
> warning, and there are no errors (that I can see) available to look
> at.
> 
> I really am stuck. Is there any debugging that I can enable?

Not that i am aware of.

> 
> Any help will be appreciated, and I am willing to post any fix, for
> the benefit of the list.
> 
> Thanks in advance, and sorry for the long mail!
> 

Regards,
Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
