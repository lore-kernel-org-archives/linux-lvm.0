Return-Path: <fauxpas@trellisinc.com>
Date: Wed, 15 Aug 2001 19:50:08 -0400
From: Faux Pas III <fauxpas@trellisinc.com>
Message-ID: <20010815195008.A9648@trellisinc.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Problem using lvreduce
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
lvreduce -- ERROR "pv_check_consistency_all_pv(): PE" volume group "test_vg" is inconsistent
lvreduce -- WARNING: you don't have an automatic backup of "test_vg"
lvreduce -- logical volume "/dev/test_vg/test_lv" successfully reduced

After this, all manner of badness ensues, including:

Gryphon:~# vgdisplay
vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan

In any event, I'm not able to pvmove or vgreduce to get the drive out of
the volume group as I would expect.   This is on 2.4.8 + LVM 1.0, and also
manifests on 2.4.7 + LVM 0.9.1beta8.  I can provide any other diagnostic
info that would be helpful, as I can reproduce this problem easily.

-- 
Josh Litherland (fauxpas@trellisinc.com)
 It is by caffeine alone that I set my mind in motion.
  It is by the juice of Mtn Dew that thoughts acquire speed.
