Message-ID: <3DA455BD.4090208@comedia.it>
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem with vgscan and md
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
Date: Wed Oct  9 11:14:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com
Cc: riccardo_brusa@hp.com

Hello,
I found a probable bug in vgscan up to LVM 1.0.5 due to lv device nodes 
renumbering

i found the problem in a shared storage environment, but it can be 
reproduced on a single machine

the problem can be reproduced with 2 md devices
create 2 vg each composed of 1 md device
let's say
VG /dev/vg00
Device 109:0
LV /dev/vg00/lvol1
Device 58:0
LV /dev/vg00/lvol2
Device 58:1
LV /dev/vg00/lvol3
Device 58:2
PV /dev/md0

VG /dev/vg01
Device 109:1
LV /dev/vg01/lvol1
Device 58:3
LV /dev/vg01/lvol2
Device 58:4
LV /dev/vg01/lvol3
Device 58:5
PV /dev/md1

now deactivate all VGs
raidstop /dev/md0
run vgscan -v

you have

VG /dev/vg01
Device 109:0
LV /dev/vg01/lvol1
Device 58:0
LV /dev/vg01/lvol2
Device 58:1
LV /dev/vg01/lvol3
Device 58:2
PV /dev/md1

vgchange -a y /dev/vg01

now raidstart /dev/md0

you need to run vgcan again, to see vg00

vgscan renumbers device node for vg00 so you get

VG /dev/vg00
Device 109:0
LV /dev/vg00/lvol1
Device 58:0
LV /dev/vg00/lvol2
Device 58:1
LV /dev/vg00/lvol3
Device 58:2
PV /dev/md0

vgscan cannot renumber device nodes for vg01 (which is active) so you 
also get

VG /dev/vg01
Device 109:0
LV /dev/vg01/lvol1
Device 58:0
LV /dev/vg01/lvol2
Device 58:1
LV /dev/vg01/lvol3
Device 58:2
PV /dev/md1

so we got two DIFFERENT vgs with the SAME device files

the need to run vgscan is due to having a shared storage so i might want 
to activate the md devices and vg devices on different nodes

Regards,
Luca


-- 
Luca Berra -- bluca@comedia.it
