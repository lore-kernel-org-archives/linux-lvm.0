From: Jeff Layton <jeffrey.b.layton@lmco.com>
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
Message-Id: <3C6187A0.3DFEA8BE@lmco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
References: <Pine.LNX.4.44.0202061338480.13203-100000@dragon.inside.ntisys.com>
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
Date: Wed Feb  6 13:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Benjamin Scott wrote:

> On Tue, 5 Feb 2002, James Hawtin wrote:
> > I think the reason most people don't do backups is because, hard disk
> > drives are really big and really cheap. Tape drives are really expensive,
> > media is also expensive and frankly tapes are very small for the cost.
>
>   Here are some prices from a recent Datacomm Warehouse catalog:
>
>   Item            GB   Cost  $/GB
>   --------------  ---  ----  ----
>   IDE HDD         100   270  2.70
>   AIT2             50    90  1.80
>   SuperDLT        110   150  1.36
>   LTO Ultrium     100   130  1.30
>   DDS-4            20    24  1.20
>
>   As you can see, hard disk is actually the most expensive media, not the
> least.  This whole "hard disks are cheaper" thing is a myth propagated by
> people who have never actually looked at the numbers.

   Be careful here. There are other possible issues (costs of
the tape drives, etc.). These appear to be just media numbers.
What about backup software costs? For the home user, this
is expensive (however, I agree with your comment below
about CD-RWs for home users).

   Large amounts of data brings in even more issues. How do
you stream Petabytes of data to tape in a resonable of time?
Unless you spend HUGE amounts of money to buy multiple
silos to handle slices of the data and put in a fantastic network
to handle the traffic, you can't backup in a reasonable amount
of time. In this case, disk is your only choice. The data size
break point between disk and tape depends on lots of things,
but that point is moving downward all the time (perhaps in
the Terabyte range).
   Of course, I don't know of any home users with this much
data, but I know lots of companies with this amount of data.

Jeff


>
>
> > Effective backup can double the cost of a system and requires time to
> > manage it.
>
>   Sure it can.  Losing your data will generally cost even more.
>
> > For the "home" market its just to much.
>
>   The home user has maybe, what, 100 MB of data to protect, tops?  You can
> fit that on a $2 CD-RW, for crying out loud.
>
> > This why people don't have backups in my book.
>
>   "Most people" don't have backups because they don't know any better, and
> likely don't care.  They bought their Pee Cee at Wal-Mart, and the most
> valuable thing on there is their collection of illegal music they downloaded
> before Napster went bust.  For those who have legitimately valuable data
> (e.g., financial data), they likely don't realize just how much it is going
> to cost them when (note -- *WHEN*, not *IF*) they lose it.
>
>   Sure, backups cost money.  You might spend $1500 on a data protection
> scheme for a small office server.  Of course, consider how much it would
> cost if they did not do that.  I know business that have *gone out of
> business* when they lost their only copy of mission-critical data.
>
>   $1500 vs bankruptcy.  Gee, tough call.
>
>   Anyone who has ever bothered to work out the numbers knows that backups
> are a bargain.  People who think otherwise are either ignorant or just plain
> don't want to know the truth.
>
> --
> Ben Scott <bscott@ntisys.com>
> | The opinions expressed in this message are those of the author and do not |
> | necessarily represent the views or policy of any other person, entity or  |
> | organization.  All information is provided without warranty of any kind.  |
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
