Message-Id: <3C6188F0.9040501@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
References: <Pine.LNX.4.44.0202061338480.13203-100000@dragon.inside.ntisys.com>
Content-Transfer-Encoding: 7bit
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
Date: Wed Feb  6 13:52:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Yes, but people who think they can backup to harddrives think they can 
backup to one drive.  They think they need gobs of tapes. Sometimes they 
don't think things thru.  They do need gobs of tapes, but in order to 
get the same redundancy they need gobs of drives.  They don't think like 
that.

I have a several gig at a minimum of stuff I would want backed up 
personally.  I work on a lot of code, and I have a lot of modifications 
and/or patches to software I would want to keep around.  Just be cause 
it is a home user machine, doesn't mean they don't use disk space.

Most small businesses generally don't do a good job at testing backups 
and that is the real trick.  I have worked at several places that failed 
to check if backups even work on a regular basis, they just rotate tapes 
and that is it.  Common things overheard when dealing with backups: 
Labels?  What are labels?  Which tape is for last Tuesday, I guess I 
will just have to try them all.  Cleaning tape, nobody told me I needed 
a cleaning tape!

And sometimes it is easier to go out of business then come up with 
$1,500.  You think like an insurance expert.  You understand bad things 
happen, and if you pay a little up front that it will cover the big 
badass expense later on.  Bean counters never see that, they see an 
unecessary expense because bad things don't happen on a weekly basis. 
They have other expense they know will happen so they want to spend 
money on that.

		Kirby





Benjamin Scott wrote:
> On Tue, 5 Feb 2002, James Hawtin wrote:
> 
>>I think the reason most people don't do backups is because, hard disk
>>drives are really big and really cheap. Tape drives are really expensive,
>>media is also expensive and frankly tapes are very small for the cost.
>>
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
> 
> 
>>Effective backup can double the cost of a system and requires time to
>>manage it.
>>
> 
>   Sure it can.  Losing your data will generally cost even more.
> 
> 
>>For the "home" market its just to much.
>>
> 
>   The home user has maybe, what, 100 MB of data to protect, tops?  You can
> fit that on a $2 CD-RW, for crying out loud.
> 
> 
>>This why people don't have backups in my book.
>>
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
> 
