From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
Message-Id: <20020206145137.J427@kluge.net>
References: <Pine.LNX.4.10.10202051326310.19683-100000@pzat.meep.org>
    <Pine.LNX.4.44.0202061338480.13203-100000@dragon.inside.ntisys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0202061338480.13203-100000@dragon.inside.ntisys.com>;
    from bscott@ntisys.com on Wed, Feb 06, 2002 at 02:14:05PM -0500
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
Date: Wed Feb  6 13:48:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Feb 06, 2002 at 02:14:05PM -0500, Benjamin Scott wrote:
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

Pot, kettle, black.

Yes, a AIT2 _TAPE_ is $90, but you need to factor in the drive, otherwise
the media is useless.  A $270 IDE drive is ready to go.  A quick look at
warehouse.com (to keep the numbers on-par):

AIT2 drive/Sony		2800 + 90 (tape) / 50GB   = 57.80
SuperDLT drive/LaCie	5000 + 150 (tape) / 110GB = 46.82
LTO Ultrium drive/HP	3650 + 130 (tape) / 100GB = 37.80
DDS-4 drive/Seagate	970 + 24 (tape) / 20GB    = 49.70


So yes, not surprisingly, tape is more expensive than disk everytime.
Even if you halfed the prices assuming full (2x) compression on the
tape. Now over time, the per GB price of tape will come down since you
only need the large outlay of cash once, but you can only use one tape
at a time at any given moment.


-- 
Randomly Generated Tagline:
"perl is awesome, perl is great
  perl gets my programs running without all the wait,
  perl lets me do my job smooth as silk,
  it even stays crispy in milk.." - Greg London
