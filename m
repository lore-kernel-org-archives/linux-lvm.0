From: "Steve Wray" <steve.wray@paradise.net.nz>
Subject: RE: [linux-lvm] lvm and 'poor mans raid' on heterogenous hard drives!
Message-Id: <NBBBKLKHMJHIJLHOGAOJIEPAJEAA.steve.wray@paradise.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020219221959.P25713@lynx.adilger.int>
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
Date: Tue Feb 19 23:47:02 2002
List-Id: <linux-lvm.redhat.com>
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-lvm@sistina.com

> From: Andreas Dilger [mailto:adilger@turbolabs.com]
>
> On Feb 20, 2002  15:54 +1300, Steve Wray wrote:
> > Ok so I have 4 hard drives of very varying capacity
> > I think 'maybe I can take advantage of the IDE
> > system and put a drive on each master and stripe them.'
> >
> > I expected some performance improvements.  Interestingly,
> > the performance improvement is not dramatic, I expected better.
>
> Well, basically you cannot get performace much better than 4x
> the slowest disk.  The reason would be that because it is striped
> across all 4 disks, no matter how fast the other disks run you
> will always have to end up waiting for the slowest disk to complete
> every 4th block I/O.

Yes, I think I've factored that in; While the disks are very
heterogenous, the motherboard is an old VIA chipset, from
TMI. Its onboard controller is UDMA33. The 2 drives that are
plugged into it are both capable of UDMA66. Sometime I'll
get a newer muthaboard :)
Meanwhile, the promise card is at UDMA66, only one of the drives
plugged into it is capable of 66 and its only on 40 cable,
so its working at 33 as well. The other drive only goes at 33
too.
So, overall, the system is UDMA33 which I figured would be minimising
the impact of a heterogenous architecture.
But obviously all this DOES introduce piles of other variables!
Differing cache in the drives for one thing.


> I think you will find that the performance of modern UDMA disks
> is far better than any of the older disks, so you are better off
> just using the single large disk for best performance & reliability.

yeah but the m/board won't help the new drive. I think that the 20G
drive is quite a bit newer than the MB (which I think was one of the
first ATX boards out. The bios even crashes at the chipset screen 8)
Yes, and I'm trying to benchmark this mongrel. Ah well I'm learning!


> > The main improvement seems to be that the striped volumes
> > do better with larger file sizes and as file size increases
> > the striped volume keeps its performance up better.
>
> The other problem (as I always complain about whenever people try
> striping and it doesn't work) is that unless you do large file
> I/O (as you have seen) you don't get much performance gains.  This
> is because for each small* read you basically have to wait for the
> maxiumu seek time of all of the disks to do a read.  For normal I/O
> patterns this is really bad.

This is very very true. I'm having second thoughts about having
all of /var on it. Maybe seperate some of the /var directories
into their own striped volumes.

But what do you think of the huge drop in performance at file sizes
of 16M and up (at all block sizes)?
It goes from 50Mps down to less than 20Mps starting when the file size
hits 16M? Looking at the figures, it virtually halves.
Read is even more dramatic from 108213Kps at 8192K files down to
14796Kps at 16384K files!
Now this is the same, striped or non striped; striping just smoothes
things out on either side of the step!
All the filesystems are LVM at standard extent size with ext3 filesystems
and default journalling.

Uh oh, this is getting off topic! (LVM)


> (*) small means larger than the stripe size and less than maybe 8-12
>     stripes.
>
> You also have the problem that you are 4x as likely to lose all of
> your data in this case.

yeah but its only /var, /usr/lib, /usr/share, /tmp, swap that sort of thing.
I think swap may have been a mistake looking at the benchmark!
