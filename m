Date: Sun, 18 Jun 2000 10:27:16 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] LVM patch for linux-xfs-2.4
Message-ID: <20000618102716.A2167@hmsysv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <20000617024951.A15926@ladystrange.bluehorizon.nl> <20000617110328.A6436@hmsysv.t-online.de> <394C01CA.7824B653@inet.net.nz>
Mime-Version: 1.0
In-Reply-To: <394C01CA.7824B653@inet.net.nz>; from dale@inet.net.nz on Sun, Jun 18, 2000 at 10:55:07AM +1200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dale Kemp <dale@inet.net.nz>
Cc: linux-lvm@msede.com


Hi Dale.

On Sun, Jun 18, 2000 at 10:55:07AM +1200, Dale Kemp wrote:
> > > Hi!
> > >
> > > I'm currenlty hacking the latest XFS tree from SGI which is based on
> > > linux kernel 2.4test1 with LVM. Except for the XFS addition this
> > > kernel has more customizations. One of them, stops the LVM tools from working.
> > >
> 
> Hi!
> 
> I've just joined this mailing-list after signing the LVM petition, or should that
> be partition? ;-)
> I'm so glad to see work going on with volume management, its a missing piece
> that most commercial UNIX's have over linux. Hey, but you all know this.

;-{)

> 
> Can I ask some questions, these might be useful on the faq list...
> 
> I didn't know that SGI's XFS system uses linux-lvm, and not the SGI volume
> management system.

Actually they officially din't.
That's why Pascal is hacking on it.

> Are IBM doing the same?

IBM just recently pushed their own architecture to the public.
AFAIK it is not implemented in the UNIX/Linux world so far.

> 
> Can any filesystem use LVM ?

Yes.

> Does it need changes to make it work ?

No.

The only known tradeoff is relarted to yournaled filesystems using LVM
snapshots.
Imagine snapshots as "frozen" copies of Logical Volumes which can be used
for doing backups and other things.

Because snapshots are readonly today, journaled filesystems are not allowed to
replay their logs. Therefore there must be either writable snapshots or
some clean state of the filesystem _before_ activating a snapshot.

I am working on an interface to support the second one.

> 
> I assume the filesystem has algorithms to store data as efficiently as possible
> within its `physical' partition. How does LVM stay efficient with different
> filesystems ?

The filesystem "sees" a Logical Volume like it "sees" a physical partition.

Just a bunch of blocks to store its data.

It just doesn't "know" that it stores data in a possibly discontinuous
Logical Volume which can spread the data of the filesystem over multiple
physical disk (subsystems).

The big advantage LVM gives you as opposed to the physical partition based
scenario, is to be able to optimze i/o bottlenecks by online moving data
to idle spindles.

> 
> Is it possible to convert an existing `low-level' physical partiton like ext2 into a
> LVM PV (this would make the transition to lvm much easier) ?

Not so far.

There have been some thoughts of the ReiserFS people to free the beginning 
of a partition holding a  reiserfs entity to enable the creation of a
LVM Physical Volume afterwards.

Don't know the actual status though.

ext2 must be able to do the same thing to support waht you are requesting.

> 
> If I start using LVM now will it be compatible with newer versions of LVM and
> especially the one in kernel 2.4 ?
> 

Yes.

That's one of the main things i'll support!

There never has been a hard change forcing people to recreate
there Volume Groups so far.

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
