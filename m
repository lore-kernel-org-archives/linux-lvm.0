Message-ID: <3BFA4184.43FC7D35@LTUtech.com>
From: Igor Dumaire <Igor.Dumaire@LTUtech.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgcfgrestore error !
References: <3BF8E5DE.ABAEB618@LTUtech.com> <20011119125632.A12388@sistina.com> <3BF8F8BF.3FE1491C@LTUtech.com> <20011119151746.A13040@sistina.com> <3BF923C3.A2060FDD@LTUtech.com> <20011120121947.B18529@sistina.com>
Content-Transfer-Encoding: 7bit
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
Date: Tue Nov 20 05:40:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Strange.
> Please provide "vgdisplay -v;pvscan;lvmdiskscan" and "pvdata -PP" for all
> PVs belonging to the missing VG.
> 
# vgdisplay -v
--- Volume group ---
VG Name               lvm2
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                255
Cur PV                3
Act PV                3
VG Size               171.79 GB
PE Size               4.00 MB
Total PE              43977
Alloc PE / Size       43776 / 171.00 GB
Free  PE / Size       201 / 804.00 MB
VG UUID               Jp3gDv-ib7D-p5te-FFLZ-lNjI-5brK-fzjEM6

--- Logical volume ---
LV Name                /dev/lvm2/Backup
VG Name                lvm2
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                171.00 GB
Current LE             43776
Allocated LE           43776
Allocation             next free
Read ahead sectors     120
Block device           58:0


--- Physical volumes ---
PV Name (#)           /dev/hdd1 (3)
PV Status             available / allocatable
Total PE / Free PE    14659 / 201

PV Name (#)           /dev/hdg1 (1)
PV Status             available / allocatable
Total PE / Free PE    14659 / 0

PV Name (#)           /dev/hdh1 (2)
PV Status             available / allocatable
Total PE / Free PE    14659 / 0



# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdc1"  is associated to an unknown VG (run vgscan)
pvscan -- ACTIVE   PV "/dev/hdd1" of VG "lvm2" [57.26 GB / 804.00 MB free]
pvscan -- inactive PV "/dev/hde1"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/hdf1"  is associated to an unknown VG (run vgscan)
pvscan -- ACTIVE   PV "/dev/hdg1" of VG "lvm2" [57.26 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdh1" of VG "lvm2" [57.26 GB / 0 free]
pvscan -- total: 6 [343.62 GB] / in use: 6 [343.62 GB] / in no VG: 0 [0]

# man pvdata
# pvdata -PP /dev/hde1
--- Physical volume ---
PV Name               /dev/hde1
VG Name               lvm1
PV Size               57.27 GB / NOT usable 8.11 MB [LVM: 181.00 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              14659
Free PE               0
Allocated PE          14659
PV UUID               kbvz5r-hJlN-WU9Q-7xwj-alJ6-8UfO-jopMFc
pv_dev                   0:33
system_id                courcelles.ltutech.com1004974292
pv_on_disk.base          0
pv_on_disk.size          1024
vg_on_disk.base          4096
vg_on_disk.size          4096
pv_uuidlist_on_disk.base 8192
pv_uuidlist_on_disk.size 32768
lv_on_disk.base          40960
lv_on_disk.size          83968
pe_on_disk.base          126976
pe_on_disk.size          4259840



# pvdata -PP /dev/hdf1
--- Physical volume ---
PV Name               /dev/hdf1
VG Name               lvm1
PV Size               57.27 GB / NOT usable 8.11 MB [LVM: 181.00 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              14659
Free PE               0
Allocated PE          14659
PV UUID               weQY7t-7II0-7t74-hVI5-Dj8Y-CV0O-8CyGqh
pv_dev                   0:33
system_id                courcelles.ltutech.com1004974293
pv_on_disk.base          0
pv_on_disk.size          1024
vg_on_disk.base          4096
vg_on_disk.size          4096
pv_uuidlist_on_disk.base 8192
pv_uuidlist_on_disk.size 32768
lv_on_disk.base          40960
lv_on_disk.size          83968
pe_on_disk.base          126976
pe_on_disk.size          4259840
 
 
 
# pvdata -PP /dev/hdc1
--- Physical volume ---
PV Name               /dev/hdc1
VG Name               lvm1
PV Size               57.27 GB / NOT usable 8.11 MB [LVM: 181.00 KB]
PV#                   3
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              14659
Free PE               201
Allocated PE          14458
PV UUID               BFvA7F-ccvF-e5r1-3QH7-02JG-dH4r-AOYF64
pv_dev                   0:22
system_id                courcelles.ltutech.com1004974291
pv_on_disk.base          0
pv_on_disk.size          1024
vg_on_disk.base          4096
vg_on_disk.size          4096
pv_uuidlist_on_disk.base 8192
pv_uuidlist_on_disk.size 32768
lv_on_disk.base          40960
lv_on_disk.size          83968
pe_on_disk.base          126976
pe_on_disk.size          4259840


Thanks a lot for your help. I have lost (can't acces) a lot of data !
Best regards.

-- 
Igor Dumaire

www.LTUtech.com - Making Sense of Visual Content
------------------------------------------------
