From: Denie Andriessen <D.Andriessen@pink.nl>
Message-Id: <033801c1c3e5$df231530$f707a182@gimmie.tudelft.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] PV-Move fails, not able to clear the last PE from a disk..
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
Date: Mon Mar  4 19:29:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I've got a problem with the behaviour of pvmove I've tested it quite a few
times, but everytime it seems to fail at the same point:

In this example I've made 2 partitions on 1 disk, put them into a single
volume, and I want to remove 1, and not the last one..
I keep getting the errors:
pvmove -- ERROR writing output physical volume "/dev/hdf2" (still 65536
bytes to write)
pvmove -- ERROR "pv_move_pe(): writing output PE" pv_move_pe
pvmove -- ERROR "pv_move_pe(): writing output PE" moving physical extents

Below is an examplesof the output I get.., and my actions..

Kernel 2.4.5, LVM driver version 0.9.1_beta2 (18/01/2001)

########
[root@localhost /root]# vgdisplay -v test12
vgdisplay
--- Volume group ---
VG Name               test12
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               200 MB
PE Size               4 MB
Total PE              50
Alloc PE / Size       25 / 100 MB
Free  PE / Size       25 / 100 MB
VG UUID               uTF83w-IRzJ-Gjl7-HlXB-lA4r-6jsU-LMpt6N

--- Logical volume ---
LV Name                /dev/test12/vol1
VG Name                test12
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                100 MB
Current LE             25
Allocated LE           25
Allocation             next free
Read ahead sectors     120
Block device           58:1


--- Physical volumes ---
PV Name (#)           /dev/hdf1 (1)
PV Status             available / allocatable
Total PE / Free PE    25 / 0

PV Name (#)           /dev/hdf2 (2)
PV Status             available / allocatable
Total PE / Free PE    25 / 25

########
So this looks good, now I want to remove /dev/hdf1
########

[root@localhost /root]# pvmove /dev/hdf1
pvmove
pvmove -- moving physical extents in active volume group "test12"
pvmove -- WARNING: if you lose power during the move you may need to restore
your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- ERROR writing output physical volume "/dev/hdf2" (still 65536
bytes to write)
pvmove -- ERROR "pv_move_pe(): writing output PE" pv_move_pe
pvmove -- ERROR "pv_move_pe(): writing output PE" moving physical extents

[root@localhost /root]# vgdisplay -v test12
vgdisplay
--- Volume group ---
VG Name               test12
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               200 MB
PE Size               4 MB
Total PE              50
Alloc PE / Size       25 / 100 MB
Free  PE / Size       25 / 100 MB
VG UUID               uTF83w-IRzJ-Gjl7-HlXB-lA4r-6jsU-LMpt6N

--- Logical volume ---
LV Name                /dev/test12/vol1
VG Name                test12
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                100 MB
Current LE             25
Allocated LE           25
Allocation             next free
Read ahead sectors     120
Block device           58:1


--- Physical volumes ---
PV Name (#)           /dev/hdf1 (1)
PV Status             available / allocatable
Total PE / Free PE    25 / 24

PV Name (#)           /dev/hdf2 (2)
PV Status             available / allocatable
Total PE / Free PE    25 / 1

########
Whatever I do, I can't seem to get rid of that last block on /dev/hdf1 !!
