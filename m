From: Werner John <john@oswf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <15311.48872.60607.177579@rigel.oswf.de>
Date: Fri, 19 Oct 2001 07:49:28 +0200
Subject: Re: [linux-lvm] Horrid performance with 2.4.{9,10,12} + LVM + ReiserFS
In-Reply-To: <20011018201943.B1724@omnifarious.org>
References: <20011018000006.A22777@jensbenecke.de>
	<15310.40503.356813.663284@rigel.oswf.de>
	<20011019030045.O25054@jensbenecke.de>
	<20011018201943.B1724@omnifarious.org>
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
To: linux-lvm@sistina.com

Eric M. Hopper writes:
> On Fri, Oct 19, 2001 at 03:00:45AM +0200, Jens Benecke wrote:
> > > Well, you have 1 disk on a single channel (hda) and the other two as
> > > master and slave on *one* channel. That's the bottleneck. If the disks
> > > are accessed individually, you get the full performance (more or less).
> > > But if *both* disks have to respond, performance drops horribly.  Best is
> > > to get a third IDE controller.
> > 
> > As the disks aren't interleaved (just appended to each other) I don't think
> > this is a problem. I use LVM because I don't want to split up the FTP
> > server space with a huge chaos of symlinks and partitions, not because I
> > absolutely need RAID performance.
> 
> 	This could still be a problem if you have two LVs on the VG that
> spans both disk, and one LV is mainly on one disk, and the other is
> mainly on the other, and you end up accessing both filesystems at the
> same time, you still get a contention problem.  This is a lot of 'ifs',
> but it can still happen.  :-)

As Eric said, appending disks does not prevent a scenario where you have
some data that spans across hdc and hdd. Or just think about the filesystem
itself. You'll never really know where files are placed on the partition...

Yours,
	Werner

> 	The disk space problem is the much more likely culprit.  *grin*
>
> Have fun (if at all possible),
> -- 
> "It does me no injury for my neighbor to say there are twenty gods or no God.
> It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
> "Go to Heaven for the climate, Hell for the company."  -- Mark Twain
> -- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper) --
