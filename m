From: Marc MERLIN <marc_lvm@merlins.org>
Message-Id: <20020211173404.GB23@merlins.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Can't mke2fs lv
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
Date: Mon Feb 11 11:34:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've never had this problem before, it's on a 2.4.14 kernel with lvm
1.0.1rc4:

gargamel:~# lvscan 
lvscan -- ACTIVE            "/dev/BootMylexLVM/usr" [1.50 GB]
lvscan -- ACTIVE            "/dev/BootMylexLVM/var" [2.00 GB]
lvscan -- ACTIVE            "/dev/BootMylexLVM/home" [115.00 GB]
lvscan -- 3 logical volumes with 118.50 GB total in 1 volume group
lvscan -- 3 active logical volume

I was able to mke2fs /dev/BootMylexLVM/usr just fine.
However, doing var and home fails like this:

gargamel:~# mke2fs  /dev/BootMylexLVM/var 
mke2fs 1.25 (20-Sep-2001)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
262144 inodes, 524288 blocks
26214 blocks (5.00%) reserved for the super user
First data block=0
16 block groups
32768 blocks per group, 32768 fragments per group
16384 inodes per group
Superblock backups stored on blocks: 
        32768, 98304, 163840, 229376, 294912

mke2fs: Attempt to write block from filesystem resulted in short write zeroing block 524280 at end of filesystem
gargamel:~# mke2fs  /dev/BootMylexLVM/home
mke2fs 1.25 (20-Sep-2001)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
15073280 inodes, 30146560 blocks
1507328 blocks (5.00%) reserved for the super user
First data block=0
920 block groups
32768 blocks per group, 32768 fragments per group
16384 inodes per group
Superblock backups stored on blocks: 
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
        4096000, 7962624, 11239424, 20480000, 23887872

File size limit exceeded


Did I do something stupid, or do I need to upgrade?
(I did do a quick search on this kind of failure, but didn't find anything)


Details on the VG:
gargamel:~# vgdisplay  -v
--- Volume group ---
VG Name               BootMylexLVM
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                3
Open LV               0
MAX LV Size           1023.97 GB
Max PV                255
Cur PV                1
Act PV                1
VG Size               135.94 GB
PE Size               16.00 MB
Total PE              8700
Alloc PE / Size       7584 / 118.50 GB
Free  PE / Size       1116 / 17.44 GB
VG UUID               opNV4o-2l8K-Vdtg-aUBK-c2uT-FbA7-BZFvJx

--- Logical volume ---
LV Name                /dev/BootMylexLVM/usr
VG Name                BootMylexLVM
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                1.50 GB
Current LE             96
Allocated LE           96
Allocation             next free
Read ahead sectors     120
Block device           58:0

--- Logical volume ---
LV Name                /dev/BootMylexLVM/var
VG Name                BootMylexLVM
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 0
LV Size                2.00 GB
Current LE             128
Allocated LE           128
Allocation             next free
Read ahead sectors     120
Block device           58:1

--- Logical volume ---
LV Name                /dev/BootMylexLVM/home
VG Name                BootMylexLVM
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 0
LV Size                115.00 GB
Current LE             7360
Allocated LE           7360
Allocation             next free
Read ahead sectors     120
Block device           58:2


--- Physical volumes ---
PV Name (#)           /dev/rd/disc0/part5 (1)
PV Status             available / allocatable
Total PE / Free PE    8700 / 1116


Thanks,
Marc
-- 
Microsoft is to operating systems & security ....
                                      .... what McDonalds is to gourmet cooking
  
Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key
