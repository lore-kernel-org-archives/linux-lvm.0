From: Trond Michelsen <mike@crusaders.no>
Message-ID: <20031004210122.S14777@crusaders.no>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] removing a bad HD
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
Date: Sat Oct  4 14:17:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi.

Recently a harddrive in my LVM started giving me read-errors, so
naturally I wanted to replace the drive with a new one. Now I've got the
replacement disk, and I've moved nearly all the PE's with pvmove. 

But, there is one PE that it can't move

--8<--
# pvmove -v /dev/hdk:646
[...]
pvmove -- /dev/hdk [PE 646 [lv0 [LE 15369]] -> /dev/hdg [PE 17557] [1/1]
/dev/vg0/group::/dev/vg0/lv0: 3900 10600832, 2200 287670784
pvmove -- ERROR "Input/output error" copying extent from "/dev/hdk"

pvmove -- ERROR "Input/output error" moving physical extents
--8<--

I've also tried with -i, but it had noe effect.
During the move-attempt, the syslog gets a few of these messages:

--8<--
Oct  4 21:13:03 2h0qoj kernel: hdk: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
Oct  4 21:13:03 2h0qoj kernel: hdk: read_intr: error=0x40 { UncorrectableError }, LBAsect=10609463, sector=10609456
Oct  4 21:13:03 2h0qoj kernel: end_request: I/O error, dev 39:00 (hdk), sector 10609456
--8<--


Anyway, because of this, vgreduce won't let me remove the drive from the
LVM

--8<--
# vgreduce -v vg0 /dev/hdk
vgreduce -- locking logical volume manager
vgreduce -- checking volume group name "vg0"
vgreduce -- checking volume group "vg0" existence
vgreduce -- checking volume group "vg0" activity
vgreduce -- reading data of volume group "vg0" from disk(s)
vgreduce -- reducing VGDA structures of volume group "vg0"
vgreduce -- ERROR: can't reduce volume group "vg0" by used physical volume "/dev/hdk"
--8<--

So, uhm. Now what? What will happen if I just turn off the coputer and
remove the drive? Will I be able to use the rest of the LVM without
losing anything other than the 8MB in the still active PE from the
faulty drive? 

Oh, and how do I determine which files will be affected? Is there any
way to find out which inodes that reside on the faulty LE?


I suspect that this is sort of a FAQ, and I apologise if I missed an
obvious entry in the HOWTO or the FAQ, but my searches have been
unsuccessful. The closest I've come is instructions on how to use the
device-mapper, which I understand is a LVM2 feature. I'm running LVM
1.0.3

more info on the drive and the volume group:

--8<--
# pvdisplay /dev/hdk
--- Physical volume ---
PV Name               /dev/hdk
VG Name               vg0
PV Size               74.53 GB [156301488 secs] / NOT usable 8.19 MB
[LVM: 165 KB]
PV#                   2
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       8192
Total PE              9538
Free PE               9537
Allocated PE          1
PV UUID               T3DIq4-sVkG-mM9j-gxJp-pjsa-U00w-X12d3w


# vgdisplay vg0
--- Volume group ---
VG Name               vg0
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                2
Open LV               0
MAX LV Size           511.98 GB
Max PV                256
Cur PV                5
Act PV                5
VG Size               568.46 GB
PE Size               8 MB
Total PE              72763
Alloc PE / Size       61243 / 478.46 GB
Free  PE / Size       11520 / 90 GB
VG UUID               VIwKSd-wcyb-huBo-fUPR-bmp0-XRR5-DH2Y7q
--8<--


-- 
Trond Michelsen
