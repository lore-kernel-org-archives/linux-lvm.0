Return-Path: <piete.brooks@cl.cam.ac.uk>
In-reply-to: Your message of Wed, 14 Feb 2001 19:18:31 +0100.
             <20010214191831.A12417@trez42.net> 
Mime-Version: 1.0
Date: Sat, 17 Feb 2001 09:26:43 +0000
From: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Message-Id: <E14U3db-0006f9-00@whittlesey.cl.cam.ac.uk>
Subject: [linux-lvm] Newbie question: ERROR "pv_move_pe(): PE lock" pv_move_pe
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

I was unable to create RAID1 PVs under 0.9.1_beta2 (RH 7.0.90 - Fisher), so I 
used some raw partitions. I upgraded to 0.9.1_beta4 (which fixed the OOPS or 
boot - great!) and have managed to create and add the RAID PV.

I'd like to remove the old PVs, and the empty one was `vgreduce's OK, but I 
can't pvmove the data from the old one.

# pvmove /dev/hda9 
pvmove -- moving physical extents in inactive volume group "vg01"
pvmove -- WARNING: moving of active logical volumes may cause data loss!
pvmove -- do you want to continue? [y/n] y
pvmove -- ERROR "pv_move_pe(): PE lock" pv_move_pe

pvmove -- ERROR "pv_move_pe(): PE lock" moving physical extents

# 

Any ideas ?

I was hoping to HACK it pro tem, and create new LVs by specifying the PVs to 
use, but this too failed:

# lvcreate -L 50M -n repl vg01 /dev/md8
lvcreate -- rounding up size to physical extent boundary "52 MB"
lvcreate -- couldn't read physical volume "/dev/md8"

# 

Should this work ? (the man page doesn't describe `[PhysicalVolumePath...]'


Not directly LVM, but if I run out of inodes, is there some way to extend an 
ext2 FS so that the ratio of inodes/block is higher than the original FS ?


%  cat /proc/lvm/global     
LVM driver version 0.9.1_beta4 (09/02/2001)

Total:  1 VG  2 PVs  2 LVs (0 LVs open)
Global: 12656 bytes malloced   IOP version: 10   11:29:30 active

VG:  vg01  [2 PV, 2 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 2097152 /512 total  122880 /30 used  1974272 /482 free
  PVs: [AA] hda9                   1048576 /256       106496 /26     942080/230
       [AA] md8                    1048576 /256            0 /0     1048576/256
    LVs: [AWDL  ] lv01                        106496 /26       close
         [ARDL  ] snap-lv01                   106496 /26       close
%
