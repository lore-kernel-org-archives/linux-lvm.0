Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5AEOGO8023226
	for <linux-lvm@redhat.com>; Tue, 10 Jun 2008 10:24:16 -0400
Received: from mail-3-it.mail.tiscali.sys (mail-3.tiscali.it [213.205.33.23])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5AENoHZ030620
	for <linux-lvm@redhat.com>; Tue, 10 Jun 2008 10:23:51 -0400
Received: from ps12 (10.39.75.82) by mail-3-it.mail.tiscali.sys (8.0.016)
	id 4816F1C50015DB60 for linux-lvm@redhat.com;
	Tue, 10 Jun 2008 16:23:44 +0200
Message-ID: <28867486.1213107824481.JavaMail.root@ps12>
Date: Tue, 10 Jun 2008 16:23:44 +0200 (CEST)
From: "alexferro@tiscali.it" <alexferro@tiscali.it>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] HELP! --> mount: error 2 mounting ext2 flags
Reply-To: "alexferro@tiscali.it" <alexferro@tiscali.it>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@redhat.com

Hi guys! I googled soooo  much but without any successsss...

My setting:
- lilo 22.2
- kernel 2.4.36.5 with lvm,ext2,ext3 static compiled

My fstab:
/dev/hda1 /boot ext3 noatime 1 2
/dev/VOLROOT/ROOTLV / ext2 noatime 1 1
none /dev/pts devpts mode=3D0620 0 0
none /dev/shm tmpfs defaults 0 0
/dev/VOLHOME/HOMELV /home ext2 noatime 1 2
none /proc proc defaults 0 0
/dev/sda2 swap swap defaults 0 0
usbfs /proc/bus/usb usbfs auto 0 0

I have in my linux box:
- 1 ide disk, boot partition -> /dev/hda1
- 1 scsi 3ware controller -> /dev/sda (2Tb) and /dev/sdb (2Tb)
      - it is partitioned into /dev/sda1,/dev/sda2,/dev/sda3 and=20
/dev/sdb1

(my future boot partition will be /dev/sda1, now it is /dev/hda1)
my swap partition is /dev/sda2
my ROOTLV logical volume =3D /dev/sda3
my HOMELV logical volume =3D /dev/sdb1

Ok, now I write my lilo.conf:
boot=3D/dev/hda
map=3D/boot/map
install=3D/boot/lilo-menu/boot.b
vga=3D788
default=3DLVM-2.4.36.5
keytable=3D/boot/it-latin1.klt
lba32
prompt
nowarn
timeout=3D100
message=3D/boot/message
menu-scheme=3Dwb:bw:wb:bw
image=3D/boot/vmlinuz-2.4.36.5
        label=3Dlinux-2.4.36.5
        root=3D/dev/hda5
        initrd=3D/boot/initrd-2.4.36.5.img
        append=3D"devfs=3Dmount ramdisk_size=3D8192"
        read-only
image=3D/boot/vmlinuz-2.4.36.5
        label=3DLVM-2.4.36.5
        root=3D/dev/VOLROOT/ROOTLV
        initrd=3D/boot/initrd-lvm-2.4.36.5.img
        append=3D"devfs=3Dmount ramdisk_size=3D20198"
        read-only
other=3D/dev/fd0
        label=3Dfloppy
        unsafe


Now I write my initrd->linuxrc:
#!/bin/nash
echo "Inserting modules..."
insmod /lib/modules/3w-9xxx.o
insmod /lib/modules/iteraid.o
insmod /lib/modules/linear.o
insmod /lib/modules/raid1.o
insmod /lib/modules/raid5.o

echo "Mounting /proc filesystem..."
mount -t proc /proc /proc

echo "Creating device file..."
raidautorun /dev/md0
raidautorun /dev/md1

echo "Setting up LVM Volume Groups..."
vgscan
vgchange -a y
vgmknodes

echo "Creating root device..."
mkrootdev /dev/root
echo 0x0100 > /proc/sys/kernel/real-root-dev

echo "Mounting root filesystem..."
mount --ro -t ext2 /dev/VOLROOT/ROOTLV /sysroot
umount /proc
pivot_root /sysroot /sysroot/initrd
echo "Remounting devfs at correct place if necessary..."
handledevfs


So, when my linuxbox boots, I read:
Loading LVM-2.4.36.5=20
............................................................................
:
:
Setting up LVM Volume Groups...
vgscan -- reading all physical volumes (this may take a while...)
NBD, minor 0: Request when not-ready.
NBD, minor 1: Request when not-ready.
:
: (much more NBD messages)
:
NBD, minor 98: Request when not-ready.
NBD, minor 99: Request when not-ready.
vgscan -- found inactive volume group "VOLROOT"
vgscan -- found inactive volume group "VOLHOME"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your=20
volume groups

vgchange -- volume group "VOLHOME" successfully activated
vgchange -- volume group "VOLROOT" successfully activated

vgmknodes -- successfully made all nodes of volume group "VOLHOME"
vgmknodes -- successfully made all nodes of volume group "VOLROOT"

Creating root device...
Mounting root filesystem...
mount: error 2 mounting ext2 flags Freeing unused kernel memory: 196k=20
freed
sh-2.05#

Have you any suggests?

Thanks, Alessandro






_______________________________________________
Tutto quello che vuoi a partire da 1=E2=82=AC
http://pages.ebay.it/tiscali/canaleaste.html
