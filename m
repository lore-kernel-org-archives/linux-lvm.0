Return-Path: <root@srv.sistina.com>
Date: Mon, 18 Jun 2001 12:04:33 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] What is a good stripe size?
Message-ID: <20010618120433.C14110@sistina.com>
References: <134933704.992803570667.JavaMail.root@boots> <20010617233627.B18539@tiger.bigcats.invalid> <1418190000.992819631@dizzy>
Mime-Version: 1.0
In-Reply-To: <1418190000.992819631@dizzy>; from lembark@wrkhors.com on Sun, Jun 17, 2001 at 06:13:51PM -0500
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

On Sun, Jun 17, 2001 at 06:13:51PM -0500, Steven Lembark wrote:
> 
> >> On Sat, Jun 16, 2001 at 03:29:16PM +0200, Urs Thuermann wrote:
> >> > Using the PVs on sda2 and sdb2 I created a single VG and I want to
> >> > create striped LVs on it now.  My questions is, how large should I
> >> > choose the stripe size to achive optimal performance.  If I choose it
> >> > too large, I will probably loose the win of striping.
> >
> >> You lose the advantage of striping if the stripe size is on the order
> >> of the file size.  You want stripes which will be narrower than most
> >> of the files you will be using.
> >
> > I wonder if you are looking at a single file or general
> > throughput here.
> >
> > For a single file you may gain reading speed (writing is less
> > critical as it is buffered); however with a stripe size below
> > file size you will need to move the heads of both (or even
> > more) disks, increasing latency[1], effectively slowing down
> > reads unless you have fairly large files.
> 
> Assumes that the stripe blocks are not adjacent on their
> respective disk drives.  The smaller stripe may have no
> penalty if the logical blocks are adjacent on the disk.
> 
> One of the main resons for using LVM at all is to avoid
> having to worry about any of this.  If raw speed is a major
> consideration then use hardware RAID5 w/ strip size ==
> I/O block size (e.g., 4 disks w/ 1K chunk and 4K filesystem
> block on linux).  This avoids the "extra read" penalty and
> gives nice, distributed reads.
> 
> > [1] Your seek time rises -- on the average -- the more heads
> >     are in use.  With one head you get 1/3 full-seek time for
> >     a random head and file locations.  With two heads you need
> >     to move both heads, chances are that one of them has a
> >     longer way than the other.
> 
> One advantage of striping is that the seek latency of one
> drive can be used for data I/O on another drive.  If the LVM
> system does any sort of double-buffering then the striped
> system can negate/reduce the seek time.

No double-buffering today :-(
LVM just redirects I/Os to the underlying devices (aka physical volumes).

Regards,
Heinz    -- The LVM Guy --

> 
> This also leaves out the issue of journaled file systems, which
> may have data (or just meta-data) spread out all over the
> place -- leaveing you with fragmented reads even in the case
> of a small file.
> 
> 
> Net result is that depending on CPU, bus, controller and
> disk hardware and their interactins with the file systems
> and particular type of I/O being performned the answer
> becomes "It Depends" :-)
> 
> In 15 years the only method I've found that works consistently
> is to try however many of the recommendations you can before
> comitting to any one of them.  Benchmark them under realistic
> condidtions and one will usually be a bit better.  At that point you
> can 'reverse engineer' why your particular conditions match
> that particular theory -- and probably learn a bit about how to
> improve your system as a result.
> 
> 
> 
> 
> > [4] all disks are 'single point of failure'.  Most file systems
> >     do not like loosing spots all over the place.  But then you
> >     do backup religiously, test your backups and have recovery
> >     plans in place, yes?
> 
> Ah, but it's so much more fun to fiture out how it all works at
> 3 in the morning with 20 users breathing fire down your back!
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
