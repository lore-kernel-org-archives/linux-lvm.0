Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9VArKV24790
	for <linux-lvm@redhat.com>; Mon, 31 Oct 2005 05:53:20 -0500
Received: from oxtel.com ([195.219.3.158])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9VAr9wW027290
	for <linux-lvm@redhat.com>; Mon, 31 Oct 2005 05:53:10 -0500
Message-ID: <4365F0AC.3090909@oxtel.com>
Date: Mon, 31 Oct 2005 10:23:40 +0000
From: Tom Robinson <tom.robinson@oxtel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] One of 8 PVs dead - Trying to rescue data from
	remaining 7
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


Hi,
I know this is a long post, but please take the time to at least
read this paragraph;

Summary: One of my 8 PVs is dead and I despirately need to rescue
the data from the other 7, even if its just read-only is fine, as
long as I can see it.

I don't have a backup, so I know this is my fault. Please have some
sympathy and help me anyway :)


Details:

System:
Gentoo linux:
Linux vaus 2.6.11.10 #2 SMP Mon May 30 02:46:52 GMT 2005 i686 AMD 
Athlon(tm) Processor AuthenticAMD GNU/Linux

I have an 8 disk lvm array (linear, non-striped)
The last disk in the array has died completely (head crash)
so i've had to remove it from the system, but now of course,
I can't see any of my volume group.

My 8 PVs make up 1 volume group called vg1, It consists of
1 logical volume, called lv1, which contains ext2.

The lvm array was originally built back when I was using kernel 2.4.18
with LVM1. Now im using LVM2 & device mapper - but I havent changed
anything, It just worked since I rebuilt the system.

The dead disk was the last one added to the array and contains nothing,
I noticed it went wrong when I heard a loud clicking noise from the 8th
PV when copying a file onto the vg that took it over the boundary to
the 8th PV.

I'm absolutely despirate, so I'm really hoping there is a way to at
least see the data on the 7 remaining PVs. All the disks are 100% ok
and it's not striped so the data should be intact.

I've trawled the web and found 2 possible solutions:
*1: Do a partial read only mount of the VG.
   This did not work - see below...

vaus root # vgchange -P -a y vg1
  Partial mode. Incomplete volume groups will be activated read-only.
  7 PV(s) found for VG vg1: expected 8
  Logical volume (lv1) contains an incomplete mapping table.
  7 PV(s) found for VG vg1: expected 8
  Logical volume (lv1) contains an incomplete mapping table.
  1 logical volume(s) in volume group "vg1" now active

vaus root # ls -l /dev/mapper/    
total 0
crw-rw----  1 root root  10, 63 May 30 02:48 control
brw-------  1 root root 254,  0 Oct 25 13:20 vg1-lv1

vaus root # mount /dev/mapper/vg1-lv1 /mnt/test/
mount: you must specify the filesystem type

vaus root # mount /dev/mapper/vg1-lv1 /mnt/test/ -t ext2
mount: wrong fs type, bad option, bad superblock on /dev/mapper/vg1-lv1,
       or too many mounted file systems
       (could this be the IDE device where you in fact use
       ide-scsi so that sr0 or sda or so is needed?)

Something seems to be wrong with the vg1-lv1 block device,
any ideas?


*2: Put a new disk in and write the uuid of the dead disk onto it.
The problem here is I can't find anyway of getting the old UUID.
I've grepped all the logs in /var/log and /etc/lvm and cant find anything.
Interestingly the backup stuff just shows 7 PVs too, I think it's only
backing up the last reboot.
Anyway, I heard that doing:

pvdata -U

Will retrieve the UUIDs of all the PVs from anyt working drive, but it's
an LVM1 command, and now i'm running 2.6 with LVM2/device mapper and
I cannot build the lvm tools (at least i dont seem to be able to).

Is there any way I can get this info without building an LVM1 system?

It was built on LVM1, the UUIDs must be stored on each drive.


Thanks in advance for any help,
I know this is my problem, but when I lost this data my world colapsed!
I would be very appreciative of any information.

