Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3O3vqLb002076
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 23:57:52 -0400
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3O3vePA003765
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 23:57:40 -0400
Subject: Re: [linux-lvm] Snapshot question... [scaling problem]
From: Ross Boylan <ross@biostat.ucsf.edu>
In-Reply-To: <1208880734.7871.86.camel@pc.ilinx>
References: <480DBE54.1090406@Media-Brokers.com>
	<chaz20080422104744.GI20413@artesyncp.com>
	<1208880734.7871.86.camel@pc.ilinx>
Content-Transfer-Encoding: 7bit
Date: Wed, 23 Apr 2008 20:57:25 -0700
Message-Id: <1209009445.11656.97.camel@corn.betterworld.us>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Tue, 2008-04-22 at 12:12 -0400, Brian J. Murrell wrote:
> On Tue, 2008-04-22 at 11:47 +0100, Stephane Chazelas wrote:
> > 
> > but
> > when you write to it, the system makes sure that unless it has
> > been done already, the block you're modifying are being copied
> > first from the "real" volume to COW volume before being modified
> > in the "real" volume.
> 
> And to be clear, the COW volumes of _all_ snapshots[1].  This is where
> the snapshot scaling problem arises.
Could someone say a bit more, because I definitely don't follow this.
If the [1] after snaphots means something, I don't know what.

I've seen references to this scaling problem before, and have never
quite gotten it.  The quoted paragraph above sounds as if it means
whenever there is a write to any volume, the COW tables for all
snapshots get the contents that are about to be overwritten.

I have multiple snapshots active, and it doesn't seem to work this way.
Some volumes have big snapshot volumes, into which substantial material
is written.  Others have small snapshot volumes, into which very little
is written.  In particular, the little ones don't seem to be getting the
writes to the big ones.  I judge how much of the COW is in use from the
output of lvdisplay (attached at bottom)

If all COW volumes get the overwritten material, then they'd all have
the same size in use.  And they don't seem to.

As I said, I'm missing something.  Could someone enlighten me?

Ross Boylan

lvdisplay for big volume shows
 LV Name                /dev/daisy/_var_spool_cyrus
 VG Name                daisy
 LV UUID                vUs6Bj-2DRx-4OVt-7FBr-K2dW-3gTV-AHpNRZ
 LV Write Access        read/write
 LV snapshot status     active destination for /dev/daisy/cyrspool
 LV Status              available
 # open                 0
 LV Size                23.62 GB
 Current LE             756
 COW-table size         12.00 GB
 COW-table LE           384
 Allocated to snapshot  29.78% 
 Snapshot chunk size    4.00 KB
 Segments               1
 Allocation             inherit
 Read ahead sectors     auto
 - currently set to     256
 Block device           254:41

and for the little one it shows
 LV Name                /dev/daisy/_var_lib_cyrus
 VG Name                daisy
 LV UUID                qkcv3k-XBYW-2gcx-pjbM-oF0g-Mlfk-P28QcH
 LV Write Access        read/write
 LV snapshot status     active destination for /dev/daisy/cyrlib
 LV Status              available
 # open                 0
 LV Size                96.00 MB
 Current LE             3
 COW-table size         128.00 MB
 COW-table LE           4
 Allocated to snapshot  33.32% 
 Snapshot chunk size    4.00 KB
 Segments               1
 Allocation             inherit
 Read ahead sectors     auto
 - currently set to     256
 Block device           254:38

I think this means the first one used 3.6G=12G*.30 while the second used
42.7MB = 128MB*.33.  The amount written to the first one exceeds the
total size available (128MB) for the 2nd snapshot.  I'm running Linux
kernel 2.6.18 as packaged for Debian.
