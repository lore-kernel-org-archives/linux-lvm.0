From: Alexander Lazarevich <alazarev@hera.itg.uiuc.edu>
Message-ID: <Pine.A41.4.43.0211121809350.48658-100000@hera.itg.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] can't make new filesystems?
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
Date: Tue Nov 12 18:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Sistina <linux-lvm@sistina.com>

LVM 1.0.3 on redhat linux 7.3 (2.4.18-3 kernel) on DELL PowerEdge 4600.

I'm cutting and pasting my whole problem below, sorry for the size, but
I'll describe it here in short:

Every time I remove a logical volume, I am then unable to create any new
filesystem within that volume group. The only way I can create another
filesystem is to blow away the VG and recreate it, then the problem is
fixed. The text below shows how I started with a good VG and 3 LV's in
that VG, then removed the LV, recreated an LV, tried to make a filesystem
on it and got an error. In fact I can't make any filesystem on the VG
anymore.

Any ideas? I'm doing it per the man pages, and the LVM manual I downloaded
from sistina.

I hope I can get this working, because if this is some bug, then there is
no way we can rely on it. But I must be doing something wrong, there is no
way something this bad could be a bug.

Thanks in advance,

Alex



[root@discord root]# vgdisplay -v
--- Volume group ---
VG Name               homevg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                3
Open LV               3
MAX LV Size           2 TB
Max PV                256
Cur PV                1
Act PV                1
VG Size               477.62 GB
PE Size               32 MB
Total PE              15284
Alloc PE / Size       12750 / 398.44 GB
Free  PE / Size       2534 / 79.19 GB
VG UUID               UkPr3d-7hyp-Yb7x-bxbb-pcc3-5m1S-dxSoTE

--- Logical volume ---
LV Name                /dev/homevg/stafflv
VG Name                homevg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                195.31 GB
Current LE             6250
Allocated LE           6250
Allocation             next free
Read ahead sectors     1024
Block device           58:0

--- Logical volume ---
LV Name                /dev/homevg/userslv
VG Name                homevg
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                195.31 GB
Current LE             6250
Allocated LE           6250
Allocation             next free
Read ahead sectors     1024
Block device           58:1

--- Logical volume ---
LV Name                /dev/homevg/publiclv
VG Name                homevg
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 1
LV Size                7.81 GB
Current LE             250
Allocated LE           250
Allocation             next free
Read ahead sectors     1024
Block device           58:2

--- Physical volumes ---
PV Name (#)           /dev/sdb (1)
PV Status             available / allocatable
Total PE / Free PE    15284 / 2534

[root@discord root]# umount /home/staff /home/users /home/public

[root@discord root]# df -k
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/sda5             68262580   2151392  62643560   4% /
/dev/sda2                62217     34141     24863  58% /boot
none                   1905076         0   1905076   0% /dev/shm

[root@discord root]# lvremove /dev/homevg/stafflv
lvremove -- do you really want to remove "/dev/homevg/stafflv"? [y/n]: y
lvremove -- doing automatic backup of volume group "homevg"
lvremove -- logical volume "/dev/homevg/stafflv" successfully removed

[root@discord root]# lvremove /dev/homevg/userslv
lvremove -- do you really want to remove "/dev/homevg/userslv"? [y/n]: y
lvremove -- doing automatic backup of volume group "homevg"
lvremove -- logical volume "/dev/homevg/userslv" successfully removed

[root@discord root]# lvremove /dev/homevg/publiclv
lvremove -- do you really want to remove "/dev/homevg/publiclv"? [y/n]: y
lvremove -- doing automatic backup of volume group "homevg"
lvremove -- logical volume "/dev/homevg/publiclv" successfully removed

[root@discord root]# vgdisplay -v
--- Volume group ---
VG Name               homevg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                1
Act PV                1
VG Size               477.62 GB
PE Size               32 MB
Total PE              15284
Alloc PE / Size       0 / 0
Free  PE / Size       15284 / 477.62 GB
VG UUID               UkPr3d-7hyp-Yb7x-bxbb-pcc3-5m1S-dxSoTE

--- No logical volumes defined in "homevg" ---

--- Physical volumes ---
PV Name (#)           /dev/sdb (1)
PV Status             available / allocatable
Total PE / Free PE    15284 / 15284

[root@discord root]# vgchange -an
vgchange -- volume group "homevg" successfully deactivated

[root@discord root]# vgchange -ay
vgchange -- volume group "homevg" successfully activated

[root@discord root]# lvcreate -L75000 -nstafflv homevg
lvcreate -- rounding size up to physical extent boundary
lvcreate -- doing automatic backup of "homevg"
lvcreate -- logical volume "/dev/homevg/stafflv" successfully created

[root@discord root]# vgdisplay -v
--- Volume group ---
VG Name               homevg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                1
Act PV                1
VG Size               477.62 GB
PE Size               32 MB
Total PE              15284
Alloc PE / Size       2344 / 73.25 GB
Free  PE / Size       12940 / 404.38 GB
VG UUID               UkPr3d-7hyp-Yb7x-bxbb-pcc3-5m1S-dxSoTE

--- Logical volume ---
LV Name                /dev/homevg/stafflv
VG Name                homevg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                73.25 GB
Current LE             2344
Allocated LE           2344
Allocation             next free
Read ahead sectors     1024
Block device           58:0

--- Physical volumes ---
PV Name (#)           /dev/sdb (1)
PV Status             available / allocatable
Total PE / Free PE    15284 / 12940

[root@discord root]# mkfs.ext3 /dev/homevg/stafflv /home/staff
mke2fs 1.27 (8-Mar-2002)
mkfs.ext3: bad blocks count - /home/staff


ACK!!!
