Return-Path: <michael@visi.com>
Date: Sun, 17 Jun 2001 23:07:54 -0500
From: idsfa@visi.com
Subject: Re: [linux-lvm] What is a good stripe size?
Message-ID: <20010617230754.A2559@mitethe.eudyptes>
References: <134933704.992803570667.JavaMail.root@boots> <20010617233627.B18539@tiger.bigcats.invalid>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010617233627.B18539@tiger.bigcats.invalid>; from weissel@netcologne.de on Sun, Jun 17, 2001 at 11:36:27PM +0200
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

On Sun, Jun 17, 2001 at 11:36:27PM +0200, Wolfgang Weisselberg wrote:
> For a single file you may gain reading speed (writing is less
> critical as it is buffered); however with a stripe size below
> file size you will need to move the heads of both (or even
> more) disks, increasing latency[1], effectively slowing down
> reads unless you have fairly large files.

True, but I was assuming 'typical' use, which means < 2G of small files
(everything having to do with the OS) with the majority of the hard
drive space being used for files in the megabyte+ range (multimedia,
databases and so forth).  I can agree with your logical argument that
larger stripes are better for small files, but I would further argue
that striping a partition of small files is the wrong way to go.  If
you are looking for a performance increase on reads for small files,
you want to look@RAID1 (mirroring) or RAID 5 (if you have enough
disk controllers) or a filesystem which optimises access to small
files.

{ I neglected to mention in my example that I do not stripe my OS 
  partitions, but mirror them instead.  I stripe my /home (where I
  do graphics and sound work) and /games. }

> In conclusion (IMHO): 
> - small stripes increase the latency even for small reads,
>   hurting throughput (and slowing the reads even when looking
>   at a single file).

I'd have to change that to "increase the latency for small reads".
For files >> stripe size, you will see no increase in latency.
This was stated in your [1] endnote, as well.


> - sufficiently large stripes allow both parallel reads of
>   small[2] files or accelerated reads (at the cost of
>   extra -- in this case insignificant[3] -- seek time) of
>   single large[2] files.

Not argued.  I was assuming large files.  The answer to "how do I
configure X" is almost always, "what do you want to do with it?"

> - With lvm you could pmove the most accessed blocks so that
>   they are spread over all disks, probably you could even
>   split those disks in 2 parts: the fast 'begin' (outer
>   edge) of the platter and most of the (slower) inner parts.
>   This would have much the same effect of stripes, but would
>   need more attention (you need to run a program, probably
>   even inactivating the LV) and probably have finer granularity.

Something which would balance PEs within a VG based on their usage
would be a lovely system tool to add to lvm.  I can hardly wait for
your program  ;-)

Thanks for pointing out where I was making unspoken assumptions!

-- 
$ fortune -m Kellen
