Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102201824.f1KIOBl13089@webber.adilger.net>
Subject: Re: [linux-lvm] Newbie question: ERROR "pv_move_pe(): PE lock"
In-Reply-To: <E14UARa-00078r-00@whittlesey.cl.cam.ac.uk> from Piete Brooks at
 "Feb 17, 2001 04:42:46 pm"
Date: Tue, 20 Feb 2001 11:24:10 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Piete.Brooks@cl.cam.ac.uk

It looks like the fix for this problem is not yet in CVS.  I'm pretty sure
Heinz has taken a look at the patch already as well (at least he commented
on this thread).  This fixes a BUG where it is not possible to do pvmove
on an MD device.

> > In any case, try the below patch, and it should fix this problem.
> 
> # pvmove /dev/md7
> pvmove -- moving physical extents in active volume group "vg01"
> pvmove -- WARNING: moving of active logical volumes may cause data loss!
> pvmove -- do you want to continue? [y/n] y
> pvmove -- doing automatic backup of volume group "vg01"
> pvmove -- 76 extents of physical volume "/dev/md7" successfully moved
>
> Many thanks -- seems to work a treat !

Here is the patch again.

Cheers, Andreas
============================================================================
diff -u -u -r1.3.2.5 pvmove.c
--- tools/pvmove.c	2001/02/14 14:48:01	1.3.2.5
+++ tools/pvmove.c	2001/02/20 18:16:22
@@ -234,7 +234,8 @@
 
    if ( opt_v > 0) printf ( "%s -- reading data of source physical volume "
                             "from \"%s\"\n", cmd, src_pv_name);
-   if ( ( ret = pv_read ( src_pv_name, &pv, NULL)) < 0) {
+   if ( ( ret = pv_read ( src_pv_name, &pv, NULL)) < 0 &&
+	ret != -LVM_EPV_READ_MD_DEVICE) {
       if ( ret == -LVM_EPV_READ_OPEN) {
          fprintf ( stderr, "%s -- source physical volume \"%s\" "
                            "doesn't exist\n\n",

-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
