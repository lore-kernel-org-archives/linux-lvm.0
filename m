Return-Path: <weissel@netcologne.de>
From: Wolfgang Weisselberg <weissel@netcologne.de>
Date: Mon, 18 Jun 2001 13:19:19 +0200
Subject: Re: [linux-lvm] What is a good stripe size?
Message-ID: <20010618131919.B31606@tiger.bigcats.invalid>
References: <134782415.992819826651.JavaMail.root@boots>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <134782415.992819826651.JavaMail.root@boots>; from ticket_ak0dezql38fr43g992819821002@sneakemail.com on Sun, Jun 17, 2001 at 06:13:51PM -0500
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

Hi, Steven!

Steven Lembark wrote 81 lines:

> > For a single file you may gain reading speed (writing is less
> > critical as it is buffered); however with a stripe size below
> > file size you will need to move the heads of both (or even
> > more) disks, increasing latency[1], effectively slowing down
> > reads unless you have fairly large files.

> Assumes that the stripe blocks are not adjacent on their
> respective disk drives.  The smaller stripe may have no
> penalty if the logical blocks are adjacent on the disk.

Actually, this assumes that the stripe blocks are not adjacent
-- which they are not, they are on different disks with
independent head movements. :-)

But even if all of the following data requires no further
seeks you still need 2 initial seeks, instead of one.  Which
is longer on the average.

> One of the main resons for using LVM at all is to avoid
> having to worry about any of this.

LVM is about not having to worry over partition sizes and disk
sizes other than the complete pool size.

> If raw speed is a major
> consideration then use hardware RAID5 w/ strip size ==
> I/O block size (e.g., 4 disks w/ 1K chunk and 4K filesystem
> block on linux).  This avoids the "extra read" penalty and
> gives nice, distributed reads.

You get the extra read penalty even with RAID5 and small
strip sizes, as the kernel does read-ahead, for example.
Actually, it gets worse (approaching 2/3 seek time, I
*guess*, on the average) with more disks.

And then you should definitively test if a HW raid controller
(which *is* the easiest thing) is as fast as software raid,
especially in degraded mode and during writes.  If you are
having a write-heavy partition, this can turn into a
bottleneck.  Also remember that with ext2 you get meta-data
every 8M, so if you find one disk doing overtime, tune that
value during the ext2 creation.

> > [1] Your seek time rises -- on the average -- the more heads
> >     are in use.  With one head you get 1/3 full-seek time for
> >     a random head and file locations.  With two heads you need
> >     to move both heads, chances are that one of them has a
> >     longer way than the other.

> One advantage of striping is that the seek latency of one
> drive can be used for data I/O on another drive.

True, but latency still increases.  And it's also true for
larger strip sizes -- with less increase in latency for
each file.

> If the LVM
> system does any sort of double-buffering then the striped
> system can negate/reduce the seek time.

Only if there is enough to be read.  
At 17.5 MB/s and 8.9 ms average seek time, you can read just
under 160 Kb in the time of one seek.

> This also leaves out the issue of journaled file systems, which
> may have data (or just meta-data) spread out all over the
> place -- leaveing you with fragmented reads even in the case
> of a small file.

Meta-data is usually cached -- and it does not help if you
need 2 seeks (or even 1.2 seeks on the average) instead of
one for each meta-data fragment.

> Net result is that depending on CPU, bus, controller and
> disk hardware and their interactins with the file systems
> and particular type of I/O being performned the answer
> becomes "It Depends" :-)

Well, ain't it good noone told this Donald E. Knuth before he
did write many highly mathematical things and thoughts about
it in 'The Art of Computer Programming'?  :-)

> In 15 years the only method I've found that works consistently
> is to try however many of the recommendations you can before
> comitting to any one of them.

True, that method usually works, if your trials are really
realistic.

> >     do not like loosing spots all over the place.  But then you
> >     do backup religiously, test your backups and have recovery
> >     plans in place, yes?

> Ah, but it's so much more fun to fiture out how it all works at
> 3 in the morning with 20 users breathing fire down your back!

For some values of 'fun' approaching microsoftian proportions?
Maybe.  Bungie jumping with piano wire as rope tends to be
more enjoyable, I have been told.

-Wolfgang
