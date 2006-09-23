Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8N82EbZ032315
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 04:02:16 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.185])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8N822xG021549
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 04:02:03 -0400
Received: by nf-out-0910.google.com with SMTP id x30so1040679nfb
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 01:02:02 -0700 (PDT)
Message-ID: <dac45060609230102k2d3e6c7fq512f27d265e24b8@mail.gmail.com>
Date: Sat, 23 Sep 2006 11:02:02 +0300
From: "Mark Ryden" <markryde@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] LVM partition and lvm commands in initrd
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello linux-lvm,

  First, I am not an expert on LVM neither on initram disk (created
with mkinitrd).

  There is one point which I want to understand and I hope I can get
help here.

  I have Fedora Core 4 (on x386).
  fdisk -l shows that I have a Linux LVM partition.

  I opened the init file of the initrd on my machine
(initrd-2.6.11-1.1369_FC4.img).

  This script have some lvm commands , like:

  lvm vgscan --ignorelockingfailure
  lvm vgchange -ay --ignorelockingfailure VolGroup00

  It also has a call to mkdmnod (which creates  /dev/mapper/control ;
see man nash).

after boot, I see that I have the following (on: /):

/dev/mapper/VolGroup00-LogVol00 on / type ext3 (rw)

The point which I want to understand is this:
Is existence of LVM partition is a MUST so that this script
will run and not cause panic on boot ?
Suppose I would NOT have an LVM partition.
(change its type with fdisk for example).

Will the calls to "lvm vgscan" and
  "lvm vgchange" and "mkdmnod" and insmoding the dm* modules will not
cause panic ?

any help will be appreciated.

Below here are the entry in grub.conf and the init script.



The entry in grub.conf is :

title Fedora Core (2.6.11-1.1369_FC4)
	root (hd0,1)
	kernel /vmlinuz-2.6.11-1.1369_FC4 ro root=/dev/VolGroup00/LogVol00
rhgb quiet nodma
	initrd /initrd-2.6.11-1.1369_FC4.img


init script of initrd: (initrd-2.6.11-1.1369_FC4.img)

#!/bin/nash

mount -t proc /proc /proc
setquiet
echo Mounted /proc filesystem
echo Mounting sysfs
mount -t sysfs /sys /sys
echo Creating /dev
mount -o mode=0755 -t tmpfs /dev /dev
mknod /dev/console c 5 1
mknod /dev/null c 1 3
mknod /dev/zero c 1 5
mkdir /dev/pts
mkdir /dev/shm
echo Starting udev
/sbin/udevstart
echo -n "/sbin/hotplug" > /proc/sys/kernel/hotplug
echo "Loading dm-mod.ko module"
insmod /lib/dm-mod.ko
echo "Loading jbd.ko module"
insmod /lib/jbd.ko
echo "Loading ext3.ko module"
insmod /lib/ext3.ko
echo "Loading dm-mirror.ko module"
insmod /lib/dm-mirror.ko
echo "Loading dm-zero.ko module"
insmod /lib/dm-zero.ko
echo "Loading dm-snapshot.ko module"
insmod /lib/dm-snapshot.ko
/sbin/udevstart
echo Making device-mapper control node
mkdmnod
echo Scanning logical volumes
lvm vgscan --ignorelockingfailure
echo Activating logical volumes
lvm vgchange -ay --ignorelockingfailure VolGroup00
echo Creating root device
mkrootdev /dev/root
echo Mounting root filesystem
mount -o defaults --ro -t ext3 /dev/root /sysroot
echo Switching to new root
switchroot --movedev /sysroot


Regards,
MR
