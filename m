From: Jesse Sipprell <jss@evcom.net>
Date: Tue, 14 Nov 2000 17:03:05 -0500
Subject: Re: [linux-lvm] LVM in shared parallel SCSI environment
Message-ID: <20001114170305.A27524@kevorkian.evcom.net>
References: <20001114142902.A25706@kevorkian.evcom.net> <200011142115.eAELFHV11698@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200011142115.eAELFHV11698@webber.adilger.net>; from adilger@turbolinux.com on Tue, Nov 14, 2000 at 02:15:16PM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: Paul Jakma <paulj@itg.ie>, Jos Visser <josv@osp.nl>, linux-lvm@msede.com

On Tue, Nov 14, 2000 at 02:15:16PM -0700, Andreas Dilger wrote:
> Jesse Sipprell writes:
> > Actually, it's entirely possible to run a non-shared-media-aware filesystem as
> > long as no more than one cluster node has a given file system mounted at a
> > time.
> > 
> > To illustrate:
> > 
> > |-------- VG --------|
> > ||====== LV0 =======||
> > || (ext2)           || --> Mounted on Cluster Node 1
> > ||==================||
> > ||====== LV1 =======||
> > || (ext2)           || --> Mounted on Cluster Node 2
> > ||==================||
> > ||====== LV2 =======||
> > || (ext2)           || --> Mounted on Cluster Node 3
> > ||==================||
> > ||====== LV3 =======||
> > || (ext2)           || --> Mounted on Cluster Node 4
> > ||==================||
> > |                    |
> > |  Free Space in VG  |
> > |                    |
> > |====================|
> 
> Far safer to simply have a separate VG for each node, and import it on the
> backup node when you do a failover.  Since you have to have some sort of
> external control for the filesystems, doing the import at the same time is
> not any more overhead.

Safer, certainly, but won't this make extending/reducing an LV problematic?
For example, say that in 6 months from now it becomes necessary to move 100MB
of capacity from LV0 to LV1; now per your assumption that LV0 and LV1 on are
on separate VGs, one can only extend and/or reduce the involved VGs by this
amount if the increment/decrement size is a multiple of the PV sizes.

> > One can use the benefits of LVM to unmount LV0's fs on Cluster Node 1, resize
> > the LV, resize the fs and remount.  Now, Cluster Node's 2, 3 and 4 need to
> > have their in-core LVM metadata updated in order to see the new size of LV0.
> > Once this is done via the vgchange bounce, everything is consistant.
> 
> Yes, except when someone also does a resize on another filesystem before
> they have synced up the VG, you have corrupt filesystems and LVM.  You've
> made something that looks to be "highly available" into something that
> facilitates destroying your important data.  In many critical systems, it
> is very rare that you would be able to take filesystems 2, 3, 4 offline
> in order to sync the LVM back up.

Absolutely.  This is the reasoning behind my original question regarding
"refreshing" the in-core LVM metadata on cluster nodes.  LVM is still a win
without clustering features, however the potential exists for exactly what you
described (and other horrors).  The only solution (until LVM-clustering comes
to fruition), in my organization, is to procedurally make sure that only one
person is in charge of a cluster, resizing LVs, filesystems, etc, as well as
to make sure that person is fully aware of the dangers involved with current
LVM in a shared media environment.

> PS - no need to unmount the ext2 filesystem to do the resize with the
>      right tools.

Certainly. ;)

-- 
Jesse Sipprell
Technical Operations Director
Evolution Communications, Inc.
800.496.4736

* Finger jss@evcom.net for my PGP Public Key *
