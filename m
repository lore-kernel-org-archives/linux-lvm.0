Message-Id: <200303131600.h2DG0Sp26251@gbt.tfo.upm.es>
From: Rodrigo de Salazar <no_id@wanadoo.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Lost a full volume group!
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
Date: Thu Mar 13 09:57:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Ok, I will paste the output of the relevant commands, if you want more info 
just ask... and thanks for the quick answer, this machine is destined to be 
an important server, and it should be ready ASAP, aka if we can't get it to 
work with LVM soon, we'll have to use a traditional scheme, superior's orders 
/:
So here it goes:

volatil:~# vgck
vgck -- VGDA of "vg1" in lvmtab is consistent
vgck -- VGDA of "vg1" on physical volume is consistent
vgck -- VGDA of "vg2" in lvmtab is consistent
vgck -- VGDA of "vg2" on physical volume is consistent

volatil:~# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/ide/host0/bus1/target0/lun0/disc"  is in no VG  
[8.03 GB]
pvscan -- ACTIVE   PV "/dev/ide/host0/bus1/target0/lun0/part2" of VG "vg2" 
[74.05 GB / 10.05 GB free]
pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part4" of VG "vg1" 
[35.74 GB / 2.79 GB free]
pvscan -- total: 3 [117.83 GB] / in use: 2 [109.80 GB] / in no VG: 1 [8.03 GB]

The 8.03 GB PV makes no sense to me, it is supposedly /dev/hdc, but that disk 
(80 GB) is partitioned, first partition 512 MB swap and the second is the LVM 
partition (the rest of the disk).

volatil:~# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vg2"
vgscan -- found inactive volume group "vg1"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
groups

volatil:~# lvscan
lvscan -- volume group "vg1" is NOT active; try -D
lvscan -- ACTIVE   Original "/dev/vg2/home" [45 GB]
lvscan -- ACTIVE            "/dev/vg2/usr" [10 GB]
lvscan -- ACTIVE   Snapshot "/dev/vg2/home-hora-16" [1008 MB] of /dev/vg2/home
lvscan -- ACTIVE   Snapshot "/dev/vg2/home-hora-19" [1008 MB] of /dev/vg2/home
lvscan -- ACTIVE   Snapshot "/dev/vg2/home-hora-10" [1008 MB] of /dev/vg2/home
lvscan -- ACTIVE   Snapshot "/dev/vg2/home-hora-13" [1008 MB] of /dev/vg2/home
lvscan -- ACTIVE            "/dev/vg2/local" [5 GB]
lvscan -- 7 logical volumes with 63.94 GB total in 1 volume group
lvscan -- 7 active logical volumes

volatil:~# lvscan -D
lvscan -- reading all physical volumes (this may take a while...)
lvscan -- inactive          "/dev/vg1/tmp" [1 GB]
lvscan -- inactive          "/dev/vg1/var" [15 GB]
lvscan -- inactive Original "/dev/vg1/www" [15 GB]
lvscan -- inactive Snapshot "/dev/vg1/www-hora-16" [0] of /dev/vg1/www
lvscan -- inactive Snapshot "/dev/vg1/www-hora-19" [0] of /dev/vg1/www
lvscan -- inactive Snapshot "/dev/vg1/www-hora-10" [0] of /dev/vg1/www
lvscan -- inactive Snapshot "/dev/vg1/www-hora-13" [0] of /dev/vg1/www
lvscan -- inactive Original "/dev/vg2/home" [45 GB]
lvscan -- inactive          "/dev/vg2/usr" [10 GB]
lvscan -- inactive Snapshot "/dev/vg2/home-hora-16" [0] of /dev/vg2/home
lvscan -- inactive Snapshot "/dev/vg2/home-hora-19" [0] of /dev/vg2/home
lvscan -- inactive Snapshot "/dev/vg2/home-hora-10" [0] of /dev/vg2/home
lvscan -- inactive Snapshot "/dev/vg2/home-hora-13" [0] of /dev/vg2/home
lvscan -- inactive          "/dev/vg2/local" [5 GB]
lvscan -- 14 logical volumes with 91 GB total in 2 volume groups
lvscan -- 14 inactive logical volumes

As you can see, there are 4 daily snapshots of /home and /var/www, maybe it 
is too much, but those are the directories where people work and well, files 
get accidentally deleted during the day and so on and so forth (:
All were available when this happened. 

volatil:~# vgchange -a y
vgchange -- ERROR "Bad address" activating volume group "vg1"
vgchange -- volume group "vg2" already active

volatil:~# pvdisplay /dev/hda4
--- Physical volume ---
PV Name               /dev/ide/host0/bus0/target0/lun0/part4
VG Name               vg1
PV Size               35.75 GB [74970000 secs] / NOT usable 4.19 MB [LVM: 163 
KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                7
PE Size (KByte)       4096
Total PE              9150
Free PE               714
Allocated PE          8436
PV UUID               kvIRnL-ZNQm-Ab0g-TSqe-rasN-Hg1C-pHZIkF

volatil:~# vgdisplay -D
--- Volume group ---
VG Name               vg2
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                7
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               74.05 GB
PE Size               4 MB
Total PE              18956
Alloc PE / Size       16384 / 64 GB
Free  PE / Size       2572 / 10.05 GB
VG UUID               Nm7brW-Hk8I-hYkt-1LvU-6COW-G5ds-FduaFe

--- Volume group ---
VG Name               vg1
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                7
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               35.74 GB
PE Size               4 MB
Total PE              9150
Alloc PE / Size       8436 / 32.95 GB
Free  PE / Size       714 / 2.79 GB
VG UUID               GNeKh6-W3TL-AMa6-3E7q-291d-pjm2-av59ou

Another thing, originally /dev/vg1/var was 30 GB, it was resized with:

e2fsadm -L-15G /dev/vg1/var

(only 9 GB were occupied) and then the /dev/vg1/www was created...
Also, they have ext3 filesystems on them, but with the journal disabled 
(working as ext2). It all worked fine even on reboot, a few days before the 
"accident".

Don't know what else to include... if I missed out something, just ask for 
it, and thanks for the help (:
