Subject: RE: [linux-lvm] booting a dm+lvm2 kernel
MIME-Version: 1.0
From: Kjartan Reynir Hauksson <krh@os.is>
Message-ID: <OF06F63D86.B4780DA6-ON00256E0F.0067BA5B-00256E0F.0067BA64@svunta.os.is>
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
Date: Fri Jan  2 13:03:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com





>reinstall coreutils-5.0-6.1.92mdk
>software on my home page is usually for the development version of
>mandrake and does not work with mandrake 9.2 (with the exception of the
>stuff in the lvm2 subdirectory, which i try to backport to 9.2)

Did it and reran mkinitrd but I'm still getting kernel panic. It says
pivotroot: pivot_root(sysroot,/sysroot/initrd) failed: 2

Here's my mkinitrd output

[root@kjartan root]# mkinitrd -v -f /boot/initrd-2.4.22.img 2.4.22
Looking for deps of module aic7xxx
         scsi_mod
Looking for deps of module scsi_mod
Looking for deps of module sd_mod
         scsi_mod
Looking for deps of module scsi_mod
Looking for deps of module lvm-mod
Looking for deps of module dm-mod
Looking for deps of module ext3
         jbd
Looking for deps of module jbd
Using modules:  ./kernel/drivers/scsi/scsi_mod.o
./kernel/drivers/scsi/aic7xxx/aic7xxx.o
./kernel/drivers/scsi/sd_mod.o ./kernel/fs/jbd/jbd.o
./kernel/fs/ext3/ext3.o
Using /root/tmp as temporary directory.
/sbin/nash -> /root/tmp/initrd.qPJFGp/bin/nash
/sbin/insmod-DIET -> /root/tmp/initrd.qPJFGp/bin/insmod
`/lib/modules/2.4.22/./kernel/drivers/scsi/scsi_mod.o' ->
`/root/tmp/initrd.qPJFGp/lib/sc
si_mod.o'
`/lib/modules/2.4.22/./kernel/drivers/scsi/aic7xxx/aic7xxx.o' ->
`/root/tmp/initrd.qPJFGp
/lib/aic7xxx.o'
`/lib/modules/2.4.22/./kernel/drivers/scsi/sd_mod.o' ->
`/root/tmp/initrd.qPJFGp/lib/sd_m
od.o'
`/lib/modules/2.4.22/./kernel/fs/jbd/jbd.o' ->
`/root/tmp/initrd.qPJFGp/lib/jbd.o'
`/lib/modules/2.4.22/./kernel/fs/ext3/ext3.o' ->
`/root/tmp/initrd.qPJFGp/lib/ext3.o'
Loading module scsi_mod.o
Loading module aic7xxx.o
Loading module sd_mod.o
Loading module jbd.o
Loading module ext3.o
`/sbin/lvm1-vgwrapper' -> `/root/tmp/initrd.qPJFGp/sbin/vgscan'
Contents of RCFILE:
#!/bin/nash

echo "Loading scsi_mod.o module"
insmod /lib/scsi_mod.o
echo "Loading aic7xxx.o module"
insmod /lib/aic7xxx.o
echo "Loading sd_mod.o module"
insmod /lib/sd_mod.o
echo "Loading jbd.o module"
insmod /lib/jbd.o
echo "Loading ext3.o module"
insmod /lib/ext3.o
echo Mounting /proc filesystem
mount -t proc /proc /proc
echo Creating device files
mkdevices /dev
mknod /dev/lvm b 109 0
mount -t tmpfs /etc /etc
echo Scanning logical volumes
vgscan
echo Activating logical volumes
vgchange -ay
umount /etc
echo 0x0100 > /proc/sys/kernel/real-root-dev
echo Mounting root filesystem
mount -o defaults --ro -t ext3 /dev/root/1 /sysroot
pivot_root /sysroot /sysroot/initrd
echo Remounting devfs at correct place if necessary
handledevfs
umount /initrd/proc
Creating filesystem with size 906KB and 186 inodes


And my lilo.conf

[root@kjartan root]# cat /etc/lilo.conf
boot=/dev/hda
map=/boot/map
vga=normal
default="linux"
keytable=/boot/us.klt
prompt
nowarn
timeout=50
message=/boot/message
menu-scheme=wb:bw:wb:bw
image=/boot/vmlinuz
        label="linux"
        root=/dev/root/1
        initrd=/boot/initrd.img
        append="devfs=mount hdc=ide-scsi acpi=ht splash=silent"
        vga=788
        read-only
image=/boot/vmlinuz
        label="linux-nonfb"
        root=/dev/root/1
        initrd=/boot/initrd.img
        append="devfs=mount hdc=ide-scsi acpi=ht"
        read-only
image=/boot/vmlinuz
        label="failsafe"
        root=/dev/root/1
        initrd=/boot/initrd.img
        append="failsafe devfs=nomount hdc=ide-scsi acpi=ht"
        read-only
image=/boot/vmlinuz-2.4.22
       label=lvm2
       root=/dev/root/1
       initrd=/boot/initrd-2.4.22.img
       append="devfs=mount"
        read-only
