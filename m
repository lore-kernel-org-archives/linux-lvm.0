Date: Thu, 8 Jun 2000 09:52:59 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
Message-ID: <20000608095259.A2434@hmsysv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <Pine.LNX.4.21.0006080005180.26807-100000@fogarty.jakma.org> <200006080022.CAA16063@e35.marxmeier.com>
Mime-Version: 1.0
In-Reply-To: <200006080022.CAA16063@e35.marxmeier.com>; from mike@msede.com on Thu, Jun 08, 2000 at 02:22:14AM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Marxmeier <mike@msede.com>
Cc: linux-lvm@msede.com

On Thu, Jun 08, 2000 at 02:22:14AM +0000, Michael Marxmeier wrote:
> > 
> > On Wed, 7 Jun 2000, Jan Niehusmann wrote:
> > 
> > > The snapshot logic simply doesn't know what a filesystem is. It just
> > > clones the block device.
> > 
> > this i knew.. :)
> > 
> > > So the fs may be in en inconsistent state, if you do the snapshot
> > > while some write operation is in progress on the cloned
> > > filesystem.
> > 
> > ok. so the solution is what? a call in the vfs to complete pending
> > writes, and hold off on modifying any blocks?
> 
> IMHO when creating a snapshot LVM could simply sync all outstanding
> buffers for the block device vialog block_fsync() (not sure if this
> is already done -- Heinz care to comment?).

Yes, in case a new snapshot is created the buffers of the original LV
are flushed using fsync_dev(). Please have a look at the end of
lvm_do_lv_create() in lvm.c.

> This should also take care of pending fs meta information thus
> we should get a consistent state.
> 
> The question is how atomic this is? Since fsync_dev() currently
> does a lock_kernel() is might even be sufficient.

It should do the job (see comment bellow).

> 
> 
> Any reason why this is not suffiecient?

The only case could be any kind of "private" metadata a filesystem keeps
outside the cache.
Any comments on that?

Heinz

-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                Sistina Software Inc.
Senior Consultant/Developer                      Bartningstr. 12
                                                 64289 Darmstadt
                                                 Germany
Mauelshgen@Sistina.com                           +49 6151 710386
                                                      FAX 710396
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
