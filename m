From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
Message-ID: <20040104232315.GD29331@percy.comedia.it>
References: <OFE39B6119.56DB46A1-ON00256E10.005F983E-00256E10.005F9849@svunta.os.is>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <OFE39B6119.56DB46A1-ON00256E10.005F983E-00256E10.005F9849@svunta.os.is>
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
Date: Mon Jan  5 07:32:02 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sat, Jan 03, 2004 at 05:24:09PM +0000, Kjartan Reynir Hauksson wrote:
>>this means either your initrd is corrupted, or you did not rerun lilo
>>after createing the initrd.
>
>Yup.. I forgot to run /sbin/lilo but it doesn't take.  The first error is
>failed to create /dev/mapper/control and after that everything fails and it
>ends up in a kernel panic.
>
ok, the attached file is a log of my computer booting with a 2.4 kernel
with device-mapper enabled and my initrd and lvm packages.
i used the latest prebuilt kernel from mandrake cooker.

tell me where your situation differs from mine and please try copying
down the 'exact' messages that the kernel prints before panicking.
(the failed to create /dev/mapper/control is normal if you are using
devfs, i'll try to remove needless warnings in a future release)

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="initrd.log"

------------ mkinitrd ----------
# mkinitrd -v --lvm-version=2 -f /boot/initrd-2.4.24-0.pre2.1mdk.img 2.4.24-0.pre2.1mdk
Looking for deps of module 3w-xxxx
	 scsi_mod
Looking for deps of module scsi_mod
Looking for deps of module sd_mod
	 scsi_mod
Looking for deps of module scsi_mod
Looking for deps of module dm-mod
Looking for deps of module ext3
	 jbd
Looking for deps of module jbd
Using modules:  ./kernel/drivers/scsi/scsi_mod.o ./kernel/drivers/scsi/3w-xxxx.o ./kernel/drivers/scsi/sd_mod.o ./kernel/drivers/md/dm-mod.o ./kernel/fs/jbd/jbd.o ./kernel/fs/ext3/ext3.o
Using /root/tmp as temporary directory.
/sbin/nash -> /root/tmp/initrd.02YkRu/bin/nash
/sbin/insmod-DIET -> /root/tmp/initrd.02YkRu/bin/insmod
Loading module scsi_mod.o
Loading module 3w-xxxx.o
Loading module sd_mod.o
Loading module dm-mod.o
Loading module jbd.o
Loading module ext3.o
`/sbin/lvm2-static' -> `/root/tmp/initrd.02YkRu/sbin/vgscan'
Contents of RCFILE:
#!/bin/nash

echo "Loading scsi_mod.o module"
insmod /lib/scsi_mod.o 
echo "Loading 3w-xxxx.o module"
insmod /lib/3w-xxxx.o 
echo "Loading sd_mod.o module"
insmod /lib/sd_mod.o 
echo "Loading dm-mod.o module"
insmod /lib/dm-mod.o 
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
mount -o defaults --ro -t ext3 /dev/vg00/lvol1 /sysroot
pivot_root /sysroot /sysroot/initrd
echo Remounting devfs at correct place if necessary
handledevfs
umount /initrd/proc
Creating filesystem with size 978KB and 147 inodes

------------ lilo.conf ---------
boot=/dev/sda
map=/boot/map
install=menu
vga=792
default="linux"
keytable=/boot/us.klt
prompt
nowarn
timeout=100
message=/boot/message
menu-scheme=wb:bw:wb:bw
image=/boot/vmlinuz
	label=linux
	root=/dev/vg00/lvol1
	initrd=/boot/initrd.img
	append="panic=60 acpi=force devfs=mount"
	read-only

------------ boot log ----------
RAMDISK: Compressed image found at block 0
Freeing initrd memory: 333k freed
VFS: Mounted root (ext2 filesystem).
Mounted devfs on /dev
Red Hat nash version 3.5.15.1-mdk starting
Loading scsi_mod.o module
Using insmod provided by busybox.
SCSI subsystem driver Revision: 1.00
Loading 3w-xxxx.o module
Using insmod provided by busybox.
3ware Storage Controller device driver for Linux v1.02.00.037.
scsi0 : Found a 3ware Storage Controller at 0x7c30, IRQ: 9, P-chip: 1.3
scsi0 : 3ware Storage Controller
  Vendor: 3ware     Model: Logical Disk 0    Rev: 1.0
  Type:   Direct-Access                      ANSI SCSI revision: 00
Loading sd_mod.o module
Using insmod provided by busybox.
Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
SCSI device sda: 240119680 512-byte hdwr sectors (122941 MB)
Partition check:
 /dev/scsi/host0/bus0/target0/lun0: p1
Loading dm-mod.o module
Using insmod provided by busybox.
device-mapper: 4.0.1-ioctl (2003-07-12) initialised: dm@uk.sistina.com
Loading jbd.o module
Using insmod provided by busybox.
Journalled Block Device driver loaded
Loading ext3.o module
Using insmod provided by busybox.
Mounting /proc filesystem
Creating device files
Making device-mapper control node
failed to create /dev/mapper/control
Scanning logical volumes
  Reading all physical volumes.  This may take a while...
  Found volume group "vg00" using metadata type lvm1
Activating logical volumes
  7 logical volume(s) in volume group "vg00" now active
Making device nodes
Mounting root filesystem
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
Remounting devfs at correct place if necessary
Mounted devfs on /dev
Freeing unused kernel memory: 156k freed
INIT: version 2.85 booting

--ZGiS0Q5IWpPtfppv--
