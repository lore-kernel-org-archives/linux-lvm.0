From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
Message-Id: <20020206195034.GA24344@auctionwatch.com>
References: <Pine.LNX.4.10.10202051326310.19683-100000@pzat.meep.org>
    <Pine.LNX.4.44.0202061338480.13203-100000@dragon.inside.ntisys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0202061338480.13203-100000@dragon.inside.ntisys.com>
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
Date: Wed Feb  6 13:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Feb 06, 2002 at 02:14:05PM -0500, Benjamin Scott wrote:
> On Tue, 5 Feb 2002, James Hawtin wrote:
> > I think the reason most people don't do backups is because, hard disk
> > drives are really big and really cheap. Tape drives are really expensive,
> > media is also expensive and frankly tapes are very small for the cost.
>   Here are some prices from a recent Datacomm Warehouse catalog:
>   Item            GB   Cost  $/GB
>   --------------  ---  ----  ----
>   IDE HDD         100   270  2.70
>   AIT2             50    90  1.80
>   SuperDLT        110   150  1.36
>   LTO Ultrium     100   130  1.30
>   DDS-4            20    24  1.20
>   As you can see, hard disk is actually the most expensive media, not the
> least.  This whole "hard disks are cheaper" thing is a myth propagated by
> people who have never actually looked at the numbers.

    Ok, now factor in time to back up a volume. 

    1 terabyte of small images from netapp F760 to a tape unit takes us
    almost 45 hours.

    Of course, that data has changed by 5 to 10 percent in that 45
    hours.

    It takes less than 20 to dump it to a cheap IDE JBOD/Linux raid
    solution. 

> > Effective backup can double the cost of a system and requires time to
> > manage it.
>   Sure it can.  Losing your data will generally cost even more.

    Yup. Losing data often enough, or in sufficient quantites can kill
    your company.

> > For the "home" market its just to much.
>   The home user has maybe, what, 100 MB of data to protect, tops?  You can
> fit that on a $2 CD-RW, for crying out loud.
> > This why people don't have backups in my book.
 
>   "Most people" don't have backups because they don't know any better, and

    I don't do backups at home because I generally have the important
    data (err...my resume) replicated slapdash over several machines.
    Everything lese I can re-download from the net, or re-install from
    CD. 

    At work, well that's a different story. 
-- 
Share and Enjoy. 
