From: Simon Kirby <sim@netnation.com>
Message-ID: <20031204011236.GA5622@simulated.ca>
References: <3FCB4AFB.3090700@backtobasicsmgmt.com> <20031201141144.GD12211@suse.de> <3FCB4CFA.4020302@backtobasicsmgmt.com> <20031201155143.GF12211@suse.de> <3FCC0EE0.9010207@backtobasicsmgmt.com> <20031202082713.GN12211@suse.de> <Pine.LNX.4.58.0312021009070.1519@home.osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0312021009070.1519@home.osdl.org>
Subject: [linux-lvm] Re: Reproducable OOPS with MD RAID-5 on 2.6.0-test11
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
Date: Thu Dec  4 08:58:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-raid maillist <linux-raid@vger.kernel.org>
Cc: Jens Axboe <axboe@suse.de>, Neil Brown <neilb@cse.unsw.edu.au>, "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@osdl.org>, linux-lvm@sistina.com

On Tue, Dec 02, 2003 at 10:23:17AM -0800, Linus Torvalds wrote:

> On Tue, 2 Dec 2003, Jens Axboe wrote:
> >
> > Smells like a bio stacking problem in raid/dm then. I'll take a quick
> > look and see if anything obvious pops up, otherwise the maintainers of
> > those areas should take a closer look.
> 
> There are several other problem reports which start to smell like md/raid.

Btw, I had trouble creating a linear array (probably not very common)
with size > 2 TB.  I expected it to just complain, but it ended up
resulting in hard lockups.  With a slight size change (removed one
drive), it ended up printing a double fault Oops, and all sorts of neat
stuff.  I suspect the hashing was overflowing and writing bits in
unexpected places.

In any event, this patch against 2.6.0-test11 compiles without warnings,
boots, and (bonus) actually works:

--- drivers/md/linear.c.orig	2003-10-29 08:16:35.000000000 -0800
+++ drivers/md/linear.c	2003-12-03 16:19:59.000000000 -0800
@@ -214,10 +214,11 @@
 		char b[BDEVNAME_SIZE];
 
 		printk("linear_make_request: Block %llu out of bounds on "
-			"dev %s size %ld offset %ld\n",
+			"dev %s size %lld offset %lld\n",
 			(unsigned long long)block,
 			bdevname(tmp_dev->rdev->bdev, b),
-			tmp_dev->size, tmp_dev->offset);
+			(unsigned long long)tmp_dev->size,
+			(unsigned long long)tmp_dev->offset);
 		bio_io_error(bio, bio->bi_size);
 		return 0;
 	}
--- include/linux/raid/linear.h.orig	2003-11-26 12:45:44.000000000 -0800
+++ include/linux/raid/linear.h	2003-12-03 16:18:00.000000000 -0800
@@ -5,8 +5,8 @@
 
 struct dev_info {
 	mdk_rdev_t	*rdev;
-	unsigned long	size;
-	unsigned long	offset;
+	sector_t	size;
+	sector_t	offset;
 };
 
 typedef struct dev_info dev_info_t;

Simon-
