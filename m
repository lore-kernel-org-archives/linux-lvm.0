Message-ID: <F888C30C3021D411B9DA00B0D0209BE8038F94E2@cvo-exchange.cvo.roguewave.com>
From: Poul Petersen <petersp@roguewave.com>
Subject: RE: [linux-lvm] LVM 1.0.4 pvmove is broken
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
Date: Mon May 13 21:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> Poul,
> 
> couldn't reproduce this directly here.
> Need to investigate more...

	Thanks for looking into this - I verified my results on a third
machine, this one a single CPU P-III, 1Ghz running RedHat 7.2. In case I am
doing something really silly, these are the exact steps I did to reproduce
the problem - notice that /dev/hdc is a 10Gig disk which I partitioned into
two equal 5-gig partitions and tagged as type 8e:

unpack 2.4.18 kernel into /usr/src/linux-2.4.18_lvm-1.0.4
cd into LVM-1.0.4 source
./configure --with-kernel_dir=/usr/src/linux-2.4.18_lvm-1.0.4
cd PATCHES
make
cd into kernel source
patch -p1 < /usr/local/src/LVM/1.0.4/PATCHES/lvm-1.0.4-2.4.18.patch
make menuconfig
enable LVM as a module in Multiple devices driver support
disable sound card support
disable usb support
edit kernel Makefile and set EXTRAVERSION = _lvm-1.0.4
make dep && make && make modules && make modules_install
mkinitrd /boot/initrd-2.4.18_lvm-1.0.4.img 2.4.18_lvm-1.0.4
edit lilo.conf and add entry for new kernel
make install
cd into LVM-1.0.4 source
make
make install
reboot into new kernel, single-user mode
vgscan
pvcreate /dev/hdc1 /dev/hdc2
vgcreate vg0 /dev/hdc1 /dev/hdc2
lvcreate -L 100M -n lv0 vg0
vgdisplay -v (see below for output)
pvmove -v /dev/hdc1

	The pvmove asks if I am sure, moves one PE and then hangs. OK, I'm
ready to feel silly :)

Thanks again - everything else in LVM 1.0.4 is working great for me, but I
just can't get pvmove to work.

-poul

Output of vgdisplay -v:

--- Volume group ---
VG Name               vg0
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               9.52 GB
PE Size               4 MB
Total PE              2436
Alloc PE / Size       25 / 100 MB
Free  PE / Size       2411 / 9.42 GB
VG UUID               Qa6d0F-ATIc-5nIU-iL3X-e1Hj-2jpx-H8cPJN

--- Logical volume ---
LV Name                /dev/vg0/lv0
VG Name                vg0
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                100 MB
Current LE             25
Allocated LE           25
Allocation             next free
Read ahead sectors     1024
Block device           58:0


--- Physical volumes ---
PV Name (#)           /dev/hdc1 (1)
PV Status             available / allocatable
Total PE / Free PE    1218 / 1193

PV Name (#)           /dev/hdc2 (2)
PV Status             available / allocatable
Total PE / Free PE    1218 / 1218
