Return-Path: <list@showme.wox.org>
Message-ID: <00ca01c0eea4$500ab4a0$0f01a8c0@ws1>
From: "Bas" <list@showme.wox.org>
References: <Pine.BSF.4.33.0106041350560.1884-100000@rogue.tripp.org> <01060413285600.09944@garfield.linux.localdomain> <011501c0ed31$58a54360$0f01a8c0@ws1> <20010605102551.Z97441@boing.melbourne.sgi.com> <3B1CE383.DCFED687@niehs.nih.gov>
Date: Wed, 6 Jun 2001 18:18:24 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 2.4.5 & Adaptec 7890 U2W Controller solved, LVM 0.9.1 b7 FAILS.
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
To: linux-xfs@oss.sgi.com
Cc: linux-lvm@sistina.com

You're right. Today I downloaded the default kernel coming from
ftp.kernel.org. Patched it using 06042001-xfs-patch. It compiled and it
runs. But when I patch this kernel to 0.9.1 beta 7, (CVS or standard patch
makes no difference) it fails to compile.

Now this:

drivers/md/mddev.o: In function `__update_hardblocksize':
drivers/md/mddev.o(.text+0x22d6): undefined reference to `get_hardblocksize'
drivers/md/mddev.o(.text+0x2312): undefined reference to `get_hardblocksize'
make[1]: *** [kallsyms] Error 1
make: *** [vmlinux] Error 2

How can I fix this.

Thanks again,
Bas.



----- Original Message -----
From: "Joe Krahn" <krahn@niehs.nih.gov>
To: "Timothy Shimmin" <tes@boing.melbourne.sgi.com>
Cc: "Bas" <list@showme.wox.org>; <linux-xfs@oss.sgi.com>
Sent: Tuesday, June 05, 2001 3:49 PM
Subject: Re: 2.4.5 & Adaptec 7890 U2W Controller.


> Timothy Shimmin wrote:
> >
> > On Mon, Jun 04, 2001 at 10:02:56PM +0200, Bas wrote:
> > >
> > > From: "J Hayward" <jhayward@micron.net>
> > > Subject: Re: 2.4.5 & Adaptec 7890 U2W Controller.
> > >
> > > > > [ ]   Build Adapter Firmware with Kernel Build (NEW)
> > > > >
> > > > > It is the last option under Adaptec AIC7xxx support.  The firmware
> > > > > included in the 2.4.5 release is out of sync with the kernel
driver.
> > > > >
> > > > > I have not done this myself, since my current XFS machine does not
have
> > > a
> > > > > SCSI controller, but see the below email for more info.
> > > >
> > > > Has anyone had any success using this option? Didn't work for me.
Problem
> > > > isn't isolated to just the 7890 it seems, I get the same error on a
> > > Adaptec
> > > > 2930CU. It still produced:
> > > >
> > > > >In interrupt handler - not syncing
> > > >
> > > > I also tried using the old aic7xxx driver, which did load the
module.
> > > However
> > > > it produced a kernel oops immediately after. I don't remember the
exact
> > > point
> > > > in the boot sequence, I believe it was at "Trying to unmount old
root".
> > >
> > > Tried the firmware option too, but didn't work for me.
> > >
> >
> > Tried the firmware option too, and it did work for me.
> >
> > scsi0 : Adaptec AIC7XXX EISA/VLB/PCI SCSI HBA DRIVER, Rev 6.1.13
> >         <Adaptec 2940 Ultra SCSI adapter>
> >         aic7880: Ultra Wide Channel A, SCSI Id=7, 16/255 SCBs
> >
> > --Tim
>
>
> The problem is that linux-2.4.5-xfs-05312001.patch.bz2
> includes the files aic7xxx_seq.h and aic7xxx_reg.h which
> are out of date, but which get a newer timestamp. Also
> the binary aicasm/aicasm is included in the patch, but
> patch creates it non-executable. Try touching aic7xxx.seq
> and removing aicasm/aicasm, then rebuilding the
> aic7xxx module with the build-firmware option.
>
> This is actually a problem with "make clean" and
> "make mrproper" not knowing about some of the aic7xxx
> files.
>
> Joe Krahn
>
