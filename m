From: Christian Hammers <ch@westend.com>
Message-Id: <20020209150809.GC28694@westend.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] error moving last PE away
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
Date: Sat Feb  9 09:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM@sistina.com

Hi

# pvmove   -v   /dev/hda10  /dev/hda8
...
pvmove -- /dev/hda10 [PE 999 [lvol5 [LE 1365]] -> /dev/hda8 [PE 560] [1/1]
pvmove -- ERROR reading input physical volume "/dev/hda10" (still 65536
bytes to read)
pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe
pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents

I wanted to release this partition from the LVM to use it with another OS.
The error once occured in June 2001 but I couldn't find a solution in the
archives.

Any ideas? More infos below.

bye,

-christian-

# uname -a
Linux app109 2.4.18-pre6 #7 Mit Jan 23 00:32:29 CET 2002 i686 unknown

# pvmove --version
pvmove: Logical Volume Manager 1.0.1
Heinz Mauelshagen, Sistina Software  26/11/2001 (IOP 10)

#  pvmove  -d -v   /dev/hda10  /dev/hda9
...
<333> pe_lock_internal -- CALLED for vg0
<4444> vg_check_name -- CALLED with VG: vg0
<55555> lvm_check_chars -- CALLED with name: "vg0"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pe_lock_internal -- LEAVING with ret: 0
<22> pv_move_pe -- LEAVING with ret: -253
<22> lvm_error -- CALLED with: -253
<22> lvm_error -- LEAVING with: "pv_move_pe(): read input PV"
pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe

<1> pv_move_pes -- LEAVING with ret: -253
<1> lvm_error -- CALLED with: -253
<1> lvm_error -- LEAVING with: "pv_move_pe(): read input PV"
pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0

# vgdisplay -v
--- Volume group ---
VG Name               vg0
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                4
Open LV               4
MAX LV Size           255.99 GB
Max PV                256
Cur PV                5
Act PV                5
VG Size               19.53 GB
PE Size               4.00 MB
Total PE              5000
Alloc PE / Size       2610 / 10.20 GB
Free  PE / Size       2390 / 9.34 GB
VG UUID               LuuTlh-HESy-ugJF-nxye-TC8f-MAe6-aIvT84

...

--- Physical volumes ---
PV Name (#)           /dev/hda6 (1)
PV Status             available / allocatable
Total PE / Free PE    1000 / 0

PV Name (#)           /dev/hda7 (2)
PV Status             available / allocatable
Total PE / Free PE    1000 / 1

PV Name (#)           /dev/hda8 (3)
PV Status             available / allocatable
Total PE / Free PE    1000 / 440

PV Name (#)           /dev/hda9 (4)
PV Status             available / allocatable
Total PE / Free PE    1000 / 950

PV Name (#)           /dev/hda10 (5)
PV Status             available / NOT allocatable
Total PE / Free PE    1000 / 999
