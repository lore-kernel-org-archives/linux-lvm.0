From: Andreas Dilger <adilger@turbolabs.com>
Message-Id: <200005031809.e43I93R26551@webber.adilger.net>
Subject: Re: [linux-lvm] SuSE/LVM boot problem
Date: Wed, 3 May 2000 12:09:03 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

David Gould writes:
> > Option 1 is way easier to implement, but has one big disadvantage: Whenever
> > you move physical extents, you have to re-run lilo.

> Yes. Would it be reasonable to have LVM tools check for this and warn
> the user?

You need to re-run LILO even if you move the kernel on a regular filesystem,
so I don't think it's that important if LVM doesn't warn you about this.
How often do you move LVs around anyways?  If you keep them in your /boot
LV and it's only a couple of PPs in size, it shouldn't be an issue.  Under
AIX, you are forced to have your boot LV contiguous (which I think LILO
doesn't need, as long as it is a single disk), and you are still required
to run "bosboot" if you move or mirror your BLV.

> If I have understood this, we need the following to make this
> work (some of this may already exist):
> 
>  - lvm needs to have a way of tracking/enforcing/satisfying the constraint
>    that specified lvs need to be in the bios bootable physical area

I think this can mostly be left up to the sysadmin for now.  I think if
LILO can handle LVs at all, it already complains if your kernel isn't
in a BIOS bootable area.

>  - lilo needs to understand about lvm and use the lvm provided ways to
>    get physical mappings.

How does LILO do this now?  It currently gets a filename for the kernel,
and that's it.  It must do some sort of internal calculation or IOCTL to
get the physical block numbers on the disk.  Is the problem that it does
its calculations w.r.t. the start of the partition?

>  - the kernel needs to be able to reconstruct enough of the lvm
>    descriptors to mount / at boot time.

You could always require that the / partition be contiguous, so it can
initially be mounted as ext2 directly.  If you want to resize your root
filesystem, you have to migrate the blocks after it to another location,
or move the whole LV to a contiguous region large enough for the new
size and re-run LILO.  I think it is already possible to specify an offset
into a block device for the / filesystem (think bootfloppy), so the kernel
could mount /dev/hda1 + X blocks read-only at boot, and when it goes to
mount read/write it remounts /dev/rootvg/lv00 as read-write.

I think I need to dig a bit more into the LILO code to see what's really
happening there.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
