Message-ID: <3E704492.DF386E61@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems and questions with LVM on a large raid system.
References: <20030312195217.GC18876@auctionwatch.com> <20030312221320.GA15196@gw.silicide.dk> <20030312234520.GA19335@auctionwatch.com>
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
Date: Thu Mar 13 02:44:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Petro wrote:

[cut]

>     The production data we gathered showed the opposite--at least for the
>     3ware cards in our environment (we had about 5-8% more overhead
>     running the 3ware cards RAID0 than we did running either raw disk
>     (cheap IDE cards) or having the 3ware card pretend to be a jbod.

you mean the cpu was more used ?

 
>     This wasn't benchmarking, this was set it up and throw it over the
>     wall for a month or two and see what the numbers looked like.

i ran quite alot of tiobench on it with various parameters. I still
have a .pdf somewhere if you want it.

 
>     A really nervous way of testing.
> 
> > > I'm running kernel 2.4.18, with LVM version 1.0.3, and the lvmtools
> > > version 1.0.1rc3-1 (long story, but upgrading is a path-of-last-resort).
> > if you need snapshots, get 1.0.7
> 
>     If I get the chance I'm probably going to ditch LVM since I don't
>     need snapshots. I initially was give snapshots as a requirement.
> 
>     Unfortunately I'll probably not get a chance to redo these.

a shame, because if you dont need snapshots, LVM is a overhead.

 
[cut]

> > that depends. You can stripe the lvm, but then you cant resize it.
> > if you made a LV, then it would proberly just allokate all on one
> > "disk", aka sda, and then on sdb.
> 
>     I'm using 100% of the VG for the same LV.
> 
>     I'm fine with not being able to resize it. Do I need the MD stuff to
>     stripe it?

No. You can stripe using the LV system. But i would think that
if you can shutdown the LV, then you might as well stop the VG,
and do it on the raw device. (except this isnt as future proof
as a LVM system is).

 
> > > Since I need the disk write rate of all 6 drives, I'm *REALLY* hoping
> > > that it's interleaved.
> > sorry... it is not interleaved.
> > JonB
> > ps: how big a partition do you need stripping for? Do you need the
> > advanced LVM stuff, like resize, snapshot...
> 
>     I need slightly over 1T of formatted disk space on each system.
> 
>     Which means i really need to find a way to send an <alt-3> through
>     an ssh session to a telnet window.

may i suggest
http://www.realweasel.com/intro.html
It's a pci GFX<->serial card.
I dont have one, but i want 3. If you buy one... do tell us how it
works.



JonB
