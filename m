From: "^YosH^" <yosh@liquidzone.net>
Message-ID: <000101c353ac$7741d7f0$0296a8c0@malin>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Need to remove broken hdd, and need to move the stuff i can from the broken disk
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
Date: Sat Jul 26 14:33:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi, I have a bit of a problem, I have just bought a new 250 GB disk and
I have put it into my lvm, but now it seems to be broken so I need to
replace it. But I have data on it that I need to save. I don't know how
much of the disk is used by data and I don't know how much is free on
the other disks.

I have 5 disks in the LVM

--- Physical volume ---
PV Name               /dev/hdd
VG Name               lvm
PV Size               152.67 GB [320173056 secs] / NOT usable 64.19 MB
[LVM: 137 KB]
PV#                   6
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       65536
Total PE              2441
Free PE               0
Allocated PE          2441
PV UUID               0EudhZ-dtuy-WuPG-r6ED-Fp9V-LFkb-CktrYG

--- Physical volume ---
PV Name               /dev/hde
VG Name               lvm
PV Size               93.16 GB [195371568 secs] / NOT usable 64.19 MB
[LVM: 133 KB]
PV#                   3
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       65536
Total PE              1489
Free PE               0
Allocated PE          1489
PV UUID               OVUe6B-SI0R-71Xo-NU4s-BQwU-zPgR-Bf6RvM

--- Physical volume ---
PV Name               /dev/hdf
VG Name               lvm
PV Size               93.16 GB [195371568 secs] / NOT usable 64.19 MB
[LVM: 133 KB]
PV#                   4
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       65536
Total PE              1489
Free PE               0
Allocated PE          1489
PV UUID               2Ea3i5-Jo0b-hB73-kENF-TffA-j4ep-QeZhRn

--- Physical volume ---
PV Name               /dev/hdg
VG Name               lvm
PV Size               232.89 GB [488397168 secs] / NOT usable 64.19 MB
[LVM: 142 KB]
PV#                   5
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       65536
Total PE              3725
Free PE               0
Allocated PE          3725
PV UUID               Nt2gWs-FbQf-Q20G-T918-Qivy-ZVbn-MJib57

--- Physical volume ---
PV Name               /dev/hdh
VG Name               lvm
PV Size               152.67 GB [320173056 secs] / NOT usable 64.19 MB
[LVM: 137 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       65536
Total PE              2441
Free PE               0
Allocated PE          2441
PV UUID               BoIRX3-51Wt-qobG-9Bbs-s645-drey-Csd9VU

--- Logical volume ---
LV Name                /dev/lvm/lvm
VG Name                site
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                957.75 GB
Current LE             15324
Allocated LE           15324
Allocation             next free
Read ahead sectors     1024
Block device           58:0


/dev/hdg is the one that is broken... when I have mounted the lvm disk
and are trying to read or write to it this shows up in the logs:

Jul 26 13:42:54 c-47bf72d5 kernel: hdg: dma_intr: status=0x51 {
DriveReady SeekComplete Error }
Jul 26 13:42:54 c-47bf72d5 kernel: hdg: dma_intr: error=0x40 {
UncorrectableError }, LBAsect=148767608, high=8, low=14549880, sec
tor=148767608
Jul 26 13:42:54 c-47bf72d5 kernel: end_request: I/O error, dev 22:00
(hdg), sector 148767608
Jul 26 13:42:56 c-47bf72d5 kernel: hdg: dma_intr: status=0x51 {
DriveReady SeekComplete Error }
Jul 26 13:42:56 c-47bf72d5 kernel: hdg: dma_intr: error=0x40 {
UncorrectableError }, LBAsect=148767610, high=8, low=14549882, sec
tor=148767610
Jul 26 13:42:56 c-47bf72d5 kernel: end_request: I/O error, dev 22:00
(hdg), sector 148767610


How can I remove the disk? And how can I figure out whats actually
stored on it... I really need to have the rest of the lvm saved. And I
don't have any backups. (I know I should have backups but I haven't had
time to get a backup station that can store all that stuff on not too
many tapes...)

Would appreciate any help, thank you.
