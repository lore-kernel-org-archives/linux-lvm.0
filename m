Return-Path: <zricku@twitch.webtownis.bc.ca>
Date: Sun, 17 Dec 2000 18:31:29 -0800
From: rick@webtownis.bc.ca
Message-ID: <20001217183129.B884@twitch.webtownis.bc.ca>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] hd read error / some PEs won't pvmove - how to resolve?
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

Hi people,

I've searched the net, the mailing lists, and the documentation for the
solution to this, but I don't see anything obvious.

I had partitions on 45GB and 20GB drives in a volume group. Problems
developed with the 20GB drive, where certain blocks became undreadable.
I added a 13GB drive, and juggled some files to come up with another 8GB on
the 45GB, and pvmoved all the data off the 20 GB drive.

All except for 8 PEs, that is. pvmove fails with an error when I try to
move those particular PEs where the read errors are occuring. 

I don't need to worry about recovering that data. None of the affected
files are important enough to worry about. But I do need to remove the 
PV on the 20GB drive from the VG, which I can't do while these 8 PEs 
are still assigned to my LV. 

So! The only hint at a solution I've found for this in the mailing lists
is to replace the 20GB drive with an equal or greater size drive, and 
use vgcfgrestore to restore the PV information on that drive. I would assume
the PEs will still be allocated, but they'll just be empty of data. From 
that point on, recovery is a filesystem layer issue.

The problem is, I don't have a 20GB or greater drive lying around to replace
this one with until I get this one replaced on warranty, which I can't send
in for warranty until I can remove it from the volume group. Chicken and egg.

The other option I can consider is a painful piece-by-piece move of the data
from this VG into a new VG, gradually reducing one VG and expanding the other
until there's no data left on the first VG. If there's no better option, I'll
do this, but I'm not excited about it. Can I do this within the existing volume
group, or will the currently allocated PEs cause problems later on when I try
to remove that failed drive? (vgsplit?)

Any help appreciated, much thanks.


Rick
