From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] badiane:  Problem
Message-ID: <20011101103233.B16554@lynx.no>
References: <61741.64.34.222.41.1004630228.squirrel@webmail.tekmd.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61741.64.34.222.41.1004630228.squirrel@webmail.tekmd.com>; from gdurand@tekmd.com on Thu, Nov 01, 2001 at 10:57:08AM -0500
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
Date: Thu Nov  1 11:31:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gdurand@tekmd.com
Cc: linux-lvm@sistina.com

On Nov 01, 2001  10:57 -0500, gdurand@tekmd.com wrote:
> I have created five volume groups (vg0 - vg4) to hold respectively /var,
> /home, /home/music, /usr, /usr/local.

Just as an FYI - this is a very bad setup.  You should have 1 (or maybe 2)
VGs set up for these filesystems.  For a normal system, having a single
VG is far more flexible.  You can then "share" all of the unused PEs and
add them to whatever LV needs them.  If you have separate VGs, then you
are not much better off than having DOS partitions.

> Oh!  I had mounted the lv's on temp mount points /var2/, /home2/ etc and
> copied the original's data over and umounted so that upon remount they would
> again be avail able.

I would also suggest that you create these LVs as small as possible.  On
Debian in particular, you can have /usr almost 100% full, and only extend
it as necessary to install new packages.  Same with /home and /home/music -
give yourself a "reasonable" amount of free space in each, and leave the
rest unallocated, so you can add it where it is needed later.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
