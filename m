Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102171618.f1HGI0L12286@webber.adilger.net>
Subject: Re: [linux-lvm] Newbie question: ERROR "pv_move_pe(): PE lock"  pv_move_pe
In-Reply-To: <E14U4vX-0006ka-00@whittlesey.cl.cam.ac.uk> from Piete Brooks at
 "Feb 17, 2001 10:49:19 am"
Date: Sat, 17 Feb 2001 09:18:00 -0700 (MST)
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

Piete Brooks writes:
> I got the data onto the RAID device, and when that's active, I get a
> different message:
> 
> # pvmove /dev/md7
> pvmove -- ERROR "pv_read(): multiple device" reading source physical volume 
> "/dev/md7"

This is because (I don't know why) LVM user tools return an "error code"
when accessing an MD device.  It is up to the caller to single out the
MD error code, and pretend like it is OK.  Probably pvmove (or pv_read)
doesn't do this correctly.  IMO we should treat MD devices just like
regular devices, since pv_read_all_pv_of_vg() already cleans this up for us.

Maybe the MD cleanup should be moved down to pv_read_all_pv() and be
done with it?  This may cause some problems if people are doing changes
to LVM when the MD devices are not active, but this problem is there no
matter where we do filtering of MD devices.

In any case, try the below patch, and it should fix this problem.

Cheers, Andreas
=============================================================================
diff -u -u -r1.3.2.5 pvmove.c
--- tools/pvmove.c	2001/02/14 14:48:01	1.3.2.5
+++ tools/pvmove.c	2001/02/17 16:12:49
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
