Message-ID: <390F5449.5C1238EC@t-online.de>
Date: Wed, 03 May 2000 00:18:49 +0200
From: Heinz Mauelshagen <Heinz.Mauelshagen@t-online.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] SuSE/LVM boot problem
References: <20000502052139.AAA12301@quartz.nbnet.nb.ca@Lxxxx.nbtel.nb.ca> <200005020951.LAA07870@e35.marxmeier.com> <20000502114113.C1608@archimedes.suse.com> <20000502232221.A20803@gondor.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jan Niehusmann <list039@gondor.com>
Cc: dgould@suse.com, linux-lvm@msede.com

Jan Niehusmann wrote:

> > On this topic, what is needed to make lvm work for both / and /boot with
> > full lilo support? I think it somewhat limits the utility of lvm not to
> > be able to make a fully lvm system, and might be tempted to do some of
> > the heavy lifting if it is not too gruesome.
>
> As lilo doesn't parse filesystems, it has to know the sector numbers of
> the disk blocks that contain the kernel (and the second stage boot loader).
>
> I can imagine two ways to make lilo work with lvm:

>
> 1) at install time (when you run /sbin/lilo), lilo maps the logical (lvm)
> locations to physical locations and writes these to the boot block. The boot
> code doesn't need to be changed.
>
> 2) lilo writes logical locations to the boot block (trivial). The boot
> code needs to understand lvm.
>
> Option 2 is probably very difficult to do, as it requires to implement
> lvm handling in 16 bit code. Only read-only access is needed, but still,
> it's probably a major project.
>
> Option 1 is way easier to implement, but has one big disadvantage: Whenever
> you move physical extents, you have to re-run lilo.
>
> Both ways, you may end up with the kernel (or parts of it) moved to
> a drive that's not accessible by lilo.  (while the 1024-cylinder-limit
> is gone, there are still drives that are accessible by linux but not by
> the bios, for example scsi drives on a controller without bios)
>
> So, while I think it's fairly easy to make booting from lvm possible, there
> are problems, and I don't know a solution for some of them.

Actually some of them are not solvable at all :-{(
LVM actually could try to deal with BIOS constraints but
this would be a real mess regarding multiple platforms.

IMHO it's not worth to put root on a logical volume because of the
above mentioned problems and because of the fact, that a root filesystem
of 300MB is only a fraction of a typical disks size of today and that it is big
enough
and therefore never has to be resized.

BTW: all of the commercial solutions i'm aware of just 'fake' root in a logical

             volume to eanble mirroring. This can be done in Linux with MD
anyway.

Heinz
