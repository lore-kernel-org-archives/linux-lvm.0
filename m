Message-ID: <202d01c3e08a$08dd10c0$0a00000a@gr>
From: "Gunnar Rysstad" <gunnar@rysstad.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Removing failed harddrive from a LV
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
Date: Wed Jan 21 20:49:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

I have got a 411GB volume which contains of 6 harddrives. One of them failed
horribly yesterday (an IBM - who would have guessed...) and of course, being
a private fileserver and all, I do not have any backup of it. I am not quite
sure if the whole disk is lost yet, but what I know is that it makes awful
noises when I try reading a file I *know* is partially on that drive. Not
quite sure which files is on that drive or not, so it is hard to test the
whole drive.

I added an 40GB disk (/dev/hdg) to the VG, and tried doing a pvmove, but the
harddrives starts making horrible noises immediately, and /var/log/messages
says stuff like this:

Jan 21 23:41:11 avalon kernel: hdd: dma_intr: status=0x51 { DriveReady
SeekComplete Error }
Jan 21 23:41:11 avalon kernel: hdd: dma_intr: error=0x40 {
UncorrectableError }, LBAsect=1531754, sector=1531688
Jan 21 23:41:11 avalon kernel: end_request: I/O error, dev 16:41 (hdd),
sector 1531688
Jan 21 23:41:16 avalon kernel: hdd: dma_intr: status=0x51 { DriveReady
SeekComplete Error }
Jan 21 23:41:16 avalon kernel: hdd: dma_intr: error=0x40 {
UncorrectableError }, LBAsect=1531754, sector=1531690
Jan 21 23:41:16 avalon kernel: end_request: I/O error, dev 16:41 (hdd),
sector 1531690


This is what pvmove says:

(root@avalon /)# pvmove -i -v -f /dev/hdd1
pvmove -- checking name of source physical volume "/dev/hdd1"
pvmove -- locking logical volume manager
pvmove -- reading data of source physical volume from "/dev/hdd1"
pvmove -- checking volume group existence
pvmove -- reading data of volume group "s0" from lvmtab
pvmove -- checking volume group consistency of "s0"
pvmove -- searching for source physical volume "/dev/hdd1" in volume group
"s0"
pvmove -- building list of possible destination physical volumes
pvmove -- checking volume group activity
pvmove -- moving physical extents in active volume group "s0"
pvmove -- starting to move extents away from physical volume "/dev/hdd1"
pvmove -- checking for enough free physical extents in "s0"
pvmove -- /dev/hdd1 [PE 22 [vol0 [LE 5979]] -> /dev/hdf [PE 3416] [1/1351]
pvmove -- ERROR "Input/output error" reading sector 1531688 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 1531689 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 1531690 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 1531691 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 1531692 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 1531693 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 1531694 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 1531695 from "/dev/hdd1"
pvmove -- ERROR reading input physical volume "/dev/hdd1" (still 21299200
bytes to read)
pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents

(root@avalon /)#


 I believe LVM splits files over several devices if there is lack of space
on the disk it starts writing to. If this is the case then, theoretically,
ALL the files on the 411GB LV can be partially on that failed 46GB.

What I want now is to save as much as possible, and throw the damn IBM in
the trashcan afterwards. I do *not* have an identical disk, so I can not do
a dd_rescue (I have got 2x40GB Hitachi's free which I can use if necessary).
Also, I am running LVM 1.0.3.

Which options do I have?

-

And if someone needs some more LVM info to answer:

(root@avalon /)# vgdisplay s0
--- Volume group ---
VG Name               s0
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           2 TB
Max PV                256
Cur PV                8
Act PV                8
VG Size               454.72 GB
PE Size               32 MB
Total PE              14551
Alloc PE / Size       13178 / 411.81 GB
Free  PE / Size       1373 / 42.91 GB
VG UUID               gNo0V0-OOKU-teKS-QenZ-I84O-WkHE-Z7ia5t


(root@avalon /)#  lvdisplay /dev/s0/vol0
--- Logical volume ---
LV Name                /dev/s0/vol0
VG Name                s0
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                411.81 GB
Current LE             13178
Allocated LE           13178
Allocation             next free
Read ahead sectors     120
Block device           58:1


(root@avalon /)# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdg"  of VG "s0" [37.22 GB / 37.22 GB free]
pvscan -- ACTIVE   PV "/dev/hde"  of VG "s0" [74.47 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdf"  of VG "s0" [111.75 GB / 5 GB free]
pvscan -- ACTIVE   PV "/dev/hdc1" of VG "s0" [41.88 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdd1" of VG "s0" [42.91 GB / 704 MB free]
pvscan -- ACTIVE   PV "/dev/hda5" of VG "s0" [34.81 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb1" of VG "s0" [53.81 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb2" of VG "s0" [57.88 GB / 0 free]
pvscan -- total: 8 [455.11 GB] / in use: 8 [455.11 GB] / in no VG: 0 [0]

(root@avalon /)# pvdisplay /dev/hdd1
--- Physical volume ---
PV Name               /dev/hdd1
VG Name               s0
PV Size               42.94 GB [90060327 secs] / NOT usable 32.19 MB [LVM:
133 KB]
PV#                   4
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       32768
Total PE              1373
Free PE               22
Allocated PE          1351
PV UUID               b6UISF-tvi5-01Z7-4F6N-Qr2h-ChOz-9o6MDH


(root@avalon /)#


--
Regards,

Gunnar Rysstad
