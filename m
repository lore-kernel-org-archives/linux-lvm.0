Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
MIME-Version: 1.0
From: Kjartan Reynir Hauksson <krh@os.is>
Message-ID: <OF2BAA1563.F6E03716-ON00256E0F.005FE18B-00256E0F.005FE196@svunta.os.is>
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
Date: Fri Jan  2 11:37:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com





>no, mkinitrd 3.5.15.1 does not care about alternatives
>your logs, please.

Here's mkinitrd

[root@kjartan root]# mkinitrd -v -f /boot/initrd-2.4.22.img 2.4.22
Looking for deps of module aic7xxx
         scsi_mod
Looking for deps of module scsi_mod
Looking for deps of module sd_mod
         scsi_mod
Looking for deps of module scsi_mod
/bin/ls: relocation error: /bin/ls: symbol gnu_dev_minor, version
GLIBC_2.3.3 not defined in file l
ibc.so.6 with link time reference
/sbin/mkinitrd: line 529: [: too many arguments
/sbin/mkinitrd: line 543: [: too many arguments
Looking for deps of module ext3
         jbd
Looking for deps of module jbd
Using modules:  ./kernel/drivers/scsi/scsi_mod.o
./kernel/drivers/scsi/aic7xxx/aic7xxx.o ./kernel/d
rivers/scsi/sd_mod.o ./kernel/fs/jbd/jbd.o ./kernel/fs/ext3/ext3.o
Using /root/tmp as temporary directory.
/sbin/nash -> /root/tmp/initrd.8wLSt0/bin/nash
/sbin/insmod-DIET -> /root/tmp/initrd.8wLSt0/bin/insmod
`/lib/modules/2.4.22/./kernel/drivers/scsi/scsi_mod.o' ->
`/root/tmp/initrd.8wLSt0/lib/scsi_mod.o'
`/lib/modules/2.4.22/./kernel/drivers/scsi/aic7xxx/aic7xxx.o' ->
`/root/tmp/initrd.8wLSt0/lib/aic7x
xx.o'
`/lib/modules/2.4.22/./kernel/drivers/scsi/sd_mod.o' ->
`/root/tmp/initrd.8wLSt0/lib/sd_mod.o'
`/lib/modules/2.4.22/./kernel/fs/jbd/jbd.o' ->
`/root/tmp/initrd.8wLSt0/lib/jbd.o'
`/lib/modules/2.4.22/./kernel/fs/ext3/ext3.o' ->
`/root/tmp/initrd.8wLSt0/lib/ext3.o'
mknod: relocation error: mknod: symbol gnu_dev_makedev, version GLIBC_2.3.3
not defined in file lib
c.so.6 with link time reference
mknod: relocation error: mknod: symbol gnu_dev_makedev, version GLIBC_2.3.3
not defined in file lib
c.so.6 with link time reference
mknod: relocation error: mknod: symbol gnu_dev_makedev, version GLIBC_2.3.3
not defined in file lib
c.so.6 with link time reference
mknod: relocation error: mknod: symbol gnu_dev_makedev, version GLIBC_2.3.3
not defined in file lib
c.so.6 with link time reference
mknod: relocation error: mknod: symbol gnu_dev_makedev, version GLIBC_2.3.3
not defined in file lib
c.so.6 with link time reference
mknod: relocation error: mknod: symbol gnu_dev_makedev, version GLIBC_2.3.3
not defined in file lib
c.so.6 with link time reference
mknod: relocation error: mknod: symbol gnu_dev_makedev, version GLIBC_2.3.3
not defined in file lib
c.so.6 with link time reference
mknod: relocation error: mknod: symbol gnu_dev_makedev, version GLIBC_2.3.3
not defined in file lib
c.so.6 with link time reference
Loading module scsi_mod.o
Loading module aic7xxx.o
Loading module sd_mod.o
Loading module jbd.o
Loading module ext3.o
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
echo Creating root device
mkrootdev /dev/root
echo 0x0100 > /proc/sys/kernel/real-root-dev
echo Mounting root filesystem
mount -o defaults --ro -t ext3 /dev/root /sysroot
pivot_root /sysroot /sysroot/initrd
echo Remounting devfs at correct place if necessary
handledevfs
umount /initrd/proc
 Creating filesystem with size 777KB and 176 inodes
