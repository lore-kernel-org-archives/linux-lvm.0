Return-Path: <defranco@cup.hp.com>
Message-ID: <3A255040.275AE009@cup.hp.com>
Date: Wed, 29 Nov 2000 10:51:44 -0800
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
References: <3A22A3BC.72EDA5AF@cup.hp.com> <20001128013518.K20735@srv.t-online.de>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Installation Problems with 0.9
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mauelshagen@sistina.com, linux-lvm@sistina.com

Hi,

Thanks Heinz, one other question then, if I install
things in the following sequence:

2.2.17
raid-2.2.17-A0
linux-2.2.17-rawio.patch
lvm-0.9-2.2.17-stock.patch

I get two hunk failures (#3,4) in drivers/block/ll_rw_blk.c.
Are these expected or is there some other problem? If I
don't
load the raid-2.2.17-A0 patch everything is ok, but then
after I boot that kernel I cannot create any raid devices
so I need the raid-2.2.17-A0 patch.

Thanks.


"Heinz J. Mauelshagen" wrote:
> 
> Please don't use the lvm-0.9-2.2.17-new_raid.patch file.
> It has been deleted from our ftp site (it is still in the LVM tarball though).
> 
> Go with the lvm-0.9-2.2.17-stock.patch instead.
> 
> Sorry for the inconvenience.
> 
> --
> 
> Regards,
> Heinz      -- The LVM guy --
> 
> On Mon, Nov 27, 2000 at 10:11:08AM -0800, John DeFranco wrote:
> >
> > Hi,
> >
> > Has anyone else had any problems install the
> > lvm-0.9-2.2.17-new_raid.patch? I'm using the following
> > procedure:
> >
> > # gunzip -dc linux-2.2.17.tar.gz | tar -xvf -
> > # cd linux
> > # patch -p1 <../raid-2.2.17-A0
> > # patch -p1 <../linux-2.2.17-rawio.patch
> > # patch -p1 <../lvm-0.9-2.2.17-new_raid.patch
> > patching file `CREDITS'
> > patching file `Documentation/Configure.help'
> > Hunk #2 succeeded at 992 with fuzz 2 (offset 7 lines).
> > Hunk #3 succeeded at 1070 with fuzz 2.
> > patching file `Documentation/LVM-HOWTO'
> > patching file `drivers/block/Config.in'
> > Hunk #1 FAILED at 96.
> > 1 out of 1 hunk FAILED -- saving rejects to
> > drivers/block/Config.in.rej
> > patching file `drivers/block/Makefile'
> > Hunk #2 FAILED at 290.
> > Hunk #3 succeeded at 353 (offset 18 lines).
> > 1 out of 3 hunks FAILED -- saving rejects to
> > drivers/block/Makefile.rej
> > patching file `drivers/block/README.lvm'
> > patching file `drivers/block/genhd.c'
> > Reversed (or previously applied) patch detected!  Assume -R?
> > [n]
> > .
> > .
> > .
> >
> > There are about 5 files that have some problem. The end
> > result is not being able to build a new kernel due to
> > complication errors.
> >
> > If I don't install the raid-2.2.17-A0 patch and then
> > install the lvm-0.9-2.2.17-stock.patch everything works
> > ok from the kernel end, but if I try to build an md
> > device I get the following:
> > analyzing super-block
> > disk 0: /dev/sdc1, 8883913kB, raid superblock at 8883840kB
> > disk 1: /dev/sdd1, 8883913kB, raid superblock at 8883840kB
> > mkraid: aborted, see the syslog and /proc/mdstat for
> > potential clues.
> > [root@ham linux]#
> >
> > If I have the raid-2.2.17-A0 patch then this works.
> >
> > Any clues?
> >
> > Thanks!
> >
> > --
> > ==========
> > Cheers
> >    -jdf
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Bartningstr. 12
>                                                   64289 Darmstadt
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 6151 7103 86
>                                                        FAX 7103 96
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

-- 
==========
Cheers
   -jdf
