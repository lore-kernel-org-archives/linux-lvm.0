Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0SNeXO26087
	for <linux-lvm@redhat.com>; Fri, 28 Jan 2005 18:40:33 -0500
Received: from tonnikala.org (tonnikala.net [62.142.121.140])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0SNeRtK017178
	for <linux-lvm@redhat.com>; Fri, 28 Jan 2005 18:40:27 -0500
Date: Sat, 29 Jan 2005 01:40:26 +0200
From: Dominique <domimail@tonnikala.org>
Message-ID: <20050128234026.GB22677@sushi.tonnikala.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM, udev and initrd problem booting
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hi all,

First off, I'm not quite sure this problem is LVM-specific, currently I'm
suspecting udev as the key culprit, or an init script bug. I hope you don't
mind. I am also sending a similar e-mail to a list specfic to the
distribution I'm using.

Recently I've set up a machine with 3 hard drives. The first two disks
mirror most of their partitions between each other with RAID-1.

/ is on soft RAID-1, /boot is a normal ext3 partition and the rest of the
disk is divided into LVM logical volumes with ext3 on top.

The third disk is connected to a IDE RAID card (InnoVision EI0 1680), which
I'm only using as an IDE card, really. Due to the RAID card, the P-ATA drive
is visible to linux as /dev/sda1.


All this is set up on Mandrakelinux 10.1 Official, with vendor kernel
2.6.8.1, udev-030-24 and lvm2-2.00.22.


After reboots, something goes wrong and udev does not appear to create the
proper device links. Upon boot, rc.sysinit enters "Setting up Logical Volume
Management" and in my case runs:

 /sbin/lvm2 vgscan -a y
 /sbin/lvm2 vgmknodes
 
This results in "no volume groups found". The script then continues to
activate swap, after that RAID (Starting up RAID devices) and the LVM volumes
sitting on top of the RAID (Setting up Logical Volume Management again). This
time the volume group related to the RAID-1 is activated, and the
mount command is able to mount everything except the LVM setup w/o RAID-1
(vg1). I get the error message:

"
/dev/vg1/data:
The superblock could not be read [..]
e2fsck -b 8193 <device>
fsck.ext3: no such file or directory while trying to open /dev/vg1/data"

The other partitions get mounted all right, but I'm then dropped to
maintenance mode fsck the device. Obviously fsck will not work, because the
symlink /dev/vg1 has not been created and the device mapper files related to
vg1 do not exist.

I've tried adding a modprobe sd_mod before the first LVM commands to no avail.


This is what my mount output looks like when everything is as it should be:
/dev/md0 on / type ext3 (rw)
none on /proc type proc (rw)
none on /proc/bus/usb type usbfs (rw)
none on /sys type sysfs (rw)
/dev/hda5 on /boot type ext2 (rw)
/dev/mapper/vg0-4 on /home type ext3 (rw)
/dev/mapper/vg0-3 on /tmp type ext3 (rw)
/dev/mapper/vg0-1 on /usr type ext3 (rw)
/dev/mapper/vg0-2 on /var type ext3 (rw)
/dev/mapper/vg0-5 on /www type ext3 (rw)
/dev/mapper/vg1-data on /data type ext3 (rw)
/dev/mapper/vg1-mirror on /mirror type ext3 (rw)

The last two don't mount automatically. I have no problems running vgchange
-a y vg1 after even maintenance mode.


Do you have any suggestions? They would be much appreciated.



Here's some additional info, pertinent to LVM:

  --- Physical volume ---
    PV Name               /dev/md1
    VG Name               vg0
    PV Size               147,51 GB / not usable 0
    Allocatable           yes
    PE Size (KByte)       4096
    Total PE              37762
    Free PE               5142
    Allocated PE          32620
    PV UUID               l0rkdF-qA0P-fO3P-iuGI-4uZ7-oLTz-gCuF2q
		    
  --- Physical volume ---
    PV Name               /dev/sda1
    VG Name               vg1
    PV Size               153,38 GB / not usable 0
    Allocatable           yes
    PE Size (KByte)       4096
    Total PE              39266
    Free PE               6766
    Allocated PE          32500
    PV UUID               12y9dB-7OJp-bLjd-mf57-YLyQ-nzcx-hNkKYu



--- Volume group ---
VG Name               vg0
System ID
Format                lvm2
Metadata Areas        1
Metadata Sequence No  9
VG Access             read/write
VG Status             resizable
MAX LV                0
Cur LV                5
Open LV               5
Max PV                0
Cur PV                1
Act PV                1
VG Size               147,51 GB
PE Size               4,00 MB
Total PE              37762
Alloc PE / Size       32620 / 127,42 GB
Free  PE / Size       5142 / 20,09 GB
VG UUID               RTToDQ-AVQY-RRDV-LRhs-O71Q-kA6c-JS3Tax

--- Volume group ---
VG Name               vg1
System ID
Format                lvm2
Metadata Areas        1
Metadata Sequence No  3
VG Access             read/write
VG Status             resizable
MAX LV                0
Cur LV                2
Open LV               2
Max PV                0
Cur PV                1
Act PV                1
VG Size               153,38 GB
PE Size               4,00 MB
Total PE              39266
Alloc PE / Size       32500 / 126,95 GB
Free  PE / Size       6766 / 26,43 GB
VG UUID               VAKCBn-GRC0-b5RI-tVrW-8SG0-BoOP-1Ry9Dw


the lv's pertinent to the problematic vg1 (after a successful vgchange!):
--- Logical volume ---
LV Name                /dev/vg1/mirror
VG Name                vg1
LV UUID                AR8zKz-46XK-e6z6-tUUn-wkgN-Rrgr-aGIQBb
LV Write Access        read/write
LV Status              available
# open                 1
LV Size                78,12 GB
Current LE             20000
Segments               1
Allocation             inherit
Read ahead sectors     0
Block device           253:5

--- Logical volume ---
LV Name                /dev/vg1/data
VG Name                vg1
LV UUID                iDcZdy-x0rx-AiGZ-rSWY-ha5G-FXGR-LmdQXy
LV Write Access        read/write
LV Status              available
# open                 1
LV Size                48,83 GB
Current LE             12500
Segments               1
Allocation             inherit
Read ahead sectors     0
Block device           253:6



regards,
Dominique
