From: Frank Joerdens <frank@joerdens.de>
Message-ID: <20020831223013.E17207@superfly.archi-me-des.de>
References: <20020831201710.B17207@superfly.archi-me-des.de> <20020831212421.C17207@superfly.archi-me-des.de> <3D712013.9070606@ednet.ns.ca> <20020831221652.D17207@superfly.archi-me-des.de>
Mime-Version: 1.0
In-Reply-To: <20020831221652.D17207@superfly.archi-me-des.de>; from frank@joerdens.de on Sat, Aug 31, 2002 at 10:16:53PM +0200
Subject: [linux-lvm] pvmove doesn't work (with either 1.0.5 or 1.1-rc2)
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
Date: Sat Aug 31 15:35:18 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Here's what I get:

limedes:/usr/src/LVM/1.1-rc2 # pvmove --verbose /dev/sdc1 /dev/hdd
pvmove -- checking name of source physical volume "/dev/sdc1"
pvmove -- locking logical volume manager
pvmove -- reading data of source physical volume from "/dev/sdc1"
pvmove -- checking volume group existence
pvmove -- checking volume group consistency of "funkadelic"
pvmove -- searching for source physical volume "/dev/sdc1" in volume
group "funkadelic"
pvmove -- building list of possible destination physical volumes
pvmove -- checking destination physical volume names in command line
pvmove -- checking volume group activity
pvmove -- moving physical extents in active volume group "funkadelic"
pvmove -- WARNING: if you lose power during the move you may need
        to restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- starting to move extents away from physical volume "/dev/sdc1"
pvmove -- checking for enough free physical extents in "funkadelic"
pvmove -- /dev/sdc1 [PE 7843 [projekte [LE 7843]] -> /dev/hdd [PE 21759]
[1/1]
pvmove -- ERROR reading input physical volume "/dev/sdc1" (still 65536
bytes to read)
pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents

As I mentioned before, there is exactly one PE left to move in this PV:

limedes:/usr/src/LVM/1.1-rc2 # pvdisplay /dev/sdc1
--- Physical volume ---
PV Name               /dev/sdc1
VG Name               funkadelic
PV Size               30.64 GB [64259937 secs] / NOT usable 944 KB [LVM:
151 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              7844
Free PE               7843
Allocated PE          1
PV UUID               mPFcyy-wTUk-X3OI-fczK-XzHN-lkdF-nDrH3q

Any ideas?

Thanks, Frank
