Return-Path: <warl0k@lvcm.com>
Message-ID: <000901c11f71$1b950100$f04b7818@lvcm.com>
From: "Glenn Shannon" <warl0k@lvcm.com>
References: <20010807105410.A31158@verb.syntaxsleuth.org>
Subject: Re: [linux-lvm] Installing Linux on LVM
Date: Tue, 7 Aug 2001 11:45:19 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: warl0k@lvcm.com
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
To: linux-lvm@sistina.com

Hi there and thanks for the info!

What I did last time was:
Install to a normal partition all on one partition (only partition created
was /) (bad form I know but it was temp only)... installed the sources for
the 2.4.7 kernel, patched to LVM beta 7 and installed the beta7 tools.

Compiled the kernel.

Went back and fixed the get_hardsect problem.

Compiled kernel again.

Went back and fixed the other get_hardsect problem.

Compiled kernel again.

Put it on a small partition which would be called /boot on the new LVM.

Made my LVs and created actual partitions.

tar -c|tar -x'ed the directories to their new reiserfs partitions (is it
just me or do files take up a chunk more space on reiser?....) on the LVM.

Set up lilo.conf and ran lilo.

Re-setup lilo.conf compensating for devfs entries (I can't get fricken
devfsd to make me my compatibility links) and re-ran lilo.

Rebooted.

Rebooted back to old install and ran lvmcreate_initrd.

Added initrd statement to lilo.conf and re-ran lilo.

Rebooted.

Booted into LVMed Debian.(yay!)

So all told I have been there done that already.. what my real question was
is if there is any way to get Debian (or any linux really) to install
straight into an LVM without the aforementioned steps above? Or would I need
to create my own bootfloppy/installation system?

Anyhow thanks for the info on your experience!

Glenn

----- Original Message -----
From: "Wade Curry" <wcurry@cts.com>
To: <linux-lvm@sistina.com>
Sent: Tuesday, August 07, 2001 10:54 AM
Subject: Re: [linux-lvm] Installing Linux on LVM


> Glenn Shannon(warl0k@lvcm.com)@Tue, Aug 07, 2001 at 10:09:26AM -0700:
> > Hi all!
> >
> > I was wanting to install Debian onto an LVM partition. Does anyone here
know
> > if this can be done or am I going to have to try and figure it out all
by my
> > lonesome? :)
> >
> > I have a bunch of experience in installing/patching LVM beta 7 and am
> > planning on using beta 8.
> >
> > Also, does anyone know of a bootloader that will recognize an LVM
partition?
> > It would be kind of wasteful if I installed linux only to have to boot
from
> > a floppy :)
> >
> > Thanks in advance for any replies!
> >
> > Glenn
> >
>
> The docs are out there, but the information on this topic isn't
> explicit or abundant.  What you're asking about is installing root
> on LVM, if I understood your request correctly.
>
> In general terms, these are the steps:
>
> 1. Create a boot partition and swap not on the LVM.  This will be
>    permanent.
> 2. Create a minimal installation on a small partition (regular
>    ext2).  This will not be permanent, so no need to be elaborate.
> 3. Compile a kernel that has support for LVM and your choice of fs
>    and ext2 statically linked.
> 4. Create your logical volumes, etc. on the rest of the disk space.
> 5. Use lvmcreate_initrd to create an initrd so the kernel will be
>    able to find everything in the new root lv.
> 6. Use debootstrap to create an installation on the new root.
>    This is not smooth, and does not run through normal style
>    installation scripts.  You will most likely have to use
>    chroot and dpkg to get the locales package installed for
>    debootstrap to even complete successfully. You'll want to copy
>    some of the things from /etc/ and check them out. fstab and
>    lilo.conf will need to be modified.  A lot of little steps here
>    just making sure that you can boot, and can get to your source
>    of debian packages.
> (at this point you can run dpkg/apt and install a _lot_ of stuff
> before you reboot.  But be careful, symlinks won't necessarily
> point where you think they do.)
> 7. Run lilo with your new config and reboot.
> 8. Fix the details you overlooked in step 6 :)
> 9. Finish selecting packages and installing.
> 10.Thank the debian maintainer for making normal installations so
> easy (Something I thought I'd never say! :).
> 11. If desired, incorporate the disk space for the original install
>     into your lv.
>
> I regret not writing down details of the process while doing it.  I
> was playing it by ear, and my original install was complete and had
> important data that I wanted to be extremely careful with. The pace
> was slow and easy.
>
> I was using 2.4.7-pre3 with the latest patches at that time, devfs
> (with no devfsd), and have had to work through a lot, but learned
> quite a bit (my main reason for doing this).  Manual installation
> and going without devfsd were more difficult than any of the issues
> with LVM. Most of the difficulties are overcome by reading docs,
> and being alert to the error messages and other "progress
> indicators".
>
> Have fun!
>
> Wade Curry                            wcurry(AT)cts.com
>
> Do I have to compile it?            Looking for a position
> No, I *get* to compile it.          working with *nix as a
> It's about freedom.                 Sys. Admin. or other.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
