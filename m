From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.1-rc1    available at
    www.sistina.com
In-Reply-To: <Pine.LNX.4.02.10203201650360.28349-100000@murnau.science-computing.de>
Message-Id: <Pine.LNX.4.44.0203202348090.27835-100000@pzat.meep.org>
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
Date: Wed Mar 20 18:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

pvmove has fixed the 2GB file offset problem. YAY! it works great however
I did get it to segv ;-)

Summary, I have a 22 gig lv, on one disk which I want to move on off it,
There is enough disk space on two other pvs.

So pvmove -v -n oolon3_lv /dev/ide/host2/bus0/target0/lun0/part4

Should work.... in theory

However it didn't a segv was produced, I solved the problem by specifying
the LE extent ranges and PEs to move them two, a two stage op, but still,
it should not have segved.

James

More detailed info from this point...

Here is the setup

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/ide/host2/bus1/target0/lun0/part2" of VG
"sunset_vg" [30.84 GB / 19.66 GB free]
pvscan -- ACTIVE   PV "/dev/ide/host2/bus1/target1/lun0/part1" of VG
"sunset_vg" [19.03 GB / 8.09 GB free]
pvscan -- ACTIVE   PV "/dev/ide/host2/bus0/target0/lun0/part4" of VG
"sunset_vg" [35.06 GB / 13.06 GB free]
pvscan -- total: 3 [85.07 GB] / in use: 3 [85.07 GB] / in no VG: 0 [0]

--- Volume group ---
VG Name               sunset_vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                6
Open LV               0
MAX LV Size           2 TB
Max PV                255
Cur PV                3
Act PV                3
VG Size               84.94 GB
PE Size               32 MB
Total PE              2718
Alloc PE / Size       1412 / 44.12 GB
Free  PE / Size       1306 / 40.81 GB
VG UUID               HMrqdp-Hf5n-FfCP-5W2D-fyw6-UHcn-MMB7Wr

--- Logical volume ---
LV Name                /dev/sunset_vg/var_lv
VG Name                sunset_vg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                256 MB
Current LE             8
Allocated LE           8
Allocation             next free
Read ahead sectors     120
Block device           58:0

--- Logical volume ---
LV Name                /dev/sunset_vg/usr_lv
VG Name                sunset_vg
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 0
LV Size                3 GB
Current LE             96
Allocated LE           96
Stripes                2
Stripe size (KByte)    16
Allocation             next free
Read ahead sectors     120
Block device           58:1

--- Logical volume ---
LV Name                /dev/sunset_vg/swap1_lv
VG Name                sunset_vg
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 0
LV Size                256 MB
Current LE             8
Allocated LE           8
Allocation             next free
Read ahead sectors     120
Block device           58:2

--- Logical volume ---
LV Name                /dev/sunset_vg/swap2_lv
VG Name                sunset_vg
LV Write Access        read/write
LV Status              available
LV #                   4
# open                 0
LV Size                256 MB
Current LE             8
Allocated LE           8
Allocation             next free
Read ahead sectors     120
Block device           58:3

--- Logical volume ---
LV Name                /dev/sunset_vg/oolon4_lv
VG Name                sunset_vg
LV Write Access        read/write
LV Status              available
LV #                   5
# open                 0
LV Size                18.38 GB
Current LE             588
Allocated LE           588
Stripes                2
Stripe size (KByte)    16
Allocation             next free
Read ahead sectors     120
Block device           58:4

--- Logical volume ---
LV Name                /dev/sunset_vg/oolon3_lv
VG Name                sunset_vg
LV Write Access        read/write
LV Status              available
LV #                   6
# open                 0
LV Size                22 GB
Current LE             704
Allocated LE           704
Allocation             next free
Read ahead sectors     120
Block device           58:5


--- Physical volumes ---
PV Name (#)           /dev/ide/host2/bus1/target0/lun0/part2 (3)
PV Status             available / allocatable
Total PE / Free PE    987 / 629

PV Name (#)           /dev/ide/host2/bus1/target1/lun0/part1 (2)
PV Status             available / allocatable
Total PE / Free PE    609 / 259

PV Name (#)           /dev/ide/host2/bus0/target0/lun0/part4 (1)
PV Status             available / NOT allocatable
Total PE / Free PE    1122 / 418

Now the problem.

bash# pvmove -v -n oolon3_lv /dev/ide/host2/bus0/target0/lun0/part4
pvmove -- checking name of source physical volume
"/dev/ide/host2/bus0/target0/lun0/part4"
pvmove -- locking logical volume manager
pvmove -- reading data of source physical volume from
"/dev/ide/host2/bus0/target0/lun0/part4"
pvmove -- checking volume group existence
pvmove -- checking volume group consistency of "sunset_vg"
pvmove -- searching for source physical volume
"/dev/ide/host2/bus0/target0/lun0/part4" in volume group "sunset_
vg"
pvmove -- checking logical volume "oolon3_lv"
pvmove -- building list of possible destination physical volumes
pvmove -- checking volume group activity
pvmove -- moving physical extents in active volume group "sunset_vg"
pvmove -- WARNING: if you lose power during the move you may need
        to restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- starting to move linear logical volume
"/dev/sunset_vg/oolon3_lv"
pvmove -- checking for enough free physical extents in "sunset_vg"
Segmentation fault
bash#
