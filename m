Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102270207.f1R270O12079@webber.adilger.net>
Subject: Re: [linux-lvm] Boot with LVM on RAID1 on entire disk
In-Reply-To: <20010226164038.A594@oro.net> from Ralph Jennings at "Feb 26, 2001
 04:40:38 pm"
Date: Mon, 26 Feb 2001 19:07:00 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ralph writes:
> On Mon, Feb 26, 2001 at 03:35:38PM -0700, Andreas Dilger wrote:
> > Ralph writes:
> > > I would like to be able to RAID mirror my entire hard drive,
> > > and run LVM on top of that (/, /boot, /usr, swap, MBR).  So
> > > that if 1 of them dies, I only have to take out the good one,
> > > put it in the hda rack, and reboot.
> > 
> > Are you using MD RAID or hardware RAID?
> 
> Software (md) RAID1 (mirroring).

OK, it is possible to build LVM on MD as well.

> > > First off, I need the patch to Lilo to allow /, and /boot to
> > > be LVM partitions.  Can somebody please point me to this?
> > 
> > You need to boot from initrd (using lvmcreate_initrd to build it)
> > to have / in LVM.  My (relatively untested) LILO patch is at the
> > end.
> 
> That's fine, thanks much.

One thing that probably _doesn't_ work is /boot on LVM on MD, just because
I haven't had a need to do so.  Unless you have unusual requirements,
you can leave /boot as a partition if you like, or you can fix LILO
based on the patch I sent.

> I don't want disk partitions, I want md0 to include the MBR
> so that when a disk crashes (say hda), I just swap the hard
> drive that is working (say hdc) into hda (I have HD racks to
> easily swap them with), and raidhotadd a new good HD.  Rather
> than swap the HD, make a boot floppy from a system that's not
> crashed (which half the time requires me to build a kernel
> as well), re-run lilo, and reboot again, then raidhotadd the
> new good HD (to replace the one that crashed).

I see what you are getting at, but unfortunately LVM can't do this, and
it would be an incompatible change to the LVM setup.  If you really want
to do this, you _could_ code up a simple utility which copies the MBR
from the good disk to the new disk, and still leave LVM in a partition.
Probably a script doing "dd if=/dev/hda of=/dev/hdc bs=512 count=1"
is enough for a single-partition disk (don't quote me because I don't
know the internals of DOS parition tables).

You could do this at the same time you run the RAID resync, or even add
a new option to LILO to copy the MBR to another disk "mirror=/dev/hdc"
or something like that.  This avoids the need to rerun LILO whenever
you replace a disk.

> OK, so I create an MBR LVM partition that is 4MB big, and
> just never use it, I can live with that.  But it seems the
> LVM stuff is at the front of the disk (as opposed to MD
> stuff being at the end of the disk), so the LVM stuff just
> overwrites the MBR anyway.

The LVM PV information is at the beginning, so creating a "don't use"
LV doesn't help (you couldn't create it in the right spot anyways.

> Has anybody got any hints for this?  I saw mention of a
> patch that just ignored the first few KB of the hard drive
> but it was for an old version (2.2 kernel).

Haven't seen it, but it would be different than any other LVM system,
so you would need to patch all of your tools.  I think the "dd" copy of
the MBR should meet your needs.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
