Return-Path: <weissel@netcologne.de>
From: Wolfgang Weisselberg <weissel@netcologne.de>
Date: Sun, 17 Jun 2001 23:36:27 +0200
Subject: Re: [linux-lvm] What is a good stripe size?
Message-ID: <20010617233627.B18539@tiger.bigcats.invalid>
References: <134933704.992803570667.JavaMail.root@boots>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <134933704.992803570667.JavaMail.root@boots>; from ticket_o889c727aqejao0992803565084@sneakemail.com on Sun, Jun 17, 2001 at 01:44:43PM -0500
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

Hi, idsfa!

idsfa@visi.com wrote 38 lines:

> On Sat, Jun 16, 2001 at 03:29:16PM +0200, Urs Thuermann wrote:
> > Using the PVs on sda2 and sdb2 I created a single VG and I want to
> > create striped LVs on it now.  My questions is, how large should I
> > choose the stripe size to achive optimal performance.  If I choose it
> > too large, I will probably loose the win of striping.

> You lose the advantage of striping if the stripe size is on the order
> of the file size.  You want stripes which will be narrower than most
> of the files you will be using.

I wonder if you are looking at a single file or general
throughput here.  

For a single file you may gain reading speed (writing is less
critical as it is buffered); however with a stripe size below
file size you will need to move the heads of both (or even
more) disks, increasing latency[1], effectively slowing down
reads unless you have fairly large files.

Often with more than one disk and randomly distributed files
(e.g. through the use of stripes) random files are on different
disks, so you can (best case) read as many files at the same
time -- in parallel -- as you have disks.  This is only true
for sufficiently large stripes, though.  Else a single file
blocks many/all disks, forcing longer/extra seeks for the
other files requested in parallel.

In conclusion (IMHO): 
- small stripes increase the latency even for small reads,
  hurting throughput (and slowing the reads even when looking
  at a single file).
- sufficiently large stripes allow both parallel reads of
  small[2] files or accelerated reads (at the cost of
  extra -- in this case insignificant[3] -- seek time) of
  single large[2] files.
- Systems where the I/O is not the bottleneck, i.e. parallel
  reads or accelerated reads of large files won't help much,
  will not profit from stripes while still increasing[4] the
  risk of data loss through HD/controller failure.
- With lvm you could pmove the most accessed blocks so that
  they are spread over all disks, probably you could even
  split those disks in 2 parts: the fast 'begin' (outer
  edge) of the platter and most of the (slower) inner parts.
  This would have much the same effect of stripes, but would
  need more attention (you need to run a program, probably
  even inactivating the LV) and probably have finer granularity.

[1] Your seek time rises -- on the average -- the more heads
    are in use.  With one head you get 1/3 full-seek time for
    a random head and file locations.  With two heads you need
    to move both heads, chances are that one of them has a
    longer way than the other.

    If you look at the first head, the seek time will be the
    same if the first head is further away --- which is more
    likely the further it is away, i.e. the higher the seek
    time already would be for a single disk system.  If it
    is close (which happens and is part of the 1/3 _average_
    seek time) then it is quite likely that the other head is
    further away -- thus the average seek time increases.

    This is quite uncritical for large files, but with short
    files the seek time is greater than the read time.  But only
    where the increased seek time is small against the read
    time a reduced read time can do reduce overall time --
    that is, only large files will be faster.

[2] small:  read time << seek time, fits in one stripe
    large:  read time >> seek time, does certainly not fit in
                                    one stripe

[3] read time >> seek time

[4] all disks are 'single point of failure'.  Most file systems
    do not like loosing spots all over the place.  But then you
    do backup religiously, test your backups and have recovery
    plans in place, yes?

-Wolfgang
