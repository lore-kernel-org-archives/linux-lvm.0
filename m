Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
MIME-Version: 1.0
From: Kjartan Reynir Hauksson <krh@os.is>
Message-ID: <OF1304E5DE.20B1794B-ON00256E0F.006B2F94-00256E0F.006B2FA0@svunta.os.is>
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
Date: Fri Jan  2 13:40:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com





>work.  You have to use the --lvm-version=2 option to mkinitrd.

kernel panic, this time VFS: Cannot open root device "3a00" or 3a:00

Output from mkinitrd:

[root@kjartan root]# mkinitrd -v -f --lvm-version=2 /boot/initrd-2.4.22.img
2.4.22
Looking for deps of module aic7xxx
         scsi_mod
Looking for deps of module scsi_mod
Looking for deps of module sd_mod
         scsi_mod
Looking for deps of module scsi_mod
Looking for deps of module dm-mod
Looking for deps of module ext3
         jbd
Looking for deps of module jbd
Using modules:  ./kernel/drivers/scsi/scsi_mod.o
./kernel/drivers/scsi/aic7xxx/aic7
xxx.o ./kernel/drivers/scsi/sd_mod.o ./kernel/fs/jbd/jbd.o
./kernel/fs/ext3/ext3.o
Using /root/tmp as temporary directory.
/sbin/nash -> /root/tmp/initrd.n7CMXa/bin/nash
/sbin/insmod-DIET -> /root/tmp/initrd.n7CMXa/bin/insmod
`/lib/modules/2.4.22/./kernel/drivers/scsi/scsi_mod.o' ->
`/root/tmp/initrd.n7CMXa/
lib/scsi_mod.o'
`/lib/modules/2.4.22/./kernel/drivers/scsi/aic7xxx/aic7xxx.o' ->
`/root/tmp/initrd.
n7CMXa/lib/aic7xxx.o'
`/lib/modules/2.4.22/./kernel/drivers/scsi/sd_mod.o' ->
`/root/tmp/initrd.n7CMXa/li
b/sd_mod.o'
`/lib/modules/2.4.22/./kernel/fs/jbd/jbd.o' ->
`/root/tmp/initrd.n7CMXa/lib/jbd.o'
`/lib/modules/2.4.22/./kernel/fs/ext3/ext3.o' ->
`/root/tmp/initrd.n7CMXa/lib/ext3.
o'
Loading module scsi_mod.o
Loading module aic7xxx.o
Loading module sd_mod.o
Loading module jbd.o
Loading module ext3.o
`/sbin/lvm2-static' -> `/root/tmp/initrd.n7CMXa/sbin/vgscan'
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
echo Making device-mapper control node
mkdmnod
echo Scanning logical volumes
vgscan --ignorelockingfailure
echo Activating logical volumes
vgchange -ay --ignorelockingfailure
echo Making device nodes
vgmknodes
echo 0x0100 > /proc/sys/kernel/real-root-dev
echo Mounting root filesystem
mount -o defaults --ro -t ext3 /dev/root/1 /sysroot
pivot_root /sysroot /sysroot/initrd
echo Remounting devfs at correct place if necessary
handledevfs
umount /initrd/proc
 Creating filesystem with size 1103KB and 191 inodes
