Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Mon, 26 Feb 2001 20:33:58 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] LVM and striping, defragmentation
Message-ID: <20010226203358.A2504@66bassett.freeserve.co.uk>
References: <m2pug5ph0m.fsf@isnogud.escape.de>
Mime-Version: 1.0
In-Reply-To: <m2pug5ph0m.fsf@isnogud.escape.de>; from urs@isnogud.escape.de on Mon, Feb 26, 2001 at 05:04:41PM +0100
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

On Mon, Feb 26, 2001 at 05:04:41PM +0100, Urs Thuermann wrote:
> I'd like to experiment with LVM and striping.  The HOWTO at
> www.linuxdoc.org says in section 8.3 LVM native striping
> 
>     Performance notices
> 
>     The performance 'gain' may well be very negative if you stripe over 2
>     partitions of the same disk - take care to prevent that.
> 
> 
> How can I take care of it?  I've seen no option in lvcreate to specify
> where the PE should be taken from.  If I have a VG with only two PVs on
> two different disks, will LVM automatically choose PEs from the two
> PVs instead of one PV?  And what if I have a VG with several PVs on
> disk A and several PVs on disk B.  How can I "take care to prevent"
> that LVM does not choose two PEs from the same disk for striping?

You have highlighted an area where we want to do more work.
Specifically we want to write a tool that allows you more control over
the LE->PE mapping.  The striping allocation will try and allocate
LE's from two different PV's in the VG.  When you create the striped
LV just try not to have two PV's on the same disk.  You can always
disable allocation on an individual PV basis.

> When I resize my LVs in a VG multiple times, I can get some
> fragmentation, i.e. LVs in the VG are not contiguous.  Is there a tool
> to defragment LVs, i.e. to swap PEs so that all LVs in the VG are
> contiguous again.  I read in the man page that the allocation policy
> can be set to "contiguous", but how can I make LVs contiguous after
> some creating, removing, and resizing of LVs?

At the moment it's not easy, you might want to look at the pvmove
documentation.

> How much performance loss is to be expected in case of non-contiguous LVs?

It shouldn't be large, the LE's are normally 4 meg so the seeks to
different parts of the disk won't be that frequent.  To contrast with
stripes where the chunk size defaults to 64K, which can cause a lot of
thrashing if the stripes are on the same disk.

- Joe
