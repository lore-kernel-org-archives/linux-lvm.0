From: Ken Savich <ken@daydream.net>
Subject: Re: [linux-lvm] removing a pv from an lv formatted xfs
In-Reply-To: <20020113121241.A6807@kluge.net>
Message-Id: <Pine.OSX.4.33.0201141203340.387-100000@localhost>
MIME-Version: 1.0
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
Date: Sun Jan 13 14:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theo Van Dinter <felicity@kluge.net>
Cc: linux-lvm@sistina.com

I did do an xfs_growfs to the fs, unfortunately.

Can I ask you, if I do add another disk, is it okay for me to add
one that is not the same size, but big enough to deal with any data
that may be on the bad disk? If so, what happens to the fs when I remove
the bad disk and the lv is no longer as large as it was?

If I can just pvmove everything from the bad disk to one of the
existing pv's, and remove it thereafter, would this work as well?

I guess this all boils down to how does xfs deal with being shrunken,
even if there is still plenty of free space.


on Sun, 13 Jan 2002, Theo Van Dinter digitally scribbled:

> On Sun, Jan 13, 2002 at 03:13:34AM -0800, Ken Savich wrote:
> > now going bad with tons of errors
> > on umount from the kernel. I need to remove it but I cannot shrink the
> > xfs partition that the lv it belongs
> > to is on. How can I remove this disk? If I remove hdb from the lv
> > without shrinking the filesystem, will it whack
> > my data? Is there any way around this? I'm sure there is only data on
> > hde, the original first disk of the vg.
>
> It wasn't clear from your note, but I'm assuming that you not only added the
> disks to the LV but also did xfs_growfs to give the filesystem all of the
> space?
>
> If so, you have two options that I can see.  The first is easiest: Add a disk
> to replace the failing one.  Put it in the VG, and do a pvmove to get the
> data moved to the new disk.  When that's complete, and 'pvdisplay -v' shows
> no PEs allocated from that device, you can remove it from the VG and then
> physically remove the disk.
>
> The second is really more annoying: backup the filesystem, remove the lv ad
> failing pv, remove/replace the disk, recreate the pv and lv, then restore the
> FS.
>
> --
> Randomly Generated Tagline:
> Oh my God, someone's trying to kill me!  Oh wait, it's for Bart.
>
>  		-- Homer Simpson
>  		   Cape Feare
>
