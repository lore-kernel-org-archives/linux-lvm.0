From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM 1.0.4 pvmove is broken
Message-ID: <20020524131106.A16236@sistina.com>
References: <F888C30C3021D411B9DA00B0D0209BE8038F94F7@cvo-exchange.cvo.roguewave.com>
Mime-Version: 1.0
In-Reply-To: <F888C30C3021D411B9DA00B0D0209BE8038F94F7@cvo-exchange.cvo.roguewave.com>; from petersp@roguewave.com on Wed, May 22, 2002 at 04:22:04PM -0700
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
Date: Fri May 24 06:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Poul,

please try the  patch below which should fix the locking problem I
introduced in 1.0.4.

This is against a clean 2.4.18 kernel patched with LVM 1.0.4.

Regards,
Heinz    -- The LVM Guy --

--- linux-2.4.18-LVM-1.0.4/drivers/md/lvm.c     Fri May 24 15:03:22 2002
+++ linux-2.4.18-LVM-1.0.4.patched/drivers/md/lvm.c     Fri May 24 14:57:11 2002
@@ -1488,26 +1488,22 @@
                        continue;

                if (strcmp(lv_ptr->lv_name, le_remap_req.lv_name) == 0) {
-                       down_read(&lv_ptr->lv_lock);
+                       down_write(&lv_ptr->lv_lock);
                        for (le = 0; le < lv_ptr->lv_allocated_le; le++) {
                                if (lv_ptr->lv_current_pe[le].dev ==
                                    le_remap_req.old_dev &&
                                    lv_ptr->lv_current_pe[le].pe ==
                                    le_remap_req.old_pe) {
-                                       up_read(&lv_ptr->lv_lock);
-                                       down_write(&lv_ptr->lv_lock);
                                        lv_ptr->lv_current_pe[le].dev =
                                            le_remap_req.new_dev;
                                        lv_ptr->lv_current_pe[le].pe =
                                            le_remap_req.new_pe;
-                                       up_write(&lv_ptr->lv_lock);
-                                       down_read(&lv_ptr->lv_lock);
-
                                        __update_hardsectsize(lv_ptr);
+                                       up_write(&lv_ptr->lv_lock);
                                        return 0;
                                }
                        }
-                       up_read(&lv_ptr->lv_lock);
+                       up_write(&lv_ptr->lv_lock);
                        return -EINVAL;
                }
        }

On Wed, May 22, 2002 at 04:22:04PM -0700, Poul Petersen wrote:
> 	I've done a lot of testing with pvmove and these are the results:
> 
> 	1) The pvmove tool (versions 1.0.3, 1.0.4, 1.1-rc2) all fail on an
> active volume group when running a LVM-1.0.4 patched 2.4.18 kernel
> 
> 	2) If the volume group is inactive, pvmove works fine in all cases.
> 
> 	3) The LVM-1.0.3 and 1.1-rc2 patches against the 2.4.18 kernel also
> work fine with all versions of pvmove.
> 
> 	4) The RedHat 7.2 call to vgscan in rc.sysinit happens before
> mounting other file-systems, for example "/usr". This causes the 1.1-rc2
> vgscan to fail since libreadline is in /usr/lib. 
> 
> 	By using the -vv option to pvmove, I can see that pvmove is hanging
> at lv_le_remap from tools/lib (see attached pvmove output) - this combined
> with the strace output I posted before suggests that the ioctl call in
> tools/lib/lv_le_remap.c is where it is dying. 
> 
> 	I've tested this on three different machines (RedHat 7.1, 7.2) with
> the same results, so I don't think I am doing anything wrong. There seems to
> be something amiss in the Makefile generated patch for lvm-1.0.4 with kernel
> 2.4.18. I welcome any suggestions on how I can persue tracking this problem
> down. I would like to use 1.0.4 as it is the latest stable release and I
> intend to install it on a production machine, so I would like to avoid
> 1.1-rc2.
> 
> Thanks,
> 
> -poul
> 
> --- pvmove output 
> 
> [root@nfs1node1 root]# pvmove -vv /dev/sdb1
> pvmove -- checking name of source physical volume "/dev/sdb1"
> pvmove -- locking logical volume manager
> pvmove -- reading data of source physical volume from "/dev/sdb1"
> pvmove -- checking volume group existence
> pvmove -- reading data of volume group "vg0" from lvmtab
> pvmove -- checking volume group consistency of "vg0"
> pvmove -- searching for source physical volume "/dev/sdb1" in volume group
> "vg0"
> pvmove -- building list of possible destination physical volumes
> pvmove -- checking volume group activity
> pvmove -- moving physical extents in active volume group "vg0"
> pvmove -- WARNING: if you lose power during the move you may need to restore
> your LVM metadata from backup!
> pvmove -- do you want to continue? [y/n] y
> pvmove -- starting to move extents away from physical volume "/dev/sdb1"
> pvmove -- checking for enough free physical extents in "vg0" lv:
> /dev/vg0/lv0[1]  old_dev: 08:17  new_dev: 08:18  old_pe_sector: 8576
> new_pe_sector: 8576
> pvmove -- opening output physical volume "/dev/sdb2"
> pvmove -- llseeking input physical volume "/dev/sdb1"
> pvmove -- llseeking output physical volume "/dev/sdb2"
> pvmove -- /dev/sdb1 [PE 0 [lv0 [LE 0]] -> /dev/sdb2 [PE 0] [1/25]
> pvmove -- locking physical extent 0 of "/dev/sdb1" in kernel
> pvmove -- about to read input physical volume "/dev/sdb1" and to write
> output physical volume "/dev/sdb2"
> pvmove -- remapping physical extent in VGDA of kernel
> pvmove -- unlocking physical extent
> pvmove -- changing source "/dev/sdb1" in VGDA of kernel
> pvmove -- changing destination "/dev/sdb2" in VGDA of kernel
> pvmove -- writing physical extent part of VGDA on source "/dev/sdb1"
> pvmove -- writing physical extent part of VGDA on destination "/dev/sdb2"
> lv: /dev/vg0/lv0[1]  old_dev: 08:17  new_dev: 08:18  old_pe_sector: 16768
> new_pe_sector: 16768
> pvmove -- opening output physical volume "/dev/sdb2"
> pvmove -- llseeking input physical volume "/dev/sdb1"
> pvmove -- llseeking output physical volume "/dev/sdb2"
> pvmove -- /dev/sdb1 [PE 1 [lv0 [LE 1]] -> /dev/sdb2 [PE 1] [2/25]
> pvmove -- locking physical extent 1 of "/dev/sdb1" in kernel
> pvmove -- about to read input physical volume "/dev/sdb1" and to write
> output physical volume "/dev/sdb2"
> pvmove -- remapping physical extent in VGDA of kernel
> 
> *This is where it dies*
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
