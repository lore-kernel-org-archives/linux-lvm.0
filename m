Return-Path: <soohoon.lee@api-networks.com>
Message-ID: <051DFF3BBA73D3119A5800A0C95BD021C03C32@barracuda.alpha-processor.com>
From: Soohoon Lee <soohoon.lee@api-networks.com>
Subject: RE: [linux-lvm] Problem using lvreduce
Date: Thu, 16 Aug 2001 13:06:39 -0400
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

That's the problem what I had.
I posted fix and waiting verification but 
mail traffic saying they are busy with 1.0 release and PE start point
problem.
And seems, this problem is also related to that PE start point problem.
Anyway, quick and no warranty fix is


--- pv_release_pe.c.old Thu Aug 16 09:23:35 2001
+++ pv_release_pe.c     Wed Aug 15 09:09:06 2001
@@ -85,7 +85,7 @@
          }
          pe_index = ( vg->lv[l]->lv_current_pe[p].pe - 
                       LVM_VGDA_SIZE ( vg->pv[pv_num]) / SECTOR_SIZE) /
-                      vg->pe_size;
+                      vg->pe_size - 1;
          debug ( "pv_release_pe -- pv_name: %s  pe: %lu  sector: %lu\n",
                   vg->pv[pv_num]->pv_name,
                   pe_index,



-----Original Message-----
From: Faux Pas III [mailto:fauxpas@trellisinc.com]
Sent: Wednesday, August 15, 2001 7:50 PM
To: linux-lvm@sistina.com
Subject: [linux-lvm] Problem using lvreduce


I have been having a problem removing a drive from a running 
volume group.  I repeat this by creating a volume group from
/dev/sda, /dev/sdb (each 18gb), /dev/hde, and /dev/hdg (each
30gb).  I create an LV that spans all physical extents in 
this group.  I then try to use lvreduce to take 4400 PE's out
of the group (slightly more than occupy either of the two 
scsi drives).

Gryphon:~# lvreduce -l -4400 /dev/test_vg/test_lv 
lvreduce -- WARNING: reducing active logical volume to 72.62 GB
lvreduce -- THIS MAY DESTROY YOUR DATA (filesystem etc.)
lvreduce -- do you really want to reduce "/dev/test_vg/test_lv"? [y/n]: y
lvreduce -- ERROR "pv_check_consistency_all_pv(): PE" volume group "test_vg"
is inconsistent
lvreduce -- WARNING: you don't have an automatic backup of "test_vg"
lvreduce -- logical volume "/dev/test_vg/test_lv" successfully reduced

After this, all manner of badness ensues, including:

Gryphon:~# vgdisplay
vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
vgscan

In any event, I'm not able to pvmove or vgreduce to get the drive out of
the volume group as I would expect.   This is on 2.4.8 + LVM 1.0, and also
manifests on 2.4.7 + LVM 0.9.1beta8.  I can provide any other diagnostic
info that would be helpful, as I can reproduce this problem easily.

-- 
Josh Litherland (fauxpas@trellisinc.com)
 It is by caffeine alone that I set my mind in motion.
  It is by the juice of Mtn Dew that thoughts acquire speed.
_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
