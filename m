Date: Fri, 13 Oct 2000 00:54:57 -0500
From: Michael J Kellen <idsfa@visi.com>
Subject: Re: [linux-lvm] Very tricky new install of Linux (using LVM and Kernel 2.4)
Message-ID: <20001013005457.A24844@isis.visi.com>
References: <20001012160136.E413@destiny.ist.flinders.edu.au>
Mime-Version: 1.0
In-Reply-To: <20001012160136.E413@destiny.ist.flinders.edu.au>; from Mark Phillips on Thu, Oct 12, 2000 at 04:01:36PM +0930
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Phillips <mark@ist.flinders.edu.au>
Cc: linux-lvm@msede.com

On Thu, Oct 12, 2000 at 04:01:36PM +0930, Mark Phillips wrote:
> I want to install it on logical partitions using LVM.  This introduces
> a number of problems.  Firstly I need kernel 2.4 to use LVM.  I've
> compiled my own 2.4-test9 kernel and it runs fine on my old disk
> (using debian).  But the debian installation disk uses an older
> kernel, nor will it probably know how to cope with LVM.

Plan 3 ... The fun way.

I have a bastard Debian 2.2 install cd that I used to reinstall my
machine after nVidia trashed my hard drive (XFree CVS ... fear it).

It is pretty much the standard disk, but there a a few changes:

1) The kernel knows reiserfs & lvm (& crypto & usb ... 2.2.17+patches)
2) The necessary lvm tools are *statically linked* and reside on
   the CD, as is mkreiserfs
3) I pretty much had to do everything by hand.  ;-)

I booted up, switched to the shell, fdisked, made the pv, vg & lvs and
then made the filesystems and swap.  I mounted them up and untarred the
"base" system.  At this point, "chroot /instmnt" is your friend.  Fix
the fstab, take care of /sbin/unconfigured.sh and RUN LILO.  If you've
done it right, you can reboot and dselect your head off.  oh, I almost
forgot: make sure to cp -rpd /etc/lvm* /instmnt/etc from the install
filesystem or you'll never get it to boot.

Of course, you pretty much need a working system to build the CD.
OTOH, It could be done with a few floppies as well.  Still need that
working machine, though.

The debian bootstrap system doesn't grok reiserfs or lvm, so you're
out of luck on a semi-auto install.