Below are some outputs of various commands. If you need any more
information I would be happy to give it.
Any suggestions I can try out right away and get back to you.

Kind regards,
  Tom Robinson



vaus root # pvscan
  7 PV(s) found for VG vg1: expected 8
  Logical volume (lv1) contains an incomplete mapping table.
  PV /dev/hda     VG vg1   lvm1 [233.72 GB / 0    free]
  PV /dev/hdc     VG vg1   lvm1 [233.72 GB / 0    free]
  PV /dev/cdrom   VG vg1   lvm1 [152.62 GB / 0    free]
  PV /dev/hde4    VG vg1   lvm1 [109.56 GB / 0    free]
  PV /dev/hdb     VG vg1   lvm1 [233.72 GB / 0    free]
  PV /dev/hdf     VG vg1   lvm1 [114.44 GB / 0    free]
  PV /dev/hdh     VG vg1   lvm1 [233.72 GB / 0    free]
  Total: 7 [1.28 TB] / in use: 7 [1.28 TB] / in no VG: 0 [0   ]

* The dead disk was a 250G - all disks are maxtors,
  normal size of VG is 1.51TB (1690 hard disk gigs)

vaus root # vgchange -a y vg1
  7 PV(s) found for VG vg1: expected 8
  7 PV(s) found for VG vg1: expected 8
  Unable to find volume group "vg1"


vaus root # vgdisplay -v
    Finding all volume groups
    Finding volume group "vg1"
    Wiping cache of LVM-capable devices
  7 PV(s) found for VG vg1: expected 8
  7 PV(s) found for VG vg1: expected 8
  Volume group "vg1" doesn't exist


vaus root # pvdisplay -v
    Scanning for physical volume names
    Wiping cache of LVM-capable devices
  7 PV(s) found for VG vg1: expected 8
  Logical volume (lv1) contains an incomplete mapping table.
  --- Physical volume ---
  PV Name               /dev/hda
  VG Name               vg1
  PV Size               233.76 GB / not usable 44.44 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              7479
  Free PE               0
  Allocated PE          7479
  PV UUID               ofE07R-sevF-QJp0-xJ2k-Ga3z-fkIW-SDsS3F
   
  --- Physical volume ---
  PV Name               /dev/hdc
  VG Name               vg1
  PV Size               233.76 GB / not usable 44.44 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              7479
  Free PE               0
  Allocated PE          7479
  PV UUID               K8CRuK-5ybE-1GPS-qxXY-cybH-asIa-KKkZmt
   
  --- Physical volume ---
  PV Name               /dev/cdrom
  VG Name               vg1
  PV Size               152.67 GB / not usable 46.50 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              4884
  Free PE               0
  Allocated PE          4884
  PV UUID               sKlDWY-DYK1-44tN-dfVU-qoaF-BKmX-wI3cAV
   
  --- Physical volume ---
  PV Name               /dev/hde4
  VG Name               vg1
  PV Size               109.61 GB / not usable 51.21 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              3506
  Free PE               0
  Allocated PE          3506
  PV UUID               efBrIF-U1AF-WeWs-7CCC-hQqg-JGh3-fT7IQt
   
  --- Physical volume ---
  PV Name               /dev/hdb
  VG Name               vg1
  PV Size               233.76 GB / not usable 44.44 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              7479
  Free PE               0
  Allocated PE          7479
  PV UUID               iG7W2l-oHuD-0VNl-L68d-aE9M-VSC1-oWnZM9
   
  --- Physical volume ---
  PV Name               /dev/hdf
  VG Name               vg1
  PV Size               114.50 GB / not usable 62.94 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              3662
  Free PE               0
  Allocated PE          3662
  PV UUID               16cN09-WSFr-B6nx-ybol-GlfM-07jY-5cRcfx
   
  --- Physical volume ---
  PV Name               /dev/hdh
  VG Name               vg1
  PV Size               233.76 GB / not usable 44.44 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              7479
  Free PE               0
  Allocated PE          7479
  PV UUID               lHJQbC-9wQv-ZAC9-w95D-dlE9-ITa7-QK6KrN
