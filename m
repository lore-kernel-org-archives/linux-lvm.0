From: Andreas Dilger <adilger@turbolabs.com>
Message-Id: <200006272002.e5RK2FR13447@webber.adilger.net>
Subject: [linux-lvm] using LVM on top of mingo raid
Date: Tue, 27 Jun 2000 14:02:15 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>
Cc: linux-raid@vger.rutgers.edu

Hello,
I'm trying to get LVM 0.8 on top of Ingo's 0.9 RAID patches with 2.2.16
(this appears to be the same issue as applying LVM on top of a RedHat
kernel, which came up on the LVM list a few times, but was never answered).

There is a problem with applying the LVM patch to ll_rw_block.c, which
I think I have fixed, but I'm not very certain of the RAID code, so I'd
like some comments on these changes:

2.2.16+LVM looks like :::: drivers/block/ll_rw_blk.c ::::::::::
============================================================================
#ifdef CONFIG_BLK_DEV_MD
                if (major==MD_MAJOR &&
                    /* changed             v   to allow LVM to remap */
                    md_map (MINOR(bh[i]->b_rdev), &bh[i]->b_rdev,
                            &bh[i]->b_rsector, bh[i]->b_size >> 9)) {
                        printk (KERN_ERR
                                "Bad md_map in ll_rw_block\n");
                        goto sorry;
                }
#endif
 [[[[snip]]]]
			/* changed         v  to allow LVM to remap */
                        if (MAJOR(bh[i]->b_rdev) == MD_MAJOR) {
                                /* changed for LVM to remap     v */
                                md_make_request(MINOR (bh[i]->b_rdev), rw, bh[i]);
                                continue; 
                        } 
============================================================================
2.2.16+RAID0.9+LVM looks like this :::: drivers/block/ll_rw_blk.c ::::::::::
============================================================================
#ifdef CONFIG_BLK_DEV_MD
                if (major==MD_MAJOR &&
-                   md_map (bh[i]->b_dev, &bh[i]->b_rdev,
+                   /* changed       v   to allow LVM to remap */
+                   md_map (bh[i]->b_rdev, &bh[i]->b_rdev,
                            &bh[i]->b_rsector, bh[i]->b_size >> 9)) {
                        printk (KERN_ERR
                                "Bad md_map in ll_rw_block\n");
                        goto sorry;
                }
#endif
 [[[[snip]]]]
-                        if (MAJOR(bh[i]->b_dev) == MD_MAJOR) {
+                        /* changed         v  to allow LVM to remap */
+                        if (MAJOR(bh[i]->b_rdev) == MD_MAJOR) {
                                md_make_request(bh[i], rw);
                                continue; 
                        } 

 :::::::: in drivers/block/md.c ::::::::::
static int md_make_request()
{
-	mddev_t *mddev = kdev_to_mddev(bh->b_dev);
+       /* changed                           v to allow LVM to remap */
+	mddev_t *mddev = kdev_to_mddev(bh->b_rdev);
============================================================================

The md_make_request() uses the same mddev (i.e. uses b_rdev instead of b_dev)
in 2.4-test1, so I think this is correct.  I'm not certain of md_map()
because it no longer exists in 2.4.  The change looks like it would work
(going from old to new RAID), but I have no idea as I've never set up RAID
before so there could be any number of problems...

Cheers, Andreas

PS - I'm not on the linux-raid list, so please CC any replies to me or
     linux-lvm@msede.com
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
