Message-ID: <3F994F88.8030908@elitedvb.net>
From: Felix Domke <tmbinc@elitedvb.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LV only detected when using "lvscan -D" on amd64 kernel
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
Date: Fri Oct 24 11:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi,

i have an amd64-based machine, upgraded from a normal one. I'm using 
debian, right now still the 32bit version (except for compiling the kernel).

I'm using
Linux opt 2.4.22-bk38 #4 SMP Wed Oct 22 06:44:13 UTC 2003 x86_64 GNU/Linux

using
# dmesg  | grep "LVM"
LVM version 1.0.7(28/03/2003)

The LVM consists of 4 disks, two 40GB, one 20GB and one 120GB, gives a 
total of roughly 220GB. All disks seem to work properly,
pvscan gives
# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdg" of VG "fast" [115.03 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdf" of VG "fast" [19.16 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdc" of VG "fast" [38.16 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdd" of VG "fast" [38.16 GB / 0 free]
pvscan -- total: 4 [210.54 GB] / in use: 4 [210.54 GB] / in no VG: 0 [0]

vgscan gives
# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "fast"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

so everything looks fine. The logical volume worked fine with the old 
kernel (2.4.20 or something like this, for ia32.).

but
# lvscan
lvscan -- no logical volumes found

and
# vgdisplay
--- Volume group ---
VG Name               fast
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                4
Act PV                4
VG Size               210.52 GB
PE Size               4 MB
Total PE              53893
Alloc PE / Size       0 / 0
Free  PE / Size       53893 / 210.52 GB
VG UUID               NiBxzC-W5zF-Mb37-5ajN-ljE9-5k53-Fzc26O

So the logical volume seems to be gone :/

HOWEVER,

# lvscan -D
lvscan -- reading all physical volumes (this may take a while...)
lvscan -- inactive          "/dev/fast/lvol1" [210.52 GB]
lvscan -- 1 logical volumes with 210.52 GB total in 1 volume group
lvscan -- 1 inactive logical volumes

and

# vgdisplay -D
--- Volume group ---
VG Name               fast
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                4
Act PV                4
VG Size               210.52 GB
PE Size               4 MB
Total PE              53893
Alloc PE / Size       53893 / 210.52 GB
Free  PE / Size       0 / 0
VG UUID               NiBxzC-W5zF-Mb37-5ajN-ljE9-5k53-Fzc26O

so i think there must be still some hope. Looks like the kernel LVM 
stuff is somehow broken. Can this be a 64bit issue? Is there anything  i 
could test/upgrade/whatever? Do you need more outputs?
Or did i simply forget to do anything?


thanks,
Felix
