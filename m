Return-Path: <ralph@oro.net>
Date: Mon, 26 Feb 2001 16:40:38 -0800
From: Ralph Jennings <ralph@oro.net>
Subject: Re: [linux-lvm] Boot with LVM on RAID1 on entire disk
Message-ID: <20010226164038.A594@oro.net>
References: <20010226140905.A523@oro.net> <200102262235.f1QMZcT11483@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200102262235.f1QMZcT11483@webber.adilger.net>; from adilger@turbolinux.com on Mon, Feb 26, 2001 at 03:35:38PM -0700
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 26, 2001 at 03:35:38PM -0700, Andreas Dilger wrote:
> Ralph writes:
> > I would like to be able to RAID mirror my entire hard drive,
> > and run LVM on top of that (/, /boot, /usr, swap, MBR).  So
> > that if 1 of them dies, I only have to take out the good one,
> > put it in the hda rack, and reboot.
> 
> Are you using MD RAID or hardware RAID?

Software (md) RAID1 (mirroring).

> > First off, I need the patch to Lilo to allow /, and /boot to
> > be LVM partitions.  Can somebody please point me to this?
> 
> You need to boot from initrd (using lvmcreate_initrd to build it)
> to have / in LVM.  My (relatively untested) LILO patch is at the
> end.

That's fine, thanks much.

> > Second, I need a way to tell pvcreate or lvcreate not to mess
> > with the MBR.  Some sort of paramater to one of them that I
> > can use to tell it not to use the first 512 bytes (or 4K, or
> > whatever it needs).  Or alternatively, some way to create an
> > LV which covers the MBR, which I can keep blank, by just not
> > writting to it.  I also saw mention of a patch for this in
> > the list before, but to an old version of LVM.  If this exists
> > for LVM 0.9.1b5, and kernel 2.4.2 can somebody point me to
> > this also?
> 
> If you have disk partitions, LVM will not mess with the MBR.  If
> you pvcreate on a whole disk, then it will overwrite the MBR.
> lvcreate is completely irrelevant in this case.  If you really
> need to leave the MBR alone, simply create a partition which is
> the size of the whole disk, and then pvcreate that partition.

I don't want disk partitions, I want md0 to include the MBR
so that when a disk crashes (say hda), I just swap the hard
drive that is working (say hdc) into hda (I have HD racks to
easily swap them with), and raidhotadd a new good HD.  Rather
than swap the HD, make a boot floppy from a system that's not
crashed (which half the time requires me to build a kernel
as well), re-run lilo, and reboot again, then raidhotadd the
new good HD (to replace the one that crashed).

> Unless you are terribly unlucky with the disk size, you will not lose any
> usable disk space.  LVM can only utilize full multiples of the PE size
> (4MB by default), and the LVM metadata (a few hundred kB) usually fits
> in the remainder, leaving a extra unused space.  In the future we may
> use some of this extra space for LVM metadata backups.

OK, so I create an MBR LVM partition that is 4MB big, and
just never use it, I can live with that.  But it seems the
LVM stuff is at the front of the disk (as opposed to MD
stuff being at the end of the disk), so the LVM stuff just
overwrites the MBR anyway.

Has anybody got any hints for this?  I saw mention of a
patch that just ignored the first few KB of the hard drive
but it was for an old version (2.2 kernel).

Thank much, Ralph.
